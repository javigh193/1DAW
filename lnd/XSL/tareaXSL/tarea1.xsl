<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
			xmlns="http://www.w3.org/1999/xhtml">
  <!-- <xsl:output method="html"/> -->
  <xsl:template match="/tarea1">
    <html>
      <head>
        <title>Tarea 1</title>
        <link href="style.css" rel="stylesheet" type="text/css">
      </head>
      <body>     
        <h2>Usuarios registrados:</h2>
        <ul>
          <li>
	          <xsl:apply-templates select="usuario">
	          </xsl:apply-templates>
          </li>
        </ul>
      </body>
    </html>
  </xsl:template>
	<!-- Definimos los datos que aparecerán en usuario -->
  <xsl:template match="usuario">
    <xsl:value-of select="nombre"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="apellido"/>
    <xsl:text>, pais: </xsl:text>
    <xsl:value-of select="pais"/>
    <xsl:text>, edad: </xsl:text>
    <xsl:value-of select="edad"/>
	</xsl:template>
</xsl:stylesheet>
