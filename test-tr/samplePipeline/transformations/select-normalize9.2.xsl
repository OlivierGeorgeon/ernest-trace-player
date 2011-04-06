<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:param name="state-filename" />
	<xsl:param name="name" />
	<xsl:output method="xml" indent="no" />
	<xsl:strip-space elements="*" />

	<xsl:template match="/deltas/delta">
		<delta source="{$name}">
			<xsl:apply-templates select="slice/event[@source='Ernest']" />
		</delta>
	</xsl:template>

	<xsl:template match="event">
		<xsl:if test="@source = 'Ernest'">
			<obsel id="{@id}^{$name}" date="{@date}" begin="{@date}" end="{@date}">
				<xsl:copy-of select="@*[name() != 'id']" />
				<type>action</type>

				<xsl:copy-of select="retina" />
				<xsl:copy-of select="current_observation" />
				<xsl:copy-of select="clock" />
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
				<xsl:copy-of select="bump_landmark" />
				<xsl:copy-of select="check_landmark" />
				<xsl:copy-of select="eat" />
				<xsl:copy-of select="drink" />
			</obsel>
		</xsl:if>
	</xsl:template>
</xsl:transform>
