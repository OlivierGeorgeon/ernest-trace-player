<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:param name="state-filename" />
	<xsl:param name="name" />
	<xsl:output method="xml" omit-xml-declaration="yes" indent="no"/>
	<xsl:strip-space elements="*" />
	
	<xsl:include href="obsel-state.xsl"/>
	<xsl:include href="shapes.xsl"/>
	
	<!-- Match the obsels from the select-normalizer, that is, the ponctual obsels. -->
	<xsl:template match="obsel">
		<xsl:param name="state" />
		
		<!-- We first define some variables which values we will use to draw the shape. -->
		<xsl:variable name="obsel-type" select="type" />
		
		<!-- Lateral position of the shape. -->
		<xsl:variable name="begin-position" select="0" />
		<xsl:variable name="end-position" select="$begin-position + number(@end) - number(@begin)" />
		
		<xsl:choose>
			<xsl:when test="$obsel-type = 'action'">
				<xsl:variable name="action-type" select="primitive_enacted_schema" />
				<!-- We create the embedding group. -->
				<add>
					<g id="{@id}-ns" obsel-id="{@id}" date="{@date}" stroke="#000000">
						<!-- [-32, -24) -->
						<xsl:call-template name="draw-num-iter">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="-32" />
						</xsl:call-template>
						
						<!-- (-15, +5] -->
						<xsl:call-template name="draw-craving-change">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="-19" />
						</xsl:call-template>
					</g>
					<g id="{@id}-s" obsel-id="{@id}" date="{@date}" begin="{@date}" end="{@date}" stroke-width="1pt" stroke="#000000">
						<!-- [+10, +50] -->
						<xsl:call-template name="draw-vision">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="32" />
						</xsl:call-template>
					</g>
					<g id="{@id}-ns2" obsel-id="{@id}" date="{@date}" stroke="#000000"  style="opacity: 0.7">
						<xsl:call-template name="draw-primitive-feedback">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="11" />
						</xsl:call-template>
					</g>
				</add>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Template drawing the time to target lines. -->
	<xsl:template match="new-ttt | lengthen-ttt | finished-ttt">
		<xsl:param name="state" />
		<xsl:variable name="ttt-state" select="$state/ttt" />
		
		<xsl:choose>
			<xsl:when test="name() = 'new-ttt'">
			
				<xsl:variable name="new-ttt-state"><ttt>
					<ttt-interval
						begin="{@begin}"
						end="{@end}"
						color="{@color}"
						ttt-value="{@ttt-value}"
						id="{@id}" />
				</ttt></xsl:variable>
				
				
				<save><xsl:copy-of select="$new-ttt-state"/></save>
				<add>
					<!-- (-23, +5] -->
					<xsl:call-template name="draw-ttt">
						<xsl:with-param name="color" select="@color" />
						<xsl:with-param name="ttt-value" select="@ttt-value" />
						<xsl:with-param name="begin" select="@begin" />
						<xsl:with-param name="end" select="@end" />
						<xsl:with-param name="id" select="@id" />
						<xsl:with-param name="vertical-offset" select="-9" />
					</xsl:call-template>
				</add>
			</xsl:when>
			
			<xsl:when test="name() = 'lengthen-ttt'">
				<xsl:variable name="new-end" select="." />
				<xsl:variable name="new-ttt-state"><ttt>
					<ttt-interval
						begin="{$ttt-state/ttt-interval/@begin}"
						end="{$new-end}"
						ttt-value="{$ttt-state/ttt-interval/@ttt-value}"
						color="{$ttt-state/ttt-interval/@color}"
						id="{$ttt-state/ttt-interval/@id}" />
				</ttt></xsl:variable>
				
				<save><xsl:copy-of select="$new-ttt-state"/></save>
				
				<delete obsel-id="{@obsel-id}" />
				<add>
					<!-- (-23, +5] -->
					<xsl:call-template name="draw-ttt">
						<xsl:with-param name="color" select="$ttt-state/ttt-interval/@color" />
						<xsl:with-param name="ttt-value" select="$ttt-state/ttt-interval/@ttt-value" />
						<xsl:with-param name="begin" select="$ttt-state/ttt-interval/@begin" />
						<xsl:with-param name="end" select="$new-end" />
						<xsl:with-param name="id" select="$ttt-state/ttt-interval/@id" />
						<xsl:with-param name="vertical-offset" select="-9" />
					</xsl:call-template>
				</add>
			</xsl:when>
			
			<xsl:when test="name() = 'finished-ttt'">
			</xsl:when>
			
			<xsl:otherwise>
			<save><xsl:copy-of select="$ttt-state" /></save>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="draw-num-iter">
		<xsl:param name="action-type" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />

		<xsl:if test="number(clock) mod 10 = 0">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'tick-sided-left'" />
				<xsl:with-param name="text-value" select="clock" />
				<xsl:with-param name="shape-color" select="'#000000'" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="draw-vision">
		<xsl:param name="action-type" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />
		
		<xsl:variable name="skewness">
			<xsl:choose>
				<xsl:when test="$action-type = '>'">
					<xsl:text>0</xsl:text>
				</xsl:when>
				<xsl:when test="$action-type = '^'">
					<xsl:text>80.5</xsl:text>
				</xsl:when>
				<xsl:when test="$action-type = 'v'">
					<xsl:text>-80.5</xsl:text>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="vtrans">
			<xsl:choose>
				<xsl:when test="$action-type = '>'">
					<xsl:text>0</xsl:text>
				</xsl:when>
				<xsl:when test="$action-type = '^'">
					<xsl:text>-6</xsl:text>
				</xsl:when>
				<xsl:when test="$action-type = 'v'">
					<xsl:text>6</xsl:text>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<g transform="skewY({$skewness}) translate(0, {$vtrans})">
			<xsl:for-each select="retina/child::node()">
				<xsl:if test="starts-with(name(), 'pixel_0')">
					
					<xsl:variable name="pixel-num" select="substring-after(substring-after(name(), 'pixel_'), '_')" />
					<xsl:variable name="color" select="concat('#', .)" />
					<xsl:variable name="voff" select="-$pixel-num*2" />
					
					<xsl:call-template name="draw-shape">
						<xsl:with-param name="vert-level" select="$vertical-offset+$voff" />
						<xsl:with-param name="begin-position" select="$begin-position" />
						<xsl:with-param name="end-position" select="$end-position" />
						<xsl:with-param name="shape-type" select="'thin-line'" />
						<xsl:with-param name="shape-color" select="$color" />
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</g>
		
	</xsl:template>
	
	<xsl:template name="draw-ttt">
		<xsl:param name="color" />
		<xsl:param name="begin" />
		<xsl:param name="end" />
		<xsl:param name="id" />
		<xsl:param name="ttt-value" />
		<xsl:param name="vertical-offset" />
		
		<xsl:variable name="begin-position" select="0" />
		<xsl:variable name="end-position" select="$begin-position + number($end) - number($begin)" />
		
		<g id="{$id}" date="{$begin}" begin="{$begin}" end="{$end}" stroke="#000000">
			<xsl:variable name="vert-level">
				<xsl:choose>
					<xsl:when test="$ttt-value != 'Far'">
						<xsl:value-of select="10 - ( $ttt-value * 0.18 )" />
					</xsl:when>
					<xsl:otherwise>-10</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:variable name="shape-color">
				<xsl:text>#</xsl:text>
				<xsl:value-of select="$color"/>
			</xsl:variable>
			
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vert-level+$vertical-offset" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'thin-line'" />
				<xsl:with-param name="shape-color" select="$shape-color" />
			</xsl:call-template>
		</g>
	</xsl:template>
	
	<xsl:template name="draw-craving-change">
		<xsl:param name="action-type" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />
		
		<xsl:if test="eat or drink">
			<xsl:variable name="shape-color">
				<xsl:choose>
					<xsl:when test="eat">
						<xsl:text>#E37CFF</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>#9680FF</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="shape-type">
				<xsl:choose>
					<xsl:when test="eat">
						<xsl:text>side-ruche</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>pollen</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset + 10" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="$shape-type" />
				<xsl:with-param name="shape-color" select="$shape-color" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="draw-primitive-feedback">
		<xsl:param name="action-type" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />
		
		<xsl:if test="primitive_feedback = 'false' and $action-type = '>'">
			<xsl:variable name="shape-color">
				<xsl:choose>
					<xsl:when test="$action-type = '>'">
						<xsl:text>#FF0000</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>#008000</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset + 10" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'vertical-thin-line'" />
				<xsl:with-param name="shape-color" select="$shape-color" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
</xsl:transform>