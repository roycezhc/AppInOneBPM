<%@ Page Language="C#" AutoEventWireup="true" CodeFile="diancai.aspx.cs" Inherits="yinshi_diancai" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Common"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<!DOCTYPE html>
<!-- saved from url=(0148)http://264116.m.weimob.com/sps/webfood/DishesList?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6 -->
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_canyin.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_dialog.css" media="all">
</script><script type="text/javascript" async="" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wtj.js"></script>
    <script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/JQuery/jQuery.min.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wei_webapp_v2_common.js"></script>
<title>门店名称</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
<body id="page_allMenu">
    
<div class="center">
    
    <nav id="navBar" style="height: 702px;">
        <% foreach(WEC_CY_TYPE type in typeList) {%>
            <dl>
                <% if(typeList.IndexOf(type)==0){ %>
                <dd  class="active" value="<%=type.ID %>" onclick="switchList(this,<%=type.ID %>);"><%=type.TITLE%></dd>
                <%}
                   else { 
                   %>
                    <dd   value="<%=type.ID %>" onclick="switchList(this,<%=type.ID %>);"><%=type.TITLE%></dd>
                <%
                   }
                %>

            </dl>
        <%} %>
    </nav>

    <section id="infoSection" style="height: 702px;">
        <article>
            <!--div class="h2">推荐菜</div-->
            <div style="display:none;" id="template">
               <dl dunitname="份" dsubcount="1" dishid="{ID}" dname="{TITLE}" dtaste="" ddescribe="{INFO}" dprice="{DISH_PRICE}" dishot="{DISH_TAG}" dspecialprice="{SPECIAL_PRICE}" disspecial="{ISSPECIAL}" onclick="selectOne(this, {ID}, {DISH_PRICE});" >
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
                 <input type="checkbox" {check} class="favourite" style="border:0;" value="{ID}" onclick="favourite(this, event);">                
                 <button shopinfo="" class="selectBtn choose {CHOOSE}"></button>
               </dl>
             </div>
             <div id="pInfo">

            </div>
        </article>
    </section>
<!--    <footer class="footFix">
	    <button class="btn_change" id="my_menu">我的菜单<span class="num">1</span></button>
	    <button onClick='location.href="/sps/webfood/ComboNums?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6"'>智能选餐</a></button>
    </footer>-->
        <div id="footer_menu" class="footer footer_menu">
            <ul class="clear">
                <li><a href="zhinengxuancan.aspx"><span class="icons icons_1"></span><label>智能选餐</label></a></li>
                <li><a href="javascript:;" class="onactive"><span class="icons icons_2"></span><label>点菜</label></a></li>
                <li><a href="dingdan.aspx"><span class="icons icons_3"></span><label>我的订单</label></a></li>
                <li><a href="xihuan.aspx"><span class="icons icons_4"></span><label>我喜欢</label></a></li>
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
            switchList($("#navBar dd").get(0), $("#navBar dd:first").attr("value"));
           
        });
        window.selected = {
            total: 0,
            dishes: {}
        };
        var cardid = '3414907165';
        var view_const_dish_SPECIAL_PRICE_YES = '2';
        var view_const_dish_HOT_YES = '2';
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
        function setHeight() {
            var cHeight;
            cHeight = document.documentElement.clientHeight;
            cHeight = (cHeight - 50) + "px"
            document.getElementById("navBar").style.height = cHeight;
            document.getElementById("infoSection").style.height = cHeight;
        }



        function getAllList() {
            var params = {
            }
            
            _doAjax('/sps/webfood/GetDishList?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6', 'POST', params, function (res) {
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
        function switchList(obj,id) {
            MLoading.show("正在加载..");
            $("#navBar dd").removeClass("active");
            $(obj).addClass("active");

            $.ajax({
                url: "Back.aspx",
                data: { type_id: id, type: "loadDishList" },
                dataType: "json",
                success: function (data) {
                    var html = "";
                    $.each(data, function (n, obj) {
                        var temp = $("#template").html();
                        $.each(obj, function (key, value) {
                            if (key == "CHECK") {
                                temp = temp.replace(/{check}/g, value);
                            }
                            temp = temp.replace(eval("/{" + key + "}/g"), value);
                            
                        });
                        html += temp;
                    });
                    $("#pInfo").html(html);
                    //显示右下角当前点菜的数量
                   // getDishCount();
                    MLoading.hide()
                },
                error: function (error) {
                    console.log(error);
                }

            });
        }
        //
        //function switchList(id) {
        //    var ai = {};
        //    if (id) {
        //        var dds = _qAll('#navBar dd');
        //        for (var i = 0; ci = window.res[i]; i++) {
        //            dds[i].className = null;
        //            if (id == ci.id) {
        //                ai = ci;
        //                dds[i].className = "active";
        //            }
        //        }
        //    } else {
        //        ai = window.res[0];
        //    }
        //    //            alert(id);return false;
        //    var checkHtml = '';
        //    var TPL = '<dl dunitname="例" dsubcount="1" dishid="{id}" dname="{name}" dtaste="" ddescribe="{note}" dprice="{price}" dishot="{tag_name}" dspecialprice="{discount_price}" disspecial="1" onclick="selectOne(this, {id}, {price});">\
        //            <dt><h3>{name}{html_name}</h3></dt>\
        //            <dd>\
        //                <a href="javascript:void(0)" class="dataIn" onclick="showImgDetail(this);event.stopPropagation();">\
        //                    <img src="{pic}" alt="" title="">';

        //    TPL += '<span style="font-size:10px;">{tag_name}</span>';


        //    TPL += '</a>\
        //            </dd>\
        //            <dd>\
        //                <em>{price}元/例</em>\
        //            </dd>\
        //            <!--dd class="dpNum">961人点过</dd-->\
        //            <input type="checkbox" class="favourite" style="border:0;" value="{id}" {check} onclick="favourite(this, event);">\
        //            <button shopinfo="" class="{curState}"></button>\
        //        </dl>';
        //    document.getElementById("pInfo").innerHTML = iTemplate.makeList(TPL, ai.dishes, function (k, v) {
        //        if (v.discount_price) {
        //            v.price = v.discount_price;
        //        }
        //        return {
        //            curState: (v.id in window.selected.dishes) ? "selectBtn choose choosen" : "selectBtn choose  unchoose",
        //            check: (v.check == '1') ? "checked" : ''
        //        }
        //    });
        //}
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
        function addToMenu() {
            //var params = '[';
            //for (var key in window.selected.dishes) {
            //    params += '{"dishes_id":' + key + ",",
            //    params += '"price":' + window.selected.dishes[key].price + ",",
            //    params += '"nums":' + window.selected.dishes[key].num + "},"
            //}
            //params = params.replace(/,$/, "");
            //params += ']';

            //$.ajax({
            //    'url': 'Back.aspx',
            //    'data': { 'order': params },
            //    'type': 'POST',
            //    'async': 'false',
            //    'success': function (db) {
            //        location.href = 'wodecandan.aspx';
            //    }
            //});
            location.href = 'wodecandan.aspx';
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

            if (isSpecial == 1) {
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
           // getAllList();
           // setHeight();
        }, false);
        window.onresize = function () { setHeight(); }
        function favourite(thi, evt) {
            evt.stopPropagation();
            var id = $(thi).val();
            var check = '';
            if ($(thi).is(':checked')) {
                type = 'addLikeDish';
            } else {
                type = 'delLikeDish';
            }
           // if(){}
            $.ajax({
                url: 'Back.aspx',
                data: { 'id': id, 'type':type },
                type: 'POST',
                dataType: 'json',
                cache: false,
                beforeSend: function () {
                  
                },
                success: function (data) {
                    
                }
            });
        }
    </script>

<script>
    $(document).ready(function () {
        $('#my_menu').click(function () {
            addToMenu();

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
	            "timeLineLink": "http://264116.m.weimob.com/sps/webfood/DishesList?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
	            "sendFriendLink": "http://264116.m.weimob.com/sps/webfood/DishesList?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
	            "weiboLink": "http://264116.m.weimob.com/sps/webfood/DishesList?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
	            "tTitle": "门店名称 18768103254 浙江省温州市",
	            "tContent": "门店名称",
	            "fTitle": "门店名称 18768103254 浙江省温州市",
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
        "timeLineLink": "http://264116.m.weimob.com/sps/webfood/DishesList?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
        "sendFriendLink": "http://264116.m.weimob.com/sps/webfood/DishesList?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
        "weiboLink": "http://264116.m.weimob.com/sps/webfood/DishesList?aid=264116&outletid=21863&wechatid=fromUsername&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6&v=1923b72867affdb8ef7a8e628d3f703a",
        "tTitle": "门店名称 18768103254 浙江省温州市",
        "tContent": "门店名称",
        "fTitle": "门店名称 18768103254 浙江省温州市",
        "fContent": "门店名称",
        "wContent": "门店名称"
    };
</script>
</body></html>