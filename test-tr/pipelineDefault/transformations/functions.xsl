<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:my="http://salade.dyndns.org/my"
	xmlns:func="http://exslt.org/functions" extension-element-prefixes="exsl func" version="1.1">

	<func:function name="my:ifthenelse">
		<xsl:param name="condition" />
   		<xsl:param name="then" />
   		<xsl:param name="else" />
   		<xsl:choose>
	   		<xsl:when test="$condition">
	   			<func:result select="$then" />
	   		</xsl:when>
	   		<xsl:otherwise>
	   			<func:result select="$else" />
	   		</xsl:otherwise>
   		</xsl:choose>
	</func:function>
	
</xsl:transform>