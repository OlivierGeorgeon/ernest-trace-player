<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:param name="state-filename" />
	<xsl:param name="name" />
	<xsl:output method="xml" indent="no" />
	<xsl:strip-space elements="*" />
	
	
	<xsl:template match="/">
		<deltas>
			<xsl:apply-templates select="deltas/delta" />
		</deltas>
	</xsl:template>
	
	<xsl:template match="delta">
		<delta source="{$name}" date="{@date}" >
			<xsl:apply-templates select="*" />
		</delta>
	</xsl:template>
	
	<!-- Match the obsels having a date value -->
	<xsl:template match="obsel">
		<tooltip obsel-id="{@id}">
			<div class="obsel-html" title="obsel-html">
				<div>
					<xsl:text>Id: </xsl:text><xsl:value-of select="@id" />
				</div>
				
				<div>
					<xsl:text>Date: </xsl:text><xsl:value-of select="@date" />
				
				<xsl:if test="@begin">
						<xsl:text> - Begin: </xsl:text><xsl:value-of select="@begin" />
				</xsl:if>
				
				<xsl:if test="@end">
						<xsl:text> - End: </xsl:text><xsl:value-of select="@end" />
				</xsl:if>
				
				</div>
				<xsl:if test="@source">
					<div>
						<xsl:text>Source: </xsl:text><xsl:value-of select="@source" />
					</div>
				</xsl:if>
				
				<xsl:apply-templates select="*" />
			</div>
		</tooltip>
	</xsl:template>
	
	<xsl:template match="color">
		<div>
			<xsl:text>Color: </xsl:text>
				<div style="height:1em; width:10em; background-color:#{.}; color:#000000; display:inline;">
					<xsl:value-of select="." />
				</div>
		</div>
	</xsl:template>
	
	<xsl:template match="*[starts-with(name(), 'pixel_') or name() = 'bump_landmark' or name() = 'check_landmark']">
		<div>
			<xsl:value-of select="name()"/><xsl:text>: </xsl:text>
				<div style="height:1em; width:10em; background-color:#{.}; color:#000000; display:inline;">
					<xsl:value-of select="." />
				</div>
		</div>
	</xsl:template>
	
	<xsl:template match="check_landmark">
		<div>
			<xsl:text>check_landmark: </xsl:text>
				<div style="height:1em; width:10em; background-color:#{.}; color:#000000; display:inline;">
					<xsl:value-of select="." />
				</div>
		</div>
	</xsl:template>
	
	<xsl:template match="slice">
		<xsl:apply-templates select="*" />
	</xsl:template>
	
	<xsl:template match="*">
		<div>
			<xsl:value-of select="name()" /><xsl:text>: </xsl:text>
			<xsl:choose>
				<xsl:when test="not(*)">
					<xsl:value-of select="."/>
				</xsl:when>
				<xsl:otherwise>
					<div style="padding-left: 5em;">
						<xsl:apply-templates select="child::*" />
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

</xsl:transform>