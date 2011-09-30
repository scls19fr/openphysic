<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- instructions de transformations -->

  <xsl:template match="/">
<html>

  <head>
    <title>Titre</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  </head>

  <body>
    <h1>Titre 1</h1>

    <div class="complexe">
  z = <xsl:apply-templates select="complexe/reel"/> +i*<xsl:apply-templates select="complexe/imag"/>
    </div>

  </body>

</html>
  </xsl:template>

<!--
  <xsl:template match="complexe/reel">
    <xsl:element name="div">
      <xsl:attribute name="class">reel</xsl:attribute>
      <xsl:value-of select="." />
    </xsl:element>
  </xsl:template>

  <xsl:template match="complexe/imag">
    <xsl:element name="div">
      <xsl:attribute name="class">imag</xsl:attribute>
      <xsl:value-of select="." />
    </xsl:element>
  </xsl:template>
-->

 <xsl:template match="complexe/reel"><i><xsl:value-of select="." /></i></xsl:template>

 <xsl:template match="complexe/imag"><b><xsl:value-of select="." /></b></xsl:template>

</xsl:stylesheet>
