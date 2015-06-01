<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xihuan.aspx.cs" Inherits="xihuan" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Common"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<!DOCTYPE html>
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_canyin.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_dialog.css" media="all">
    <script type="text/javascript" async="" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wtj.js"></script>
    <script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/JQuery/jquery.min.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wei_webapp_v2_common.js"></script>
<title>门店名称---我喜欢</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
</head>
<body id="page_allMenu">
    
<div class="center">
    <section id="infoSection" style="float:none;width:100%;">
        <article>
            <!--div class="h2">推荐菜</div-->
             <div style="display:none;" id="template">
               <dl dunitname="份" dsubcount="1" dishid="{Expr1}" dname="{TITLE}" dtaste="" ddescribe="{INFO}" dprice="{DISH_PRICE}" dishot="{DISH_TAG}" dspecialprice="{SPECIAL_PRICE}" disspecial="{ISSPECIAL}" onclick="selectOne(this, {Expr1}, {DISH_PRICE});" >
                 <dt><h3>{TITLE}{DISH_REMARK}</h3></dt>                    
                 <dd>                       
                      <a href="javascript:void(0)" class="dataIn" onclick="showImgDetail(this);event.stopPropagation();">
                        <img src="{PIC}" alt="" title="">
                      <span style="font-size:10px;">{DISH_TAG}</span>
                      </a>                    
                 </dd>                    
                 <dd>                        
                      <em>{DISH_PRICE}元/例</em>                    
                  </dd>                                     
                 <button shopinfo="" class="selectBtn choose {CHOOSE}"></button>
               </dl>
             </div>
                <div id="pInfo">
                   
                 </div>
        </article>
    </section>
    <div id="footer_menu" class="footer footer_menu">
            <ul class="clear">
                <li><a href="zhinengxuancan.aspx"><span class="icons icons_1"></span><label>智能选餐</label></a></li>
                <li><a href="diancai.aspx"><span class="icons icons_2"></span><label>点菜</label></a></li>
                <li><a href="dingdan.aspx"><span class="icons icons_3"></span><label>我的订单</label></a></li>
                <li><a class="onactive" href="javascript:void(0);"><span class="icons icons_4"></span><label>我喜欢</label></a></li>
                <li><a href="javascript:void(0);" id="my_menu"><span class="icons icons_5"><label id="num" class="num"><%=num %></label></span></a></li>
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
    </div>

    <script type="text/javascript">
        $(function () {
            switchList();
           
        });
      
        function getDishCount() {
            $.ajax({
                url: "Back.aspx",
                data: { getdishcount: "true" },
                dataType:"json",
                success: function (data) {
                    $("#num").html(data["num"]);
                }
            });
        }
        function switchList() {
            MLoading.show("正在加载..");
           
            $.ajax({
                url: "Back.aspx",
                data: { type: "loadLikeList" },
                dataType: "json",
                success: function (data) {
                    var html = "";
                    $.each(data, function (n, obj) {
                        var temp = $("#template").html();
                        $.each(obj, function (key, value) {
                            temp = temp.replace(eval("/{" + key + "}/g"), value);
                        });
                        html += temp;
                    });
                    $("#pInfo").html(html);
                    //显示右下角当前点菜的数量
                   // getDishCount();
                    MLoading.hide();
                },
                error: function (error) {
                    console.log(error);
                }

            });
        }
        window.selected = {
            total: 0,
            dishes: {}
        };
        var cardid = '3414907165';
        var view_const_dish_SPECIAL_PRICE_YES = '2';
        var view_const_dish_HOT_YES = '2';

        function setHeight() {
            var cHeight;
            cHeight = document.documentElement.clientHeight;
            cHeight = (cHeight - 50) + "px"
           // document.getElementById("navBar").style.height = cHeight;
            document.getElementById("infoSection").style.height = cHeight;
        }



        function getAllList() {
            var params = {
            }
            MLoading.show('加载中');
            _doAjax('/sps/webfood/GetLikeList?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6', 'POST', params, function (res) {
                MLoading.hide();
                window.res = res;
                if (res && res.length) {
                    switchList();
                    var navBar = document.getElementById("navBar");
                    var TPL = '<dd categoryid="{id}" class="{selectedClass}" onclick="switchList({id});">{name}</dd>';
                    (function () {
                        var dds_HTML = iTemplate.makeList(TPL, res, function (k, v) {
                            return {
                                selectedClass: 0 == k ? "active" : ""
                            }
                        });
                        navBar.innerHTML = "<dl>" + dds_HTML + "</dl>";
                    })();
                }
            });


        }
        //
       
        //show img detail
        function showImgDetail(thi) {
            var parentDl = thi.parentNode.parentNode;
            var childImg = thi.childNodes[0]
            if (childImg.nodeType == 3) {
                childImg = thi.childNodes[1];
            }

            popPic(childImg.src,
                    parentDl.getAttribute('dname'),
                    parentDl.getAttribute('dprice') + '元/' + parentDl.getAttribute('dunitName'),
                    parentDl.getAttribute('dIsSpecial'),
                    parentDl.getAttribute('dSpecialPrice') + '元/' + parentDl.getAttribute('dunitName'),
                    parentDl.getAttribute('dsubCount'),
                    parentDl.getAttribute('dtaste'),
                    parentDl.getAttribute('ddescribe'),
                    parentDl.getAttribute('dishot')
                );
        }
        //

        function selectOne(container, dishid, price) {
            var btn = container.querySelectorAll("button")[0];
            if (btn.className.indexOf("choosen") > -1) {
                _removeClass(btn, 'choosen');
                _addClass(btn, 'unchoose');
                //unselected
                delete window.selected.dishes[dishid];
                window.selected.total -= 1;
                $.ajax({
                    url: "Back.aspx",
                    type: "post",
                    data: { dishid: dishid, type: "delItem" },
                    success: function (data) { },
                    error: function () { }
                });
            } else {
                _removeClass(btn, 'unchoose');
                _addClass(btn, 'choosen');
                //selected
                window.selected.dishes[dishid] = {
                    price: price,
                    num: 1
                }
                window.selected.total += 1;

                $.ajax({
                    url: "Back.aspx",
                    type: "post",
                    data: { dishid: dishid, type: "addItem" },
                    success: function (data) { },
                    error: function () { }
                });
            }
            if (!("origTotal" in window.selected)) {
                window.selected.origTotal = parseInt(_q(".footer_menu .num").innerHTML);
            }
            _q(".footer_menu .num").innerHTML = window.selected.origTotal + window.selected.total;
            console.log(window.selected);
        }
        //
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

        //后台可自行扩展参数
        //调用自定义弹层
        function popPic(imgUrl, title, price, isSpecial, specialPrice, people, teast, assess, isHot) {
            var _title = title,
                _price = price,
                _people = null;//people,
            _teast = teast,
            _assess = assess;

            var hotHtml = '<b>' + isHot + '</b>';
            _tmpHtml = "<div class='content'>" + hotHtml + "<img src='" + imgUrl + "' alt='' title=''><h2>" + _title;

            if (isSpecial == view_const_dish_SPECIAL_PRICE_YES) {
                _tmpHtml += "<i>" + specialPrice + "</i><del>" + _price + "</del>";
            } else {
                _tmpHtml += "<i>" + _price + "</i>";
            }

            if (_people) {
                _tmpHtml += "<span>" + _people + "人点过</span>";
            }
            _tmpHtml += "</h2>";

            if (_teast) {
                _tmpHtml += "<h3>口味：" + _teast + "</h3>";
            }

            if (_assess) {
                _tmpHtml += "<p>" + _assess + "</p>";
            }

            _tmpHtml += '</div>';
            MDialog.popupCustom(_tmpHtml, true, true);
        }

        window.addEventListener("DOMContentLoaded", function () {
            //getAllList();
            setHeight();
        }, false);
        window.onresize = function () { setHeight(); }
        function favourite(thi, evt) {
            evt.stopPropagation();
            var checkeds = '';
            if ($(thi).is(':checked')) {
                checkeds = '1';
            } else {
                checkeds = '0';
            }
            MDialog.confirm(
                '', '您确定要从喜欢栏目中移除？', null,
                '确定', function () {

                    var id = $(thi).val();
                    var check = '';
                    if ($(thi).is(':checked')) {
                        check = '1';
                    } else {
                        check = '0';
                    }
                    $.ajax({
                        url: '/sps/webfood/doLike' + '?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6',
                        data: { 'id': id, 'check': check },
                        type: 'POST',
                        dataType: 'json',
                        cache: false,
                        beforeSend: function () {
                            MLoading.show('加载中');
                        },
                        success: function (msgObj) {
                            MLoading.hide();
                            if (msgObj.status == '1') {
                                $("#list_" + id).remove();
                            } else {
                                return false;
                            }
                        }
                    });

                }, null,
                '取消', function () { thi.checked = true; }, null,
                    null, true, true
                );
        }
    </script>

<script>
    $(document).ready(function () {
        $('#my_menu').click(function () {
            // addToMenu();
            location.href = 'wodecandan.aspx';
        });

    });

</script>
<script>
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
        WeixinJSBridge.call('hideToolbar');
    });
</script>
	<script>
	    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {

	        window.shareData = {
	            "imgUrl": "http://img.weimob.com/static/7d/7f/b9/image/20140620/20140620103808_96323.png",
	            "timeLineLink": "http://264116.m.weimob.com/sps/webfood/like?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=e8cad04b4c784d4c2d92adf431d3121c",
	            "sendFriendLink": "http://264116.m.weimob.com/sps/webfood/like?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=e8cad04b4c784d4c2d92adf431d3121c",
	            "weiboLink": "http://264116.m.weimob.com/sps/webfood/like?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=e8cad04b4c784d4c2d92adf431d3121c",
	            "tTitle": "门店名称 可以收藏自己喜欢的菜品了，小伙伴们快来体验吧！",
	            "tContent": "门店名称",
	            "fTitle": "门店名称 可以收藏自己喜欢的菜品了，小伙伴们快来体验吧！",
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

</body></html>