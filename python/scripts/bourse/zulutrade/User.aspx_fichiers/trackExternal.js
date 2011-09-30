onReady = (function(ie){
 var d = document;
 return ie ? function(c){
   var n = d.firstChild,
    f = function(){
     try{
      c(n.doScroll('left'))
     }catch(e){
      setTimeout(f, 10)
     }
    }; f()
  } : 
  /webkit|safari|khtml/i.test(navigator.userAgent) ? function(c){
   var f = function(){
     /loaded|complete/.test(d.readyState) ? c() : setTimeout(f, 10)
    }; f()
  } : 
  function(c){
   d.addEventListener("DOMContentLoaded", c, false);
  }
})(/*@cc_on 1@*/);

addGAHandler = function( el, ev, handler, prevDef ) {

	if( prevDef ) ev.preventDefault ? ev.preventDefault() : ev.returnValue = false;

	if( el.addEventListener ) {
		el.addEventListener( ev, function() { handler( el ) }, false )
	} else {
		el.attachEvent( 'on' + ev, function() { handler( el ) } );
	}

}

function addLinkerEvents() {
	var as = document.getElementsByTagName("a");
	var divs = document.getElementsByTagName('div');//$('div.img-block');
	var extTrack = ["alpari.ru"];

	for(var i=0; i< divs.length; i++) {
		var flag = 0;
		if( /img-block/i.test( divs[i].className ) ) {
			var tmp = divs[i].getAttribute("onclick");

			// IE6-IE7 fix (null values error) with thanks to Julien Bissonnette for this
			if (tmp != null) {
			  tmp = String(tmp);
			  if (tmp.indexOf('urchinTracker') > -1 || tmp.indexOf('_trackPageview') > -1) continue;
			}
			
			addGAHandler( divs[i], 'click', function( el ) {
				var splitResult = document.location.href.split( "//www.alpari.ru/ru/" );
				pageTracker._trackPageview( '/show/block/' + splitResult[1] + el.getAttribute('id') );
			});
		}
	}
	// List of local sites that should not be treated as an outbound link. Include at least your own domain here

var extDoc = [".doc",".docx", ".xls", ".xlsx",".exe",".zip",".pdf",".js",".chm",".cab",".se",".rar",".mp3"];
	//List of file extensions on your site. Add/edit as you require

	/*If you edit no further below this line, Top Content will report as follows:
		/ext/url-of-external-site
		/downloads/filename
		/mailto/email-address-clicked
	*/

	for(var i=0; i<as.length; i++) {
		var flag = 0;
		var tmp = as[i].getAttribute("onclick");

		// IE6-IE7 fix (null values error) with thanks to Julien Bissonnette for this
		if (tmp != null) {
		  tmp = String(tmp);
		  if (tmp.indexOf('urchinTracker') > -1 || tmp.indexOf('_trackPageview') > -1) continue;
    		}

		// Tracking outbound links off site - not the GATC
		for (var j=0; j<extTrack.length; j++) {					
			if (as[i].href.indexOf(extTrack[j]) == -1 && as[i].href.indexOf('google-analytics.com') == -1 ) {
				flag++;
			}
		}

		//http://www.alpari-broker.ru/ru/trading_platforms/?tab=2 - open account
		if(  /alpari-broker\.ru\/ru\/trading_platforms\/\?tab=2/gi.test( document.location.href ) && /open-account\/demo_quik/i.test( as[i].href ) ) {
			addGAHandler( as[i], 'click', function( el ) {
				pageTracker._setCustomVar( 2, "QUIK_demo", "1", 3 );
			}, true );
		}
		
		if (flag == extTrack.length && as[i].href.indexOf("mailto:") == -1){
			//as[i].onclick = function(){ var splitResult = this.href.split("//"); pageTracker._trackPageview('/ext/' +splitResult[1]) + ";"
//+((tmp != null) ? tmp+";" : "");}
			//alert(as[i] +"  ext/" +splitResult[1])

			addGAHandler( as[i], 'click', function( el ) {
				var splitResult = el.href.split("//");
				pageTracker._trackPageview( '/ext/' + ( splitResult[1] || el.innerHTML ) );
				//pageTracker._link( el[ 'href' ] );
			});
		}

		// Tracking electronic documents - doc, xls, pdf, exe, zip
		for (var j=0; j<extDoc.length; j++) {
			if (as[i].href.indexOf(extTrack[0]) != -1 && as[i].href.indexOf(extDoc[j]) != -1) {
				//as[i].onclick = function(){ var splitResult = this.href.split(extTrack[0]);pageTracker._trackPageview('/downloads' +splitResult[1])+ ";"
//+((tmp != null) ? tmp+";" : "");}
				//alert(as[i] +"  downloads" +splitResult[1])
				
				addGAHandler( as[i], 'click', function( el ) {
					var splitResult = el.href.split(extTrack[0]);
					pageTracker._trackPageview('/downloads' +splitResult[1]);
				});
				break;
			}
		}

		if( new RegExp( /tabs/gi ).test( as[i].parentNode.parentNode.className ) || new RegExp( /tabs/gi ).test( as[i].parentNode.parentNode.parentNode.className ) ) {
			//pageTracker._trackPageview('/tabs/' +splitResult[1]) + ';' + ((tmp != null) ? tmp+";" : "" ); return false; }
			//as[i].onclick = function(){ var splitResult = this.href.split("//"); pageTracker._trackPageview( '/tabs/' +splitResult[1] )+ ';' + ((tmp != null) ? tmp+";" : "" );};
			addGAHandler( as[i], 'click', function( el ) {
				var splitResult = el.href.split("//");
				pageTracker._trackPageview('/tabs/' + splitResult[1]);
			});
		}
		
		if( new RegExp( /^lavaLamp$/i ).test( as[i].parentNode.parentNode.className ) ) {
			//as[i].onclick = function(){ var splitResult = this.href.split("//");pageTracker._trackPageview('/slider/' +splitResult[1]) + ';' + ((tmp != null) ? tmp+";" : "" );}
			addGAHandler( as[i], 'click', function( el ) {
				var splitResult = el.href.split("//");
				pageTracker._trackPageview('/slider/' + splitResult[1]);
			});
		}

		// <a class="show" href="#map2">Читать</a>
		// http://www.alpari.ru/ru/school/test-courses/#description1
		// http://www.alpari.ru/ru/ekat/?elem=education
		if(  /*new RegExp( /(test-courses|astana|ekat)/gi ).test( document.location.href ) &&*/ new RegExp( /^show$/i ).test( as[i].className ) ) {
			addGAHandler( as[i], 'click', function( el ) {
				var splitResult = el.href.split( "//www.alpari.ru/ru/" );
				pageTracker._trackPageview( '/show/' + splitResult[1] );
			});
		}

		// http://www.alpari.ru/ru/trader/ - buttons
		// http://www.alpari.ru/ru/basic/ - buttons
		var result = document.location.href.match( /(basic|trader)/i );
		if( result && result[1] ) {
			var splitResult = as[i].parentNode.parentNode.className.match( /(green|orange)/i );
			if( splitResult && splitResult[1] ) {
				addGAHandler( as[i], 'click', function( el ) {
					var splitResult = el.parentNode.parentNode.className.match( /(green|orange)/i );
					pageTracker._trackPageview( '/show/' + result[1] + '/' + splitResult[1] );
					return false;
				});
			}
		}

		// added to track mailto links 23-Oct-2007
		// updated 31-Oct-2008 to remove break command - thanks to Victor Geerdink for spotting this
		if (as[i].href.indexOf("mailto:") != -1) {
			//as[i].onclick = function(){ var splitResult = this.href.split(":");pageTracker._trackPageview('/mailto/' +splitResult[1])+ ";"+((tmp != null) ? tmp+";" : "");}
			//alert(as[i] +"  mailto/" +splitResult[1])
			
			addGAHandler( as[i], 'click', function( el ) {
				var splitResult = el.href.split(":");
				pageTracker._trackPageview('/mailto/' +splitResult[1]);
			});
		}

	}

}

onReady(function(){
	addLinkerEvents();

});

if( pageTracker && window.Visitor ) {
	pageTracker._setCustomVar( 5, "userGAId", Visitor.GetUserId(), 1 );
	pageTracker._setCustomVar( 4, "sessionGAId", Visitor.GetSessionId(), 2 );
	//pageTracker._trackPageview();
}