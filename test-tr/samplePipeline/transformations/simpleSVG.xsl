<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common" xmlns:math="http://exslt.org/math"
	xmlns:dyn="http://exslt.org/dynamic" extension-element-prefixes="exsl math dyn"
	version="1.1">
	<xsl:param name="state-filename" />
	<xsl:param name="name" />
	<xsl:output method="xml" omit-xml-declaration="yes" indent="no" />
	<xsl:strip-space elements="*" />

	<xsl:include href="obsel-state.xsl" />
	<xsl:include href="shapes.xsl" />

	<!-- Match the obsels from the select-normalizer, that is, the ponctual 
		obsels. -->
	<xsl:template match="obsel">
		<xsl:param name="state" />

		<!-- We first define some variables which values we will use to draw the 
			shape. -->
		<xsl:variable name="obsel-type" select="type" />

		<!-- Lateral position of the shape. -->
		<xsl:variable name="begin-position" select="0" />
		<xsl:variable name="end-position"
			select="$begin-position + number(@end) - number(@begin)" />

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
							<xsl:with-param name="vertical-offset" select="-155" />
						</xsl:call-template>
					</g>
					<g id="{@id}-s" obsel-id="{@id}" date="{@date}" begin="{@date}"
						end="{@date}" stroke-width="1pt" stroke="#000000">
						<!-- [+10, +50] -->
						<xsl:call-template name="draw-vision">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="100" />
						</xsl:call-template>
					</g>
					<g id="{@id}-s2" obsel-id="{@id}" date="{@date}" stroke="#000000">
						<!-- [+10, +50] -->
						<xsl:call-template name="draw-map2">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="25" />
						</xsl:call-template>
					</g>
					<g id="{@id}-ns2" obsel-id="{@id}" date="{@date}" stroke="#000000"
						style="opacity: 1">
						<xsl:call-template name="draw-primitive-feedback">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="0" />
						</xsl:call-template>
					</g>
					<g id="{@id}-s3" obsel-id="{@id}" date="{@date}" stroke="#000000"
						style="opacity: 1">
						<xsl:call-template name="draw-satisfaction">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="-50" />
						</xsl:call-template>
					</g>
					<g id="{@id}-v" obsel-id="{@id}" date="{@date}" stroke="#000000"
						style="opacity: 1">
						<xsl:call-template name="draw-bundle">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="-85" />
						</xsl:call-template>
					</g>
					<g id="{@id}-s3" obsel-id="{@id}" date="{@date}" stroke="#000000"
						style="opacity: 1">
						<xsl:call-template name="draw-attractiveness">
							<xsl:with-param name="action-type" select="$action-type" />
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="-120" />
						</xsl:call-template>
					</g>
				</add>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
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
				<xsl:with-param name="shape-type" select="'tick'" />
				<xsl:with-param name="text-value" select="clock" />
				<xsl:with-param name="shape-color" select="'#000000'" />
				<xsl:with-param name="height" select="'280'" />
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
				<xsl:otherwise>
					0
				</xsl:otherwise>
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
				<xsl:otherwise>
					0
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<g transform="skewY({$skewness}) translate(0, {$vtrans})">
			<xsl:for-each select="retina/child::node()">
				<xsl:if test="starts-with(name(), 'pixel_0')">

					<xsl:variable name="pixel-num"
						select="substring-after(substring-after(name(), 'pixel_'), '_')" />
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

	<xsl:template name="draw-map">
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
					<xsl:text>70</xsl:text>
				</xsl:when>
				<xsl:when test="$action-type = 'v'">
					<xsl:text>-70</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					0
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="vtrans">
			<xsl:choose>
				<xsl:when test="$action-type = '>'">
					<xsl:text>0</xsl:text>
				</xsl:when>
				<xsl:when test="$action-type = '^'">
					<xsl:text>-3</xsl:text>
				</xsl:when>
				<xsl:when test="$action-type = 'v'">
					<xsl:text>3</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					0
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<g transform="skewY({$skewness}) translate(0, {$vtrans})">
			<xsl:for-each select="local_space/child::node()">
				<xsl:if test="starts-with(name(), 'position_')">

					<xsl:variable name="pixel-num"
						select="substring-after(name(), 'position_')" />
					<xsl:variable name="color" select="concat('#', .)" />
					<xsl:variable name="voff" select="-$pixel-num*3" />

					<xsl:call-template name="draw-shape">
						<xsl:with-param name="vert-level" select="$vertical-offset+$voff" />
						<xsl:with-param name="begin-position" select="$begin-position" />
						<xsl:with-param name="end-position" select="$end-position" />
						<xsl:with-param name="shape-type" select="'line-three'" />
						<xsl:with-param name="shape-color" select="$color" />
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</g>

	</xsl:template>

	<xsl:template name="draw-primitive-feedback">
		<xsl:param name="action-type" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />

		<xsl:if
			test="current_observation/dynamic_feature = '|-' or current_observation/dynamic_feature = '|_'">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset + 10" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'down'" />
				<xsl:with-param name="shape-color"
                          select="concat('#', focus/salience)" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if
			test="current_observation/dynamic_feature = '|+' or current_observation/dynamic_feature = '|*'">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset + 13" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'up'" />
				<xsl:with-param name="shape-color"
					select="concat('#', focus/salience)" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if
			test="current_observation/dynamic_feature = '+|' or current_observation/dynamic_feature = '*|'">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset - 23" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'down'" />
				<xsl:with-param name="shape-color"
					select="concat('#', focus/salience)" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if
			test="current_observation/dynamic_feature = '-|' or current_observation/dynamic_feature = '_|'">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset - 21" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'up'" />
				<xsl:with-param name="shape-color"
					select="concat('#', focus/salience)" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if
			test="current_observation/dynamic_feature = '+' or current_observation/dynamic_feature = '_'">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset - 5" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'left'" />
				<xsl:with-param name="shape-color"
					select="concat('#', focus/salience)" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if
			test="current_observation/dynamic_feature = '-' or current_observation/dynamic_feature = '*'">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset - 5" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'square-8'" />
				<xsl:with-param name="shape-color"
					select="concat('#', focus/salience)" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if test="current_observation/dynamic_feature = 'e'">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset - 5" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'circle'" />
				<xsl:with-param name="transform" select="'scale(1,1.5)'" />
				<xsl:with-param name="shape-color" select="concat('#', current_observation/gustatory)" />
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="current_observation/stimuli = 'w'">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset - 5" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'square-8'" />
				<xsl:with-param name="shape-color" select="concat('#', current_observation/kinematic)" />
			</xsl:call-template>
		</xsl:if>

	</xsl:template>
	
	<!-- Template to draw the satisfaction bargraph. -->
	<xsl:template name="draw-satisfaction">
		<xsl:param name="action-type" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />

		<xsl:if test="- current_observation/satisfaction > 0">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'bar-down'" />
				<xsl:with-param name="shape-color" select="'#F08080'" />
				<xsl:with-param name="height"
					select="- current_observation/satisfaction div 10" />
			</xsl:call-template>
		</xsl:if>

		<xsl:if test="current_observation/satisfaction > 0">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'bar-up'" />
				<xsl:with-param name="shape-color" select="'#00FF00'" />
				<xsl:with-param name="height"
					select="current_observation/satisfaction div 10" />
			</xsl:call-template>
		</xsl:if>

	</xsl:template>
	
	<!-- Template to draw the bundle construction. -->
	<xsl:template name="draw-bundle">
		<xsl:param name="action-type" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />

		<xsl:if test="bundle">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'bundle'" />
				<xsl:with-param name="shape-color" select="concat('#', bundle/visual)" />
				<xsl:with-param name="shape-color2" select="concat('#', bundle/gustatory)" />
				<xsl:with-param name="shape-color3" select="concat('#', bundle/tactile)" />
				<xsl:with-param name="shape-color4" select="concat('#', bundle/kinematic)" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<!-- Template to draw the map. -->
	<xsl:template name="draw-map2">
		<xsl:param name="action-type" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />

		<xsl:if test="local_space">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'map'" />
				<xsl:with-param name="shape-color0" select="concat('#', local_space/position_0)" />
				<xsl:with-param name="shape-color1" select="concat('#', local_space/position_1)" />
				<xsl:with-param name="shape-color2" select="concat('#', local_space/position_2)" />
				<xsl:with-param name="shape-color3" select="concat('#', local_space/position_3)" />
				<xsl:with-param name="shape-color4" select="concat('#', local_space/position_4)" />
				<xsl:with-param name="shape-color5" select="concat('#', local_space/position_5)" />
				<xsl:with-param name="shape-color6" select="concat('#', local_space/position_6)" />
				<xsl:with-param name="shape-color7" select="concat('#', local_space/position_7)" />
				<xsl:with-param name="shape-color8" select="concat('#', local_space/position_8)" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<!-- Template to draw the attractiveness bargraph. -->
	<xsl:template name="draw-attractiveness">
		<xsl:param name="action-type" />
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />

		<xsl:if test="current_observation">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'bar-up'" />
				<xsl:with-param name="shape-color" select="concat('#', focus/salience)" />
				<xsl:with-param name="transform" select="concat('scale(1,', concat(current_observation/attractiveness div 300, ')'))" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:transform>