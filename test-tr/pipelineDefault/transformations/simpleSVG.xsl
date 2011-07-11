<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common" xmlns:math="http://exslt.org/math"
	xmlns:dyn="http://exslt.org/dynamic" extension-element-prefixes="exsl math dyn"
	version="1.1">
	<xsl:param name="state-filename" />
	<xsl:param name="name" />
	<xsl:output method="xml" omit-xml-declaration="yes" indent="no" />
	<xsl:strip-space elements="*" />

	<xsl:include href="obsel-state.xsl" />
	<xsl:include href="shapes.xsl" />

	<!-- Match the obsels from the select-normalizer, that is, the ponctual 
		obsels. -->
	<xsl:template match="obsel">
		<xsl:param name="state" />

		<!-- We first define some variables which values we will use to draw the 
			shape. -->
		<xsl:variable name="obsel-type">
			<xsl:choose>
				<xsl:when test="type">
					 <xsl:value-of select="type" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>action</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<!-- Lateral position of the shape. -->
		<xsl:variable name="begin-position" select="0" />
		<xsl:variable name="end-position"
			select="$begin-position + number(@end) - number(@begin)" />
		
		<xsl:choose>
			<xsl:when test="$obsel-type = 'action'">
				<!-- We create the embedding group. -->
				<add>
					<g id="{@id}-ns" obsel-id="{@id}" date="{@date}" stroke="#000000">
						<!-- [-32, -24) -->
						<xsl:call-template name="draw-num-iter">
							<xsl:with-param name="begin-position" select="$begin-position" />
							<xsl:with-param name="end-position" select="$end-position" />
							<xsl:with-param name="vertical-offset" select="-110" />
						</xsl:call-template>
					</g>
				</add>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="draw-num-iter">
		<xsl:param name="begin-position" />
		<xsl:param name="end-position" />
		<xsl:param name="vertical-offset" />
		
		<xsl:if test="number(clock) mod 10 = 0">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="end-position" select="$end-position" />
				<xsl:with-param name="shape-type" select="'tick-sided-left'" />
				<xsl:with-param name="text-value" select="clock" />
				<xsl:with-param name="shape-color" select="'#000000'" />
				<xsl:with-param name="height" select="'220'" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:transform>