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
	<xsl:template match="obsel" mode="named-saves">
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
		
		<xsl:choose>
			<xsl:when test="$obsel-type = 'action'">
                                <xsl:call-template name="draw-example-symbol">
                                  <xsl:with-param name="state" select="$state" />
                          	</xsl:call-template>
				<!-- We create the embedding group. -->
				<add>
					<g id="{@id}-ns" obsel-id="{@id}" date="{@date}" stroke="#000000">
						<!-- [-32, -24) -->
						<xsl:call-template name="draw-num-iter">
							<xsl:with-param name="begin-position" select="$begin-position" />
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
		<xsl:param name="vertical-offset" />
		
		<xsl:if test="number(@date) mod 10 = 0">
			<xsl:call-template name="draw-shape">
				<xsl:with-param name="vert-level" select="$vertical-offset" />
				<xsl:with-param name="begin-position" select="$begin-position" />
				<xsl:with-param name="shape-type" select="'tick-sided-left'" />
				<xsl:with-param name="text-value" select="clock" />
				<xsl:with-param name="shape-color" select="'#000000'" />
				<xsl:with-param name="height" select="'280'" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

        <xsl:template name="draw-example-symbol">
          <xsl:param name="state" />
          <xsl:variable name="sym-state" select="$state/save[@name='example-sym']/symbol" />
          <xsl:variable name="last-state" select="$state/save[@name='example-last']" />
          <xsl:choose>
            
            <!-- In the case we have to create a new symbol: at the beginning or when colors mismatch between this element and the previous one. -->
            <xsl:when test="not($last-state/color) or $last-state/color != current_observation/color">
              <!-- All we have to do is to add the symbol. -->
              <add>
                <g id="{@id}-s" obsel-id="{@id}" date="{@date}" begin="{@date}" end="{@date}" stroke="#000000">
                    <xsl:call-template name="draw-shape">
                              <xsl:with-param name="vert-level" select=" - current_observation/distance div 5 + 75" />
                              <xsl:with-param name="begin-position" select="0" />
                              <xsl:with-param name="shape-type" select="'line'" />
                              <xsl:with-param name="shape-color" select="concat('#', current_observation/color)" />
                    </xsl:call-template>
		</g>
	      </add>
              
              <!-- We save the symbole caracteristics, we will probably have to draw it again. -->
              <save name='example-sym'>
                <symbol id="{@id}-s" obsel-id="{@id}" begin="{@date}" end="{@date}"
                	vert-level="{ - current_observation/distance div 5 + 75}"
                	color="#{current_observation/color}" />
              </save>
            </xsl:when>
            <xsl:otherwise>
              <!-- We want to lengthen the symbole, so we first have to delete the old one, before we draw a longer one -->
              <delete obsel-id="{$sym-state/@id}" />
              
              <!-- We draw the longer symbol, using the saved properties.  -->
              <add>
                <g id="{$sym-state/@id}" obsel-id="{$sym-state/@obsel-id}" date="{$sym-state/@begin}" begin="{$sym-state/@begin}" end="{@date}" stroke="#000000">
                    <xsl:call-template name="draw-shape">
                              <xsl:with-param name="vert-level" select="$sym-state/@vert-level" />
                              <xsl:with-param name="begin-position" select="0" />
                              <xsl:with-param name="shape-type" select="'line'" />
                              <xsl:with-param name="shape-color" select="$sym-state/@color" />
                    </xsl:call-template>
		</g>
	      </add>
              
            </xsl:otherwise>
          </xsl:choose>
          
          <!-- We save the current obsel color for the next iteration. -->
          <save name='example-last'>
            <color><xsl:value-of select='current_observation/color' /></color>
          </save>
	</xsl:template>
</xsl:transform>