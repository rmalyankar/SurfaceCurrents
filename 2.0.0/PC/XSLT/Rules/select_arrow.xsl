<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" version="1.0">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:template name="select_arrow">
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
    <xsl:variable name="scale">
      <xsl:choose>
        <xsl:when test="$speed >= 0.01"><xsl:value-of select="fn:min(fn:max(1.50, $speed), 13.00) * 0.20"/></xsl:when>
        <xsl:otherwise>0.01</xsl:otherwise>
      </xsl:choose> 
    </xsl:variable>
    <coverageInstruction>
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
      <coverageFill>
        <attributeCode>surfaceCurrentSpeed</attributeCode>
        <placement>directPosition</placement>
        <!-- lookup entry to catch fill value? Fill value for speed is -9999.0 -->
        <lookup>
          <label>SurfaceCurrentSpeedBand1</label>
          <range>
            <xsl:attribute name="lower">0.00</xsl:attribute>
            <xsl:attribute name="upper">0.50</xsl:attribute>
            <xsl:attribute name="closure">geLtInterval</xsl:attribute>  
          </range>
          <color>
            <startColor>SCBN1</startColor>
          </color>
          <symbol>
            <symbolRef>SCAROW10</symbolRef>
            <defaultRotation>0.0</defaultRotation>
            <rotationCRS>GeographicCRS</rotationCRS>
            <defaultScale>0.3</defaultScale>
            <rotationAttribute>surfaceCurrentDirection</rotationAttribute>
            <rotationFactor>1.0</rotationFactor>
          </symbol>
        </lookup>
        <lookup>
          <label>SurfaceCurrentSpeedBand2</label>
          <range>
            <xsl:attribute name="lower">0.50</xsl:attribute>
            <xsl:attribute name="upper">1.00</xsl:attribute>
            <xsl:attribute name="closure">geLtInterval</xsl:attribute>  
          </range>
          <color>
            <startColor>SCBN2</startColor>
          </color>
          <symbol>
            <symbolRef>SCAROW10</symbolRef>
            <defaultRotation>0.0</defaultRotation>
            <rotationCRS>GeographicCRS</rotationCRS>
            <defaultScale>0.45</defaultScale>
            <rotationAttribute>surfaceCurrentDirection</rotationAttribute>
            <rotationFactor>1.0</rotationFactor>
          </symbol>
        </lookup>
        <lookup>
          <label>SurfaceCurrentSpeedBand3</label>
          <range>
            <xsl:attribute name="lower">1.00</xsl:attribute>
            <xsl:attribute name="upper">2.00</xsl:attribute>
            <xsl:attribute name="closure">geLtInterval</xsl:attribute>  
          </range>
          <color>
            <startColor>SCBN3</startColor>
          </color>
          <symbol>
            <symbolRef>SCAROW10</symbolRef>
            <defaultRotation>0.0</defaultRotation>
            <rotationCRS>GeographicCRS</rotationCRS>
            <defaultScale>0.6</defaultScale>
            <rotationAttribute>surfaceCurrentDirection</rotationAttribute>
            <rotationFactor>1.0</rotationFactor>
          </symbol>
        </lookup>
        <lookup>
          <label>SurfaceCurrentSpeedBand4</label>
          <range>
            <xsl:attribute name="lower">2.00</xsl:attribute>
            <xsl:attribute name="upper">3.00</xsl:attribute>
            <xsl:attribute name="closure">geLtInterval</xsl:attribute>  
          </range>
          <color>
            <startColor>SCBN4</startColor>
          </color>
          <symbol>
            <symbolRef>SCAROW10</symbolRef>
            <defaultRotation>0.0</defaultRotation>
            <rotationCRS>GeographicCRS</rotationCRS>
            <defaultScale>0.75</defaultScale>
            <rotationAttribute>surfaceCurrentDirection</rotationAttribute>
            <rotationFactor>1.0</rotationFactor>
          </symbol>
        </lookup>
        <lookup>
          <label>SurfaceCurrentSpeedBand5</label>
          <range>
            <xsl:attribute name="lower">3.00</xsl:attribute>
            <xsl:attribute name="upper">5.00</xsl:attribute>
            <xsl:attribute name="closure">geLtInterval</xsl:attribute>  
          </range>
          <color>
            <startColor>SCBN5</startColor>
          </color>
          <symbol>
            <symbolRef>SCAROW10</symbolRef>
            <defaultRotation>0.0</defaultRotation>
            <rotationCRS>GeographicCRS</rotationCRS>
            <defaultScale>0.9</defaultScale>
            <rotationAttribute>surfaceCurrentDirection</rotationAttribute>
            <rotationFactor>1.0</rotationFactor>
          </symbol>
        </lookup>
        <lookup>
          <label>SurfaceCurrentSpeedBand6</label>
          <range>
            <xsl:attribute name="lower">5.00</xsl:attribute>
            <xsl:attribute name="upper">7.00</xsl:attribute>
            <xsl:attribute name="closure">geLtInterval</xsl:attribute>  
          </range>
          <color>
            <startColor>SCBN6</startColor>
          </color>
          <symbol>
            <symbolRef>SCAROW10</symbolRef>
            <defaultRotation>0.0</defaultRotation>
            <rotationCRS>GeographicCRS</rotationCRS>
            <defaultScale>1.2</defaultScale>
            <rotationAttribute>surfaceCurrentDirection</rotationAttribute>
            <rotationFactor>1.0</rotationFactor>
          </symbol>
        </lookup>
        <lookup>
          <label>SurfaceCurrentSpeedBand7</label>
          <range>
            <xsl:attribute name="lower">7.00</xsl:attribute>
            <xsl:attribute name="upper">10.00</xsl:attribute>
            <xsl:attribute name="closure">geLtInterval</xsl:attribute>  
          </range>
          <color>
            <startColor>SCBN7</startColor>
          </color>
          <symbol>
            <symbolRef>SCAROW10</symbolRef>
            <defaultRotation>0.0</defaultRotation>
            <rotationCRS>GeographicCRS</rotationCRS>
            <defaultScale>1.5</defaultScale>
            <rotationAttribute>surfaceCurrentDirection</rotationAttribute>
            <rotationFactor>1.0</rotationFactor>
          </symbol>
        </lookup>
        <lookup>
          <label>SurfaceCurrentSpeedBand8</label>
          <range>
            <xsl:attribute name="lower">10.00</xsl:attribute>
            <xsl:attribute name="upper">13.00</xsl:attribute>
            <xsl:attribute name="closure">geLtInterval</xsl:attribute>  
          </range>
          <color>
            <startColor>SCBN8</startColor>
          </color>
          <symbol>
            <symbolRef>SCAROW10</symbolRef>
            <defaultRotation>0.0</defaultRotation>
            <rotationCRS>GeographicCRS</rotationCRS>
            <defaultScale>2.0</defaultScale>
            <rotationAttribute>surfaceCurrentDirection</rotationAttribute>
            <rotationFactor>1.0</rotationFactor>
          </symbol>
        </lookup>
        <lookup>
          <label>SurfaceCurrentSpeedBand9</label>
          <range>
            <xsl:attribute name="lower">13.00</xsl:attribute>
            <xsl:attribute name="closure">geSemiInterval</xsl:attribute>  
          </range>
          <color>
            <startColor>SCBN9</startColor>
          </color>
          <symbol>
            <symbolRef>SCAROW10</symbolRef>
            <defaultRotation>0.0</defaultRotation>
            <rotationCRS>GeographicCRS</rotationCRS>
            <defaultScale>1.0</defaultScale>
            <rotationAttribute>surfaceCurrentDirection</rotationAttribute>
            <rotationFactor>1.0</rotationFactor>
          </symbol>
        </lookup>
      </coverageFill>	
    </coverageInstruction>
  </xsl:template>
</xsl:transform>