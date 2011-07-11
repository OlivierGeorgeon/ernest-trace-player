<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:param name="state-filename" />
	<xsl:param name="name" />
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes" />
	<xsl:strip-space elements="*" />

	<xsl:template match="/deltas">
		<deltas>
			<xsl:for-each select="delta">
				<delta source="{$name}" date="{@date}">
					<xsl:apply-templates select="slice/event" />
				</delta>
			</xsl:for-each>
		</deltas>
	</xsl:template>

	<xsl:template match="event">
			<obsel id="{@id}-{$name}" date="{@date}" begin="{@date}" end="{@date}">
				<xsl:copy-of select="@*[name() != 'id']" />
				<xsl:copy-of select="*[not(@display = 'no')]" />
			</obsel>
	</xsl:template>

	<xsl:template match="*">
	</xsl:template>

</xsl:transform>