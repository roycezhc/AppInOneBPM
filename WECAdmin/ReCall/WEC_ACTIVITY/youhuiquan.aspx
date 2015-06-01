<%@ Page Language="C#" AutoEventWireup="true" CodeFile="youhuiquan.aspx.cs" Inherits="WECAdmin_ReCall_WEC_ACTIVITY_youhuiquan" %>

<!DOCTYPE html>
<!-- saved from url=(0231)http://www.shengyt.com/activity/Coupons?_tj_twtype=12&_tj_pid=113362&_tt=1&_tj_graphicid=15099&_tj_title=312312&_tj_keywords=123&id=15099&bid=222020&wechatid=oWKVbt8s-eF1Hjxs-iUykz5mDvp0&pid=113362&v=4a12207616277f4cc516383a02e07870 -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="微信生意通/政务通、微信营销、微信代运营、微信定制开发、微信托管、微网站、微商城、微营销" name="Keywords">
	<meta content="微信生意通/政务通，国内最大的微信公众智能服务平台，微信生意通/政务通八大微体系：微菜单、微官网、微会员、微活动、微商城、微推送、微服务、微统计，企业微营销必备。" name="Description">
    <link rel="stylesheet" type="text/css" href="./youhuiquan_files/activity_style.css" media="all">
<script type="text/javascript" async="" src="./youhuiquan_files/wtj.js"></script><script type="text/javascript" src="./youhuiquan_files/zepto.js"></script>
<title>优惠券</title>
	<link rel="shortcut icon" href="http://stc.shengyt.com/img/favicon.ico">
    <!--[if lte IE 9]><script src="http://stc.shengyt.com/src/watermark.js"></script><![endif]-->
	<!--[if IE 7]><link href="http://stc.shengyt.com/css/font_awesome_ie7.css" rel="stylesheet" /><![endif]-->
<script charset="utf-8" src="./youhuiquan_files/v.js"></script></head>
<body class="activity-coupon-winning">
	


    
   <meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="youhuiquan">
    <title>优惠券</title>


	<script src="./youhuiquan_files/alert.js"></script><style type="text/css">

.window {
	width:290px;
	position:absolute;
	display:none;
	bottom:30px;
	left:50%;
	 z-index:9999;
	margin:-50px auto 0 -145px;
	padding:2px;
	border-radius:0.6em;
	-webkit-border-radius:0.6em;
	-moz-border-radius:0.6em;
	background-color: #ffffff;
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	-o-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	font:14px/1.5 Microsoft YaHei,Helvitica,Verdana,Arial,san-serif;
}
.window .title {
	
	background-color: #A3A2A1;
	line-height: 26px;
    padding: 5px 5px 5px 10px;
	color:#ffffff;
	font-size:16px;
	border-radius:0.5em 0.5em 0 0;
	-webkit-border-radius:0.5em 0.5em 0 0;
	-moz-border-radius:0.5em 0.5em 0 0;
	background-image: -webkit-gradient(linear, left top, left bottom, from( #585858 ), to( #565656 )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient(#585858, #565656); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient(#585858, #565656); /* FF3.6 */
	background-image:     -ms-linear-gradient(#585858, #565656); /* IE10 */
	background-image:      -o-linear-gradient(#585858, #565656); /* Opera 11.10+ */
	background-image:         linear-gradient(#585858, #565656);
	
}
.window .content {
	/*min-height:100px;*/
	overflow:auto;
	padding:10px;
	background: linear-gradient(#FBFBFB, #EEEEEE) repeat scroll 0 0 #FFF9DF;
    color: #222222;
    text-shadow: 0 1px 0 #FFFFFF;
	border-radius: 0 0 0.6em 0.6em;
	-webkit-border-radius: 0 0 0.6em 0.6em;
	-moz-border-radius: 0 0 0.6em 0.6em;
}
.window #txt {
	min-height:30px;font-size:16px; line-height:22px;
}
.window .txtbtn {
	
	background: #f1f1f1;
	background-image: -webkit-gradient(linear, left top, left bottom, from( #DCDCDC ), to( #f1f1f1 )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #ffffff , #DCDCDC ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #ffffff , #DCDCDC ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #ffffff , #DCDCDC ); /* IE10 */
	background-image:      -o-linear-gradient( #ffffff , #DCDCDC ); /* Opera 11.10+ */
	background-image:         linear-gradient( #ffffff , #DCDCDC );
	border: 1px solid #CCCCCC;
	border-bottom: 1px solid #B4B4B4;
	color: #555555;
	font-weight: bold;
	text-shadow: 0 1px 0 #FFFFFF;
	border-radius: 0.6em 0.6em 0.6em 0.6em;
	display: block;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	text-overflow: ellipsis;
	white-space: nowrap;
	cursor: pointer;
	text-align: windowcenter;
	font-weight: bold;
	font-size: 18px;
	padding:6px;
	margin:10px 0 0 0;
}
.window .txtbtn:visited {
	background-image: -webkit-gradient(linear, left top, left bottom, from( #ffffff ), to( #cccccc )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #ffffff , #cccccc ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #ffffff , #cccccc ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #ffffff , #cccccc ); /* IE10 */
	background-image:      -o-linear-gradient( #ffffff , #cccccc ); /* Opera 11.10+ */
	background-image:         linear-gradient( #ffffff , #cccccc );
}
.window .txtbtn:hover {
	background-image: -webkit-gradient(linear, left top, left bottom, from( #ffffff ), to( #cccccc )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #ffffff , #cccccc ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #ffffff , #cccccc ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #ffffff , #cccccc ); /* IE10 */
	background-image:      -o-linear-gradient( #ffffff , #cccccc ); /* Opera 11.10+ */
	background-image:         linear-gradient( #ffffff , #cccccc );
}
.window .txtbtn:active {
	background-image: -webkit-gradient(linear, left top, left bottom, from( #cccccc ), to( #ffffff )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #cccccc , #ffffff ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #cccccc , #ffffff ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #cccccc , #ffffff ); /* IE10 */
	background-image:      -o-linear-gradient( #cccccc , #ffffff ); /* Opera 11.10+ */
	background-image:         linear-gradient( #cccccc , #ffffff );
	border: 1px solid #C9C9C9;
	border-top: 1px solid #B4B4B4;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3) inset;
}

.window .title .close {
	float:right;
	background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACTSURBVEhL7dNtCoAgDAZgb60nsGN1tPLVCVNHmg76kQ8E1mwv+GG27cestQ4PvTZ69SFocBGpWa8+zHt/Up+IN+MhgLlUmnIE1CpBQB2COZibfpnXhHFaIZkYph0SOeeK/QJ8o7KOek84fkCWSBtfL+Ny2MPpCkPFMH6PWEhWhKncIyEk69VfiUuVhqJefds+YcwNbEwxGqGIFWYAAAAASUVORK5CYII=");
	width:26px;
	height:26px;
	display:block;	
}
</style>
<div class="window" id="windowcenter">
	<div id="title" class="title">消息提醒<span class="close" id="alertclose"></span></div>
	<div class="content">
	 <div id="txt"></div>
	 <input type="button" value="确定" id="windowclosebutton" name="确定" class="txtbtn">	
	</div>
</div>

    <div class="main">
        <div class="banner">
                                    <a href=""><img id="zjpic" src="./youhuiquan_files/activity-coupon-winning.jpg"></a>
                        </div>
     	    
         <div class="content">
            
            <div id="ywl" style="display: none" class="boxcontent boxwhite">
                <div class="box">
                    <div class="title-red"><span>你的抽奖机会已经用完了</span></div>
                  </div>
                
            </div>

        <div class="content">
            
            <div id="zjl" style="display: none" class="boxcontent boxwhite">
                <div class="box">
                    <div class="title-red"><span>恭喜你中奖了</span></div>
                    <div class="Detail">
                        <p>你中了：<span class="red"><%=info %></span></p>
                        <p>兑奖SN码：<span class="red" id="sncode"><%=sn_code%></span></p>
						                                                <p class="red"><%=activity.INFORMATION %></p>
                                                <p>
                        <%
                            if (phone == null || phone.Equals(""))
                            {
                                 
                             %>
                        <input name="" class="px" id="tel" value="" type="text" placeholder="用户请输入您的手机号">
                        </p>
                        <p>
                        </p><p>
                            <input class="pxbtn" name="提 交" id="save-btn" type="button" value="用户提交">
                        </p>
                        <%
                            }
                            else
                            {
                                 %>

                                <div>你提交的手机号码为：<%=phone %>,请耐心等待工作人员联系</div>
                                 <%
                            } %>
                                                                       <p>

                                                                    </div>
                  <!--  <div class="Detail">
                        <p>你中了：<span class="red">一等奖</span></p>
                        <p>兑奖SN码：<span class="red" id="Span1">080731995610087932</span></p>
                        <p class="red">请在下方提交你的手机号，方便我们联系你兑奖!兑奖请联系我们，电话18950099999</p>

                        <p class="red">中奖者手机号：144444 </p>
                        <p>
                    </div>-->
                </div>
                
            </div>
              
            <div class="boxcontent boxwhite">
                <div class="box">
                    <div class="title-red"><span>奖项设置：</span></div>
                    <div class="Detail">
                        <% 
                           
                            string[] name1=new string[]{activity.TYPE_ONE,activity.TYPE_TWO,activity.TYPE_THREE,activity.TYPE_FOUR,activity.TYPE_FIVE,activity.TYPE_SIX};
                            string[] name2 = new string[] { activity.NAME_ONE,activity.NAME_TWO,activity.NAME_THREE,activity.NAME_FOUR,activity.NAME_FIVE,activity.NAME_SIX};
                            int[] name3 = new int[] { activity.NUM_ONE,activity.NUM_TWO,activity.NUM_THREE,activity.NUM_FOUR,activity.NUM_FIVE,activity.NUM_SIX};
                            for (int i = 0; i < 6;i++ )
                           {
                               if (name1[i] == null || name1[i].Equals(""))
                                   break;
                               %>
                         <p>优惠券名称： <%=name2[i]%>。数量：<%=name3[i]%></p>                        
              
                        <%}
                           
                            
                            %>
                    </div>
                </div>
            </div>
              <div class="boxcontent boxwhite" id="desc">
                <div class="box">
                    <div class="title-red">活动说明：</div>
                    <div class="Detail">
                        <p class="red">本次活动总共可以刮<%=activity.NUMBER_TIMES %>次,你已经刮了<%=detail.ALL_PLAY%>次,机会如果没用完重新进入本页面可以再刮! 如果已中奖，则不可再刮！</p>
                        <p><%=activity.INFO %>  </p>
                    </div>
                </div>
            </div>
                    </div>
        <div style="clear: both;"></div>
    </div>
    </div>
<footer style="text-align:center;margin-right:20px"><a href="http://www.shengyt.com/weisite/home?pid=113362&bid=222020&wechatid=oWKVbt8s-eF1Hjxs-iUykz5mDvp0&wxref=mp.weixin.qq.com" style=" color:#fff;">©个人介绍</a></footer>


<script>
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
window.shareData = {  
    "imgUrl": "http://stc.shengyt.com/img/web_bb/activity/activity-coupon-start.jpg", 
    "timeLineLink": "http://www.shengyt.com/activity/Coupons?id=15099&bid=222020&pid=113362&wechatid=fromUsername&v=4a12207616277f4cc516383a02e07870",
    "sendFriendLink": "http://www.shengyt.com/activity/Coupons?id=15099&bid=222020&pid=113362&wechatid=fromUsername&v=4a12207616277f4cc516383a02e07870",
    "weiboLink": "http://www.shengyt.com/activity/Coupons?id=15099&bid=222020&pid=113362&wechatid=fromUsername&v=4a12207616277f4cc516383a02e07870",
    "tTitle": "312312",
    "tContent": "亲，请点击进入优惠券页面，快来参加活动吧！~",
    "fTitle": "312312",
    "fContent": "亲，请点击进入优惠券页面，快来参加活动吧！~",
    "wContent": "亲，请点击进入优惠券页面，快来参加活动吧！~" 
};
// 发送给好友you
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
<script type="text/javascript">
    (function () {
        var wtj = document.createElement('script'); wtj.type = 'text/javascript'; wtj.async = true;
        wtj.src = 'http://tj.shengyt.com/wtj.js?url=' + encodeURIComponent(location.href);
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(wtj, s);
    })();
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd80741dd59de91e1846b2add2c0ad2a2' type='text/javascript'%3E%3C/script%3E"));
    function shengytAfterShare(shareFromWechatId, sendFriendLink, shareToPlatform) {
        var wmShare = document.createElement('script'); wmShare.type = 'text/javascript'; wmShare.async = true;
        wmShare.src = 'http://' + getShareApiRouter() + '/api-share.js?fromWechatId=' + shareFromWechatId + '&shareToPlatform=';
        wmShare.src += shareToPlatform + '&pid=113362&sendFriendLink=' + encodeURIComponent(sendFriendLink);
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(wmShare, s);
    }
    function getShareApiRouter() {
        var str_domain = location.href.split('/', 4)[2];
        var tj_domain = '127.0.0.1';
        switch (str_domain) {
            case 'www.shengyt.com':
                tj_domain = 'tj.shengyt.com';
                break;
            case '112.124.28.82':
                tj_domain = '112.124.28.82:400';
                break;
        }
        return tj_domain;
    }
    if (typeof (window.shareData) == 'undefined') {
        var share_imgurl = "";
        if ("" == share_imgurl) {
            var shareImgObj = document.getElementsByClassName("shareImgUrl")[0];
            if ('undefined' != typeof (shareImgObj)) {
                share_imgurl = shareImgObj.src;
            }
        }
        window.shareData = {
            "imgUrl": share_imgurl,
            "timeLineLink": "http://www.shengyt.com/activity/Coupons?_tj_twtype=12&_tj_pid=113362&_tt=1&_tj_graphicid=15099&_tj_title=312312&_tj_keywords=123&id=15099&bid=222020&wechatid=fromUsername&pid=113362&v=4a12207616277f4cc516383a02e07870",
            "sendFriendLink": "http://www.shengyt.com/activity/Coupons?_tj_twtype=12&_tj_pid=113362&_tt=1&_tj_graphicid=15099&_tj_title=312312&_tj_keywords=123&id=15099&bid=222020&wechatid=fromUsername&pid=113362&v=4a12207616277f4cc516383a02e07870",
            "weiboLink": "http://www.shengyt.com/activity/Coupons?_tj_twtype=12&_tj_pid=113362&_tt=1&_tj_graphicid=15099&_tj_title=312312&_tj_keywords=123&id=15099&bid=222020&wechatid=fromUsername&pid=113362&v=4a12207616277f4cc516383a02e07870",
            "tTitle": document.title,
            "tContent": document.title,
            "fTitle": document.title,
            "fContent": document.title,
            "wContent": document.title
        }
    }
    if ("" == window.shareData.imgUrl) {
        var shareImgObj = document.getElementsByClassName("shareImgUrl")[0];
        if ('undefined' != typeof (shareImgObj)) {
            window.shareData.imgUrl = shareImgObj.src;
        }
    }
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
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
                shengytAfterShare("oWKVbt8s-eF1Hjxs-iUykz5mDvp0", window.shareData.sendFriendLink, 'appmessage');
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
                //shengytAfterShare("oWKVbt8s-eF1Hjxs-iUykz5mDvp0",window.shareData.timeLineLink,'timeline');
                _report('timeline', res.err_msg);
            });
        });

        // 分享到微博
        WeixinJSBridge.on('menu:share:weibo', function (argv) {
            WeixinJSBridge.invoke('shareWeibo', {
                "content": window.shareData.wContent,
                "url": window.shareData.weiboLink
            }, function (res) {
                shengytAfterShare("oWKVbt8s-eF1Hjxs-iUykz5mDvp0", window.shareData.weiboLink, 'weibo');
                _report('weibo', res.err_msg);
            });
        });
    }, false);
</script><script src="./youhuiquan_files/h.js" type="text/javascript"></script>
<script type="text/javascript" src="./youhuiquan_files/ChatFloat.js"></script>
<script type="text/javascript">
    var str_domain = location.href.split('/', 4)[2];
    var boolIsTest = true;
    if (str_domain == 'www.shengyt.com') {
        boolIsTest = false;
    }
    new ChatFloat({
        AId: '113362',
        openid: "oWKVbt8s-eF1Hjxs-iUykz5mDvp0",
        top: 150,
        right: 0,
        IsTest: boolIsTest
    });
</script>

</body></html>