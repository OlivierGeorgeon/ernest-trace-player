<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:param name="state-filename" />
	<xsl:param name="name" />
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes" />
	<xsl:strip-space elements="*" />


	<xsl:template match="/">
		<deltas>
			<xsl:apply-templates select="deltas/delta" />
		</deltas>
	</xsl:template>

	<xsl:template match="delta">
		<delta source="{$name}" date="{@date}">
			<xsl:apply-templates select="*" />
		</delta>
	</xsl:template>

	<!-- Match the obsels having a date value -->
	<xsl:template match="obsel">
		<tooltip obsel-id="{@id}">
			<div class="obsel-html" title="obsel-html">
				<div>
					<xsl:text>Id: </xsl:text>
					<xsl:value-of select="@id" />
				</div>

				<div>
					<xsl:text>Date: </xsl:text>
					<xsl:value-of select="@date" />

					<xsl:if test="@begin">
						<xsl:text> - Begin: </xsl:text>
						<xsl:value-of select="@begin" />
					</xsl:if>

					<xsl:if test="@end">
						<xsl:text> - End: </xsl:text>
						<xsl:value-of select="@end" />
					</xsl:if>

				</div>
				<xsl:if test="@source">
					<div>
						<xsl:text>Source: </xsl:text>
						<xsl:value-of select="@source" />
					</div>
				</xsl:if>

				<xsl:apply-templates select="child::node()[not(@display = 'no')]" />
			</div>
		</tooltip>
	</xsl:template>

	<!-- match="*[ends-with(name(), 'color')]", but it's only available in XPATH 2.0, so : -->
	<xsl:template match="*['color' = substring(name(), string-length(name())- string-length('color') +1)]">
		<xsl:element name="div">
			<xsl:element name="span">
				<xsl:value-of select="name()" />
				<xsl:text>: </xsl:text>
			</xsl:element>
			<xsl:element name="div">
				<xsl:attribute name="style">
					<xsl:text>height:1em; width:10em; background-color:#</xsl:text>
					<xsl:value-of select="text()" />
					<xsl:text>; color:#000000; display:inline;</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="text()" />
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template match="slice">
		<xsl:apply-templates select="child::node()" />
	</xsl:template>

	<xsl:template match="*">
		<div>
			<xsl:choose>
				<xsl:when test="not(*)">
					<xsl:value-of select="name()" />
					<xsl:text>: </xsl:text>
					<xsl:value-of select="text()" />
				</xsl:when>
				<xsl:otherwise>
					<span>
						<xsl:value-of select="name()" />
					</span>
					<div style="padding-left: 5em;">
						<xsl:apply-templates select="child::node()" />
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

</xsl:transform>