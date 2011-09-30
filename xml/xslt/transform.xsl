<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Menu</title>
			</head>
			<body>
				<ul>
					<xsl:apply-templates select="//menu" />
				</ul>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="menu">
		<li><xsl:value-of select="@titre" /><ul>
			<xsl:apply-templates />	
		</ul></li>
	</xsl:template>

	<xsl:template match="sous-menu">
			<li><xsl:value-of select="@titre" /><ul>
				<xsl:apply-templates />
			</ul></li>
	</xsl:template>

	<xsl:template match="lien">
			<li><a>
				<xsl:attribute name="href">
					<xsl:value-of select="@url" />
				</xsl:attribute>
			<xsl:value-of select="." />
			</a></li>
	</xsl:template>

</xsl:stylesheet>
