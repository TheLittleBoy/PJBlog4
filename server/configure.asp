<!--#include file="../config.asp" -->
<%
http.async(function(req){
	var j = req.query.j, callbacks = {};
	
	callbacks.normal = function(){
		var title = req.form.title,
			description = req.form.description,
			nickname = req.form.nickname,
			website = req.form.website,
			webstatus = req.form.webstatus,
			qq_appid = req.form.qq_appid,
			qq_appkey = req.form.qq_appkey,
			articleprivewlength = req.form.articleprivewlength,
			articleperpagecount = req.form.articleperpagecount,
			webdescription = req.form.webdescription,
			webkeywords = req.form.webkeywords,
			authoremail = req.form.authoremail,
			seotitle = req.form.seotitle,
			commentaduit = req.form.commentaduit,
			commentperpagecount = req.form.commentperpagecount,
			error = "处理过程中发生错误。";
			
		if ( webstatus === "1" ){
			webstatus = true;
		}else{
			webstatus = false;
		}
		
		if ( commentaduit === "1" ){
			commentaduit = true;
		}else{
			commentaduit = false;
		}
			
		var ret = this.saveNormal({
			title: title,
			description: description,
			nickname: nickname,
			website: website,
			webstatus: webstatus,
			qq_appid: qq_appid,
			qq_appkey: qq_appkey,
			articleprivewlength: articleprivewlength,
			articleperpagecount: articleperpagecount,
			webdescription: webdescription,
			webkeywords: webkeywords,
			authoremail: authoremail,
			seotitle: seotitle,
			commentaduit: commentaduit,
			commentperpagecount: commentperpagecount
		});
		
		if ( ret === true ){
			error = "";
			var cache = require.async("cache");
				cache.build("global");
		}
		
		return {
			success: ret,
			error: error
		}
	}
	
	callbacks.saveNormal = function(options){
		var dbo = require("DBO"),
			connecte = require("openDataBase");
			
		if ( connecte === true ){
			dbo.update({ data: options, table: "blog_global", conn: config.conn, key: "id", keyValue: "1" });
			return true;
		}else{
			return false;
		}
	}
	
	if ( Session("admin") === true ){
		if ( callbacks[j] !== undefined ){
			return callbacks[j]();
		}else{
			return {
				success: false,
				error: "未找到对应处理模块"
			}
		}
	}else{
		return {
			success: false,
			error: "非法权限操作"
		}
	}
});

CloseConnect();
%>