// Gridset Toggle JS
gs={init:function(e,t,n){gs.bind(document,"keydown",function(e){if(!e)var e=window.event;if(e.metaKey||e.ctrlKey)switch(e.which||e.keyCode){case 71:var t=document.getElementById("gridsetoverlaywrap");t?document.body.removeChild(t):gs.show(["da","db","t","m"],[6,4,5,2],[990,990,768,320]),gs.prevent(e)}})},show:function(e,t,n){var r=document.getElementsByTagName("body")[0],i='<div id="gridwrap"><div id="gridoverlay" class="wrapper">',s=0,o="",u='<style id="gridsetoverlaystyles" type="text/css">#gridwrap {display:block;position:fixed;top:0;left:0;width:100%;height:100%;z-index:1000;pointer-events:none;font-family:Helvetica, Arial, sans-serif !important;}#gridoverlay {position:relative;height:100%;}#gridoverlay div {display:block;height:100%;color:rgb(150,150,255);}#gridoverlay .gridset {position:absolute;width:100%;height:100%;top:0;left:0;opacity:0.3;}#gridoverlay .gridset div {padding-top:5px;text-align:left;font-size:10px !important;border-right:1px solid rgb(150,150,255);border-left:1px solid rgb(150,150,255);-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box;}#gridoverlay div small {width:100%;display:block;text-align:center;color:rgb(130,130,255);font-weight:700 !important;border-bottom:1px solid rgb(150,150,255);padding-top:0 !important;}#gridoverlay .gridset:nth-child(2) div {border-style:dashed;padding-top:35px;}#gridoverlay .gridset:nth-child(2) small {border-bottom:1px dashed rgb(150,150,255);}#gridoverlay .gridset:nth-child(3) div {border-style:dotted;padding-top:70px;}#gridoverlay .gridset:nth-child(3) small {border-bottom:1px dotted rgb(150,150,255);}.noshow{display:none;}</style>';while(e[s]){var a="",f=0;n[s]!=o&&s==0?i+="<div>":n[s]!=o&&(i+="</div><div>");while(e[f])f!=s&&n[f]!=n[s]&&(a+=e[f]+"-hide "),f++;i+='<div class="gridset '+a+'"><div class="'+e[s]+'1"><small>'+e[s]+"1</small></div>";var l=1;while(l++<t[s])i+='<div class="'+e[s]+l+'"><small>'+e[s]+l+"</small></div>";i+="</div>",s==n.length-1&&(i+="</div>"),o=n[s],s++}i+="</div></div>";var c=document.createElement("div");c.id="gridsetoverlaywrap",c.innerHTML=i+u,r.appendChild(c)},bind:function(e,t,n){e.attachEvent?e.attachEvent("on"+t,n):e.addEventListener(t,n,!1)},prevent:function(e){e.preventDefault?e.preventDefault():event.returnValue=!1}},window.location.href.match("gridset=show")?gs.show(["da","db","t","m"],[6,4,5,2],[990,990,768,320]):gs.init(["da","db","t","m"],[6,4,5,2],[990,990,768,320]);