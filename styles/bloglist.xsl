<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:atom="http://www.w3.org/2005/Atom"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:fb="http://ogp.me/ns/fb#"
    xmlns:media="http://search.yahoo.com/mrss/"
    exclude-result-prefixes="xhtml">

<xsl:output indent="yes" />


<xsl:include href="header.xsl" />
<xsl:include href="footer.xsl" />

<xsl:template match="/">

        <html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
            <head>
            <link href='http://fonts.googleapis.com/css?family=Old+Standard+TT'
                    rel='stylesheet' type='text/css' />

                <link rel="stylesheet" type="text/css" href="/styles/bloglist.css" />
                <link rel="alternate" type="application/atom+xml"
                href="atom.xml" title="Atom Feed for Designr8.com" />
            </head>
            <body>

            <xsl:call-template name="header"></xsl:call-template>

            <xsl:apply-templates />

            <xsl:call-template name="footer"></xsl:call-template>

            </body>
        </html>

</xsl:template>


<!-- <xsl:template match="atom:feed">  match feed xmlns="http://www.w3.org/1999/xhtml" -->

<!--    </xsl:template> -->

    <xsl:template match="atom:feed/atom:entry">
    <xsl:element name="a">
                <xsl:attribute name="href">
                <xsl:value-of select="atom:id" />
                </xsl:attribute>
        <div class="atomentry">
                <div class="thumbdiv">
                    <xsl:element name="img"><xsl:attribute name="src"><xsl:value-of select="media:thumbnail/@url" /></xsl:attribute><xsl:attribute name="class">thumb</xsl:attribute></xsl:element>
                </div>
                <xsl:value-of select="atom:title" />
            <div class="atomupdated">

<!--            <xsl:value-of select="atom:updated" /> -->
            <xsl:apply-templates select="atom:updated" />

            </div>



            <xsl:value-of select="atom:summary" />


        </div>
        </xsl:element>
<!--        <xsl:apply-templates /> -->
    </xsl:template>

<!-- <updated>Sat Nov 12 22:24:59 MST 2011</updated> -->
<!-- 2002-10-02T10:00:00-05:00   2013-06-21T15:36:31-07:00 2013-6- -->
<xsl:template match="atom:updated">
<xsl:if test="parent::atom:entry" >
<xsl:variable name="DateTime">
            <xsl:value-of select="text()" />
        </xsl:variable>
        <xsl:variable name="mo">
            <xsl:value-of select="substring($DateTime,6,2)" />
        </xsl:variable>
        <xsl:variable name="day">
            <xsl:value-of select="substring($DateTime,9,2)" />
        </xsl:variable>
        <xsl:variable name="year">
            <xsl:value-of select="substring($DateTime,1,4)" />
        </xsl:variable>
    <xsl:choose>
            <xsl:when test="$mo = '01'">
                <xsl:text>Jan</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '02'">
                <xsl:text>Feb</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '03'">
                <xsl:text>Mar</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '04'">
                <xsl:text>Apr</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '05'">
                <xsl:text>May</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '06'">
                <xsl:text>Jun</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '07'">
                <xsl:text>Jul</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '08'">
                <xsl:text>Aug</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '09'">
                <xsl:text>Sep</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '10'">
                <xsl:text>Oct</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '11'">
                <xsl:text>Nov</xsl:text>
            </xsl:when>
            <xsl:when test="$mo = '12'">
                <xsl:text>Dec</xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:text> </xsl:text>
        <xsl:if test="(string-length(normalize-space($day)) &lt; 2)">
            <xsl:value-of select="0" />
        </xsl:if>
        <xsl:value-of select="normalize-space($day)" />
        <xsl:text>, </xsl:text>
        <xsl:value-of select="$year" />
<!--        <xsl:value-of select="substring($DateTime,12,8)"></xsl:value-of> -->
<!--        <xsl:text>-07:00</xsl:text> -->
</xsl:if>
</xsl:template>

    <xsl:template match="text()" />
</xsl:stylesheet>