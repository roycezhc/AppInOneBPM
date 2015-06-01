<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wodecandan.aspx.cs" Inherits="canyin_wodecandan" %>
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
    <script type="text/javascript" async="" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wtj.js"></script>
    <script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/JQuery/jQuery.min.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wei_webapp_v2_common.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/bootstrap-datepicker_canyin.js"></script>
<title>我的菜单</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
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
    <span class="pCount" style="">已点<l style="color:red" id="countnums" nums=""></l>个菜</span>
    <label><i>共计：</i><b class="duiqi" id="total"></b><b class="duiqi">元</b></label>
</header>

<section style="margin-bottom:10px;">
    <article>
        <h2>我的菜单
            <button class="btn_add emptyIt" id="clearBtn" onclick="clearAll();">清空</button>
            <button class="btn_add" onclick="location.href='diancai.aspx'">+加菜</button>
        </h2>
        <div style="display:none;" id="template">
            <li class="dish_item">
                <!-- val1.TITLE = "";
            val1.REMARK = "";
            val1.NUM = 1;
            val1.ID = 1;
            val1.DISH_PRICE = 1;-->
                    <span class="dishName">{TITLE}</span>
                    <i>{DISH_PRICE}元/份</i>
                    <span class="btn_common" onclick="slideOn(this, event);">添加备注</span>
                    <div><textarea name="description" onblur="changeDescription(this, event, {ID});" value="">{REMARK}</textarea></div>
                    <section class="bbox" dishname="{TITLE}" onclick="changeCount(this, event, {ID});">
                        <input class="btn-reduce" type="button" value="-">
                        <input class="numBox" name="numBox" type="text" value="{NUM}" item_id="{ITEM_ID}" price="{DISH_PRICE}" readonly="readonly" selected_count="{NUM}">
                        <input type="button" class="btn-plus" value="+">
                    </section>
             </li>
        </div>
        <div style="display:none;" id="template2">
          
        </div>
        <ul id="myorder" class="myorder">            
                
        </ul>
    </article>
</section>
<section style="margin-bottom:40px;">
    <article>
        <form id="form_dish" action="Back.aspx" method="post" target="hide">
            <input type="hidden" value="orderSubmit" name="type"/>
            <table class="table_book">
                <tbody><tr>
                    <td width="80px" style="width:80px;">手机号码：</td>
                    <td colspan="2"><input type="tel" id="tel" name="tel" value="18768103254" maxlength="11" placeholder="(必填*)请输入您的手机号码" style="width:200px;"></td>
                </tr>
                <tr>
                    <td style="width:80px;">用户姓名：</td>
                    <td style="width:50%;">
                        <input type="text" name="guest_name" id="guest_name" value="ads" placeholder="(必填*)请输入您的真是姓名" maxlength="10" style="width:100px;">
                    </td>
                    <td>
                        <div class="group_checkbox" style="width:70px;display:inline;">
                            <input type="checkbox" value="1" name="sex" checked="checked">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width:80px;">就餐时间：</td>
                    <td colspan="2">
                        <input id="dpd1" type="text" name="time_day" readonly="readonly" style="width:80px;">
                        <select name="time_hour">
                                                            <option value="01">01时</option>
                                                            <option value="02">02时</option>
                                                            <option value="03">03时</option>
                                                            <option value="04">04时</option>
                                                            <option value="05">05时</option>
                                                            <option value="06">06时</option>
                                                            <option value="07">07时</option>
                                                            <option value="08">08时</option>
                                                            <option value="09">09时</option>
                                                            <option value="10">10时</option>
                                                            <option value="11">11时</option>
                                                            <option value="12">12时</option>
                                                            <option value="13">13时</option>
                                                            <option value="14">14时</option>
                                                            <option value="15">15时</option>
                                                            <option value="16">16时</option>
                                                            <option value="17">17时</option>
                                                            <option value="18">18时</option>
                                                            <option value="19">19时</option>
                                                            <option value="20">20时</option>
                                                            <option value="21">21时</option>
                                                            <option value="22">22时</option>
                                                            <option value="23">23时</option>
                                                            <option value="24">24时</option>
                                                    </select>
                        <select name="time_second">
                                                            <option value="00">00分</option>
                                                            <option value="10">10分</option>
                                                            <option value="20">20分</option>
                                                            <option value="30">30分</option>
                                                            <option value="40">40分</option>
                                                            <option value="50">50分</option>
                                                            <option value="60">60分</option>
                                                    </select>
                    </td>
                    <!--
                    <td colspan="2">
                        <input type="text" name="start_time" value="1403197200" style="width:200px;" />
                        就餐时长：
                        <select name="time_length">
                                                            <option value="1" >1小时</option>
                                                            <option value="2" >2小时</option>
                                                            <option value="3" >3小时</option>
                                                            <option value="4" >4小时</option>
                                                            <option value="5" >5小时</option>
                        </select>
                    </td>
                    -->
                </tr>
                

                <tr>
                    <td style="width:80px;">预定人数：</td>
                    <td colspan="2">
                        <input type="number" name="nums" id="nums" value="1" min="1" maxlength="3" style="width:100px;">
                    </td>
                </tr>
                                <tr>
                    <td style="width:80px;">就餐形式：</td>
                    <td colspan="2">
                        <div class="group_radio">
                            
                            <%
                                if(list.Count==0){
                                %>
                            <div>暂时没有位置</div>
                            <%
                                }
                                foreach (Dictionary<string,string> d in list){ %>
                              <span>
                                <input type='radio' name='seat_type' <%=list.IndexOf(d)==0?"checked":"" %> value='<%=d["value"]%>'>
                                <label><%=d["title"] %></label>
                              </span>
                            <%} %>
                        </div>
                    </td>
                </tr>
                                <tr>
                    <td style="width:80px;vertical-align:top;line-height:25px;">备注说明：</td>
                    <td colspan="2">
                        <textarea name="remark" style="height:60px;" maxlength="100"></textarea>
                    </td>
                </tr>
            </tbody></table>
            <footer>
                <input type="button" value="立即预定" class="btn_2" id="submit_form">
                
            </footer>
            
        </form>
        
    </article>
    
</section>


<div id="footer_menu" class="footer footer_menu">
            <ul class="clear" style="position: inherit;">
                <li><a href="zhinengxuancan.aspx"><span class="icons icons_1"></span><label>智能选餐</label></a></li>
                <li><a href="diancai.aspx" class="onactive"><span class="icons icons_2"></span><label>点菜</label></a></li>
                <li><a href="dingdan.aspx"><span class="icons icons_3"></span><label>我的订单</label></a></li>
                <li><a href="xihuan.aspx"><span class="icons icons_4"></span><label>我喜欢</label></a></li>
                <li><a href="javascript:void(0);" id="my_menu"><span class="icons icons_5"><label id="num" class="num"></label></span></a></li>
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
<script>var pageName = 'menuFilled';</script>
<script>
    window.addEventListener("DOMContentLoaded", function () {
        getAllMenu();
        
        var now = new Date();
        var nowArr = [now.getFullYear(), now.getMonth() + 1, now.getDate()];
        $("#dpd1").each(function (k, v) {
            var ndate = $(v).datepicker({
                format: "yyyy/mm/dd",
                onRender: function (date) {
                    var t1 = new Date(date.valueOf());
                    var t2 = new Date(now.valueOf());
                    t1 = t1.getFullYear() + "/" + (t1.getMonth() + 1) + "/" + t1.getDate();
                    t2 = t2.getFullYear() + "/" + (t2.getMonth() + 1) + "/" + t2.getDate();
                    return (t1 != t2 && (date.valueOf() < now.valueOf())) ? 'disabled' : '';
                }
            }).on("changeDate", function (date) {
                if ('days' == date.viewMode) {
                    ndate.datepicker('hide');
                }
            });
            v.value = nowArr.join("/");
        });
        //
    }, false);
    window.addEventListener("DOMContentLoaded", function () {
        getAllMenu();
    }, false);
    //
    function getDishCount() {
        $.ajax({
            url: "Back.aspx",
            data: { type: "getDishCount" },
            dataType: "json",
            success: function (data) {
                $("#num").html(data["num"]);
                $("#countnums").html(data["num"]);
                $("#countnums").attr("nums", data["num"]);
                $("#total").html(data["total"]);
            }
        });
    }
    function getAllMenu() {
        MLoading.show('加载中');
        $.ajax({
            url: "Back.aspx",
            data: { type: "getAllMenu" },
            dataType:"json",
            success: function (data) {
                //alert(data);
                var TPL = $("#template").html();
                var html = "";
                $.each(data, function (n, obj) {
                    var temp = TPL;//标签,标签值
                    $.each(obj, function (key, value) {
                        temp = temp.replace(eval("/{" + key + "}/g"), value);
                    });
                    html += temp;
                });
                $("#myorder").html(html);
                getDishCount();
                MLoading.hide();
            },
            error: function (data,error) {
               // console.log(data);
                //console.log(error);
            }
        });
    }

    //function getAllMenu() {
    //    MLoading.show('加载中');
    //    var params = {}
    //    _doAjax('/sps/webfood/GetGuestOrderList?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6', 'POST', params, function (res) {
    //        MLoading.hide();
    //        window.res = {
    //            data: res
    //        }
    //        switchMenu();
    //    });
    //}
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
    function switchMenu() {
        var TPL = '<li class="dish_item">\
                    <span class="dishName">{name}</span>\
                    <i>{price}元/份</i>\
                    <span class="btn_common" onclick="slideOn(this, event);">添加备注</span>\
                    <div><textarea name="description" onblur="changeDescription(this, event, {dishes_id});">{description}</textarea></div>\
                    <section class="bbox" dishname="{name}" onclick="changeCount(this, event, {dishes_id});">\
                        <input class="btn-reduce" type="button" value="-">\
                        <input class="numBox" name="numBox" type="text" value="{dishes_id}" price="{price}" readonly="readonly" selected_count="{selected_count}">\
                        <input type="button" class="btn-plus" value="+">\
                    </section>\
                    </li>';
        var myorder = document.getElementById("myorder");
        var totalPrice = 0;
        myorder.innerHTML = iTemplate.makeList(TPL, window.res.data, function (k, v) {
            if (v.discount_price) {

                v.price = v.discount_price;
            }
            totalPrice += parseFloat(v.price) * parseInt(v.selected_count);
            return {
                description: v.description || ""
            }
        });
        document.getElementById("total").innerHTML = (totalPrice).toFixed(2);
    }



    function changeCount(thi, evt, dishes_id) {
        if ("button" == evt.target.type) {
            var counter = thi.querySelectorAll("input[name='numBox']")[0];

            var val = parseInt(counter.value);

            var countnums = parseInt($("#countnums").attr("nums"));
            if ("btn-reduce" == evt.target.className) {
                val--;
            } else {
                val++;
            }
            counter.value = Math.max(0, val);
            if (val >= 0) {
                if ("btn-reduce" == evt.target.className) {
                    var num = countnums - 1;
                } else {
                    var num = countnums + 1;
                }
                document.getElementById("countnums").innerHTML = num;
                $("#countnums").attr("nums", num);
            }
            var totalPrice = 0;

            
            $(thi).find(".numBox").attr("selected_count", counter.value);
            $(thi).find(".numBox").attr("value", counter.value);
            $.each($(".numBox"), function (n, value) {
                if (n == 0) {
                    return;
                }
                totalPrice += parseFloat($(value).attr("price")) * parseInt($(value).attr("value"))
            });
            document.getElementById("total").innerHTML = totalPrice.toFixed(2);

        }
    }



    function changeDescription(thi, evt, dishes_id) {
        for (var i = 0, ci; ci = window.res.data[i]; i++) {
            if (dishes_id == ci.dishes_id) {
                ci.description = thi.value;
                break;
            }
        }
    }
    //
    function clearAll() {
        MDialog.confirm(
                '', '是否清空菜单？', null,
                '确定', function () {
                    $.ajax({
                        'url': 'Back.aspx',
                        'type': "post",
                        'data': { type: "clearAll" },
                        'success': function (data) {
                            $('#myorder').empty();
                            $('#total').text('0.00');
                            $("#countnums").text("0");
                            $("#num").text("0");
                        }
                    });

                }, null,
                '取消', null, null,
                null, true, true
                );
    }
    //

    function slideOn(thi, evt) {
        var li = $(thi).closest("li");
        li["toggleClass"]("on");
    }

    function updateItems(orderid) {
        var descs = $("#myorder div textarea");
        var desc = "";
        $.each(descs, function (n, value) {
            if (n == 0) {
                desc += value.value;
            } else {
                desc +=","+ value.value;
            }
        });
        var ids = $("#myorder section input.numBox");
        var id = "";
        $.each(ids, function (n, value) {
            if (n == 0) {
                id += $(value).attr("item_id");
            } else {
                id += "," + $(value).attr("item_id");
            }
        });
        var counts = $("#myorder section input.numBox");
        var count = "";
        $.each(counts, function (n, value) {
            if (n == 0) {
                count += $(value).attr("selected_count");
            } else {
                count += "," + $(value).attr("selected_count");
            }
        });
        //var html = "";
       
        //html += "{\"id\":\"" + id + "\",\"count\":\"" + count + "\",\"desc\":\"" + desc + "\",\"orderid\":\"" + orderid + "\"}";
        
        $.ajax({
            url: "Back.aspx",
            type: "post",
            data: {id:id ,count:count,desc:desc ,orderid:orderid,type:"updateItem"},
            success:function(){}
        });
    }

</script>

<script type="text/javascript">
    $(function () {

        $('#submit_form').click(function () {

            if ($(".group_radio").html() == "暂时没有位置") {
                alert("暂时没有位置，不好意思啊，亲！");
                return false;
            }

            if (null == $('#tel').val().match(/^1\d{10,13}$/g)) {
                alert("请输入正确的手机号"); return false;
                MDialog.alert(null, "请输入正确的手机号", null, "确定");
                return false;
            }

            if ($("#guest_name").val() == '') {
                alert("请输入用户姓名"); return false;
                //                MDialog.alert(null, "请输入用户姓名", null, "确定");
                //                return false;
            }

            if (null == $('#nums').val().match(/^[0-9]*[1-9][0-9]*$/)) {
                alert("请输入正确的预定人数"); return false;
                MDialog.alert(null, "请输入正确的预定人数", null, "确定");
                return false;
            }

          
            //var price = 0;
            //for (var i = 0, ci; ci = window.res.data[i]; i++) {
            //    price += parseFloat(ci.price);
            //}
            //if (price <= 0) {
            //    alert("订单价格有误，请重新下单"); return false;
            //}
            //editOrder();
            $.ajax({
                'url': $('#form_dish').attr('action'),
                'data': $('#form_dish').serialize(),
                'type': 'post',
                dataType: 'JSON',
                'success': function (data) {
                    if (data.success == 1) {
                        updateItems(data.orderid);
                        window.location = "dingdan.aspx";
                        //return false;
                    } else {
                        alert("预定失败，请重试...");
                        return false;
                    }

                }
            });
        });
    });
    function editOrder() {
        var params = '[';
        for (var i = 0, ci; ci = window.res.data[i]; i++) {
            params += '{"dishes_id":' + ci.dishes_id + ','
            params += '"price":' + ci.price + ','
            params += '"description":"' + (ci.description || '') + '",'
            params += '"nums":' + ci.selected_count + '},'
        }
        params = params.replace(/,$/, "");
        params += ']';
        $.ajax({
            'url': '/sps/webfood/EditOrder?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6',
            'data': { 'order': params },
            'type': 'POST',
            'async': false,
            'success': function (db) {

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
<iframe name="hide" style="display:none;"></iframe>
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


<div class="datepicker dropdown-menu"><div class="datepicker-days" style="display: block;"><table class=" table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">June 2014</th><th class="next">›</th></tr><tr><th class="dow">Su</th><th class="dow">Mo</th><th class="dow">Tu</th><th class="dow">We</th><th class="dow">Th</th><th class="dow">Fr</th><th class="dow">Sa</th></tr></thead><tbody><tr><td class="day disabled old">25</td><td class="day disabled old">26</td><td class="day disabled old">27</td><td class="day disabled old">28</td><td class="day disabled old">29</td><td class="day disabled old">30</td><td class="day disabled old">31</td></tr><tr><td class="day disabled">1</td><td class="day disabled">2</td><td class="day disabled">3</td><td class="day disabled">4</td><td class="day disabled">5</td><td class="day disabled">6</td><td class="day disabled">7</td></tr><tr><td class="day disabled">8</td><td class="day disabled">9</td><td class="day disabled">10</td><td class="day disabled">11</td><td class="day disabled">12</td><td class="day disabled">13</td><td class="day disabled">14</td></tr><tr><td class="day disabled">15</td><td class="day disabled">16</td><td class="day disabled">17</td><td class="day disabled">18</td><td class="day disabled">19</td><td class="day  active">20</td><td class="day ">21</td></tr><tr><td class="day ">22</td><td class="day ">23</td><td class="day ">24</td><td class="day ">25</td><td class="day ">26</td><td class="day ">27</td><td class="day ">28</td></tr><tr><td class="day ">29</td><td class="day ">30</td><td class="day  new">1</td><td class="day  new">2</td><td class="day  new">3</td><td class="day  new">4</td><td class="day  new">5</td></tr></tbody></table></div><div class="datepicker-months" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2014</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="month">Jan</span><span class="month">Feb</span><span class="month">Mar</span><span class="month">Apr</span><span class="month">May</span><span class="month active">Jun</span><span class="month">Jul</span><span class="month">Aug</span><span class="month">Sep</span><span class="month">Oct</span><span class="month">Nov</span><span class="month">Dec</span></td></tr></tbody></table></div><div class="datepicker-years" style="display: none;"><table class="table-condensed"><thead><tr><th class="prev">‹</th><th colspan="5" class="switch">2010-2019</th><th class="next">›</th></tr></thead><tbody><tr><td colspan="7"><span class="year old">2009</span><span class="year">2010</span><span class="year">2011</span><span class="year">2012</span><span class="year">2013</span><span class="year active">2014</span><span class="year">2015</span><span class="year">2016</span><span class="year">2017</span><span class="year">2018</span><span class="year">2019</span><span class="year old">2020</span></td></tr></tbody></table></div></div></body></html>
