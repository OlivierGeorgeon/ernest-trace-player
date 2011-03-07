<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="xml" indent="yes" />
	<xsl:strip-space elements="*"/>
	
	<xsl:template match="event">
		<obsel id="{date}">
		<xsl:copy-of select="*"/>
		</obsel>
	</xsl:template>
	<xsl:template match="sequence">
		<xsl:element name="sequence">
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates select="*" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="*">
		<xsl:copy-of select="."/>
	</xsl:template>
</xsl:transform>
