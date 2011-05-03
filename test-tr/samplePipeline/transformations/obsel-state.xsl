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
			<xsl:variable name="next-nodes" select="$nodes[position() &gt; count($group-set/delta)]"/>
			
			<!-- Apply the transformations on the delta elements of the group. -->
			<xsl:variable name="outputs">
				<xsl:apply-templates select="$group-set/delta/*">
					<xsl:with-param name="state" select="$state/saves/save[not(@name)]" />
				</xsl:apply-templates>
				
				<xsl:apply-templates select="$group-set" mode="manage-named-saves">
					<xsl:with-param name="state" select="$state/saves" />
				</xsl:apply-templates>
			</xsl:variable>
			
			<!-- Output the result, but not the saves. -->
			<delta source="{$name}" date="{$nodes[1]/@date}">
				<xsl:copy-of select="exsl:node-set($outputs)/*[name() != 'save']" />
			</delta>
			
			<!-- Extract saves -->
			<xsl:variable name="save-names" select="exsl:node-set($outputs)/save[not(@name = preceding-sibling::save/@name)]" />
			<xsl:variable name="old-saves" select="$state/save[@name and not(@name = $save-names/@name)]" />
			
			<xsl:variable name="saves-temp">
				<saves>
					<save>
						<xsl:copy-of select="exsl:node-set($outputs)/save[not(@name)]/*" />
					</save>
					<xsl:copy-of select="$old-saves" />
					<xsl:copy-of select="exsl:node-set($outputs)/save[@name]" />
				</saves>
			</xsl:variable>
			<xsl:variable name="saves" select="exsl:node-set($saves-temp)" />
			
			<xsl:choose>
				<!-- If there are more nodes to process, recurse on them. -->
				<xsl:when test="count($next-nodes) &gt; 0">
					<xsl:call-template name="fold-applying-templates">
						<xsl:with-param name="nodes" select="$next-nodes" />
						<xsl:with-param name="state" select="$saves" />
					</xsl:call-template>
				</xsl:when>
				<!-- If there are no more nodes to process, 
				     save the state to a file and return. -->
				<xsl:otherwise>
					<exsl:document href="{$state-filename}">
						<xsl:copy-of select="$saves"/>
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
				<xsl:with-param name="nodes" select="$nodes[position() &gt; 1]" />
			</xsl:call-template>
		</xsl:if>
		
	</xsl:template>
	
	<!-- Unnamed saves should pass thru this process untouched -->
	<xsl:template match="*" mode="manage-named-saves">
		<xsl:param name="state" />
		<xsl:call-template name="exec-manage-saves">
			<xsl:with-param name="state" select="$state"/>
			<xsl:with-param name="obsels" select="delta/*"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- Unnamed saves should pass thru this process untouched -->
	<xsl:template name="exec-manage-saves">
		<xsl:param name="state" />
		<xsl:param name="obsels" />
		
		<!-- Process first obsel -->
		<xsl:variable name="output">
			<xsl:apply-templates select="$obsels[1]" mode="named-saves">
				<xsl:with-param name="state" select="$state" />
			</xsl:apply-templates>
		</xsl:variable>
		<xsl:variable name="node-output" select="exsl:node-set($output)" />
		
		<!-- Manage named saves -->
		<xsl:variable name="save-names" select="$node-output/save[@name and not(@name = preceding-sibling::save/@name)]" />
		<!-- Including unnamed saves on purpose -->
		<xsl:variable name="old-saves" select="$state/save[@name and not(@name = $save-names/@name)]" />
		<xsl:variable name="saves-temp">
			<saves>
				<xsl:copy-of select="$state/save[not(@name)]" />
				<xsl:copy-of select="$old-saves" />
				<xsl:copy-of select="$node-output/save[@name]" />
			</saves>
		</xsl:variable>
		<xsl:variable name="new-state" select="exsl:node-set($saves-temp)/saves" />
		
		<!-- Recurse on remaining nodes -->
		<xsl:choose>
			<xsl:when test="count($obsels) &gt; 1">
				<!-- Output nodes except named saves. -->
				<xsl:copy-of select="$node-output/*[not(name() = 'save' and @name)]" />
				
				<xsl:call-template name="exec-manage-saves">
					<xsl:with-param name="state" select="$new-state"/>
					<xsl:with-param name="obsels" select="$obsels[position() > 1]"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<!-- Since it is the last execution, output every nodes. -->
				<!-- Should also include old named saves, but only if changed !!!!!!!!!! -->
				<xsl:copy-of select="$node-output" />
				<xsl:variable name="new-save-names" select="$node-output/save[not(@name = preceding-sibling::save/@name)]" />
				<!-- Excluding unnamed saves -->
				<xsl:copy-of select="$state/save[@name and not(@name = $new-save-names/@name)]" />
				
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:transform>