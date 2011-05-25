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
				<xsl:sort data-type="number" select="@date" />
				<!-- TODO: groups elements with same dates into the same delta (not necessary 
					and useless for now since the would be only one in each anyway) -->
				<delta source="{$name}" date="{@date}">
					<xsl:value-of select="@date" />
				</delta>
			</xsl:for-each>
		</deltas>
	</xsl:template>

	<xsl:template match="*">
	</xsl:template>
</xsl:transform>
