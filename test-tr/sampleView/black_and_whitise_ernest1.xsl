<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:math="http://exslt.org/math" xmlns:dyn="http://exslt.org/dynamic"
	xmlns:exsl="http://exslt.org/common" extension-element-prefixes="math dyn exsl"
	version="1.0">
	<xsl:output method="xml" indent="yes" />
	<xsl:strip-space elements="*" />

	<xsl:template match="color | check_landmark">
		<xsl:element name="{name()}">
			<xsl:copy-of select="@*" />
			<xsl:choose>
				<xsl:when test=". = 'E37CFF'">000000</xsl:when> <!-- nid -->
				<xsl:when test=". = 'E6CF00'">444444</xsl:when>
				<xsl:when test=". = '2EE600'">606060</xsl:when>
				<xsl:when test=". = '00E6A1'">707070</xsl:when>
				<xsl:when test=". = 'B8E600'">8f8f8f</xsl:when>
				<xsl:when test=". = '2EE600'">A0A0A0</xsl:when>
				<xsl:when test=". = '00E617'">A6A6A6</xsl:when>
				<xsl:when test=". = '00E65C'">AEAEAE</xsl:when>
				<xsl:when test=". = '00E6E6'">AFAFAF</xsl:when>
				<xsl:when test=". = '9680FF'">CCCCCC</xsl:when>
				<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>

	<xsl:template match="*">
		<xsl:element name="{name()}">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="node()" />
		</xsl:element>
	</xsl:template>
</xsl:transform>
