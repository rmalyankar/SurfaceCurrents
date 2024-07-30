<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:template name="current_multipoint">
    <xsl:param name="viewingGroup"/>
    <!--  The viewing group  -->
    <xsl:param name="displayPlane"/>
    <!--  The display plane  -->
    <xsl:param name="drawingPriority"/>
    <!-- don't need variable direction? -->
    <xsl:variable name="speed">
      <xsl:choose>
        <xsl:when test="surfaceCurrentSpeed and number(surfaceCurrentSpeed) = number(surfaceCurrentSpeed) ">
          <xsl:value-of select="number(surfaceCurrentSpeed)"/>
        </xsl:when>
        <xsl:otherwise>-1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="direction">
      <xsl:choose>
        <xsl:when test="surfaceCurrentDirection and number(surfaceCurrentDirection) = number(surfaceCurrentDirection) ">
          <xsl:value-of select="number(surfaceCurrentDirection)"/>
        </xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="scaleFloor"><xsl:value-of select="0.30"/></xsl:variable>
    <xsl:variable name="scaleCeiling"><xsl:value-of select="2.60"/></xsl:variable>
    <!--<xsl:variable name="scaleFactorIntermediate"><xsl:value-of select="0.20"/></xsl:variable>-->
    <xsl:choose>
      <xsl:when test="$speed &lt; 0.0">
        <nullInstruction>
          <featureReference>
            <xsl:value-of select="@id"/>
          </featureReference>	
          <viewingGroup>
            <xsl:value-of select="$viewingGroup"/>
          </viewingGroup>
          <displayPlane>
            <xsl:value-of select="$displayPlane"/>
          </displayPlane>
          <drawingPriority>
            <xsl:value-of select="$drawingPriority"/>
          </drawingPriority>
        </nullInstruction>
      </xsl:when>
      <xsl:otherwise>
        <pointInstruction>
          <featureReference>
            <xsl:value-of select="@id"/>
          </featureReference>			
          <viewingGroup>
            <xsl:value-of select="$viewingGroup"/>
          </viewingGroup>
          <displayPlane>
            <xsl:value-of select="$displayPlane"/>
          </displayPlane>
          <drawingPriority>
            <xsl:value-of select="$drawingPriority"/>
          </drawingPriority>
          <symbol>
            <xsl:choose>
              <xsl:when test="$speed &lt; 0.50">
                <xsl:attribute name="reference">SCAROW01</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="$scaleFloor"/></xsl:attribute>
              </xsl:when>
              <xsl:when test="$speed &lt; 1.00">
                <xsl:attribute name="reference">SCAROW02</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="$scaleFloor"/></xsl:attribute>
              </xsl:when>
              <xsl:when test="$speed &lt; 1.50">
                <xsl:attribute name="reference">SCAROW03</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="$scaleFloor"/></xsl:attribute>
              </xsl:when>
              <xsl:when test="$speed &lt; 2.00">
                <xsl:attribute name="reference">SCAROW03</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="0.40"/></xsl:attribute>
              </xsl:when>
              <xsl:when test="$speed &lt; 3.000">
                <xsl:attribute name="reference">SCAROW04</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="0.60"/></xsl:attribute>
              </xsl:when>
              <xsl:when test="$speed &lt; 5.00">
                <xsl:attribute name="reference">SCAROW05</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="1.00"/></xsl:attribute>
              </xsl:when>
              <xsl:when test="$speed &lt; 7.00">
                <xsl:attribute name="reference">SCAROW06</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="1.40"/></xsl:attribute>
              </xsl:when>
              <xsl:when test="$speed &lt; 10.00">
                <xsl:attribute name="reference">SCAROW07</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="2.00"/></xsl:attribute>
              </xsl:when>
              <xsl:when test="$speed &lt; 13.00">
                <xsl:attribute name="reference">SCAROW08</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="2.60"/></xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="reference">SCAROW09</xsl:attribute>
                <xsl:attribute name="scaleFactor"><xsl:value-of select="$scaleCeiling"/></xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
              <!--<xsl:attribute name="scaleAttribute">surfaceCurrentSpeed</xsl:attribute>-->
              <xsl:attribute name="rotation"><xsl:value-of select="$direction"/></xsl:attribute>
              <xsl:attribute name="rotationCRS">GeographicCRS</xsl:attribute>
          </symbol>
        </pointInstruction>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:transform>