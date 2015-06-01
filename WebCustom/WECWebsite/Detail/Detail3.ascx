<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Detail3.ascx.cs" Inherits="WECWebsite_Detail_Detail3" %>
    <script type="text/javascript">
//       <link rel="stylesheet" type="text/css" href="http://stc.shengyt.com/css/template/shengyt-ui-1-1.css?2014-03-07-1" media="all">

        document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/shengyt-ui-1-1.css?r=' + Math.random() + '"" media="all" />');
       
        $(function () {
            $("#imgshare_1").attr("src", "<%=preUrl %>UploadFiles/Menu/icon_msg.png?v=" + Math.random());
            $("#imgcover").attr("src", "<%=preUrl %>UploadFiles/Menu/guide.png?v=" + Math.random());
            $("#imgshare_2").attr("src", "<%=preUrl %>UploadFiles/Menu/icon_timeline.png?v=" + Math.random());

        }
        );
    </script>
    <html>
       


<title>汉字作为一种文字，</title>
        
       
        <style>
            img{max-width:100%!important;}
        </style>

<div class="shengyt-page">
    					<article id="shareCover" class="toshare" onclick="$('#shareCover').toggleClass('on')">
	<%--	<table>
			<tbody><tr>
				<td colspan="2" style="text-align:right;">
					<img id="imgshare_1" src="" style="width:120px!important;">
					<img  id="imgshare_2" src="" style="width:30px!important;">
				</td>
			</tr>
			<tr>
				<td style="width:50%;">
					<img id="imgshare_4"  src="">
					<div>发送给朋友</div>
				</td>
				<td>
					<img id="imgshare_3" src="">
					<div>分享到朋友圈</div>
				</td>
			</tr>
		</tbody></table>--%>
	</article>
	<script>
	    window.addEventListener("DOMContentLoaded", function () {
	        var nav = document.querySelectorAll(".nav_8")[0];

	        var evts = {
	            handleEvent: function (evt) {
	                if ("A" == evt.target.nodeName) {
	                    evt.target.classList.toggle("active");
	                }
	            }
	        }
	        nav.addEventListener("mousedown", evts, false);
	        nav.addEventListener("mouseup", evts, false);
	        nav.addEventListener("touchstart", evts, false);
	        nav.addEventListener("touchend", evts, false);
	    });
	</script>
	
        <div class="shengyt-content">
			<h3><%=headvalue %></h3>
			<div class="pub_time"><%= timevalue %></div>
							<div style=" text-align:center;"><img src="<%=we.PIC_URL %>" "style="width:100%;"></div>
						<article>
                                 <%=mainvalue %>
                        </article>
		</div>
		<section style="width:95%; margin:0px auto;">
	<div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
		<img id="imgcover" src="http://stc.shengyt.com/img/guide.png?=2014-03-07-1">
	</div>
	<div class="text" id="content">
		<div id="mess_share">
			<div id="share_1">
				<button class="button2" onclick="document.getElementById('mcover').style.display='block';">
					<img id="imgshare_1" src="">&nbsp;发送给朋友
				</button>
			</div>
			<div id="share_2">
				<button class="button2" onclick="document.getElementById('mcover').style.display='block';">
					<img id="imgshare_2" src="">&nbsp;分享到朋友圈
				</button>
			</div>
			<div class="clr"></div>
		</div>
	</div>
</section>
<div style="padding-bottom:0!important;">
	<a href="javascript:window.scrollTo(0,0);" style="font-size:12px;margin:5px auto;display:block;color:#fff;text-align:center;line-height:35px;background:#333;margin-bottom:-10px;">返回顶部</a>
</div>

<!--
分享前控制
-->
	<script>
		document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			window.shareData = {
				"imgUrl": "http://img.shengyt.com/static/91/ec/c5/image/20140324/20140324164820_88419.jpg",
				"timeLineLink": "http://www.shengyt.com/weisite/detail?pid=98816&bid=202577&did=400898&wechatid=fromUsername&from=list&wxref=mp.weixin.qq.com",
				"sendFriendLink": "http://www.shengyt.com/weisite/detail?pid=98816&bid=202577&did=400898&wechatid=fromUsername&from=list&wxref=mp.weixin.qq.com",
				"weiboLink": "http://www.shengyt.com/weisite/detail?pid=98816&bid=202577&did=400898&wechatid=fromUsername&from=list&wxref=mp.weixin.qq.com",
				"tTitle": "汉字作为一种文字，",
				"tContent":  <%=mainvalue %>
			};

			// 发送给好友
			WeixinJSBridge.on('menu:share:appmessage', function (argv) {
				WeixinJSBridge.invoke('sendAppMessage', {
					"img_url": window.shareData.imgUrl,
					"img_width": "640",
					"img_height": "640",
					"link": window.shareData.sendFriendLink,
					"desc": window.shareData.fContent,
					"title": window.shareData.fTitle
				}, function (res) {
					_report('send_msg', res.err_msg);
				})
			});

			// 分享到朋友圈
			WeixinJSBridge.on('menu:share:timeline', function (argv) {
				WeixinJSBridge.invoke('shareTimeline', {
					"img_url": window.shareData.imgUrl,
					"img_width": "640",
					"img_height": "640",
					"link": window.shareData.timeLineLink,
					"desc": window.shareData.tContent,
					"title": window.shareData.tTitle
				}, function (res) {
					_report('timeline', res.err_msg);
				});
			});

			// 分享到微博
			WeixinJSBridge.on('menu:share:weibo', function (argv) {
				WeixinJSBridge.invoke('shareWeibo', {
					"content": window.shareData.wContent,
					"url": window.shareData.weiboLink,
				}, function (res) {
					_report('weibo', res.err_msg);
				});
			});
		}, false)
	</script>
</div>


