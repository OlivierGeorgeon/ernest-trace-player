<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="xlink"
	xmlns:dyn="http://exslt.org/dynamic" xmlns:exsl="http://exslt.org/common" 
	xmlns:math="http://exslt.org/math" 
	extension-element-prefixes="math dyn exsl" version="1.1">
	
	<xsl:variable name="initial-state" select="exsl:node-set(document($state-filename))"/>
	
	<!-- This stylesheet fragment is made to make easy transforming obsels, and
	     helps managing states.
	     It sorts and groups incoming obsels by date and call iteratively templates
	     on the groups, while updating the state for each group with the saves made
	     by the transformations on the previous group.
	-->
	
	<xsl:template match="/">
		<deltas>
			<!-- Select, merge and sort the obsels. -->
			<xsl:variable name="delta-elements" select="deltas/delta" />
			
			<!-- Compute the transformations -->
			<xsl:choose>
				<xsl:when test="$delta-elements">
					<xsl:call-template name="fold-applying-templates">
						<xsl:with-param name="nodes" select="$delta-elements" />
						<xsl:with-param name="state" select="$initial-state" />
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise><delta source="{$name}" date="{math:max(/deltas/delta/@date)}" /></xsl:otherwise>
			</xsl:choose>
		</deltas>
	</xsl:template>
	
	<xsl:template name="fold-applying-templates">
		<xsl:param name="nodes"/>
		<xsl:param name="state"/>
		
		<xsl:if test="$nodes[1]">
			<!-- Select the first group of delta elements. -->
			<xsl:variable name="group">
				<deltas>
					<xsl:call-template name="first-group">
						<xsl:with-param name="nodes" select="$nodes"/>
					</xsl:call-template>
				</deltas>
			</xsl:variable>
			<xsl:variable name="group-set" select="exsl:node-set($group)/deltas"/>
			
			<!-- TODO: isn't that way of selecting really slow ? (n^2 total) -->
			<xsl:variable name="next-nodes" select="$nodes[position() > count($group-set/delta)]"/>
			
			<!-- Apply the transformations on the delta elements of the group. -->
			<xsl:variable name="outputs">
				<xsl:apply-templates select="$group-set/delta">
					<xsl:with-param name="state" select="$initial-state" />
				</xsl:apply-templates>
			</xsl:variable>
			
			<!-- Output the result, but not the saves. -->
			<delta source="$name" date="$nodes[1]/@date">
				<xsl:copy-of select="exsl:node-set($outputs)/*[name() != 'save']" />
			</delta>
			
			<!-- Extract saves -->
			<xsl:variable name="saves" select="exsl:node-set($outputs)/save/*" />
			
			<xsl:choose>
				<!-- If there are more nodes to process, recurse on them. -->
				<xsl:when test="$next-nodes">
					<xsl:call-template name="fold-applying-templates">
						<xsl:with-param name="nodes" select="$next-nodes" />
						<xsl:with-param name="state" select="$saves" />
					</xsl:call-template>
				</xsl:when>
				<!-- If there are no more nodes to process, 
				     save the state to a file and return. -->
				<xsl:otherwise>
					<exsl:document href="{$state-filename}">
						<xsl:copy-of select="exsl:node-set($outputs)/save/*"/>
					</exsl:document>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="first-group">
		<xsl:param name="nodes" />
		
		<xsl:copy-of select="$nodes[1]" />
		
		<xsl:if test="$nodes[2] and $nodes[1]/@date = $nodes[2]/@date">
			<xsl:call-template name="first-group">
				<xsl:with-param name="nodes" select="$nodes[position() > 1]" />
			</xsl:call-template>
		</xsl:if>
		
	</xsl:template>
	
</xsl:transform>