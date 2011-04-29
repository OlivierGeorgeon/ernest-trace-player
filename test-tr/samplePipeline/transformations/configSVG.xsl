<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:exsl="http://exslt.org/common"
		xmlns:math="http://exslt.org/math" xmlns:dyn="http://exslt.org/dynamic"
		extension-element-prefixes="exsl math dyn" version="1.1">
	<xsl:param name="state-filename" />
	<xsl:param name="name" />
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes" />
	<xsl:strip-space elements="*" />
	
	<xsl:include href="obsel-state.xsl"/>
	<xsl:include href="shapes.xsl"/>
	
	<xsl:template match="delete">
		<delete obsel-id="{@obsel-id}-ns" />
	</xsl:template>
	
	<xsl:template match="ldelete">
		<delete obsel-id="{@obsel-id}-s" />
	</xsl:template>
	
	<xsl:template match="symbole">
		<xsl:variable name="obsel">
			<xsl:choose>
				<xsl:when test="original-obsel">
					<xsl:copy-of select="original-obsel/*"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="obsel-id" select="@obsel-id"/>
					<xsl:copy-of select="../../delta/*[@id=$obsel-id]"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="symbole" select="."/>
		
		<xsl:for-each select="exsl:node-set($obsel)/*">
			<add>
				<g id="{$symbole/@id}-ns" obsel-id="{@id}" date="{@date}" stroke="#000000">
				<xsl:call-template name="draw-shape">
					<xsl:with-param name="vert-level" select="dyn:evaluate($symbole/@voffset)" />
					<xsl:with-param name="begin-position" select="0" />
					<xsl:with-param name="end-position" select="0" />
					<xsl:with-param name="shape-type" select="dyn:evaluate($symbole/@shape)" />
					<xsl:with-param name="shape-color" select="concat('#', dyn:evaluate($symbole/@color))" />
					<xsl:with-param name="image-url" select="dyn:evaluate($symbole/@image-url)" />
				</xsl:call-template>
				</g>
			</add>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="new-ls" mode="named-saves">
		<xsl:param name="state" />
		<xsl:variable name="ls-id" select="@ls-id" />
		<xsl:variable name="ls-state" select="$state/save[@name=concat('ls-', $ls-id)]/*" />
		
		<xsl:variable name="obsel-temp">
			<xsl:choose>
				<xsl:when test="original-obsel">
					<xsl:copy-of select="original-obsel/*"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="obsel-id" select="@obsel-id"/>
					<xsl:copy-of select="../../delta/*[@id=$obsel-id]"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="obsel" select="exsl:node-set($obsel-temp)/*" />
		
		<xsl:variable name="symbole" select="."/>
		
		<xsl:for-each select="$obsel">
			<xsl:variable name="voffset" select="dyn:evaluate($symbole/@voffset)" />
			<xsl:variable name="shape" select="dyn:evaluate($symbole/@shape)" />
			<xsl:variable name="color" select="concat('#', dyn:evaluate($symbole/@color))" />
			<xsl:variable name="image-url" select="dyn:evaluate($symbole/@image-url)" />
			
			<save name="ls-{$symbole/@ls-id}">
				<ls>
					<lsymbole
						begin="{@date}"
						end="{@date}"
						voffset="{$voffset}"
						shape="{$shape}"
						color="{$color}"
						image-url="{$image-url}"
						id="{@id}" />
				</ls>
			</save>
			
			<add>
				<g id="{$symbole/@id}-s" obsel-id="{@id}" date="{@date}" begin="{@date}" end="{@date}" stroke="#000000">
					<xsl:call-template name="draw-shape">
						<xsl:with-param name="vert-level" select="$voffset" />
						<xsl:with-param name="begin-position" select="0" />
						<xsl:with-param name="end-position" select="0" />
						<xsl:with-param name="shape-type" select="$shape" />
						<xsl:with-param name="shape-color" select="$color" />
						<xsl:with-param name="image-url" select="$image-url" />
					</xsl:call-template>
				</g>
			</add>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="lengthen-ls" mode="named-saves">
		<xsl:param name="state" />
		<xsl:variable name="ls-id" select="@ls-id" />
		<xsl:variable name="ls-state" select="$state/save[@name=concat('ls-', $ls-id)]/ls" />
		<xsl:variable name="obsel-temp">
			<xsl:choose>
				<xsl:when test="original-obsel">
					<xsl:copy-of select="original-obsel/*"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="obsel-id" select="@obsel-id"/>
					<xsl:copy-of select="../../delta/*[@id=$obsel-id]"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="obsel" select="exsl:node-set($obsel-temp)/*" />
		
		<xsl:variable name="new-end" select="$obsel/@date" />
		
		<xsl:variable name="symbole" select="."/>
		
		<xsl:for-each select="$obsel">
			<xsl:variable name="begin" select="$ls-state/lsymbole/@begin"/>
			<xsl:variable name="end" select="@date"/>
			<xsl:variable name="voffset" select="$ls-state/lsymbole/@voffset" />
			<xsl:variable name="shape" select="$ls-state/lsymbole/@shape" />
			<xsl:variable name="color" select="$ls-state/lsymbole/@color" />
			<xsl:variable name="image-url" select="$ls-state/lsymbole/@image-url" />
			<xsl:variable name="id" select="$ls-state/lsymbole/@id"/>
			
			<save name="ls-{$symbole/@ls-id}">
				<ls>
					<lsymbole
						begin="{$begin}"
						end="{$end}"
						voffset="{$voffset}"
						shape="{$shape}"
						color="{$color}"
						image-url="{$image-url}"
						id="{$id}" />
				</ls>
			</save>
			
			<delete obsel-id="{$symbole/@id}-s" />
			<add>
				<g id="{$symbole/@id}-s" obsel-id="{$id}" date="{$begin}" begin="{$begin}" end="{$end}" stroke="#000000">
				<xsl:call-template name="draw-shape">
					<xsl:with-param name="vert-level" select="$voffset" />
					<xsl:with-param name="begin-position" select="0" />
					<xsl:with-param name="end-position" select="0" />
					<xsl:with-param name="shape-type" select="$shape" />
					<xsl:with-param name="shape-color" select="$color" />
					<xsl:with-param name="image-url" select="$image-url" />
				</xsl:call-template>
				</g>
			</add>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="finished-ls" mode="named-saves">
		<xsl:param name="state" />
		<!-- Erase saves produced by this symbole. -->
		<save name="ls-{@ls-id}" />
	</xsl:template>
	
</xsl:transform>