<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:fb="http://ogp.me/ns/fb#"
	exclude-result-prefixes="xhtml"
	>
<xsl:include href="footer.xsl"/>

<!-- <xsl:output doctype="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/> -->
<!-- <xsl:param name="title" /> -->
<xsl:template match="atom:feed">  <!-- match feed xmlns="http://www.w3.org/1999/xhtml" -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"
	xmlns:fb="http://ogp.me/ns/fb#">
	<head>
		<meta name="title" content="Designr8.com" />
		<meta name="author" content="Darrell Dupas darrell@designr8.com" />
		<meta name="description" content="Designr8.com" />
		<meta name="keywords"
			content="Redwater, Alberta, Web Design, Darrell Dupas, Edmonton, designr8.com" />

		<link href='http://fonts.googleapis.com/css?family=Old+Standard+TT' rel='stylesheet' type='text/css' />
		<link rel="stylesheet" TYPE="text/css" HREF="/styles/blog.css" />

		<title>
			<xsl:value-of select="$title" />
		</title>

		<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-27501164-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
	</head>
<!-- -->
	<body>
			<div id="header">
				<h1>
					<xsl:value-of select="$title" />
				</h1>

			</div>
				<xsl:apply-templates />
	<xsl:call-template name="footer"></xsl:call-template>
	</body>
	</html>
</xsl:template>

<xsl:template match="atom:feed/atom:entry">
	<xsl:choose>
		<xsl:when test="$title=atom:title">
			<p>
				<xsl:apply-templates select="atom:updated" />
			</p>
			<div class="content">
			<xsl:apply-templates select="atom:content/*" />
			</div>
		</xsl:when>
	</xsl:choose>
</xsl:template>


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
<!-- 		<xsl:value-of select="substring($DateTime,12,8)"></xsl:value-of> -->
<!-- 		<xsl:text>-07:00</xsl:text> -->
</xsl:if>
</xsl:template>



<xsl:template match="atom:feed/atom:entry/atom:content/*">

	<xsl:copy-of select="." copy-namespaces="no" />

</xsl:template>





<xsl:template match="text()" />
</xsl:stylesheet>
