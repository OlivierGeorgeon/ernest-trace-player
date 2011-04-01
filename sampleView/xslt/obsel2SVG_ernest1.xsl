<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xlink"
	version="1.0">
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<!-- <xsl:template match="obsel"> <g id="{@id}" date="{date}" > <circle 
		r="5" cx="0" cy="0" fill="gray" stroke="black" /> </g> </xsl:template> -->

	<!-- Match the obsels having a date value -->
	<xsl:template match="obsel">
		<!-- We first define some variables which values we will use to draw the 
			shape. -->
		<xsl:variable name="obselType" select="type" />

		<!-- Lateral position of the shape. -->
		<xsl:variable name="BeginPosition" select="0" />
		<xsl:variable name="EndPosition"
			select="$BeginPosition + number(@end) - number(@begin)" />

		<xsl:choose>
			<xsl:when test="$obselType = 'action'">
				<xsl:variable name="VarType" select="primitive_enacted_schema" />
				<!-- We create the embedding group. -->
				<g id="{@id}" obsel-id="{@id}" date="{@date}">
					<xsl:call-template name="draw-num-iter">
						<xsl:with-param name="VarType" select="$VarType" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
						<xsl:with-param name="verticalOffset" select="15" />
					</xsl:call-template>

					<xsl:call-template name="draw-checks">
						<xsl:with-param name="VarType" select="$VarType" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
						<xsl:with-param name="verticalOffset" select="75" />
					</xsl:call-template>

					<xsl:call-template name="draw-movement">
						<xsl:with-param name="VarType" select="$VarType" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
						<xsl:with-param name="verticalOffset" select="75" />
					</xsl:call-template>

					<xsl:call-template name="draw-craving-change">
						<xsl:with-param name="VarType" select="$VarType" />
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
						<xsl:with-param name="verticalOffset" select="-75" />
					</xsl:call-template>
				</g>
			</xsl:when>
			<xsl:when test="$obselType = 'feature'">
				<g id="{@id}" date="{@date}" begin="{@begin}" end="{@end}">
					<xsl:call-template name="draw-feature">
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
						<xsl:with-param name="verticalOffset" select="75" />
					</xsl:call-template>
				</g>
			</xsl:when>
			<xsl:when test="$obselType = 'craving'">
				<!-- We create the embedding group. -->
				<g id="{@id}" date="{@date}" begin="{@begin}" end="{@end}">
					<xsl:call-template name="draw-craving">
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
						<xsl:with-param name="verticalOffset" select="-75" />
					</xsl:call-template>
				</g>
			</xsl:when>
			<xsl:when test="$obselType = 'percent_to_target'">
				<!-- We create the embedding group. -->
				<g id="{@id}" date="{@date}" begin="{@begin}" end="{@end}">
					<xsl:call-template name="draw-ttt">
						<xsl:with-param name="BeginPosition" select="$BeginPosition" />
						<xsl:with-param name="EndPosition" select="$EndPosition" />
						<xsl:with-param name="verticalOffset" select="-75" />
					</xsl:call-template>
				</g>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="draw-movement">
		<xsl:param name="VarType" />
		<xsl:param name="BeginPosition" />
		<xsl:param name="EndPosition" />
		<xsl:param name="verticalOffset" />
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
					<xsl:text>0</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='v'">
					<xsl:text>0</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					0
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- Fill color, wrt the type/properties of the obsel -->
		<xsl:variable name="varColor">
			<xsl:choose>
				<xsl:when test="primitive_feedback='false'">
					<xsl:text>#FF0000</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="$VarType=''">
							<xsl:text>#F21A54</xsl:text>
						</xsl:when>
						<xsl:when test="$VarType='>'">
							<xsl:text>#AAAAAA</xsl:text>
						</xsl:when>
						<xsl:when test="$VarType='^'">
							<xsl:text>#AAAAAA</xsl:text>
						</xsl:when>
						<xsl:when test="$VarType='v'">
							<xsl:text>#AAAAAA</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							#82AA54
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- Which shape will it be (see (1) below for the list), wrt the type/properties 
			of the obsel. -->
		<xsl:variable name="currentShape">
			<xsl:choose>
				<xsl:when test="$VarType=''">
					<xsl:text>ruche</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='>'">
					<xsl:text>rightuse</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='^'">
					<xsl:text>arrow-left</xsl:text>
				</xsl:when>
				<xsl:when test="$VarType='v'">
					<xsl:text>arrow-right</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					circle
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- In the case the shape is an image (jpg, ...), set this variable to 
			its URI. -->
		<xsl:variable name="currentImage" select="string('')" />

		<xsl:call-template name="draw-shape">
			<xsl:with-param name="varLevel" select="$varLevel+$verticalOffset" />
			<xsl:with-param name="BeginPosition" select="$BeginPosition" />
			<xsl:with-param name="EndPosition" select="$EndPosition" />
			<xsl:with-param name="currentShape" select="$currentShape" />
			<xsl:with-param name="currentImage" select="$currentImage" />
			<xsl:with-param name="varColor" select="$varColor" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="draw-num-iter">
		<xsl:param name="VarType" />
		<xsl:param name="BeginPosition" />
		<xsl:param name="EndPosition" />
		<xsl:param name="verticalOffset" />

		<xsl:if test="number(clock) mod 10 = 0">
			<xsl:variable name="varLevel" select="$verticalOffset" />

			<xsl:variable name="varColor">
				<xsl:text>#000000</xsl:text>
			</xsl:variable>

			<xsl:variable name="currentShape">
				<xsl:text>tick</xsl:text>
			</xsl:variable>

			<xsl:variable name="textValue">
				<xsl:value-of select="clock" />
			</xsl:variable>

			<xsl:call-template name="draw-shape">
				<xsl:with-param name="varLevel" select="$varLevel+$verticalOffset" />
				<xsl:with-param name="BeginPosition" select="$BeginPosition" />
				<xsl:with-param name="EndPosition" select="$EndPosition" />
				<xsl:with-param name="currentShape" select="$currentShape" />
				<xsl:with-param name="textValue" select="clock" />
				<xsl:with-param name="varColor" select="$varColor" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="draw-feature">
		<xsl:param name="VarType" />
		<xsl:param name="BeginPosition" />
		<xsl:param name="EndPosition" />
		<xsl:param name="verticalOffset" />
		<xsl:if test="color != '008000'">
			<xsl:variable name="varLevel">
				<xsl:choose>
					<xsl:when test="side='right'">
						<xsl:text>35</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>-35</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="varColor" select="concat('#', color)" />

			<xsl:variable name="currentImage" select="string('')" />

			<xsl:call-template name="draw-shape">
				<xsl:with-param name="varLevel" select="$varLevel+$verticalOffset" />
				<xsl:with-param name="BeginPosition" select="$BeginPosition" />
				<xsl:with-param name="EndPosition" select="$EndPosition" />
				<xsl:with-param name="currentShape" select="string('fat-line')" />
				<xsl:with-param name="currentImage" select="$currentImage" />
				<xsl:with-param name="varColor" select="$varColor" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="draw-checks">
		<xsl:param name="VarType" />
		<xsl:param name="BeginPosition" />
		<xsl:param name="EndPosition" />
		<xsl:param name="verticalOffset" />

		<xsl:if
			test="eye_left/color != '008000' and eye_left/color = check_landmark">
			<xsl:variable name="colorLeft">
				<xsl:text>#</xsl:text>
				<xsl:value-of select="eye_left/color" />
			</xsl:variable>
			<xsl:variable name="shapeLeft" select="string('bigeye')" />
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="varLevel" select="-35+$verticalOffset" />
				<xsl:with-param name="BeginPosition" select="$BeginPosition" />
				<xsl:with-param name="EndPosition" select="$EndPosition" />
				<xsl:with-param name="currentShape" select="$shapeLeft" />
				<xsl:with-param name="currentImage" select="string('')" />
				<xsl:with-param name="varColor" select="$colorLeft" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if
			test="eye_right/color != '008000' and eye_right/color = check_landmark">
			<xsl:variable name="colorRight">
				<xsl:text>#</xsl:text>
				<xsl:value-of select="eye_right/color" />
			</xsl:variable>
			<xsl:variable name="shapeRight" select="string('bigeye')" />
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="varLevel" select="35+$verticalOffset" />
				<xsl:with-param name="BeginPosition" select="$BeginPosition" />
				<xsl:with-param name="EndPosition" select="$EndPosition" />
				<xsl:with-param name="currentShape" select="$shapeRight" />
				<xsl:with-param name="currentImage" select="string('')" />
				<xsl:with-param name="varColor" select="$colorRight" />
			</xsl:call-template>
		</xsl:if>

	</xsl:template>

	<xsl:template name="draw-ttt">
		<xsl:param name="VarType" />
		<xsl:param name="BeginPosition" />
		<xsl:param name="EndPosition" />
		<xsl:param name="verticalOffset" />

		<xsl:variable name="varLevel">
			<xsl:choose>
				<xsl:when test="time != 'Far'">
					<xsl:choose>
						<xsl:when test="need='thirsty'">
							<xsl:value-of select="-30 + ( time * 0.60 )" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="30 - ( time * 0.60 )" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="need='thirsty'">
							<xsl:value-of select="40" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="-40" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="varColor">
			<xsl:text>#000000</xsl:text>
		</xsl:variable>

		<xsl:variable name="currentImage" select="string('')" />

		<xsl:call-template name="draw-shape">
			<xsl:with-param name="varLevel" select="$varLevel+$verticalOffset" />
			<xsl:with-param name="BeginPosition" select="$BeginPosition" />
			<xsl:with-param name="EndPosition" select="$EndPosition" />
			<xsl:with-param name="currentShape" select="string('hair')" />
			<xsl:with-param name="currentImage" select="$currentImage" />
			<xsl:with-param name="varColor" select="$varColor" />
		</xsl:call-template>

	</xsl:template>

	<xsl:template name="draw-craving">
		<xsl:param name="VarType" />
		<xsl:param name="BeginPosition" />
		<xsl:param name="EndPosition" />
		<xsl:param name="verticalOffset" />

		<xsl:variable name="varLevel">
			<xsl:choose>
				<xsl:when test="need='thirsty'">
					<xsl:text>35</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>-35</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="varColor">
			<xsl:choose>
				<xsl:when test="need='thirsty'">
					<xsl:text>#E37CFF</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>#9680FF</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="currentImage" select="string('')" />

		<xsl:call-template name="draw-shape">
			<xsl:with-param name="varLevel" select="$varLevel+$verticalOffset" />
			<xsl:with-param name="BeginPosition" select="$BeginPosition" />
			<xsl:with-param name="EndPosition" select="$EndPosition" />
			<xsl:with-param name="currentShape" select="string('line')" />
			<xsl:with-param name="currentImage" select="$currentImage" />
			<xsl:with-param name="varColor" select="$varColor" />
		</xsl:call-template>

	</xsl:template>

	<xsl:template name="draw-craving-change">
		<xsl:param name="VarType" />
		<xsl:param name="BeginPosition" />
		<xsl:param name="EndPosition" />
		<xsl:param name="verticalOffset" />

		<xsl:if test="eat or drink">
			<xsl:variable name="varLevel">
				<xsl:choose>
					<xsl:when test="eat">
						<xsl:text>35</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>-35</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="varColor">
				<xsl:choose>
					<xsl:when test="eat">
						<xsl:text>#E37CFF</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>#9680FF</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="currentShape">
				<xsl:choose>
					<xsl:when test="eat">
						<xsl:text>ruche</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>pollen</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="colorRight">
				<xsl:text>#</xsl:text>
				<xsl:value-of select="eye_right/color" />
			</xsl:variable>
			<xsl:variable name="shapeRight">
				<xsl:choose>
					<xsl:when test="eye_right/color = check_landmark">
						bigeye
					</xsl:when>
					<xsl:otherwise>
						eye
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="varLevel" select="$varLevel+$verticalOffset" />
				<xsl:with-param name="BeginPosition" select="$BeginPosition" />
				<xsl:with-param name="EndPosition" select="$EndPosition" />
				<xsl:with-param name="currentShape" select="$currentShape" />
				<xsl:with-param name="currentImage" select="string('')" />
				<xsl:with-param name="varColor" select="$varColor" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="draw-shape">
		<xsl:param name="varLevel" />
		<xsl:param name="BeginPosition" />
		<xsl:param name="EndPosition" />
		<xsl:param name="currentShape" />
		<xsl:param name="currentImage" />
		<xsl:param name="textValue" />
		<xsl:param name="varColor" />
		<!-- Creation of the shape itself -->
		<g stroke="#000000" fill="{$varColor}">
			<!-- Selection of the class attribute (for CSS). -->
			<!-- <xsl:attribute name="class"> <xsl:value-of select="type" /> </xsl:attribute> -->
			<!-- (1) Here we draw the shape that's been chosen. -->
			<xsl:choose>
				<!-- nothing -->
				<xsl:when test="$currentShape='nothing'" />
				<!-- Image -->
				<xsl:when test="$currentShape='image'">
					<image x="{$BeginPosition -10}" y="{$varLevel -10}" width="20"
						height="20" xlink:href="{$currentImage}" />
				</xsl:when>
				<!-- hair (thinest line) -->
				<xsl:when test="$currentShape='hair'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/hair.svg#hair" />
				</xsl:when>
				<!-- thin line -->
				<xsl:when test="$currentShape='thin-line'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/thinline.svg#thinline" />
				</xsl:when>
				<!-- line -->
				<xsl:when test="$currentShape='line'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/line.svg#line" />
				</xsl:when>
				<!-- fat line -->
				<xsl:when test="$currentShape='fat-line'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/fatline.svg#fatline" />
				</xsl:when>
				<!-- fat line -->
				<xsl:when test="$currentShape='huge-line'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/hugeline.svg#hugeline" />
				</xsl:when>
				<!-- arrow left -->
				<xsl:when test="$currentShape='arrow-left'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/arrowleft.svg#arrowleft" />
				</xsl:when>
				<!-- arrow right -->
				<xsl:when test="$currentShape='arrow-right'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/arrowright.svg#arrowright" />
				</xsl:when>
				<!-- ruche -->
				<xsl:when test="$currentShape='ruche'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/ruche.svg#ruche" />
				</xsl:when>
				<!-- TODO: pollen -->
				<xsl:when test="$currentShape='pollen'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/pollen.svg#pollen" />
				</xsl:when>
				<!-- eye -->
				<xsl:when test="$currentShape='eye'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/eye.svg#eye" />
				</xsl:when>
				<!-- big_eye -->
				<xsl:when test="$currentShape='bigeye'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/bigeye.svg#bigeye" />
				</xsl:when>
				<!-- Tick -->
				<xsl:when test="$currentShape='tick'">
					<polyline>
						<xsl:attribute name="points">
							<xsl:value-of select="$BeginPosition" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 25" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 15" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polyline>
					<text x="{$BeginPosition - 5}" y="{$varLevel}"
						style="font-size:14px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;stroke:none;font-family:Sans">
						<xsl:value-of select="$textValue" />
					</text>
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
							<xsl:value-of select="$BeginPosition - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$varLevel + 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$BeginPosition + 8" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$varLevel - 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle up -->
				<xsl:when test="$currentShape='upuse'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/up.svg#tr-up" />
				</xsl:when>
				<!-- triangle down -->
				<xsl:when test="$currentShape='downuse'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/down.svg#tr-down" />
				</xsl:when>
				<!-- triangle right -->
				<xsl:when test="$currentShape='rightuse'">
					<use x="0" y="{$varLevel}" xlink:href="svg/icons/right.svg#tr-right" />
				</xsl:when>
				<!-- Square + line -->
				<xsl:when test="$currentShape='square_and_line'">
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
				<xsl:value-of select="$varLevel" /><xsl:text> </xsl:text>
				<xsl:value-of select="number($EndPosition)" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$varLevel" /><xsl:text> </xsl:text>
			</xsl:attribute>
		</polyline>
		<polyline opacity="{$opacity}" stroke-width="3">
			<xsl:attribute name="points">
				<xsl:value-of select="$EndPosition -1" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$varLevel -8" /><xsl:text> </xsl:text>
				<xsl:value-of select="$EndPosition -1" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$varLevel +8" /><xsl:text> </xsl:text>
			</xsl:attribute>
		</polyline>
	</xsl:template>

	<xsl:template match="*">
		<xsl:apply-templates select="*" />
	</xsl:template>

</xsl:transform>