//        function showzpzhushou(url) {
//			try
//			{
//		    var src = document.createElement("script");
//            src.type = "text/javascript";
//            src.src = url;
//            src.id = "scriptid";
//			var div = document.getElementById("zpzs");
//            if (div != null) {
//                div.innerHTML = '';
//                div.appendChild(src);             
//				}
//			}
//			catch (e){}
//        }
        var lastScrollY = 0;
        function heartBeat() {
			try
			{
				 var diffY;
            if (document.documentElement && document.documentElement.scrollTop)
                diffY = document.documentElement.scrollTop;
            else if (document.body)
                diffY = document.body.scrollTop
            percent = .1 * (diffY - lastScrollY);
            if (percent > 0) percent = Math.ceil(percent);
            else percent = Math.floor(percent);
            document.getElementById("zpzs").style.top = (parseInt(document.getElementById("zpzs").style.top) + percent) + "px";
			document.getElementById("zpzs").style.right = ((document.body.clientWidth - 1000) / 2) - 125 + "px";
            lastScrollY = lastScrollY + percent;
			}
			catch (e){}
        }
        function callback(str) {
			try
			{
			if(str!=null&&str!=""){
			   document.getElementById("zpzs").innerHTML = str;
			   document.getElementById("zpzs").style.display = "";
               document.getElementById("zpzs").style.right = ((document.body.clientWidth - 1000) / 2) - 125 + "px";
			   window.setInterval("heartBeat()", 1);
			   }
			}
			catch (e){}
        }