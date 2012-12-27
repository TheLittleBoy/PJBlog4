﻿<%include(pageCustomParams.global.themeFolder + "/header2");%>
<% 
	var date = require("DATE");
%>
<script language="javascript">
var postid = <%=pageCustomParams.article.id%>;
</script>
	<div class="pj-wrapper fn-clear pj-bodyer">
        <div class="pj-article-content">
<%
;(function(params){
%>
			<h1><%=params.title%></a></h1>
            <div class="pj-article-infos">
            	<span class="date">作者：<%=params.user.name%></span>
                <span class="date">发布：<%=date.format(params.postDate, "M d y")%></span>
            	<span class="category">分类：<a href="<%=params.category.url%>" title="<%=params.category.info%>"><%=params.category.name%></a></span>
            	<span class="date">阅读：<%=params.views%>次</span>
            </div>
            <div class="pj-content"><%=params.content%></div>
            <div class="information">除非注明，本站所有文章均为博主原创，转载请注明出处！
                <%
					if ( params.tags.length > 0 ){
				%>
                <span class="tags">标签：
                <%
						for ( var tagitems = 0 ; tagitems < params.tags.length ; tagitems++ ){
				%>
                	<a href="<%=params.tags[tagitems].url%>"><%=params.tags[tagitems].name%></a>
                <%			
						}
				%>
                </span>
                <%	
					}
				%>
            </div>
            <div class="pj-content-nav">
            	<%if ( params.other.prev ){%>
                	<a class="l" href="<%=params.other.prev.url%>">上一篇：<%=params.other.prev.title%></a>
                <%}%>
                <%if ( params.other.next ){%>
                	<a class="r" href="<%=params.other.next.url%>">下一篇：<%=params.other.next.title%></a>
                <%}%>
            </div>
<%
})(pageCustomParams.article);
%>
        </div>

    <div class="pj-sidebar fn-right">
    	<div class="pj-sidepannel">
        	<h3>用户信息</h3>
            <ul class="fn-clear">
    <%
	if ( config.user.login === true ){
	%>
    	<li><a href="server/logout.asp">注销登录</a></li>
    <%
	}else{
		LoadPluginsCacheModule("qqoauth", function(qq){
			console.log('<li><a href="' + qq.url() + '">腾讯账号登入</a></li>');
		});
	}
    %><li><a href="control.asp">管理后台（需要权限）</a></li>
    		</ul>
    	</div>
        
    	<%
			LoadPluginsCacheModule("newarticles", function(articles){
				if ( articles ){
					var datas = articles.datas();
					if ( datas.length > 0 ){
		%>
        <div class="pj-sidepannel">
        	<h3>最新日志</h3>
            <ul class="fn-clear">
        <%
						for ( var i = 0 ; i < datas.length; i++ ){
		%>
            	<li><a href="<%=datas[i].url%>"><%=datas[i].title%></a></li>
        <%
						}
		%>
            </ul>
        </div>
        <%
					}
				}
			});
		%>
        
    	<div class="pj-sidepannel">
        	<h3>最新评论</h3>
            <ul class="fn-clear">
    	    <li><a >这个主题很赞，我很喜欢，期待PJblog4</a></li>
    	    <li><a >喜欢并支持博主的创作，我会长期关注的</a></li>
    	    <li><a >这是条测试评论，测试效果的</a></li>
    	    </ul>
        </div>
    	<div class="pj-sidepannel">
        	<h3>网站统计</h3>
            <ul class="fn-clear">
    	    <li style="width:50%;">文章总数：88篇</li>
    	    <li style="width:50%;">评论总数：88条</li>
    	    <li style="width:50%;">浏览总数：8888次</li>
            <li style="width:50%;">当前主题：imback</li>
    	    </ul>
        </div>
    	<div class="pj-sidepannel">
        	<h3>友情链接</h3>
            <ul>
    	<li style="width:50%;"><a href="http://www.maosay.com" target="_blank">猫言猫语</a></li>
        <li style="width:50%;"><a href="/old" target="_blank">林肆随笔</a></li>
    	<li style="width:50%;"><a href="http://www.izhu.org" target="_blank">大猪博客</a></li>
        <li style="width:50%;"><a href="http://blog.goeswell.cn/" target="_blank">生活笔谈</a></li>
        <div class="fn-clear"></div>
    	    </ul>
    	</div>
    </div>

        <div class="relate">
            <h3>相关日志</h3>
            <ul class="fn-clear">
            <li><a >坚决捍卫国家的主权完整，努力关心国家大事</a></li>
            <li><a >钓鱼岛是中国的，这是不容置疑的事实</a></li>
            <li><a >PJblog4公测在即，赶快关注吧！记住本站网址哟</a></li>
            <li><a >既然世界末日都不怕，那还怕什么呢？</a></li>
            </ul>
        </div>        
        <div class="comments">
        	<div class="comment-title fn-clear">
            	<div class="fn-left"><h3>评论列表</h3></div>
                <div class="fn-right"><a href="javascript:;" id="postnewcomment">+ 发表评论</a></div>
            </div>
            <div class="comment-list">
<%
;(function(lists, pages){
	if ( lists.length > 0 ){
%>
	<ul>
<%
	for ( var i = 0 ; i < lists.length ; i++ ){
		var items = lists[i].childrens;
%>
	<li class="fn-clear">
        <div class="img fn-left"><img src="<%=lists[i].user.photo%>" /></div>
        <div class="comment-content fn-left">
            <div class="comment-who fn-clear">
            	<span class="fn-left"><%=lists[i].user.name%></span>
                <span class="fn-right comment-who-time"><%=date.format(lists[i].date, "M d y - h:i")%></span>
            </div>
            <div class="comment-des"><%=lists[i].content%></div>
            <div class="actiontools"><a href="javascript:;" data-id="<%=lists[i].id%>" class="postreply">回复该留言</a></div>
            <%
                if ( items.length > 0 ){
            %>
                    <div class="comment-items">
                    <%
                            for ( var j = 0 ; j < items.length ; j++ ){
                    %>
                        <div class="fn-clear cline">
                            <div class="cimg fn-left"><img src="<%=items[j].user.photo%>" /></div>
                            <div class="ccontent fn-left">
                                <div class="cwho"><%=items[j].user.name%></div>
                                <div class="cinfo"><%=date.format(items[j].date, "M d y - h:i")%></div>
                                <div class="cdes"><%=items[j].content%></div>
                            </div>
                        </div>
                    <%			
                            }
                    %>
                    </div>
            <%
                }
            %>
        </div>
    </li>
<%
	}
%>
    </ul>
<%
	}
	
	if ( pages.length > 0 ){
%>
	<div class="pj-article-pagebar fn-clear">
	<%
                for ( var n = 0 ; n < pages.length ; n++ ){
                    if ( pages[n].url === undefined ){
    %>
       <a href="javascript:;"><span class="fn-left"><%=pages[n].key%></span></a>
    <%
                    }else{
    %>
        <a href="<%=pages[n].url%>" class="fn-left"><span><%=pages[n].key%></span></a>
    <%				
                    }
                }
    %>
    </div>
    <%
	}
})(pageCustomParams.comments.lists, pageCustomParams.comments.pages);
%> 
            </div>
        </div>
    </div>
    <script language="javascript">
    	require("assets/js/config.js", function( route ){
			route.load("<%=pageCustomParams.global.themeFolder%>/js/article");
		});
    </script>
<%include(pageCustomParams.global.themeFolder + "/footer")%>
