<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="canyin_index" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Common"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<!DOCTYPE html>
<!-- saved from url=(0324)http://275083.m.weimob.com/sps/webfood/RestList?_tj_twtype=2&_tj_pid=275083&_tt=1&_tj_graphicid=858955&_tj_title=%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A&_tj_keywords=%E8%AE%A2%E8%8F%9C&aid=275083&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=ade7a69307b0ceed0a711726e7c9b632&wxref=mp.weixin.qq.com -->
<html lang="zh-CN">
 <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_dialog.css" media="all">
    <link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_canyin.css" media="all">
     
    <title>个人介绍</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <script charset="utf-8" src="<%=WebHelper.GetAppPath()%>Lib/JQuery/jquery.min.js"></script>
</head>
<body id="page_order">
    
    <header>
        <table style="width:100%;">
			<!--
            <tr>
                <td><label class="locAddress">上海</label></td>
                <td style="text-align:right;"><a href="" class="btn_1" style="width:70px;text-align:center;padding:5px 3px;font-size:12px;display:inline-block;">切换城市</a></td>
            </tr>
            -->
        </table>
    </header>


    <% foreach(WEC_CY_STOREMANAGER store in list){ %>
	   <section>
		<a href="zhinengxuancan.aspx?storeid=<%=store.ID%>">
			<article>
				<span><img src="<%=store.PIC %>"></span>
				<h1><%=store.SHOPNAME %></h1>
				<p><%=store.DESCRIPTION %> </p>
			</article>
        </a>
        <ul>
            <li><a href="tel:<%=store.TEL %>" class="order">电话预订</a></li>
        </ul>
    </section>
    <%} %>

   <script>

       _onPageLoaded(function () {

           (function () {

               // ios下系统默认弹窗
               if (_isIOS) {
                   return null;
               }

               var orderBtns = _qAll('.order');

               for (var i = 0; i < orderBtns.length; i++) {
                   orderBtns[i].onclick = function (e) {
                       var self = this;
                       var phone = self.getAttribute('href').match(/\d*-?\d+/);
                       if (!phone[0]) { phone[0] = ''; }
                       MDialog.confirm(
                           '', '<span style="text-align:center !important;display:inline-block;width:205px;">是否拨打预订电话<br/>' + phone[0] + '？</span>', null,
                           '确定', function () {
                               isCancle = false;

                               location.href = self.getAttribute('href');
                           }, null,
                           '取消', null, null,
                           null, true, true
                       );

                       return false;
                   }
               }
           })();
       });

    </script>
    <script>
        document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
            WeixinJSBridge.call('hideToolbar');
        });
    </script>
<script>
    window.addEventListener("DOMContentLoaded", function () {
        getRecommendList();
    }, false);
</script>
<script type="text/javascript">
    
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    function weimobAfterShare(shareFromWechatId, sendFriendLink, shareToPlatform) {
        var wmShare = document.createElement('script'); wmShare.type = 'text/javascript'; wmShare.async = true;
        wmShare.src = 'http://tj.weimob.com/api-share.js?fromWechatId=' + shareFromWechatId + '&shareToPlatform=';
        wmShare.src += shareToPlatform + '&pid=&sendFriendLink=' + encodeURIComponent(sendFriendLink);
        var stj = document.getElementsByTagName('script')[0]; stj.parentNode.insertBefore(wmShare, stj);
    }

    /**
     * 默认分享出去的数据
     *
     */
    function getShareImageUrl() {

        var share_imgurl = "";
        if ("" == share_imgurl) {
            var shareImgObj = document.getElementsByClassName("shareImgUrl")[0];
            if ('undefined' != typeof (shareImgObj)) {
                share_imgurl = shareImgObj.src;
            }
        }
        return window.shareData.imgUrl || share_imgurl;
    }

    window.shareData = window.shareData || {
        "timeLineLink": "http://275083.m.weimob.com/sps/webfood/RestList?_tj_twtype=2&_tj_pid=275083&_tt=1&_tj_graphicid=858955&_tj_title=%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A&_tj_keywords=%E8%AE%A2%E8%8F%9C&aid=275083&wechatid=fromUsername&v=ade7a69307b0ceed0a711726e7c9b632&wxref=mp.weixin.qq.com",
        "sendFriendLink": "http://275083.m.weimob.com/sps/webfood/RestList?_tj_twtype=2&_tj_pid=275083&_tt=1&_tj_graphicid=858955&_tj_title=%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A&_tj_keywords=%E8%AE%A2%E8%8F%9C&aid=275083&wechatid=fromUsername&v=ade7a69307b0ceed0a711726e7c9b632&wxref=mp.weixin.qq.com",
        "weiboLink": "http://275083.m.weimob.com/sps/webfood/RestList?_tj_twtype=2&_tj_pid=275083&_tt=1&_tj_graphicid=858955&_tj_title=%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A%E5%95%8A&_tj_keywords=%E8%AE%A2%E8%8F%9C&aid=275083&wechatid=fromUsername&v=ade7a69307b0ceed0a711726e7c9b632&wxref=mp.weixin.qq.com",
        "tTitle": document.title,
        "tContent": document.title,
        "fTitle": document.title,
        "fContent": document.title,
        "wContent": document.title
    }
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
        // 发送给好友
        WeixinJSBridge.on('menu:share:appmessage', function (argv) {
            WeixinJSBridge.invoke('sendAppMessage', {
                "img_url": getShareImageUrl(),
                "img_width": "640",
                "img_height": "640",
                "link": window.shareData.sendFriendLink,
                "desc": window.shareData.fContent,
                "title": window.shareData.fTitle
            }, function (res) {
                if ('send_app_msg:cancel' != res.err_msg) {
                    weimobAfterShare("oWKVbt705q6MyupsTckpZcVKklZ4", window.shareData.sendFriendLink, 'appmessage');
                }
                _report('send_msg', res.err_msg);
            })
        });

        // 分享到朋友圈
        WeixinJSBridge.on('menu:share:timeline', function (argv) {
            WeixinJSBridge.invoke('shareTimeline', {
                "img_url": getShareImageUrl(),
                "img_width": "640",
                "img_height": "640",
                "link": window.shareData.timeLineLink,
                "desc": window.shareData.tContent,
                "title": window.shareData.tTitle
            }, function (res) {
                if ('share_timeline:cancel' != res.err_msg) {
                    //如果用户没有取消
                    weimobAfterShare("oWKVbt705q6MyupsTckpZcVKklZ4", window.shareData.timeLineLink, 'timeline');
                }
                _report('timeline', res.err_msg);
            });
        });

        // 分享到微博
        WeixinJSBridge.on('menu:share:weibo', function (argv) {
            WeixinJSBridge.invoke('shareWeibo', {
                "content": window.shareData.wContent,
                "url": window.shareData.weiboLink
            }, function (res) {
                if ('share_weibo:cancel' != res.err_msg) {
                    weimobAfterShare("oWKVbt705q6MyupsTckpZcVKklZ4", window.shareData.weiboLink, 'weibo');
                }
                _report('weibo', res.err_msg);
            });
        });
    }, false);
</script>
<script type="text/javascript">
    var str_domain = location.href.split('/', 4)[2];
    var boolIsTest = true;
    if (str_domain == 'www.weimob.com' || str_domain.indexOf('m.weimob.com') > 0) {
        boolIsTest = false;
    }
    new ChatFloat({
        AId: '275083',
        openid: "oWKVbt705q6MyupsTckpZcVKklZ4",
        top: 150,
        right: 0,
        IsTest: boolIsTest
    });
</script>

</body></html>