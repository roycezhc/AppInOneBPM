<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SAP_CHART/SAPCHARTBLANK.master" CodeFile="Stock.aspx.cs" Inherits="SAP_CHART_Stock" %>

<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %> 
<%@ Import Namespace="AgileFrame.Common" %> 
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>库存表</title>
       <script src="js/Production.js"></script>
    <script>
        $(function () {
            $("#month").datetimepicker({
                "language": "zh-CN", "autoclose": 1, format: "yyyy-mm", startView: 3, minView: 3
            });
        });
    </script>
  </asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="body">
    <div class="row">
        <form method="post" runat="server">
           <span ><label for="werk">工厂</label></span>
           <input value="<%=werk %>" class="form-control" style="width:120px;display:inline;" type="text" id="werk" name="werk"/>
          <span ><label for="month">月份</label></span>
          <input value="<%=month %>" class="form-control" style="width:200px;display:inline;"  id="month" name="month"/>
          <asp:Button runat="server" Text="查询" CssClass="btn btn-primary"/>
        </form>
    </div>
    <% if(IsPostBack){ %>
   
      <div class="row marginTopAdd2 col-lg-offset-4 ">
          <h4><%= "库存金额情况变动表"%></h4>
      </div>
       <div class="row marginTopAdd2 col-lg-12" style="overflow-x:auto;overflow-y:hidden;">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th class="firstTh"></th>
                    <% for(int i=1;i<=days;i++)
                       {%>
                        <th><%=monthStr+"/"+(i<10?"0"+i:""+i)%></th>
                    <%} %>
                </tr>
            </thead>
            <tbody>
                <%foreach (var zkw in zkwMap)
                  {%>
                    <tr>
                        <td><%=zkw.Key %></td>
                        <%for(int i=1;i<=days;i++) {%>
                        <td><%=stockMap.ContainsKey(month+"-"+(i<10?"0"+i:""+i)+zkw.Key)?stockMap[month+"-"+(i<10?"0"+i:""+i)+zkw.Key]:"0" %></td>
                        <%} %>
                    </tr>
                <%} %>
            </tbody>
        </table> 
           </div>

        <%} %>
    </asp:Content>