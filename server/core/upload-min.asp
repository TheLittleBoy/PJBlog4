<%define(function(c,a,d){var e={readBinary:function(g){var f=Request.TotalBytes,j=0,i;if(f<g){g=f}var h=new ActiveXObject(config.nameSpace.stream);h.Type=1;h.Mode=3;h.Open();while(j<f){if(f-j<g){g=f-j}h.Write(Request.BinaryRead(g));j+=g}h.Position=0;i=h.Read();h.Close();h=null;return i},extend:function(g,h){if(h===undefined){h={}}for(var f in h){g[f]=h[f]}return g},asc:function(h){var f=new ActiveXObject(config.nameSpace.stream),g;f.Type=2;f.Open();f.WriteText(h);f.Position=0;f.Charset="ascii";f.Position=2;g=f.ReadText;return{obj:f,text:g}},spliteLine:function(f){return f.substring(0,f.indexOf("\r\n"))},saveFile:function(f,j,g,i){var h=new ActiveXObject(config.nameSpace.stream);h.Type=1;h.Mode=3;h.Open();f.Position=j+2;f.CopyTo(h,g-j);h.SaveToFile(i,2);h.Close();h=null},randoms:function(f){var j="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",h="";for(var g=0;g<f;g++){h+=j.charAt(Math.ceil(Math.random()*100000000)%j.length)}return h},selectPath:function(g,k,i){function f(o){if(i==="*"){return true}else{var m=false;if(typeof i==="string"){i=[i]}for(var n=0;n<i.length;n++){if(i.toLowerCase()===o.toLowerCase()){m=true;break}}return m}}function l(m){if(m===""){return m}else{return m.replace(/\/$/,"")+"/"}}var j=g.split(".").slice(-1).join("."),h={allow:false,ext:j};if(f(j)){h.name=l(k)+this.randoms(16)+"."+j;h.path=selector.lock(h.name);h.allow=true}else{h.error="不符合上传类型"}return h},binaryToText:function(h,j,f){var i=new ActiveXObject(config.nameSpace.stream),g;i.Type=2;i.Open();h.Position=j+2;h.CopyTo(i,f-j);i.Position=2;g=i.ReadText();i.Close();i=null;return g}};var b=function(g){g=e.extend({speed:1000,saveTo:"profile/uploads",allowExt:"*",error:null},g);var f=e.readBinary(g.speed),o=new ActiveXObject(config.nameSpace.stream);o.Type=2;o.Open();o.WriteText(f);o.Position=0;o.Charset="ascii";o.Position=2;var p=o.ReadText,k=e.spliteLine(p),q=k.length+2;var m=p.substring(q),r,j,i,s,h=q,v={};while((j=m.indexOf(k))>-1){var u=0,w;r=m.substring(0,j);u=r.indexOf("\r\n\r\n");i=r.substring(0,u);w=(/\sname=\"([^\"]+?)\"/.exec(i))[1];if(v[w]===undefined){v[w]={binaryStart:h+u+4,binaryEnd:h+j-2}}if(/\sfilename=\"([^\"]+?)\"/.test(i)){v[w]["isFile"]=true;v[w]["fileName"]=(/\sfilename=\"([^\"]+?)\"/.exec(i))[1]}else{v[w]["isFile"]=false}m=m.substring(j+q);h=h+j+q}for(var n in v){if(v[n]["isFile"]===true){var t=v[n]["fileName"];if(t.length>0){var l=e.selectPath(t,g.saveTo,g.allowExt);if(l.allow===true){e.saveFile(o,v[n]["binaryStart"],v[n]["binaryEnd"],l.path);v[n]["fileSize"]=v[n]["binaryEnd"]-v[n]["binaryStart"];v[n]["fileExt"]=l.ext;v[n]["savePath"]=l.path;v[w]["saveName"]=l.name;v[n]["success"]=true}else{v[n]["success"]=false;(typeof g.error==="function")&&g.error.call(v[n],l.error)}}}else{v[n]["value"]=p.substring(v[n]["binaryStart"],v[n]["binaryEnd"])}}o.Close();o=null;return v};return b});%>