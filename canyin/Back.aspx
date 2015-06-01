<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Back.aspx.cs" Inherits="canyin_Back" %>


<%--<li class="dish_item">\
                    <span class="dishName">{name}</span>\
                    <i>{price}元/份</i>\
                    <span class="btn_common" onclick="slideOn(this, event);">添加备注</span>\
                    <div><textarea name="description" onblur="changeDescription(this, event, {dishes_id});" value="">{description}</textarea></div>\
                    <section class="bbox" dishname="{name}" onclick="changeCount(this, event, {dishes_id});">\
                        <input class="btn-reduce" type="button" value="-">\
                        <input class="numBox" name="numBox" type="text" value="{selected_count}" item_id="{item_id}" price="{price}" readonly="readonly" selected_count="{selected_count}">\
                        <input type="button" class="btn-plus" value="+">\
                    </section>\
                    </li>

switch(type){

case "Request["loadlist"]":

"<ul class='list_order'>" +
                                   "<li>" +
                                       "<label style='float:none;' onclick='this.classList.toggle(&#39;on&#39;);' class=''>订餐人：{订餐人}&nbsp;预约时间：{预约时间}</label>" +
                                       "<ol>" +
                                           "<p>就餐地址：" +
                                           "{就餐地址}</p>" +
                                                     "<p>付款方式：线下支付</p>" +
                                   "<table>" +
                                       "<thead>" +
                                           "<tr>" +
                                               "<td colspan='3' style='font-size:16px;'>我的菜单</td>" +
                                           "</tr>" +
                                           "<tr>" +
                                               "<td style='width:33%'>菜名</td>" +
                                               "<td style='width:33%'>单价</td>" +
                                               "<td>数量</td>" +
                                           "</tr>" +
                                       "</thead>" +
                                       "<tbody>";
                        var TPL2 = "<tr>"

                            
case "Request["loadlist"]":
                            
            foreach (WEC_CY_DISH dish in list)
            {
"<ul class='list_order'>" +
                                   "<li>" +
                                       "<label style='float:none;' onclick='this.classList.toggle(&#39;on&#39;);' class=''>订餐人：{订餐人}&nbsp;预约时间：{预约时间}</label>" +
                                       "<ol>" +
                                           "<p>就餐地址：" +
                                           "{就餐地址}</p>" +
                                                     "<p>付款方式：线下支付</p>" +
                                   "<table>" +
                                       "<thead>" +
                                           "<tr>" +
                                               "<td colspan='3' style='font-size:16px;'>我的菜单</td>" +
                                           "</tr>" +
                                           "<tr>" +
                                               "<td style='width:33%'>菜名</td>" +
                                               "<td style='width:33%'><%=dish %></td>" +
                                               "<td>数量</td>" +
                                           "</tr>" +
                                       "</thead>" +
                                       "<tbody>";
                        var TPL2 = "<tr>"

                            }
    }--%>
