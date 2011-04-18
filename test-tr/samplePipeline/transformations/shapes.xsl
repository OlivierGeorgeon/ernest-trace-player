<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xlink" version="1.1">

	<xsl:template name="draw-shape">
		<xsl:param name="vert-level" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="shape-type" />
		<xsl:param name="image-url" select="''" />
		<xsl:param name="text-value" select="''" />
		<xsl:param name="shape-color" select="''" />
		<!-- Creation of the shape itself -->
		<g fill="{$shape-color}">
			<!-- Selection of the class attribute (for CSS). -->
			<!-- <xsl:attribute name="class"> <xsl:value-of select="type" /> </xsl:attribute> -->
			<!-- (1) Here we draw the shape that's been chosen. -->
			<xsl:choose>
				<!-- nothing -->
				<xsl:when test="$shape-type='nothing'" />
				<!-- Image -->
				<xsl:when test="$shape-type='image'">
					<image x="{$begin-position -10}" y="{$vert-level -10}" width="20"
						height="20" xlink:href="{$image-url}" />
				</xsl:when>
				<!-- square -->
				<xsl:when test="$shape-type='nostroke-square'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/square.svg#square" />
				</xsl:when>
				<!-- square -->
				<xsl:when test="$shape-type='vertical-thin-line'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/verticalthinline.svg#verticalthinline" />
				</xsl:when>
				<!-- hair (thinest line) -->
				<xsl:when test="$shape-type='hair'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/hair.svg#hair" />
				</xsl:when>
				<!-- thin line -->
				<xsl:when test="$shape-type='thin-line'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/thinline.svg#thinline" />
				</xsl:when>
				<!-- line -->
				<xsl:when test="$shape-type='line'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/line.svg#line" />
				</xsl:when>
				<!-- fat line -->
				<xsl:when test="$shape-type='fat-line'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/fatline.svg#fatline" />
				</xsl:when>
				<!-- fat line -->
				<xsl:when test="$shape-type='huge-line'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/hugeline.svg#hugeline" />
				</xsl:when>
				<!-- arrow left -->
				<xsl:when test="$shape-type='arrow-left'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/arrowleft.svg#arrowleft" />
				</xsl:when>
				<!-- arrow right -->
				<xsl:when test="$shape-type='arrow-right'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/arrowright.svg#arrowright" />
				</xsl:when>
				<!-- ruche -->
				<xsl:when test="$shape-type='ruche'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/ruche.svg#ruche" />
				</xsl:when>
				<!-- side-ruche -->
				<xsl:when test="$shape-type='side-ruche'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/sideruche.svg#sideruche" />
				</xsl:when>
				<!-- pollen -->
				<xsl:when test="$shape-type='pollen'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/pollen.svg#pollen" />
				</xsl:when>
				<!-- eye -->
				<xsl:when test="$shape-type='eye'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/eye.svg#eye" />
				</xsl:when>
				<!-- big eye -->
				<xsl:when test="$shape-type='bigeye'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/bigeye.svg#bigeye" />
				</xsl:when>
				<!-- Right skewed eye -->
				<xsl:when test="$shape-type='right-skewed-eye'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/rseye.svg#rseye" />
				</xsl:when>
				<!-- Left skewed eye -->
				<xsl:when test="$shape-type='left-skewed-eye'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/lseye.svg#lseye" />
				</xsl:when>
				<!-- Tick -->
				<xsl:when test="$shape-type='tick'">
					<polyline>
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 25" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 15" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polyline>
					<text x="{$begin-position - 5}" y="{$vert-level}"
						style="font-size:14px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;stroke:none;font-family:Sans">
						<xsl:value-of select="$text-value" />
					</text>
				</xsl:when>
				<!-- Tick up -->
				<xsl:when test="$shape-type='tick-sided-left'">
					<polyline style="stroke:#AAAAAA;stroke-width:1pt">
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 3" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level + 60" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polyline>
					<g transform="translate({$begin-position + 2},{$vert-level - 5}) rotate(90)"><text
						style="font-size:9px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;stroke:none;font-family:Sans">
						<xsl:value-of select="$text-value" />
					</text></g>
				</xsl:when>
				<!-- Strip -->
				<xsl:when test="$shape-type='strip' and endTimecode">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$end-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$end-position" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- Square -->
				<xsl:when test="$shape-type='square'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position - 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle left -->
				<xsl:when test="$shape-type='left'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 8" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle right -->
				<xsl:when test="$shape-type='right'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position - 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 8" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle up -->
				<xsl:when test="$shape-type='up'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 8" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle down -->
				<xsl:when test="$shape-type='down'">
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level + 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 8" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle up -->
				<xsl:when test="$shape-type='upuse'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/up.svg#tr-up" />
				</xsl:when>
				<!-- triangle down -->
				<xsl:when test="$shape-type='downuse'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/down.svg#tr-down" />
				</xsl:when>
				<!-- triangle right -->
				<xsl:when test="$shape-type='rightuse'">
					<use x="0" y="{$vert-level}" xlink:href="svg/icons/right.svg#tr-right" />
				</xsl:when>
				<!-- Square + line -->
				<xsl:when test="$shape-type='square_and_line'">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="vert-level" select="$vert-level" />
						<xsl:with-param name="begin-position" select="$begin-position" />
						<xsl:with-param name="end-position" select="$end-position" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position - 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle left + line -->
				<xsl:when test="$shape-type='left_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="vert-level" select="$vert-level" />
						<xsl:with-param name="begin-position" select="$begin-position" />
						<xsl:with-param name="end-position" select="$end-position" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 8" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle right + line -->
				<xsl:when test="$shape-type='right_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="vert-level" select="$vert-level" />
						<xsl:with-param name="begin-position" select="$begin-position" />
						<xsl:with-param name="end-position" select="$end-position" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 6" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position - 6" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 8" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle up + line -->
				<xsl:when test="$shape-type='up_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="vert-level" select="$vert-level" />
						<xsl:with-param name="begin-position" select="$begin-position" />
						<xsl:with-param name="end-position" select="$end-position" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 8" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level + 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- triangle down + line -->
				<xsl:when test="$shape-type='down_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="vert-level" select="$vert-level" />
						<xsl:with-param name="begin-position" select="$begin-position" />
						<xsl:with-param name="end-position" select="$end-position" />
					</xsl:call-template>
					<polygon>
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="points">
							<xsl:value-of select="$begin-position - 8" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
							<xsl:value-of select="$vert-level + 8" /><xsl:text> </xsl:text>
							<xsl:value-of select="$begin-position + 8" /><xsl:text>, </xsl:text>
							<xsl:value-of select="$vert-level - 6" /><xsl:text> </xsl:text>
						</xsl:attribute>
					</polygon>
				</xsl:when>
				<!-- circle + line -->
				<xsl:when test="$shape-type='circle_and_line' and endTimecode">
					<xsl:call-template name="display_duration_line">
						<xsl:with-param name="vert-level" select="$vert-level" />
						<xsl:with-param name="begin-position" select="$begin-position" />
						<xsl:with-param name="end-position" select="$end-position" />
					</xsl:call-template>
					<circle cx="{$begin-position}" r="4">
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="cy">
							<xsl:value-of select="$vert-level" />
						</xsl:attribute>
					</circle>
				</xsl:when>
				<!-- circle -->
				<xsl:when test="$shape-type='circle'">
					<circle cx="{$begin-position}" r="4">
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="cy">
							<xsl:value-of select="$vert-level" />
						</xsl:attribute>
					</circle>
				</xsl:when>
				<xsl:otherwise>
					<circle cx="{$begin-position}" r="4">
						<!-- Set the attributes of the obsels -->
						<xsl:attribute name="cy">
							<xsl:value-of select="$vert-level" />
						</xsl:attribute>
					</circle>
				</xsl:otherwise>
			</xsl:choose>
		</g>
	</xsl:template>


	<!-- Draw the duration lines -->
	<xsl:template name="display_duration_line">
		<xsl:param name="vert-level" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:variable name="opacity" select="0.5" />
		<polyline opacity="{$opacity}">
			<xsl:attribute name="points">
				<xsl:value-of select="number($begin-position)" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$vert-level" /><xsl:text> </xsl:text>
				<xsl:value-of select="number($end-position)" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$vert-level" /><xsl:text> </xsl:text>
			</xsl:attribute>
		</polyline>
		<polyline opacity="{$opacity}" stroke-width="3px">
			<xsl:attribute name="points">
				<xsl:value-of select="$end-position -1" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$vert-level -8" /><xsl:text> </xsl:text>
				<xsl:value-of select="$end-position -1" /><xsl:text>,</xsl:text>
				<xsl:value-of select="$vert-level +8" /><xsl:text> </xsl:text>
			</xsl:attribute>
		</polyline>
	</xsl:template>
	
</xsl:transform>