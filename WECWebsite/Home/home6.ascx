<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home6.ascx.cs" Inherits="WECWebsite_Home_home6" %>

<!DOCTYPE html>
<html>
<%--    <head>
        <meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="http://stc.shengyt.com/css/template/home-55.css?2014-03-07-1" media="all" />


        <link rel="shortcut icon" href="http://stc.shengyt.com/img/favicon.ico" />
    </head>--%>
    <script type="text/javascript">
        document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-55.css?r=' + Math.random() + '"" media="all" />');
</script>
<link rel="shortcut icon" href="http://stc.shengyt.com/img/favicon.ico" />
        <div class="body">
	<header>
        <div class="snower">
            <script type="text/javascript"></script>
            <script type="text/javascript" src="http://stc.shengyt.com/src/template/snower.js"></script>
        </div>
    </header>     	<section>
		<div>
			<div class="header2">
				<hgroup>
					<h2></h2>
					<h4></h4>
				</hgroup>
								<figure style="background-image:url();">&nbsp;</figure>
				
			</div>
			<ul class="list_ul">
            <% 
                foreach (AgileFrame.Orm.PersistenceLayer.Model.WEC_COLUMN wc in list1)
                {
                %>

                <li>
					  <a href='<% =!string.IsNullOrEmpty(wc.OUT_URL) ? wc.OUT_URL : "list.aspx?id=" + wc.ID + "&aid=" + aid%>' style="background-image:url('<%=wc.PIC_URL%>');">
						<label><%=wc.COLUMN_NAME %></label>
					</a>
					<i></i>
				</li>
            <%} %>
								
								<%--<li>
					                        <a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293179&wxref=mp.weixin.qq.com"
                                                             style="background-image:url('http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1');">
						<label>测试5</label>
					</a>
					<i></i>
				</li>
								<li>
					                        <a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293175&wxref=mp.weixin.qq.com"
                                                             style="background-image:url('http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1');">
						<label>测试</label>
					</a>
					<i></i>
				</li>
								<li>
					                        <a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293176&wxref=mp.weixin.qq.com"
                                                             style="background-image:url('http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1');">
						<label>测试2</label>
					</a>
					<i></i>
				</li>
								<li>
					                        <a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293167&wxref=mp.weixin.qq.com"
                                                             style="background-image:url('http://stc.shengyt.com//img/template/lib/home-150150.jpg?v=2014-03-07-1?=2014-03-07-1');">
						<label>习近平</label>
					</a>
					<i></i>
				</li>
								<li>
					                        <a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293177&wxref=mp.weixin.qq.com"
                                                             style="background-image:url('http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1');">
						<label>测试3</label>
					</a>
					<i></i>
				</li>
								<li>
					                        <a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=292743&wxref=mp.weixin.qq.com"
                                                             style="background-image:url('http://stc.shengyt.com//img/template/lib/home-150150.jpg?v=2014-03-07-1?=2014-03-07-1');">
						<label>汉字作为一种文字</label>
					</a>
					<i></i>
				</li>--%>
							</ul>
		</div>
	</section>
</div>
<!--
导航菜单
   后台设置的快捷菜单
-->

<!--
分享前控制
-->
	<script type="text/javascript">
	    window.shareData = {
	        "imgUrl": "",
	        "timeLineLink": "http://www.shengyt.com/weisite/home?pid=98816&bid=202577&wechatid=fromUsername&wxref=mp.weixin.qq.com",
	        "sendFriendLink": "http://www.shengyt.com/weisite/home?pid=98816&bid=202577&wechatid=fromUsername&wxref=mp.weixin.qq.com",
	        "weiboLink": "http://www.shengyt.com/weisite/home?pid=98816&bid=202577&wechatid=fromUsername&wxref=mp.weixin.qq.com",
	        "tTitle": "",
	        "tContent": "",
	        "fTitle": "",
	        "fContent": "",
	        "wContent": ""
	    };
			</script>

</html>



