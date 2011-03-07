<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0">
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<!-- <xsl:template match="obsel"> <g id="{@id}" date="{date}" > <circle 
		r="5" cx="0" cy="0" fill="gray" stroke="black" /> </g> </xsl:template> -->

	<!-- Match the obsels having a date value -->
	<xsl:template match="obsel">
		<!-- We first define some variables which values we will use to draw the 
			shape. -->
		<xsl:variable name="VarType" select="substring(primitive_enacted_act, 2, 1)" />

		<!-- Lateral position of the shape. -->
		<xsl:variable name="BeginPosition" select="0" />

		<xsl:variable name="EndPosition" select="$BeginPosition" />

		<!-- Vertical offset from the center. -->
		<xsl:variable name="varLevel">
			<xsl:choose>
				<xsl:when test="$VarType=''">
					<xsl:text>0</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='>'">
					<xsl:text>0</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='^'">
					<xsl:text>-10</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='v'">
					<xsl:text>10</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<!-- Fill color, wrt the type/properties of the obsel -->
		<xsl:variable name="varColor">
			<xsl:choose>
				<xsl:when test="success='fail'">
					<xsl:text>#FF0000</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="$VarType=''">
							<xsl:text>#000000</xsl:text>
						</xsl:when>
						<xsl:when test="$VarType='>'">
							<xsl:text>#5555FF</xsl:text>
						</xsl:when>
						<xsl:when test="$VarType='^'">
							<xsl:text>#00FF00</xsl:text>
						</xsl:when>
						<xsl:when test="$VarType='v'">
							<xsl:text>#00FF00</xsl:text>
						</xsl:when>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- Which shape will it be (see (1) below for the list), wrt the type/properties 
			of the obsel. -->
		<xsl:variable name="currentShape">
			<xsl:choose>
				<xsl:when test="$VarType=''">
					<xsl:text>cycle</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='>'">
					<xsl:text>right</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='^'">
					<xsl:text>up</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='v'">
					<xsl:text>down</xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<!-- In the case the shape is an image (jpg, ...), set this variable to 
			its URI. -->
		<xsl:variable name="currentImage" select="string('')" />

		<!-- Creation of the shape itself -->
		<g id="{@id}" date="{date}" stroke="#000000" fill="{$varColor}">
			<!-- Selection of the class attribute (for CSS). -->
			<xsl:attribute name="class">
		        	<xsl:value-of select="type" />
            		</xsl:attribute>
			<!-- (1) Here we draw the shape that's been chosen. -->
			<xsl:choose>
				<!-- nothing -->
				<xsl:when test="$currentShape='nothing'" />
				<!-- Image -->
				<xsl:when test="$currentShape='image'">
					<image x="{$BeginPosition -10}" y="{$varLevel -10}"
						width="20" height="20" xlink:href="{$currentImage}" />
				</xsl:when>
				<!-- Strip -->
				<xsl:when test="$currentShape='strip' and endTimecode">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$EndPosition" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$EndPosition" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- Square -->
				<xsl:when test="$currentShape='square'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition - 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition - 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle left -->
				<xsl:when test="$currentShape='left'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 8" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle right -->
				<xsl:when test="$currentShape='right'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition - 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition - 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 8" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle up -->
				<xsl:when test="$currentShape='up'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 8" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle down -->
				<xsl:when test="$currentShape='down'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition -8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel + 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 8" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- Square + line -->
				<xsl:when test="$currentShape='square_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="varLevel" select="$varLevel" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition - 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition - 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle left + line -->
				<xsl:when test="$currentShape='left_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="varLevel" select="$varLevel" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 8" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle right + line -->
				<xsl:when test="$currentShape='right_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="varLevel" select="$varLevel" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition - 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition - 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 8" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle up + line -->
				<xsl:when test="$currentShape='up_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="varLevel" select="$varLevel" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 8" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle down + line -->
				<xsl:when test="$currentShape='down_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="varLevel" select="$varLevel" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel + 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 8" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- circle + line -->
				<xsl:when test="$currentShape='circle_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="varLevel" select="$varLevel" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
					</xsl:call-template>
					<circle cx="{$BeginPosition}" r="4">
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="cy">
							<xsl:value-of select="$varLevel" />
						</xsl:attribute>
					</circle>
				</xsl:when>
				<!-- circle -->
				<xsl:when test="$currentShape='circle'">
					<circle cx="{$BeginPosition}" r="4">
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="cy">
							<xsl:value-of select="$varLevel" />
						</xsl:attribute>
					</circle>
				</xsl:when>
				<xsl:otherwise>
					<circle cx="{$BeginPosition}" r="4">
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="cy">
							<xsl:value-of select="$varLevel" />
						</xsl:attribute>
					</circle>
				</xsl:otherwise>
			</xsl:choose>
		</g>

	</xsl:template>

	<!-- Draw the duration lines -->
	<xsl:template name="display_duration_line">
		<xsl:param name="varLevel" />
		<xsl:param name="BeginPosition" />
		<xsl:param name="EndPosition" />
		<xsl:variable name="opacity" select="0.5" />
		<polyline opacity="{$opacity}">
			<xsl:attribute name="points">
				<xsl:value-of select="number($BeginPosition)" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$varLevel+120" /><xsl:text> </xsl:text>
				<xsl:value-of select="number($EndPosition)" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$varLevel+120" /><xsl:text> </xsl:text>
			</xsl:attribute>
		</polyline>
		<polyline opacity="{$opacity}" stroke-width="3">
			<xsl:attribute name="points">
				<xsl:value-of select="$EndPosition -1" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$varLevel +120-8" /><xsl:text> </xsl:text>
				<xsl:value-of select="$EndPosition -1" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$varLevel +120+8" /><xsl:text> </xsl:text>
			</xsl:attribute>
		</polyline>
	</xsl:template>

	<xsl:template match="*">
		<xsl:apply-templates select="*" />
	</xsl:template>

</xsl:transform>