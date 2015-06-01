<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SAP_CHART/SAPCHARTBLANK.master" CodeFile="ALVShow.aspx.cs" Inherits="SAP_CHART_ALVShow" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %> 
<%@ Import Namespace="AgileFrame.Common" %> 
<asp:Content runat="server" ContentPlaceHolderID="head">
       <script src="js/Production.js"></script>
    <script>
        $(function () {
            $("#startmonth").datetimepicker({
                "language": "zh-CN", "autoclose": 1, format: "yyyy-mm", startView: 3, minView: 3
            });
            $("#endmonth").datetimepicker({
                "language": "zh-CN", "autoclose": 1, format: "yyyy-mm", startView: 3, minView: 3
            });
        });
    </script>
  </asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="body">
    <div class="row">
        <form method="post" runat="server">
         <div style="width:800px;">
           <div class="pull-left ">
          <span ><label for="startmonth">开始月份</label></span>
          <input value="<%=startmonth %>" class="form-control" style="width:200px;display:inline;"  id="startmonth" name="startmonth"/>
           </div>
            <div class="pull-left marginLeftAdd2" >
          <span ><label for="endmonth">结束月份</label></span>
          <input value="<%=endmonth %>" class="form-control" style="width:200px;display:inline;"  id="endmonth" name="endmonth"/>
           </div>
            <div class="pull-left marginTop27 marginLeftAdd2" >
          <asp:Button runat="server" Text="查询" CssClass="btn btn-primary"/>
             </div>
             </div>
        </form>
    </div>
    <% if(IsPostBack){ %>
        <div class="row marginTopAdd2">
        <table class="table table-bordered table-striped mytable" style="border-top:1px solid #000;">
            <thead>
                <tr>
                    <th>名称</th>
                    <th>工厂</th>
                    <th>年</th>
                    <th>月</th>
                    <th>创建者</th>
                    <th>季度考核率</th>
                    <th>倍数</th>
                </tr>
            </thead>
            <tbody>
                <%foreach (ALVTEMP val1 in val1List)
                  {%>
                    <tr>
                       <td>生产订单物料耗用差异率 </td>
                        <% foreach(AttributeItem item in itemList){ %>
                            <td><%=val1[item] %></td>
                        <%} %>
                    </tr>
                <%} %>
                 <%foreach (ALVTEMP val2 in val2List)
                  {%>
                    <tr>
                       <td>盘盈盘亏/盘点初的库存总金额  </td>
                        <% foreach(AttributeItem item in itemList){ %>
                            <td><%=val2[item] %></td>
                        <%} %>
                    </tr>
                <%} %>
                 <%foreach (ALVTEMP val3 in val3List)
                  {%>
                    <tr>
                       <td>采购订单及时率  </td>
                        <% foreach(AttributeItem item in itemList){ %>
                            <td><%=val3[item] %></td>
                        <%} %>
                    </tr>
                <%} %>
                 <%foreach (ALVTEMP val4 in val4List)
                  {%>
                    <tr>
                       <td>采购订单及时率(按操作人员) </td>
                        <% foreach(AttributeItem item in itemList){ %>
                            <td><%=val4[item] %></td>
                        <%} %>
                    </tr>
                <%} %>
                 <%foreach (ALVTEMP val5 in val5List)
                  {%>
                    <tr>
                       <td>采购订单完成率 </td>
                        <% foreach(AttributeItem item in itemList){ %>
                            <td><%=val5[item] %></td>
                        <%} %>
                    </tr>
                <%} %>
                 <%foreach (ALVTEMP val6 in val6List)
                  {%>
                    <tr>
                       <td>采购订单完成率(按操作人员) </td>
                        <% foreach(AttributeItem item in itemList){ %>
                            <td><%=val6[item] %></td>
                        <%} %>
                    </tr>
                <%} %>
                 <%foreach (ALVTEMP val7 in val7List)
                  {%>
                    <tr>
                       <td>生产订单入库及时率 </td>
                        <% foreach(AttributeItem item in itemList){ %>
                            <td><%=val7[item] %></td>
                        <%} %>
                    </tr>
                <%} %>
            </tbody>
        </table> 
           </div>

        <%} %>
    </asp:Content>
