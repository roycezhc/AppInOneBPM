<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dingdan.aspx.cs" Inherits="yinshi_dingdan" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Common"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<!DOCTYPE html>
<!-- saved from url=(0145)http://264116.m.weimob.com/sps/webfood/myorder?aid=264116&outletid=21863&wechatid=oWKVbt705q6MyupsTckpZcVKklZ4&v=eaf7c21d7837fbaeb2ed17b2ae9f04e6 -->
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_dialog.css" media="all">
<link rel="stylesheet" type="text/css" href="<%=WebHelper.GetAppPath()%>Themes/WEC/canyin/wei_canyin.css" media="all">
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/JQuery/jQuery.min.js"></script>
<script type="text/javascript" src="<%=WebHelper.GetAppPath()%>Lib/canyin/wei_webapp_v2_common.js"></script>
<title>我的订单</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <link href="/WECAdmin/WebSite/Model/wec/bootstrap_min.css" rel="stylesheet" type="text/css"/>
    <link href="/WECAdmin/WebSite/Model/wec/bootstrap_responsive_min.css" rel="stylesheet" type="text/css"/>
     <script src="/Lib/Bootstrap/bootstrap-paginator.js" type="text/javascript"></script>
</head>
<body id="page_intelOrder" class="myOrderCon">
    <script>
        $(document).ready(function () {
            var min_height = $(document).height() - 79;
            $("#container").css({ "min-height": min_height });
        });
</script>
<div class="container">
    <header id="container" style="min-height: 673px;">
        <div>
            <select class="select_orderType" onchange="orderList(this.value);">
                <option value="0">未付款，未就餐</option>
                <option value="1">已付款，未就餐</option>
                <option value="2">已付款，已就餐</option>
            </select>
        </div>
        <div style="display:none" id="template">
            <ul class='list_order'>
                 <li>
                    
                    <label style='float:none;' onclick='this.classList.toggle(&#39;on&#39;);' class=''>订餐人：{GUESTNAME}&nbsp;预约时间：{EATING_TIME}</label>
                        <ol>
                        <p>就餐地址：
                            {ADDRESS}</p>
                            <p>付款方式：线下支付</p>
                        <table>
                            <thead>
                                <tr>
                                    <td colspan='3' style='font-size:16px;'>我的菜单</td>
                                </tr>
                                 <tr>
                                    <td style='width:33%'>菜名</td>
                                    <td style='width:33%'>单价</td>
                                    <td>数量</td>
                                 </tr>
                                </thead>
                          <tbody  id="body">
                          </tbody>
                           <tfoot>
                              <tr>
                                 <td colspan='3' style='text-align:right;'>
                                     <label>总金额：<span class='red h5'>{ALLPRICE}元</span></label>
                                  </td>
                              </tr>
                           </tfoot>
                        </table>
                          </ol>
                        </li>
                      </ul>;
         </div>
           
           
        <div style="padding:10px 0;" id="list">
                       
          </div>
        <div class="container">
            <button style="width: inherit;
margin: auto;
font-size: 12px;
color: #b1b2b3;
margin-top: -10px;
line-height: 30px;
height: 50px;
border-left-color:#e9e9eb" class="btn btn-info" onclick="javascript:getMoreInfo();">获取更多订单信息</button>
        </div>
    </header>

        <script>
            var footer = document.getElementById("footer_menu");
            var evtObj = {
                handleEvent: function (evt) {
                    if ("A" == evt.target.tagName) {
                        evt.target.classList.toggle("on");
                    }
                }
            }
            //            footer.addEventListener("touchstart", evtObj, false);
            //            footer.addEventListener("touchend", evtObj, false);

        </script>
</div>
<div id="footer_menu" class="footer footer_menu">
    <ul class="clear" style="position: inherit;">
        <li><a href="zhinengxuancan.aspx"><span class="icons icons_1"></span><label>智能选餐</label></a></li>
        <li><a href="diancai.aspx"><span class="icons icons_2"></span><label>点菜</label></a></li>
        <li><a class="onactive" href="javascript:void(0);"><span class="icons icons_3"></span><label>我的订单</label></a></li>
        <li><a href="xihuan.aspx"><span class="icons icons_4"></span><label>我喜欢</label></a></li>
        <li><a href="javascript:void(0);" id="my_menu"><span class="icons icons_5"><label id="num" class="num"><%=num %></label></span></a></li>
    </ul>
</div>
<script>
    window.selected = {
        total: 0,
        val: 0,
        index:1
    };
    $(function () {
        selected.index = 1;
        orderList(0);
        //getDishCount();
       // setPage(selected.total);
    });
    function getMoreInfo() {
        selected.index = selected.index+1;
        orderList($(".select_orderType").val());
    }
        function changeList(val) {
            orderList(val);

            setPage(selected.total);
        }
        function setPage(totalPages) {
            var options = {
                currentPage: 1,
                totalPages: totalPages,
                size: "normal",
                alignment: "center",
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first":
                            return "第一页";
                        case "prev":
                            return "<";
                        case "next":
                            return ">";
                        case "last":
                            return "最后页";
                        case "page":
                            return page;
                    }
                },
                onPageClicked: function (e, originalEvent, type, page) {
                    alert("type:" + type + ",Page:" + page);

                    orderList($(".select_orderType").val(), page, 10);
                }
            }

            $('#page').bootstrapPaginator(options);
        }
        //function getDishCount() {
        //    $.ajax({
        //        url: "Back.aspx",
        //        data: { getdishcount: "true"},
        //        dataType: "json",
        //        beforeSend: function () {
        //            MLoading.show('加载中');
        //        },
        //        success: function (data) {
        //            $("#num").html(data["num"]);
        //            orderList(0);
        //        }
        //    });
        //}
        function orderList(val) {
            //var val = $(thi).val();
            if (val != selected.val) {
                selected.index = 0;
                $("#list").html("");
            }
            $.ajax({
                url: 'Back.aspx',
                data: { 'val': val, type: "getOrderList", index: selected.index },
                type: 'POST',
                dataType: 'json',
                cache: false,
                beforeSend: function () {
                    MLoading.show('加载中');
                },
                success: function (data) {
                    if (data.length == 0) {
                        MLoading.hide();
                        if ($("#list").html() == "") {
                            $("#list").html("暂无订单");
                        }
                        return;
                    };
                    var html1 = $("#list").html();
                    $.each(data, function (n1, obj) {    
                        var html2=""
                        $.each(obj.ITEMS, function (n2, obj1) {
                            var temp = "<tr><td>{TITLE}</td><td>{PRICE}</td><td>{NUM}</td></tr>";
                            $.each(obj1, function (key, value) {
                                temp = temp.replace(eval("/{" + key + "}/g"), value);
                            });
                            html2 += temp;
                        });
                        if (n1 == 0) {
                            selected.total = parseInt(obj.COUNT);
                        }
                        $("#body").html(html2);
                        var temp = $("#template").html();
                        $.each(obj, function (key, value) {
                            temp = temp.replace(eval("/{" + key + "}/g"), value);
                        });
                        html1 += temp;
                    });          
                    $("#list").html(html1);
                    selected.val = val;
                    MLoading.hide();
                },
                error: function (error, exp) {
                    console.log(error);
                    console.log(exp);
                }
            });
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
    $(document).ready(function () {
        $(".confirm_order").click(function () {
            var url = $(this).attr("url");
            var pay_type = $(this).attr("pc_type");
            var pay = $(this).attr("val");
            var o_id = $(this).attr("o_id");
            $.ajax({
                'url': url,
                'type': 'POST',
                'data': { "o_id": o_id, "pay_type": pay_type },
                beforeSend: function () {
                    MLoading.show('加载中');
                },
                'success': function (data) {
                    if (pay == 'alipay') {
                        window.location.href = data;
                    } else {
                        alert("订单支付成功");
                    }
                    $('#confirm_order').hide();
                }
            });

        });
    });

</script>


</body></html>