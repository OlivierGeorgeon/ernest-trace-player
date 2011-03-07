<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:math="http://exslt.org/math" xmlns:dyn="http://exslt.org/dynamic"
	xmlns:exsl="http://exslt.org/common" extension-element-prefixes="math dyn exsl"
	version="1.0">
	<xsl:output method="xml" indent="yes" />
	<xsl:strip-space elements="*" />

	<xsl:template match="event">
		<xsl:if test="@source = 'Ernest'">
			<obsel id="{@id}0" begin="{@date}" end="{@date}">
				<xsl:copy-of select="@*[name() != 'id']" />
				<type>action</type>

				<xsl:copy-of select="eye_left" />
				<xsl:copy-of select="eye_right" />
				<xsl:copy-of select="clock" />
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

			<xsl:variable name="ernests" select="event[@source='Ernest']" />

			<xsl:variable name="group-eye-left">
				<xsl:call-template name="group-adjacent">
					<xsl:with-param name="nodeset" select="$ernests" />
					<xsl:with-param name="equal-path" select="string('eye_left/color')" />
					<xsl:with-param name="sort-path" select="string('@date')" />
					<xsl:with-param name="date-path" select="string('@id')" />
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="group-eye-right">
				<xsl:call-template name="group-adjacent">
					<xsl:with-param name="nodeset" select="$ernests" />
					<xsl:with-param name="equal-path" select="string('eye_right/color')" />
					<xsl:with-param name="sort-path" select="string('@date')" />
					<xsl:with-param name="date-path" select="string('@id')" />
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="group-hungry">
				<xsl:call-template name="group-adjacent">
					<xsl:with-param name="nodeset" select="event[@source='Ernest']" />
					<xsl:with-param name="equal-path" select="string('is_hungry')" />
					<xsl:with-param name="sort-path" select="string('@date')" />
					<xsl:with-param name="date-path" select="string('@id')" />
				</xsl:call-template>
			</xsl:variable>

			<xsl:variable name="group-thirsty">
				<xsl:call-template name="group-adjacent">
					<xsl:with-param name="nodeset" select="event[@source='Ernest']" />
					<xsl:with-param name="equal-path" select="string('is_thristy')" />
					<xsl:with-param name="sort-path" select="string('@date')" />
					<xsl:with-param name="date-path" select="string('@id')" />
				</xsl:call-template>
			</xsl:variable>
			
			<xsl:variable name="group-ttt">
				<xsl:call-template name="group-adjacent">
					<xsl:with-param name="nodeset" select="event[@source='Ernest']" />
					<xsl:with-param name="equal-path" select="string('time_to_target')" />
					<xsl:with-param name="sort-path" select="string('@date')" />
					<xsl:with-param name="date-path" select="string('@id')" />
				</xsl:call-template>
			</xsl:variable>

			<xsl:for-each select="exsl:node-set($group-eye-left)/group">
				<xsl:variable name="beginid" select="@begin" />
				<xsl:variable name="endid" select="@end" />
				<obsel id="{$beginid}1" date='{$ernests[@id = $beginid]/@date}'
					begin='{$ernests[@id = $beginid]/@date}' end='{$ernests[@id = $endid]/@date}'>
					<type>feature</type>
					<side>left</side>
					<color>
						<xsl:value-of select="$ernests[@id = $beginid]/eye_left/color" />
					</color>
				</obsel>
			</xsl:for-each>

			<xsl:for-each select="exsl:node-set($group-eye-right)/group">
				<xsl:variable name="beginid" select="@begin" />
				<xsl:variable name="endid" select="@end" />
				<obsel id="{$beginid}3" date='{$ernests[@id = $beginid]/@date}'
					begin='{$ernests[@id = $beginid]/@date}' end='{$ernests[@id = $endid]/@date}'>
					<type>feature</type>
					<side>right</side>
					<color>
						<xsl:value-of select="$ernests[@id = $beginid]/eye_right/color" />
					</color>
				</obsel>
			</xsl:for-each>

			<xsl:for-each select="exsl:node-set($group-thirsty)/group">
				<xsl:variable name="beginid" select="@begin" />
				<xsl:variable name="endid" select="@end" />
				<xsl:if test="$ernests[@id = $beginid]/is_thristy = 'true'">
					<obsel id="{$beginid}4" date='{$ernests[@id = $beginid]/@date}'
						begin='{$ernests[@id = $beginid]/@date}' end='{$ernests[@id = $endid]/@date}'>
						<type>craving</type>
						<need>thirsty</need>
					</obsel>
				</xsl:if>
			</xsl:for-each>

			<xsl:for-each select="exsl:node-set($group-hungry)/group">
				<xsl:variable name="beginid" select="@begin" />
				<xsl:variable name="endid" select="@end" />
				<xsl:if test="$ernests[@id = $beginid]/is_hungry = 'true'">
					<obsel id="{$beginid}2" date='{$ernests[@id = $beginid]/@date}'
						begin='{$ernests[@id = $beginid]/@date}' end='{$ernests[@id = $endid]/@date}'>
						<type>craving</type>
						<need>hungry</need>
					</obsel>
				</xsl:if>
			</xsl:for-each>
			
			
			<xsl:for-each select="exsl:node-set($group-ttt)/group">
				<xsl:variable name="beginid" select="@begin" />
				<xsl:variable name="endid" select="@end" />
				<obsel id="{$beginid}2" date='{$ernests[@id = $beginid]/@date}'
					begin='{$ernests[@id = $beginid]/@date}' end='{$ernests[@id = $endid]/@date}'>
					<type>percent_to_target</type>
					<xsl:variable name="crave-group" select="exsl:node-set($group-hungry)/group[@begin &lt;= $beginid and @end &gt; $beginid]" />
					<time>
						<xsl:variable name="percent-dist" select="100.0 * number($ernests[@id = $beginid]/time_to_target) div number($ernests[@id = $crave-group/@begin]/time_to_target)" />
						<xsl:choose>
						<xsl:when test="$percent-dist &lt;= 100">
							<xsl:value-of select="$percent-dist" />
						</xsl:when>
						<xsl:otherwise><xsl:text>Far</xsl:text></xsl:otherwise>
						</xsl:choose>
					</time>
					<need>
						<xsl:choose>
							<xsl:when test="$ernests[@id = $crave-group/@begin]/is_hungry = 'true'">
								<xsl:text>hungry</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>thirsty</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</need>
				</obsel>
			</xsl:for-each>
			
			<xsl:apply-templates select="event" />

		</xsl:element>
	</xsl:template>

	<xsl:template name="group-adjacent">
		<xsl:param name="nodeset" />
		<xsl:param name="equal-path" />
		<xsl:param name="sort-path" select="position()" />
		<xsl:param name="sort-data-type" select="number" />
		<xsl:param name="date-path" select="@date" />

		<xsl:variable name="nodes_frag">
			<xsl:for-each select="$nodeset">
				<xsl:sort select="dyn:evaluate($sort-path)" data-type="number"
					order="ascending" />
				<xsl:copy-of select="." />
			</xsl:for-each>
		</xsl:variable>

		<xsl:variable name="nodes" select="exsl:node-set($nodes_frag)/*" />

		<xsl:variable name="features_bounds_frag">
			-->
			<xsl:for-each select="$nodes">
				<xsl:variable name="pos" select="position()" />
				<xsl:variable name="posm1" select="$pos - 1" />

				<xsl:variable name="cond">
					<xsl:choose>

						<xsl:when test="$pos != 1">
							<xsl:text>./</xsl:text>
							<xsl:value-of select="$equal-path" />
							<xsl:text> != $nodes[$posm1]/</xsl:text>
							<xsl:value-of select="$equal-path" />
						</xsl:when>

						<xsl:otherwise>
							<xsl:text>1</xsl:text>
						</xsl:otherwise>

					</xsl:choose>
				</xsl:variable>

				<xsl:if test="dyn:evaluate($cond)">
					<xsl:if test="$pos != 1">
						<xsl:copy-of select="$nodes[$posm1]" />
					</xsl:if>
					<xsl:copy-of select="." />
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<xsl:variable name="features_bounds"
			select="exsl:node-set($features_bounds_frag)/*" />

		<xsl:for-each select="$features_bounds">
			<xsl:if test="position() mod 2 = 1">
				<xsl:variable name="pos-begin" select="position()" />
				<xsl:variable name="pos-end" select="$pos-begin + 1" />
				<xsl:variable name="begin-date"
					select="dyn:evaluate(concat('$features_bounds[$pos-begin]/', $date-path))" />
				<xsl:variable name="end-date">
					<xsl:choose>
						<xsl:when test="$pos-begin = last()">
							<xsl:value-of
								select="dyn:evaluate(concat('$nodes[count($nodes)]/', $date-path))" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of
								select="dyn:evaluate(concat('$features_bounds[$pos-end]/', $date-path))" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>


				<group>
					<xsl:attribute name="begin">
						<xsl:value-of select="$begin-date" />
					</xsl:attribute>
					<xsl:attribute name="end">
						<xsl:value-of select="$end-date" />
					</xsl:attribute>
				</group>
			</xsl:if>
		</xsl:for-each>

	</xsl:template>

</xsl:transform>
