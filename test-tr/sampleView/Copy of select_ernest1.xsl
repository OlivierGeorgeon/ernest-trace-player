<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:math="http://exslt.org/math" xmlns:dyn="http://exslt.org/dynamic"
	xmlns:exsl="http://exslt.org/common" extension-element-prefixes="math dyn exsl"
	version="1.0">
	<xsl:output method="xml" indent="yes" />
	<xsl:strip-space elements="*" />

	<xsl:template match="event">
		<xsl:if test="@source = 'Ernest'">
			<obsel>
				<type>action</type>
				<xsl:copy-of select="@*" />
				<xsl:attribute name='begin' value='{@date}' />
				<xsl:attribute name='end' value='{@date}' />

				<xsl:copy-of select="eye_left" />
				<xsl:copy-of select="eye_right" />
				<xsl:copy-of select="check_landmark" />
				<xsl:copy-of select="is_thirsty" />
				<xsl:if test="is_thristy"> <!-- typo -->
					<is_thirsty>
						<xsl:copy-of select="is_thristy/@*" />
						<xsl:value-of select="is_thristy" />
					</is_thirsty>
				</xsl:if>
				<xsl:copy-of select="is_hungry" />
				<xsl:copy-of select="time_to_target" />
				<xsl:copy-of select="primitive_enacted_schema" />
				<xsl:copy-of select="primitive_feedback" />
				<xsl:copy-of select="primitive_satisfaction" />
				<xsl:copy-of select="eat" />
				<xsl:copy-of select="drink" />
			</obsel>
		</xsl:if>
	</xsl:template>
	<xsl:template match="sequence">
		<xsl:element name="sequence">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="event" />
			
			<xsl:call-template name="group-adjacent">
				<xsl:with-param name="nodes" select="event[@source='Ernest']" />
				<xsl:with-param name="equal-path" select="string('eye_left/color')" />
				<xsl:with-param name="sort-path" select="string('@date')" />
			</xsl:call-template>

		</xsl:element>
	</xsl:template>

	<xsl:template name="group-adjacent">
		<xsl:param name="nodes" />
		<xsl:param name="equal-path" />
		<xsl:param name="sort-path" />

		<xsl:variable name="features_beginning_frag">
			<xsl:for-each select="$nodes">

				<xsl:variable name="cond">
					<xsl:choose>
						<xsl:when test="position() > 1">
							<xsl:text>./</xsl:text>
							<xsl:value-of select="$equal-path" />
							<xsl:text> != $nodes[</xsl:text>
							<xsl:value-of select="position()-1" /> <!-- TODO: make it depend on the date, not the elements order -->
							<xsl:text>]/</xsl:text>
							<xsl:value-of select="$equal-path" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>.</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:if test="dyn:evaluate($cond)">
					<xsl:copy-of select="." />
				</xsl:if>

			</xsl:for-each>
		</xsl:variable>

		<xsl:variable name="features_beginning"
			select="exsl:node-set($features_beginning_frag)" />

		<xsl:for-each select="$features_beginning/event">
			<xsl:variable name="pos" select="position()" />
			<xsl:variable name="begin" select="@date" />

			<xsl:variable name="next_begin">
				<xsl:if test="$pos != last()">
					<xsl:value-of select="$features_beginning/event[$pos + 1]/@date" />
				</xsl:if>
			</xsl:variable>

			<xsl:variable name="feature_end">
				<xsl:choose>
					<xsl:when test="$pos != last()">
						<xsl:value-of select="math:max($nodes[@date &lt; $next_begin]/@date)" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="math:max($nodes/@date)" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<group>
				<xsl:attribute name="begin">
					<xsl:value-of select="$begin" />
				</xsl:attribute>
				<xsl:attribute name="end">
					<xsl:value-of select="$feature_end" />
				</xsl:attribute>
			</group>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="*">
		<xsl:copy-of select="." />
	</xsl:template>
</xsl:transform>
