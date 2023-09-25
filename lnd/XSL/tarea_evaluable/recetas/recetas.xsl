<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

    <head>
        <style>
            .titulo { 
                color: #30A010;
                padding-top: 1vh;
                padding-bottom: 1vh;
            }

            .nombre {
                font-weight: bold;
            }

            .contenedor{
                margin-left: 10%;
                border-left: solid 1px #B0DD90;
                padding-left: 1vw;
                padding-top: 2vh;
                margin-bottom: 2vh;
            }

            .contenedor *{
                padding-bottom: 1vh;
            }

            .contenedor h2{
                text-align: center;
            }

            .indented-p{
                margin-left: 2vw;
            }

            * {
                color: #106610;
                padding: 0;
                margin: 0;
            }

            h2 {
                color: #106610;
            }

            header{
                background-color: #DDDD80;
                display: flex;
                flex-direction: column;
                align-items: center;
                color: #106610;
                padding: 1vh;
            }

            header *{
                padding: 1vh 0 1vh 0;
            }

            th{
                background-color: #DDDD80; 
                padding: 1.5vh 0.5vh 1.5vh 0.5vh;
            }

            ul{
                list-style: none;
            }

            li{
                padding: 0 0.5vh 0.5vh;
            }
        </style>
    </head>

    <html>
    <body>
        <header>
            <h2>transformación con XSLT</h2>
            <p>XML -&gt; HTML</p>
        </header>
        <div class="contenedor">
            <h2>Mis recetas de cocina canaria</h2>
            <p>Listado de mis recetas de cocina favoritas, 
            características y modo de elaboración, ordenado alfabéticamente</p>
            <xsl:for-each select="recetas/receta">
                <p class="titulo nombre">Nombre de la receta: <xsl:value-of select="nombre"/></p>
                <ul>
                    <li>Tipo de receta: <xsl:value-of select="tipo/@definicion"/></li>
                    <li>Dificultad: <xsl:value-of select="dificultad"/></li>
                    <li>Tiempo de elaboración:  <xsl:value-of select="tiempo"/></li>
                    <li>Esta receta puedes elaborarla en un/una: <xsl:value-of select="elaboracion"/></li>
                    <li>Calorías: <xsl:value-of select="calorias"/></li>
                </ul>
                <table>
                    <caption>Lista de ingredientes de <xsl:value-of select="nombre"/></caption>
                    <th>Nombre del ingrediente</th><th>Cantidad necesaria</th>
                    <xsl:for-each select="ingredientes/ingrediente">
                        <tr>
                            <td><xsl:value-of select="@nombre"/></td>
                            <td><xsl:value-of select="@cantidad"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <p class="titulo pasos">Pasos necesarios:</p>
                <xsl:for-each select="pasos/paso">
                    <p>Paso número <xsl:value-of select="@orden"/>:</p> 
                    <p class="indented-p"><xsl:value-of select="."/></p>
                </xsl:for-each>
            </xsl:for-each>
        </div>
    </body>
    </html>
</xsl:template>

</xsl:stylesheet>