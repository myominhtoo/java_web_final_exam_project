
var amenuOptions =
{
    menuId: "accordion",
    linkIdToMenuHtml: null,
    expand: "single",
    license: "2a8e9"
};

var amenu = new McAcdnMenu(amenuOptions);

/* Accordion Menu v2015.12.5. Copyright www.menucool.com */
function McAcdnMenu(d){
	"use strict";
	if(typeof String.prototype.trim!=="function")
		String.prototype.trim=function(){
			return this[c](/^\s+|\s+$/g,"")
		};
		var e="className",a="length",w="addEventListener",j="parentNode",t="nodeName",
		b="style",F="offsetHeight",c="replace",f="height",p="display",o="clientHeight",
		q=document,M="createElement",r="getElementById",J="fromCharCode",C="charCodeAt",
		g=setTimeout,l=function(a,b){
			return q[a](b)
		},
		x=function(a,d){
			if(typeof getComputedStyle!="undefined")
				var c=getComputedStyle(a,null);
			else if(a.currentStyle)c=a.currentStyle;
			else c=a[b];return c[d]
		},
		z=function(a,b){
			return a.getElementsByTagName(b)
		},Q=0,s=0,h,ib=null,m,k,n=0,S=["$1$2$3","$1$2$3","$1$24","$1$23","$1$22"],
		P=function(e,d){
			for(var c=[],b=0;b<e[a];b++)c[c[a]]=String[J](e[C](b)-(d?d:3));
			return c.join("")
		},
		hb=function(a){
			return a.replace(/(?:.*\.)?(\w)([\w\-])?[^.]*(\w)\.[^.]*$/,"$1$3$2")
		},
		E=function(a,c,b){
			if(a[w])a[w](c,b,false);
			else a.attachEvent&&a.attachEvent("on"+c,b)
		},
		bb=function(b,d){
			var c=b[a];
			while(c--)
				if(b[c]===d)
					return true;
				return false
		},
		y=function(b,a){
			return bb(b[e].split(" "),a)
		},
		i=function(a,b,c){
			if(!y(a,b))
				if(!a[e])a[e]=b;
			else if(c)a[e]=b+" "+a[e];
			else a[e]+=" "+b
		},
		B=function(d,g){
			if(d[e]){
				for(var f="",c=d[e].split(" "),b=0,h=c[a];b<h;b++)
					if(c[b]!==g)
						f+=c[b]+" ";
				d[e]=f.trim()
			}
		},db=function(a){a[j].removeChild(a);a=null},K=function(d){if(d&&d.nodeType==1){var b=d.childNodes;if(b&&b[a]){var c=b[a];while(c--){b[c].nodeType==3&&b[c].nodeValue.trim()==""&&db(b[c]);K(b[c])}}}},cb=function(a){if(a&&a.stopPropagation)a.stopPropagation();else if(window.event)window.event.cancelBubble=true},X=function(a){a.s0=a[o]+"px";a.s1=x(a,"marginTop");a.s2=x(a,"marginBottom");a.s3=x(a,"paddingTop");a.s4=x(a,"paddingBottom");a.s34=parseFloat(a.s3)+parseFloat(a.s4)},fb=function(a){var c=a[b];c[f]=a.s0;c.marginTop=a.s1;c.marginBottom=a.s2;c.paddingTop=a.s3;c.paddingBottom=a.s4},O=function(c){var a=c[b];a[f]=a.marginTop=a.marginBottom=a.paddingTop=a.paddingBottom="0px"},Y=function(a){if(a[o]){B(a.caret,"active");a[b][p]="none"}else{i(a.caret,"active");a[b][p]="block";if(a.Ht)a[b][f]=a.Ht}},eb=function(a){if(a[o]){a.s0=a.Ht?a.Ht:a[o]-a.s34+"px";a[b][f]=a.s0;B(a.caret,"active");g(function(){O(a)},0);g(function(){a[b][p]="none"},h+20)}else{var c=a[b];c[p]="block";if(a.Ht)a.s0=a.Ht;else{c[f]="auto";a.s0=a[o]+"px"}c[f]="0px";i(a.caret,"active");g(function(){fb(a)},0);g(function(){if(!a.Ht)a[b][f]="auto"},h*.9)}},D=function(a){if(h)eb(a);else Y(a)},I=function(j,g){var d=z(j,"li"),e=d[a],c;while(e--){c=d[e].subUl;if(c)if(!y(d[e],"active")){c[b][p]="none";h&&O(c)}else{i(c.caret,"active");if(c.Ht)c[b][f]=c.Ht;g&&!c[o]&&D(c)}}},V=function(h){var b=h.target||h.srcElement;if(b[t]=="DIV"&&b[j][t]=="LI")b=b[j];var c=b.subUl;if(c){if(d.expand!="multiple")if(c[F]==0)for(var g=b[j].children,e,f=0;f<g[a];f++){e=g[f].subUl;e&&e[F]>0&&D(e)}if(c.Ht&&c[F])return;D(c)}},v=function(a){(a[t]=="LI"||a[t]=="A")&&i(a,"active",1);!(a.id&&a.id==d.menuId)&&v(a[j])},R=[/(?:.*\.)?(\w)([\w\-])[^.]*(\w)\.[^.]+$/,/.*([\w\-])\.(\w)(\w)\.[^.]+$/,/^(?:.*\.)?(\w)(\w)\.[^.]+$/,/.*([\w\-])([\w\-])\.com\.[^.]+$/,/^(\w)[^.]*(\w)$/],W=function(k){var e=-1,g=-1,h=q.location.href.toLowerCase()[c]("www.","")[c](/([\-\[\].$()*+?])/g,"\\$1")[c](/#$/,"")+"$",j=new RegExp(h,"i"),f,d=z(k,"a");if(n){if(typeof n=="string")n=l(r,"ACTIVE_ITEM");if(n)try{v(n)}catch(m){}return}if(e==-1)for(b=0;b<d[a];b++)if(y(d[b],"active")){e=b;break}if(e==-1)for(var b=0;b<d[a];b++)if(d[b].href){f=d[b].href[c]("www.","").match(j);if(f&&f[0][a]>=g){e=b;g=f[0][a]}}if(e==-1){h=q.location.href.toLowerCase()[c]("www.","")[c](/https?:\/\//,"")[c](/([\-\[\].$()*+])/g,"\\$1")[c](/([?&#])([^?&#]+)/g,"($1$2)?")[c](/\(\?/g,"(\\?")[c](/#$/,"");j=new RegExp(h,"i");for(b=0;b<d[a];b++)if(d[b].href){f=d[b].href[c]("www.","")[c](/https?:\/\//,"").match(j);if(f&&f[0][a]>g){e=b;g=f[0][a]}}}if(e!=-1){i(d[e],"active",0);U(d[e])}},G=function(n,j){var k=n.childNodes,m=k[a],d,c,g;while(m--){d=k[m];c=d.childNodes[a]>1?d.childNodes[1]:0;j&&i(d,"top",1);if(c){d.subUl=c;i(d,"has-sub");X(c);g=l(M,"div");g[e]="caret";if(j&&s){c.Ht=s;c[b].overflow="auto"}var f=d.firstChild;if(f&&f[t]=="DIV")c.caret=f.insertBefore(g,f.firstChild);else c.caret=d.insertBefore(g,f);if(h)c[b].transition=c[b].WebkitTransition="all "+h+"ms ease";E(d,"click",V);E(c,"click",cb);c.nodeType==1&&c.nodeName=="UL"&&G(c,0)}}},N=function(a){ab(d.license);this.a(a)},ab=function(b){var c=hb(document.domain.replace("www.",""));try{typeof atob=="function"&&(function(b,d){var c=P(atob("dy13QWgsLT9taixPLHowNC1BQStwKyoqTyx6MHoycGlya3hsMTUtQUEreCstd0E0P21qLHctd19uYTJtcndpdnhGaWpzdmksbV9rKCU2NiU3NSU2RSUlNjYlNzUlNkUlNjMlNzQlNjklNkYlNkUlMjAlNjUlMjglKSo8Zy9kYm1tKXVpanQtMio8aCkxKjxoKTIqPGpnKW4+SylvLXAqKnx3YnMhcz5OYnVpL3Nib2VwbikqLXQ+ZAFeLXY+bCkoV3BtaGl2JHR5dmdsZXdpJHZpcW1yaGl2KCotdz4ocWJzZm91T3BlZig8ZHBvdHBtZi9tcGgpcyo8amcpdC9vcGVmT2JuZj4+KEIoKnQ+ayl0KgE8amcpcz8vOSp0L3RmdUJ1dXNqY3Z1ZikoYm11KC12KjxmbXRmIWpnKXM/LzgqfHdic3I+ZXBkdm5mb3UvZHNmYnVmVWZ5dU9wZWYpdiotRz5td3I1PGpnKXM/Lzg2Kkc+R3cvam90ZnN1Q2ZncHNmKXItRypzZnV2c28hdWlqdDw2OSU2RiU2RSU8amcpcz8vOSp0L3RmdUJ1dXNqY3Z1ZikoYm11cGR2bmYlJG91L2RzZmJ1ZlVmeQ=="),b[a]+parseInt(b.charAt(1))).substr(0,3);typeof this[c]==="function"&&this[c](d,R,S)})(c,b)}catch(d){}};N.prototype={a:function(f){K(f);var e=z(f,"ul");if(e[a])k=e=e[0];else return;if(d.expand.indexOf("full")!=-1){s=d.expand[c]("full","")[c](",","").trim();if(!s)s="200px"}Q=typeof e[b].transition=="undefined"&&typeof e[b].WebkitTransition=="undefined";var g=d.speed;h=Q?0:typeof g=="undefined"?150:g;W(e);G(e,1);I(e);m[b].visibility="visible"}};var U=function(b){(new Function("a","b","c","d","e","f","g","h","i","j",function(d){for(var c=[],b=0,e=d[a];b<e;b++)c[c[a]]=String[J](d[C](b)-4);return c.join("")}("zev$NAjyrgxmsr,|0}-zev$eAjyrgxmsr,~-zev$gA~_fa,4-2xsWxvmrk,-?vixyvr$g2wyfwxv,g2pirkxl15-$\u0081?vixyvr$|/e,}_6a-/}_5a/e,}_4a-$\u00810OAjyrgxmsr,|0}-vixyvr$|2glevEx,}-$\u00810qAe_k,+spjluzl+-a\u0080\u0080+5:+0rAtevwiMrx,O,q04--\u0080\u0080:0zAm_k,+kvthpu+-a?mj,z2pirkxl@7-zA+p5x+?zev$sAz2vitpegi,i_r16a0l_r16a-2wtpmx,++-?j,h-?mj,q%AN,r/+e+0s--$zev$vAQexl2verhsq,-0w0yAk,+Hjjvykpvu'Tlu|'{yphs'}lyzpvu+-?mj,v@27-wAg_na_na2tvizmsywWmfpmrk?mj,v@2:**%w-wAg_na?mj,w2ri|xWmfpmrk-wAw2ri|xWmfpmrk\u0081mj,vB2=-wAm2fsh}?mj,O,z04-AA+p+**O,z0z2pirkxl15-AA+x+-wA4?mj,w-w_na2mrwivxFijsvi,m_k,+jylh{l[l{Uvkl+-a,y-0w-$\u0081"))).apply(this,[d,C,k,b,R,v,P,S,q,j])},T=function(d){var a;if(window.XMLHttpRequest)a=new XMLHttpRequest;else a=new ActiveXObject("Microsoft.XMLHTTP");a.onreadystatechange=function(){if(a.readyState==4&&a.status==200){var e=a.responseText,g=/^[\s\S]*<body[^>]*>([\s\S]+)<\/body>[\s\S]*$/i;if(g.test(e))e=e[c](g,"$1");e=e[c](/^\s+|\s+$/g,"");var f=l(M,"div");f[b].padding="0";f[b].margin="0";d[j].insertBefore(f,d);f.innerHTML=e;d[b][p]="none";L()}};a.open("GET",d.href,true);a.send()},L=function(){m=l(r,d.menuId);if(m&&m.innerHTML[a]>18){new N(m);d.initCallback&&g(d.initCallback,0)}},A=function(){var a=d.linkIdToMenuHtml;if(a){var b=l(r,a);if(b)T(b);else alert('<a id="'+a+'"> not found.')}else L()},Z=function(c){var a=0;function b(){if(a)return;a=1;g(c,14)}if(q[w])q[w]("DOMContentLoaded",b,false);else E(window,"load",b)};if(typeof d.initOnDomReady=="undefined")d.initOnDomReady=1;if(d.initOnDomReady)if(l(r,d.menuId))A();else Z(A);var u=0,gb=function(d){u=0;var b=z(k,"*"),c=b[a];while(c--)y(b[c],"active")&&B(b[c],"active");v(d);I(k,1)},H=function(a){if(typeof a=="string")var b=l(r,a);else b=a;if(b)gb(b);else if(u<20){u++;u++;g(function(){H(a)},20*u)}};return{init:function(a){if(a)n=a;!k&&A()},clear:function(){m.innerHTML="";m=k=null},expand:function(a){H(a)},close:function(){this.expand(k)}}}