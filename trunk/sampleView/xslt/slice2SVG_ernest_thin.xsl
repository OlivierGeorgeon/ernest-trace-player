<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="xml" omit-xml-declaration="yes" />
	<xsl:param name="obsel2svgFileName" />
	<xsl:param name="scale" /> <!-- Scale in pixels/second -->
	<xsl:param name="begin" />
	<xsl:param name="end" />
	
	<xsl:include href="obsel2SVG_ernest_thin.xsl" />
	<xsl:template match="slice">
		<g>
			<xsl:apply-templates select="obsel" />
		</g>
	</xsl:template>
</xsl:transform>