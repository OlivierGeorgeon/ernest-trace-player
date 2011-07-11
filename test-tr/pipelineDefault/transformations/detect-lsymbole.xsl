<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dyn="http://exslt.org/dynamic" xmlns:math="http://exslt.org/math"
	xmlns:func="http://exslt.org/functions"
	xmlns:my="http://salade.dyndns.org/my"
	extension-element-prefixes="math dyn func" version="1.1">

	<xsl:include href="functions.xsl" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="test/obsels/*" />
	</xsl:template>

	<xsl:template match="/test/obsels/*[2]">
		<xsl:variable name="last" select="../*[1]" />

		<xsl:element name="result">
			<xsl:attribute name="value">
				<xsl:choose>
					<xsl:when test="/test/end-condition/child::node() and dyn:evaluate(/test/end-condition)">
						<xsl:choose>
							<xsl:when test="dyn:evaluate(/test/begin-condition)">
								<xsl:text>both</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>end</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="dyn:evaluate(/test/begin-condition)">
						<xsl:text>begin</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>none</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>

</xsl:transform>