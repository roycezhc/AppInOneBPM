<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xuancai.aspx.cs" Inherits="canyin_xuancai" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Common"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<!DOCTYPE html>
<!-- saved from url=(0153)http://264116.m.weimob.com/sps/webfood/CompoDishesList?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6 -->
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_canyin.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/datepicker.css" media="all">
    <script type="text/javascript" async="" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wtj.js"></script>
    <script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/JQuery/jQuery.min.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wei_webapp_v2_common.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/bootstrap-datepicker.js"></script>
<title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
</head>
<body id="page_intelOrder" class="intelPage">
    	    <div class="center">
    	<header>
    		<span class="pCount">共2人用餐<a href="http://264116.m.weimob.com/sps/webfood/ComboNums?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&combo_nums=2&v=be51f9261ef491dff90271a4fb7ecfe7">重选人数</a></span>
            <label>
                <i>共计：</i>
                <b class="duiqi" id="priceCount">48.00元</b>
            </label>
    	</header>
    	<section id="dishList"><article><h2>特别难吃</h2>                                <dl dunitname="例" dsubcount="0" dname="" dtaste="" ddescribe="特别难吃" dprice="0" dishot="0" dpicture="http://img.weimob.com/static/7d/7f/b9/image/20140620/20140620133903_92885.png" dspecialprice="">                                    <dt><h3>水煮死鱼</h3></dt>                                    <dd>                                        <a href="javascript:void(0)" class="dataIn" onclick="showImgDetail(this);">                                            <img src="./CompoDishesList_files/20140620133903_92885.png" alt="" title="">                                        </a>                                    </dd>                                    <dd><em>30元/例</em> </dd>                                    <!--dd class="dpNum">0人点过</dd-->                                    <dd class="dpFen">×1</dd>                                </dl>                            </article><article><h2>水煮活鱼特价</h2>                                <dl dunitname="例" dsubcount="0" dname="" dtaste="" ddescribe="水煮活鱼特价" dprice="0" dishot="0" dpicture="http://img.weimob.com/static/7d/7f/b9/image/20140620/20140620104345_49732.png" dspecialprice="18">                                    <dt><h3>水煮活鱼</h3></dt>                                    <dd>                                        <a href="javascript:void(0)" class="dataIn" onclick="showImgDetail(this);">                                            <img src="./CompoDishesList_files/20140620104345_49732.png" alt="" title="">                                        </a>                                    </dd>                                    <dd><em>18.00元/例</em> </dd>                                    <!--dd class="dpNum">0人点过</dd-->                                    <dd class="dpFen">×1</dd>                                </dl>                            </article></section>
        <div id="footer_menu" class="footer footer_menu">
            <ul class="clear">
                <li><a href="zhinengxuancan.aspx" class="onactive"><span class="icons icons_1"></span><label>智能选餐</label></a></li>
                <li><a href="diancai.aspx"><span class="icons icons_2"></span><label>点菜</label></a></li>
                <li><a href="dingdan.aspx"><span class="icons icons_3"></span><label>我的订单</label></a></li>
                <li><a href="xihuan.aspx"><span class="icons icons_4"></span><label>我喜欢</label></a></li>
                <li><a href="javascript:void(0);" id="my_menu"><span class="icons icons_5"><label id="num" class="num">2</label></span></a></li>
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
    	<footer class="footFix" style="margin-bottom: 64px;">
    		<a id="addToMenu" class="btn_add" href="javascript:addToMenu();">加入菜单</a>
    		<a class="btn_change" href="javascript:;" onclick="switchList();">换一桌</a>
    	</footer>
    </div>
    <script type="text/javascript">
        window.selected = {
            total: 0,
            dishes: {}
        };

        window.addEventListener("DOMContentLoaded", function () {
            getRecommendList();
        }, false);
        $(function () {
            getDishCount();
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
        function getRecommendList() {
            var params = {
                author: "eric",
                desc: "getAllList"
            }
            MLoading.show('加载中');
            _doAjax('/sps/webfood/ComboDishesListByNums?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&combo_nums=2&v=be51f9261ef491dff90271a4fb7ecfe7', 'POST', params, function (res) {
                MLoading.hide();
                window.res = {
                    data: res,
                    randIndex: -1
                }
                switchList();
            });
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

        function switchList() {
            window.res.randIndex++;
            window.res.randIndex = window.res.randIndex % window.res.data.length;

            var TPL = '<article><h2>{note}</h2>\
                                <dl dunitname="例" dsubcount="0"  dname="" dtaste="" ddescribe="{note}" dprice="0" dishot="0" dpicture="{pic}" dspecialprice="{discount_price}" >\
                                    <dt><h3>{name}</h3></dt>\
                                    <dd>\
                                        <a href="javascript:void(0)" class="dataIn" onclick="showImgDetail(this);">\
                                            <img src="{pic}" alt="" title="">\
                                        </a>\
                                    </dd>\
                                    <dd><em>{price}元/例</em> </dd>\
                                    <!--dd class="dpNum">0人点过</dd-->\
                                    <dd class="dpFen">×{dishes_count}</dd>\
                                </dl>\
                            </article>';
            var dishList = document.getElementById("dishList");
            var price = 0;
            dishList.innerHTML = iTemplate.makeList(TPL, window.res.data[window.res.randIndex].dishes, function (k, v) {
                if (v.discount_price) {
                    v.price = ((v.discount_price) * (v.dishes_count)).toFixed(2);
                }
                price += parseFloat(v.price);
                /*return{
					price: v.discount_price||price
				}*/
            });
            document.getElementById("priceCount").innerHTML = (price).toFixed(2) + "元";
        }



        var isMenuFilled = '1';
        //  var view_const_dish_SPECIAL_PRICE_YES = '2';
        var view_const_dish_HOT_YES = '2';
        isMenuFilled = (isMenuFilled == '1');

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

        //后台可自行扩展参数
        //调用自定义弹层
        function popPic(imgUrl, title, price, isSpecial, specialPrice, people, teast, assess, isHot) {
            var _title = title,
                _price = price,
                _people = null;//people,
            _teast = teast,
            _assess = assess;

            var hotHtml = '';
            if (isHot == view_const_dish_HOT_YES) {
                hotHtml = '<b></b>';
            }
            _tmpHtml = "<div class='content'>" + hotHtml + "<img src='" + imgUrl + "' alt='' title=''><h2>" + _title;

            if (isSpecial != '') {
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



        function addToMenu() {
            var params = '[';
            for (var i = 0, ci; ci = window.res.data[window.res.randIndex].dishes[i]; i++) {
                params += '{"dishes_id": ' + ci.id + ', "nums":' + ci.dishes_count + ', "price":' + ci.price + '},';
            }
            params = params.replace(/,$/gi, "");
            params += ']';
            MLoading.show('加载中');

            $.ajax({
                'url': '/sps/webfood/AddOrder?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&combo_nums=2&v=be51f9261ef491dff90271a4fb7ecfe7',
                'data': { 'order': params },
                'type': 'POST',
                'success': function (data) {
                    MLoading.hide();
                    window.location.href = "/sps/webfood/MyMenuList?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&combo_nums=2&v=be51f9261ef491dff90271a4fb7ecfe7";
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
    

</body></html>