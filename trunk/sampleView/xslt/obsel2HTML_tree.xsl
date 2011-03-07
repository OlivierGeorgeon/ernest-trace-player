<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xlink"
	version="1.0">
	<xsl:output method="xml" omit-xml-declaration="yes" />

	<!-- Match the obsels having a date value -->
	<xsl:template match="obsel">
		<div class="obsel-html" title="obsel-html">
			<p>
				<xsl:text>Id: </xsl:text><xsl:value-of select="@id" />
			</p>
			
			<p>
				<xsl:text>Date: </xsl:text><xsl:value-of select="@date" />
			
			<xsl:if test="@begin">
					<xsl:text> - Begin: </xsl:text><xsl:value-of select="@begin" />
			</xsl:if>
			
			<xsl:if test="@end">
					<xsl:text> - End: </xsl:text><xsl:value-of select="@end" />
			</xsl:if>
			
			</p>
			<xsl:if test="@source">
				<p>
					<xsl:text>Source: </xsl:text><xsl:value-of select="@source" />
				</p>
			</xsl:if>
			
			<xsl:apply-templates select="*" />
		</div>
	</xsl:template>
	
	<xsl:template match="color">
		<p>
			<xsl:text>Color: </xsl:text>
				<div style="height:1em; width:10em; background-color:#{.}; color:#000000; display:inline;">
					<xsl:value-of select="." />
				</div>
		</p>
	</xsl:template>
	
	<xsl:template match="check_landmark">
		<p>
			<xsl:text>check_landmark: </xsl:text>
				<div style="height:1em; width:10em; background-color:#{.}; color:#000000; display:inline;">
					<xsl:value-of select="." />
				</div>
		</p>
	</xsl:template>
	
	<xsl:template match="slice">
		<xsl:apply-templates select="*" />
	</xsl:template>
	
	
	<xsl:template match="*">
		<p>
			<xsl:value-of select="name()" /><xsl:text>: </xsl:text>
			<xsl:choose>
				<xsl:when test="not(*)">
					<xsl:value-of select="."/>
				</xsl:when>
				<xsl:otherwise>
					<p style="padding-left: 5em;">
						<xsl:apply-templates select="child::*" />
					</p>
				</xsl:otherwise>
			</xsl:choose>
		</p>
	</xsl:template>

</xsl:transform>