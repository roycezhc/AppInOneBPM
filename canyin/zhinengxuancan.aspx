<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhinengxuancan.aspx.cs" Inherits="yinshi" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Common"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<!DOCTYPE html>
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_canyin.css" media="all">
    <script type="text/javascript" async="" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wtj.js"></script>
    <script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/JQuery/jQuery.min.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wei_webapp_v2_common.js"></script>
<title>门店名称</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
<script charset="utf-8" src="<%=WebHelper.GetAppPath()%>Lib/canyin/v.js"></script></head>
<body id="page_count" style="height: 752px;">
    
    <div class="center main">
        <section>
            <ol style="width: 424px;">
           
            </ol>
        </section>
    </div>
    <div class="notice">
        <b>请选择您的用餐人数</b>
    </div>
        <div class="center">
		<form id="re-location" action="wodecandan.aspx" method="post">
			<input type="hidden" name="combo_nums" value="">
		</form>
        <a class="order" onclick="doSelected();" id="order" style="margin-top: 80px;"><span>开始点菜</span></a>
    </div>
<div id="footer_menu" class="footer footer_menu">
            <ul class="clear">
                <li style="width: 60px;"><a class="onactive" href="javascript:void(0);"><span class="icons icons_1"></span><label>智能选餐</label></a></li>
                <li style="width: 60px;"><a href="diancai.aspx"><span class="icons icons_2"></span><label>点菜</label></a></li>
                <li style="width: 60px;"><a href="dingdan.aspx"><span class="icons icons_3"></span><label>我的订单</label></a></li>
                <li style="width: 60px;"><a href="xihuan.aspx"><span class="icons icons_4"></span><label>我喜欢</label></a></li>
                <li style="width: 60px;"><a href="javascript:void(0);" id="my_menu"><span class="icons icons_5"><label id="num" class="num"><%=num %></label></span></a></li>
            </ul>
        </div>
        <script>
            var footer = document.getElementById("footer_menu");
            var evtObj = {
                handleEvent: function (evt) {
                    if ("A" == evt.target.tagName) {
                        evt.target.classList.toggle("on");
                    }
                }
            }
            footer.addEventListener("touchstart", evtObj, false);
            footer.addEventListener("touchend", evtObj, false);
        </script>
        
    <script>
        window.selected = {
            total: 0,
            dishes: {}
        };
        var numStr = "<%=nums%>";
        var arr=numStr.split(',');
        var counts = arr.length;
       // var cardid = "3414907165";
        if (counts > 1) {
            var nums = new Array();
            $.each(arr, function (n, value) {
                nums.push(parseInt(arr[n]));
            });
        } else {
            var nums = new Array(numStr);
        }
        var _selectedCount = 0; //选择好的人数会同步到这个变量里
        $(function () {
           // getDishCount();
        });
        //function getDishCount() {
        //    $.ajax({
        //        url: "Back.aspx",
        //        data: { getdishcount: "true" },
        //        dataType:"json",
        //        success: function (data) {
        //            $("#num").html(data["num"]);
        //        }
        //    });
        //}
        function SliderChooser(config) { var container = _q(config.containerContext), inner = _q(config.innerContext, container), nums = config.nums, itemW = config.itemWidth, curr = 1, w = container.clientWidth, drag_start = { time: 0, left: 0, top: 0, x: 0, y: 0, lx: 0, ly: 0 }, drag_end = { left: 0 }, directionLocked = null, time = function () { return (new Date).getTime(); }, getP = function (e) { var t = e.touches[0], c = e.currentTarget.parentNode, r = c.parentNode.getClientRects()[0]; return { x: t.pageX - r.left, y: t.pageY - r.top, px: t.pageX, py: t.pageY, cx: t.clientX, cy: t.clientY, sx: t.screenX, sy: t.screenY }; }, getLeft = function (dom) { return parseFloat(/\((\-?[\.\d]+)px/.exec(dom.style[_vendor + 'Transform'])[1]); }, setCurr = function (idx) { curr = idx; _forEach(_qAll(config.itemContext, inner), function (li, liIdx) { _removeClass(li, config.currentStyleClass); if (idx == liIdx) { _addClass(li, config.currentStyleClass); } }); }, doTransition = function (value, tweenMode) { var d = tweenMode ? /*as idx*/ -value * itemW : value, s = tweenMode ? 6.18 * 4 * .01 : 0; inner.style[_vendor + 'TransitionDuration'] = s + 's'; inner.style[_vendor + 'Transform'] = _trnOpen + d + 'px,0' + _trnClose; }, e_ts = function (e) /*touchstart*/ { if (!_touchSupport) e.preventDefault(); directionLocked = null; var p1 = getP(e), p2 = { x: drag_end.left * 1, y: inner.getClientRects()[0].top }; drag_start = { time: time(), left: p2.x, top: p2.y, x: parseInt(p2.x - p1.x), y: parseInt(p2.y - p1.y), lx: e.touches[0].clientX, ly: e.touches[0].clientY, point: p1 }; e.currentTarget.addEventListener("touchmove", e_tm); e.currentTarget.addEventListener("touchend", e_te); e.currentTarget.addEventListener("touchcancel", e_te); }, e_tm = function (e) /*touchmove*/ { if (!_touchSupport) e.preventDefault(); var p = getP(e), c = e.currentTarget.parentNode, v = drag_start.x + p.x; /*横纵拖动互不干扰*/ var absDistX, absDistY, deltaX = e.touches[0].pageX - drag_start.point.px, deltaY = e.touches[0].pageY - drag_start.point.py; if (directionLocked === "y") { return } else { if (directionLocked === "x") { e.preventDefault() } else { absDistX = Math.abs(deltaX); absDistY = Math.abs(deltaY); if (absDistX < 4) { return } if (absDistY > absDistX * 0.58) { directionLocked = "y"; return } else { e.preventDefault(); directionLocked = "x"; } } } doTransition(v); if (MData(c, 'touching') === undefined || MData(c, 'touching') * 1 != 1) MData(c, 'touching', 1); }, e_te = function (e) /*touchend*/ { if (!_touchSupport) e.preventDefault(); e.currentTarget.removeEventListener("touchmove", e_tm); e.currentTarget.removeEventListener("touchend", e_te); e.currentTarget.removeEventListener("touchcancel", e_te); var c = e.currentTarget.parentNode; MData(c, 'touching', 0); try { drag_end.left = getLeft(c); } catch (ex) { } var idx = curr, p2 = { x: drag_end.left, y: c.getClientRects()[0].top }, tTime = time() - drag_start.time, tDis = p2.x - drag_start.left, shortDis = Math.abs(tDis) < 5, longTime = tTime > 300; if (!longTime && !shortDis) { /*快速拖动*/ if (tDis < 0) /*left*/ idx++; else /*right*/ idx--; } else { /*一般拖动*/ if (Math.abs(tDis) > .5 * itemW) { var d1 = Math.abs(Math.round(tDis / itemW)); if (tDis < 0) idx += d1; else idx -= d1; } } if (idx < 1) idx = 1; if (idx >= nums.length - 2) idx = nums.length - 2; doTransition(idx - 1, true); drag_end.left = getLeft(c); setCurr(idx); if ('callback' in config && !!config.callback) { config.callback.call(null, curr - 1); } }; nums.unshift(-1); nums.push(-1); _forEach(nums, function (n, idx, arr) { inner.insertAdjacentHTML('beforeEnd', '<' + config.itemContext + '>' + n + '</' + config.itemContext + '>'); var li = _q(config.itemContext + ':last-of-type', inner); if (idx == 0 || idx == arr.length - 1) { _addClass(li, 'sider'); return; } li.addEventListener("touchstart", e_ts); li = null; }); inner.style.width = itemW * nums.length + 'px'; setCurr(1); };
        function scCallback(currIdx) {
            _forEach(_qAll('section li'), function (li) {
                _removeClass(li, 'left');
                _removeClass(li, 'right');
            });
            var l = _q('section li:nth-of-type(' + (currIdx + 1) + ')'),
                r = _q('section li:nth-of-type(' + (currIdx + 3) + ')');
            _addClass(l, 'left');
            _addClass(r, 'right');
            l = null;
            r = null;
            _selectedCount = parseInt(_q('section li:nth-of-type(' + (currIdx + 2) + ')').innerHTML);
        }
        _onPageLoaded(function () {
            _q('body').scrollTop = -1;
            window.scrollTo(0, -1);
            _q('body').style.height = window.innerHeight + 'px';
            var obtn = _q('.order');
            obtn.style.marginTop = '80px'; //(window.innerHeight - 280 - 75) + 'px';

            SliderChooser({
                nums: nums,
                containerContext: 'section',
                innerContext: 'ol',
                itemContext: 'li',
                itemWidth: 106,
                currentStyleClass: 'curr',
                callback: scCallback
            });
            scCallback(0);
        });
        function doSelected() {
            $('#re-location input[name="combo_nums"]').val(_selectedCount);
            location.href = "wodecandan.aspx?combo_nums="+$('#re-location input[name="combo_nums"]').val();
            return true;
        }

        function addToMenu() {
            var params = '[';
            for (var key in window.selected.dishes) {
                params += '{"dishes_id":' + key + ",",
                params += '"price":' + window.selected.dishes[key].price + ",",
                params += '"nums":' + window.selected.dishes[key].num + "},"
            }
            params = params.replace(/,$/, "");
            params += ']';

            $.ajax({
                'url': 'Back.aspx',
                'data': { 'order': params },
                'type': 'POST',
                'async': 'false',
                'success': function (db) {
                    location.href = 'wodecandan.aspx';
                }
            });

        }
    </script>
    <script>
        $(document).ready(function () {
            $('#my_menu').click(function () {
                location.href = 'wodecandan.aspx';
                //addToMenu();
            });

        });
        document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
            WeixinJSBridge.call('hideToolbar');
        });

</script>
    	<script>
    	    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {

    	        window.shareData = {
    	            "imgUrl": "http://img.weimob.com/static/7d/7f/b9/image/20140620/20140620103808_96323.png",
    	            "timeLineLink": "http://264116.m.weimob.com/sps/webfood/ComboNums?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
    	            "sendFriendLink": "http://264116.m.weimob.com/sps/webfood/ComboNums?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
    	            "weiboLink": "http://264116.m.weimob.com/sps/webfood/ComboNums?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
    	            "tTitle": "门店名称 智能选餐太好用了，小伙伴们快来体验吧！",
    	            "tContent": "门店名称",
    	            "fTitle": "门店名称 智能选餐太好用了，小伙伴们快来体验吧！",
    	            "fContent": "门店名称",
    	            "wContent": "门店名称"
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
<script type="text/javascript">
    window.shareData = {
        "imgUrl": "http://img.weimob.com/static/7d/7f/b9/image/20140620/20140620103808_96323.png",
        "timeLineLink": "http://264116.m.weimob.com/sps/webfood/ComboNums?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
        "sendFriendLink": "http://264116.m.weimob.com/sps/webfood/ComboNums?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
        "weiboLink": "http://264116.m.weimob.com/sps/webfood/ComboNums?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
        "tTitle": "门店名称 智能选餐太好用了，小伙伴们快来体验吧！",
        "tContent": "门店名称",
        "fTitle": "门店名称 智能选餐太好用了，小伙伴们快来体验吧！",
        "fContent": "门店名称",
        "wContent": "门店名称"
    };
</script>


</body></html>