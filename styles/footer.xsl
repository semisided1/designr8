<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:fb="http://ogp.me/ns/fb#"
	exclude-result-prefixes="xhtml xsl atom"
	>

	<xsl:template name="footer">

		<div id="footer">
					<p><a href="/"> Designr8.com </a> </p>
					<p><a href="/press" >Press </a></p>
					<p><a href="http://feedvalidator.org/check.cgi?url=http%3A//designr8.com/atom.xml"><img src="https://lh6.googleusercontent.com/-XL4ZdVa9P-g/UcvsLPM_GrI/AAAAAAAAHKE/mdKakaFqQqw/w88-h31-no/valid-atom.png" alt="[Valid Atom 1.0]" title="Validate my Atom 1.0 feed" /></a></p>
					<p><a type="application/atom+xml" href="/atom.xml">Atom Feed</a></p>

					<div id="fb-root"></div>
					<script>
						(function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id))
						return;
						js = d.createElement(s);
						js.id = id;
						js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
						fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
					</script>
					<fb:like send="true" width="15em" show_faces="false"></fb:like>
					<div class="g-plusone" data-annotation="inline"></div>
					<script type="text/javascript">
						(function() {
						var po = document.createElement('script');
						po.type = 'text/javascript';
						po.async = true;
						po.src = 'https://apis.google.com/js/plusone.js';
						var s = document.getElementsByTagName('script')[0];
						s.parentNode.insertBefore(po, s);
						})();
					</script>

							<!-- <script type="text/javascript"> google_ad_client = "ca-pub-7326905713177295";
								/* slayton */ google_ad_slot = "9273749359"; google_ad_width = 200; google_ad_height
								= 200; // </script> -->
				</div>


	<!--	<script type="text/javascript">
google_ad_client = "ca-pub-7326905713177295";
/* slayton */
google_ad_slot = "9273749359";
google_ad_width = 200;
google_ad_height = 200;
//
</script> -->


<div class="ad">
	<script type="text/javascript">
		<xsl:comment>
			google_ad_client = "ca-pub-7326905713177295";
			/* designr8 */
			google_ad_slot = "1639107101";
			google_ad_width = 250;
			google_ad_height = 250;
			//
		</xsl:comment>
	</script>
	<script type="text/javascript"
		src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
	</script>
</div>
	<div class="ad">
		<script type="text/javascript">
			<xsl:comment>
				google_ad_client = "ca-pub-7326905713177295";
				/* designr8 two */
				google_ad_slot = "1577198311";
				google_ad_width = 250;
				google_ad_height = 250;
				//
			</xsl:comment>
		</script>
		<script type="text/javascript"
			src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
		</script>
	</div>

	</xsl:template>
</xsl:stylesheet>