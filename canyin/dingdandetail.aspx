<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dingdandetail.aspx.cs" Inherits="canyin_dingdandetail" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Common"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<!DOCTYPE html>
<!-- saved from url=(0148)http://264116.m.weimob.com/sps/webfood/MyMenuList?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6 -->
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_canyin.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_dialog.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/datepicker_canyin.css" media="all">
    <link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/bootstrap-responsive.css" media="all">
    <script type="text/javascript" async="" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wtj.js"></script>
    <script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/JQuery/jQuery.min.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wei_webapp_v2_common.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/bootstrap-datepicker_canyin.js"></script>
<title>我的菜单</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no"></head>
<body id="page_intelOrder" class="myOrderCon">
    <style>
    .btn_common{
        font-size:12px;
        padding: 5px 8px;
        border: 0;
        border-radius: 2px;
        cursor: pointer;
        background-color: #2ec366;
        color: #fff;
    }
    .dish_item textarea{
        padding: 8px;
        background: #eaeaea;
        border-radius: 12px;
        border: 1px solid #dedede;
        outline: none;
        resize: none;
        width: 100%;
        -webkit-box-sizing: border-box;
        box-shadow: none;
        display:none;
    }
    .dish_item{
        height:45px!important;
    }
    .dish_item.on{
        height:97px!important;
    } .dish_item.on textarea{
        margin-top:3px;
        display:block;
    }
</style>
<header style="padding-top:20px;">
    <span class="pCount" style="">该订单共<l style="color:red" id="countnums" nums=""></l>个菜</span>
    <label><i>共计：</i><b class="duiqi" id="total"></b><b class="duiqi">元</b></label>
</header>

<section style="margin-bottom:10px;">
    <article>
        <h2>我的菜单
          
        </h2>
        <div style="display:none;" id="template">
        <li class="dish_item">\
                <span class="dishName">{name}</span>\
                <i>{price}元/份</i>\
                <span>{remark}</span>\
                <div><textarea name="description" onblur="changeDescription(this, event, {dishes_id});" value="">{description}</textarea></div>\
                <section class="bbox" dishname="{name}" onclick="changeCount(this, event, {dishes_id});">\
                    <input class="numBox" name="numBox" type="text" value="{selected_count}" price="{price}" readonly="readonly">\
                    份\
                </section>\
            </li>
        </div>
        <ul id="myorder" class="myorder">
              
                
        </ul>
        <h2>备注
        </h2>
         <div class="alert alert-block" style="width:500px;margin-left:20px;">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 id="remark"></h4>
        </div>
    </article>
</section>
<div id="footer_menu" class="footer footer_menu">
        <ul class="clear" style="position: inherit;">
            <li><a href="zhinengxuancan.aspx"><span class="icons icons_1"></span><label>智能选餐</label></a></li>
            <li><a href="diancai.aspx" class="onactive"><span class="icons icons_2"></span><label>点菜</label></a></li>
            <li><a href="dingdan.aspx"><span class="icons icons_3"></span><label>我的订单</label></a></li>
            <li><a href="xihuan.aspx"><span class="icons icons_4"></span><label>我喜欢</label></a></li>
            <li><a href="javascript:void(0);" id="my_menu"><span class="icons icons_5"><label id="num" class="num"><%=num %></label></span></a></li>
        </ul>
    </div>

<iframe name="hide" style="display:none;"></iframe>
	<script>
	    $(function () {
	        getAllMenu();
	       // getDishCount();
           
	    });
	    function getDishCount() {

	        $.ajax({
	            url: "Back.aspx",
	            data: { getdishcount: "true" },
	            dataType: "json",
	            success: function (data) {
	                $("#num").html(data["num"]);
	            }
	        });
	    }
	    function getAllMenu() {
	        var orderid="<%=Request["orderid"]%>";
	        MLoading.show('加载中');
	        $.ajax({
	            url: "Back.aspx",
	            data: { type: "getAllMenu", orderid: orderid },
	            dataType: "json",
	            success: function (data) {
	                //alert(data);
	                var TPL = $("#template").html();
	                var html = "";
	                var totalnum = 0;
	                var totalprice = 0;
	                var remark = "";
	                $.each(data, function (n, value) {
	                    var temp = "";
	                    for (var i = 0; i < value.length; i++) {
	                        temp = TPL.replace('{' + name + '}', value[i].value);
	                    }
	                    temp = TPL.replace(/{name}/g, value.name);
	                    temp = temp.replace(/{price}/g, value.price);
	                    temp = temp.replace(/{dishes_id}/g, value.dishes_id);
	                  //  temp = temp.replace(/{description}/g, value.description);
	                    temp = temp.replace(/{selected_count}/g, value.selected_count);
	                    temp = temp.replace(/{remark}/g, value.description);

	                    totalnum += parseInt(value.selected_count);
	                    totalprice += parseFloat(value.price) * value.selected_count;
	                    html += temp;

	                    remark = value.order_remark;
	                });
	                $("#countnums").html(totalnum);
	                $("#total").html(totalprice.toFixed(2));
	                $("#myorder").html(html);
	                $("#remark").html(remark);
	                getDishCount();
	                MLoading.hide();
	            },
	            error: function (data, error) {
	                // console.log(data);
	                //console.log(error);
	            }
	        });
	    }

	</script>
    <script>
	    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {

	        window.shareData = {
	            "imgUrl": "",
	            "timeLineLink": "http://264116.m.weimob.com/sps/webfood/MyMenuList?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
	            "sendFriendLink": "http://264116.m.weimob.com/sps/webfood/MyMenuList?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
	            "weiboLink": "http://264116.m.weimob.com/sps/webfood/MyMenuList?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
	            "tTitle": "",
	            "tContent": "",
	            "fTitle": "",
	            "fContent": "",
	            "wContent": ""
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
	                _report('send_msg', '111111');
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
	                "url": window.shareData.weiboLink
	            }, function (res) {
	                _report('weibo', res.err_msg);
	            });
	        });
	    }, false)
	</script>
</html>
