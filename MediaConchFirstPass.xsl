<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mc="https://mediaarea.net/mediaconch" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0" extension-element-prefixes="xsi">
  <xsl:output encoding="UTF-8" method="text" version="1.0" indent="yes"/>
  <xsl:template match="/mc:MediaConch">
    <xsl:choose>
      <xsl:when test="count(mc:media[1]/mc:policy|mc:media[1]/mc:rule)=0">
        <xsl:text>This display only supports policy results</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>filename</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>first passing policy or rule</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="mc:media">
          <xsl:value-of select="@ref"/>
          <xsl:text>,</xsl:text>
          <xsl:value-of select="mc:policy/mc:policy[@outcome='pass'][1]/@name|mc:policy/mc:rule[@outcome='pass'][1]/@name|mc:policy/mc:rule[@outcome='pass'][1]/@name"/>
          <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
