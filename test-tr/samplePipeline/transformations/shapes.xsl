<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xlink"
	version="1.1">

	<xsl:template name="draw-shape">
		<xsl:param name="vert-level" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="shape-type" />
		<xsl:param name="image-url" select="''" />
		<xsl:param name="text-value" select="''" />
		<xsl:param name="shape-color" select="''" />
		<xsl:param name="shape-color2" select="''" />
		<xsl:param name="shape-color3" select="''" />
		<xsl:param name="shape-color4" select="''" />
		<xsl:param name="height" select="'10'" />
		<xsl:param name="transform" select="''" />
		<!-- Creation of the shape itself -->
		<g fill="{$shape-color}">
			<!-- If there is a transform attribute, we can't use y attribute in
				subelements since it would interfer with it (wrong rotation and skew 
				point). -->
			<xsl:if test="$transform != ''">
				<xsl:attribute name="transform">
					<xsl:value-of select="concat('translate(0, ', $vert-level, ')')" />
				</xsl:attribute>
			</xsl:if>

			<!-- Selection of the class attribute (for CSS). -->
			<!-- <xsl:attribute name="class"> <xsl:value-of select="type" /> </xsl:attribute> -->
			<xsl:choose>
				<!-- nothing -->
				<xsl:when test="$shape-type='nothing'" />
				<!-- Image -->
				<xsl:when test="$shape-type='image'">
					<image x="{$begin-position -10}" y="-10" width="20" height="20"
						xlink:href="{$image-url}">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
						</xsl:call-template>
					</image>
				</xsl:when>
				<!-- square -->
				<xsl:when test="$shape-type='nostroke-square'">
					<rect stroke="none" x="-3" width="6" height="6">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-3" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- square -->
				<xsl:when test="$shape-type='vertical-thin-line'">
					<rect x="0" width="2" height="30" stroke="none">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-15" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- square 8 pixels -->
				<xsl:when test="$shape-type='square-8'">
					<rect x="-4" width="8" height="8" stroke="1">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-4" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- bar up -->
				<xsl:when test="$shape-type='bar-up'">
					<rect x="-3" width="6" height="{$height}" stroke="none">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-$height" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- bar down -->
				<xsl:when test="$shape-type='bar-down'">
					<rect x="-3" width="6" height="{$height}" stroke="none">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- hair (thinest line) -->
				<xsl:when test="$shape-type='hair'">
					<rect x="0" width="1" height="1" stroke="none">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-0.5" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- thin line -->
				<xsl:when test="$shape-type='thin-line'">
					<rect x="0" width="1" height="2" stroke="none">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-1" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- line 3 pixels -->
				<xsl:when test="$shape-type='line-three'">
					<rect x="0" width="1" height="3" stroke="none">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-1" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- line -->
				<xsl:when test="$shape-type='line'">
					<rect x="0" width="1" height="4" stroke="none">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-2" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- fat line -->
				<xsl:when test="$shape-type='fat-line'">
					<rect x="0" width="1" height="8" stroke="none">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-4" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- fat line -->
				<xsl:when test="$shape-type='huge-line'">
					<rect x="0" width="1" height="12" stroke="none">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y" select="-6" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- arrow left -->
				<xsl:when test="$shape-type='arrow-left'">
					<g>
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>

						<path type="arc" style="fill:none;stroke-width:2.5" d="M -3,0 A 15,15 0 0,0 3,-16"
							open="true" />
						<path d="M 5.77,0.0 L -2.88,5.0 L -2.88,-5.0 L 5.77,0.0 z "
							stroke="#000000" transform="translate(3,-14) rotate(30)" />
					</g>
				</xsl:when>
				<!-- arrow right -->
				<xsl:when test="$shape-type='arrow-right'">
					<g>
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>
						<path type="arc" style="fill:none;stroke-width:2.5" d="M -3,0 A 15,15 0 0 1 3,16"
							open="true" />
						<path d="M 5.77,0.0 L -2.88,5.0 L -2.88,-5.0 L 5.77,0.0 z "
							stroke="#000000" transform="translate(3,14) rotate(-30)" />
					</g>
				</xsl:when>
				<!-- ruche -->
				<xsl:when test="$shape-type='ruche'">
					<polygon points="-5,5 5,5 5,-3 0,-7 -5,-3">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>
					</polygon>
				</xsl:when>
				<!-- pollen -->
				<xsl:when test="$shape-type='pollen'">
					<path
						d="M0 -3 V3 M-3 0 H3 A3,3 0 1,1 0,3 A3,3 0 1,1 -3,0 A3,3 0 1,1 0,-3 A3,3 0 1,1 3,0 Z"
						style="stroke-width:0.5">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>
					</path>
				</xsl:when>
				<!-- eye -->
				<xsl:when test="$shape-type='eye'">
					<rect x="-4" y="-4" width="8" height="8">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- big eye -->
				<xsl:when test="$shape-type='bigeye'">
					<rect x="-6" y="-6" width="12" height="12">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- Right skewed eye -->
				<xsl:when test="$shape-type='right-skewed-eye'">
					<rect transform="skewY(51) translate(0, -6)" x="-4" y="-4"
						width="8" height="8">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- Left skewed eye -->
				<xsl:when test="$shape-type='left-skewed-eye'">
					<rect transform="skewY(-51) translate(0, 6)" x="-4" y="-4"
						width="8" height="8">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
						</xsl:call-template>
					</rect>
				</xsl:when>
				<!-- Tick -->
				<xsl:when test="$shape-type='tick'">
					<g>
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level + 15" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>

						<polyline  style="stroke:#DDDDDD;stroke-width:1pt">
							<xsl:attribute name="points">
								<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
								<xsl:value-of select="5" /><xsl:text> </xsl:text>
								<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
								<xsl:value-of select="250" /><xsl:text> </xsl:text>
							</xsl:attribute>
						</polyline>
						<text x="{$begin-position - 5}"
							style="font-size:9px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;stroke:none;font-family:Sans">
							<xsl:value-of select="$text-value" />
						</text>
					</g>
				</xsl:when>
				<!-- Tick up -->
				<xsl:when test="$shape-type='tick-sided-left'">
					<g>
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>

						<polyline style="stroke:#DDDDDD;stroke-width:1pt">
							<xsl:attribute name="points">
								<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
								<xsl:value-of select=" - 3" /><xsl:text> </xsl:text>
								<xsl:value-of select="$begin-position" /><xsl:text>,</xsl:text>
								<xsl:value-of select="$height" /><xsl:text> </xsl:text>
							</xsl:attribute>
						</polyline>
						<g transform="translate({$begin-position + 2},-5) rotate(90)">
							<text
								style="font-size:9px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;stroke:none;font-family:Sans">
								<xsl:value-of select="$text-value" />
							</text>
						</g>
					</g>
				</xsl:when>
				<!-- Strip -->
				<xsl:when test="$shape-type='strip' and endTimecode">
					<polygon>
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
						</xsl:call-template>

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
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
						</xsl:call-template>

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
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
						</xsl:call-template>

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
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
						</xsl:call-template>

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
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
						</xsl:call-template>

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
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
						</xsl:call-template>

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
					<polygon points="-8,+6 0,-8 8,+6 ">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>
					</polygon>
				</xsl:when>
				<!-- triangle down -->
				<xsl:when test="$shape-type='downuse'">
					<polygon points="-8,-6 0,8 8,-6 ">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>
					</polygon>
				</xsl:when>
				<!-- triangle right -->
				<xsl:when test="$shape-type='rightuse'">
					<polygon points="-6,-8 8,0 -6,8 ">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>
					</polygon>
				</xsl:when>
				<!-- circle -->
				<xsl:when test="$shape-type='circle'">
					<circle cx="{$begin-position}" r="4">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="'cy'" />
						</xsl:call-template>
					</circle>
				</xsl:when>
                          	<!-- cube -->
				<xsl:when test="$shape-type='cube'">
					<polygon points="-7,-3 3,-3 3,7 -7,7 -7,-3 -3,-7 7,-7 3,-3 3,7 7,3 7,-7 3,-3 ">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="''" />
						</xsl:call-template>
					</polygon>
				</xsl:when>
				<!-- bundle -->
				<xsl:when test="$shape-type='bundle'">
					<g fill="{$shape-color4}" stroke="none">
						<polygon points="-8,4 4,4 9,-1 9,3 4,8 -8,8">
							<xsl:call-template name="transform-shape">
								<xsl:with-param name="transform" select="$transform" />
								<xsl:with-param name="vert-level" select="$vert-level" />
								<xsl:with-param name="y-name" select="''" />
							</xsl:call-template>
						</polygon>
					</g>  
					<g fill="{$shape-color3}" stroke="none">
						<polygon points="-8,1 4,1 9,-4 9,0 4,5 -8,5">
							<xsl:call-template name="transform-shape">
								<xsl:with-param name="transform" select="$transform" />
								<xsl:with-param name="vert-level" select="$vert-level" />
								<xsl:with-param name="y-name" select="''" />
							</xsl:call-template>
						</polygon>
					</g>  
					<g fill="{$shape-color2}" stroke="none">
						<polygon points="-8,-2 4,-2 9,-7 9,-3 4,2 -8,2">
							<xsl:call-template name="transform-shape">
								<xsl:with-param name="transform" select="$transform" />
								<xsl:with-param name="vert-level" select="$vert-level" />
								<xsl:with-param name="y-name" select="''" />
							</xsl:call-template>
						</polygon>
					</g>  
					<g fill="{$shape-color}" stroke="none">
						<polygon points="-8,-4 4,-4 9,-9 9,-6 4,-1 -8,-1">
							<xsl:call-template name="transform-shape">
								<xsl:with-param name="transform" select="$transform" />
								<xsl:with-param name="vert-level" select="$vert-level" />
								<xsl:with-param name="y-name" select="''" />
							</xsl:call-template>
						</polygon>
					</g>  
					<g fill="none" stroke="#000000"  stroke-linejoin="round">
						<polygon points="-8,-4 4,-4 4,8 -8,8">
							<xsl:call-template name="transform-shape">
								<xsl:with-param name="transform" select="$transform" />
								<xsl:with-param name="vert-level" select="$vert-level" />
								<xsl:with-param name="y-name" select="''" />
							</xsl:call-template>
						</polygon>
						<polygon points="4,8 9,3 9,-9 4,-4">
							<xsl:call-template name="transform-shape">
								<xsl:with-param name="transform" select="$transform" />
								<xsl:with-param name="vert-level" select="$vert-level" />
								<xsl:with-param name="y-name" select="''" />
							</xsl:call-template>
						</polygon>
					</g>
					<g fill="{$shape-color}" stroke="#000000" stroke-linejoin="round">
						<polygon points="-8,-4 -3,-9 9,-9 4,-4">
							<xsl:call-template name="transform-shape">
								<xsl:with-param name="transform" select="$transform" />
								<xsl:with-param name="vert-level" select="$vert-level" />
								<xsl:with-param name="y-name" select="''" />
							</xsl:call-template>
						</polygon>
					</g>
				</xsl:when>
				<xsl:otherwise>
					<circle cx="{$begin-position}" r="4">
						<xsl:call-template name="transform-shape">
							<xsl:with-param name="transform" select="$transform" />
							<xsl:with-param name="vert-level" select="$vert-level" />
							<xsl:with-param name="y-name" select="'cy'" />
						</xsl:call-template>
					</circle>
				</xsl:otherwise>
			</xsl:choose>
		</g>
	</xsl:template>

	<xsl:template name="transform-shape">
		<xsl:param name="transform" select="''" />
		<xsl:param name="vert-level" select="0" />
		<xsl:param name="y" select="0" />
		<xsl:param name="y-name" select="'y'" />

		<xsl:choose>
			<xsl:when test="$transform != ''">
				<xsl:attribute name="transform">
					<xsl:value-of select="$transform" />
				</xsl:attribute>
				<xsl:if test="$y != 0 and $y-name != ''">
					<xsl:attribute name="{$y-name}">
						<xsl:value-of select="$y" />
					</xsl:attribute>
				</xsl:if>
			</xsl:when>

			<xsl:otherwise>
				<xsl:if test="$vert-level + $y != 0">

					<xsl:choose>
						<xsl:when test="$y-name != ''">
							<xsl:attribute name="{$y-name}">
								<xsl:value-of select="$vert-level + $y" />
							</xsl:attribute>
						</xsl:when>

						<xsl:otherwise>
							<xsl:attribute name="transform">
								<xsl:text>translate(0,</xsl:text>
								<xsl:value-of select="$vert-level + $y" />
								<xsl:text>)</xsl:text>
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>
</xsl:transform>