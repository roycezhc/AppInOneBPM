<%@ Page Language="C#" AutoEventWireup="true"MasterPageFile="~/SAP_CHART/SAPCHARTBLANK.master" CodeFile="Purchase.aspx.cs" Inherits="SAP_CHART_Purchase" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %> 
<%@ Import Namespace="AgileFrame.Common" %> 
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>采购表</title>
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
          <input value="<%=month %>" class="form-control" style="width:200px;display:inline;" id="month" name="month"/>
          <asp:Button runat="server" Text="查询" CssClass="btn btn-primary"/>
        </form>
    </div>
    <% if(IsPostBack){ %>
    <% foreach(List<ITableImplement> valList in valLists ){ 
           int index=valLists.IndexOf(valList);
           %>
      <div class="row marginTopAdd2 col-lg-offset-4 ">
          <h4><%= tabnames[index]%></h4>
      </div>
      <div class="row marginTopAdd2 col-lg-12" style="overflow-x:auto;overflow-y:hidden;">
        <table class="table table-bordered table-striped mytable">
            <thead>
                <tr>
                  <th class="firstTh"></th>
                    <% foreach (ITableImplement val in valList)
                       {%>
                        <th><%=Convert.ToString(val["ZDATE"]).Substring(5,2)+"/"+Convert.ToString(val["ZDATE"]).Substring(8,2)%></th>
                    <%} %>
                </tr>
            </thead>
            <tbody>
                <%foreach (AttributeItem item in itemLists[valLists.IndexOf(valList)])
                  {%>
                    <tr>
                        <%if(item.FieldName.Equals("ZDATE")){continue;} %>
                        <td><%=item.ZhName %></td>
                        <% foreach (ITableImplement val in valList)
                           { %>
                           <td><% try {  Response.Write(Convert.ToInt32(val[item])); }
                                   catch (Exception e) { Response.Write(val[item]); }%></td>
                        <%} %>
                    </tr>
                <%} %>
            </tbody>
        </table> 
           </div>
        <div style="clear:both;"></div>
            <%--<div class="row marginTopAdd2">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th></th>
                    <% foreach (ZTTPP_POMOVE_SUM_MN val2 in val2List)
                       {%>
                        <th><%=val2.ZDATE.Substring(5,2)+"/"+val2.ZDATE.Substring(8,2)%></th>
                    <%} %>
                </tr>
            </thead>
            <tbody>
                <%foreach (AttributeItem item2 in item2List)
                  {%>
                    <tr>
                        <%if(item2.FieldName.Equals("ZDATE")){continue;} %>
                        <td><%=item2.ZhName %></td>
                        <% foreach (ZTTPP_POMOVE_SUM_MN val2 in val2List)
                           { %>
                            <td><% try {  Response.Write(Convert.ToInt32(val2[item2])); }
                                   catch (Exception e) { Response.Write(val2[item2]); }%></td>
                        <%} %>
                    </tr>
                <%} %>
            </tbody>
        </table> 
       </div>

    <div class="row marginTopAdd2">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th></th>
                    <% foreach (ZTTPP_POMOVE_LAG val3 in val3List)
                       {%>
                        <th><%=val3.ZDATE.Substring(5,2)+"/"+val3.ZDATE.Substring(8,2)%></th>
                    <%} %>
                </tr>
            </thead>
            <tbody>
                <%foreach (AttributeItem item3 in item3List)
                  {%>
                    <tr>
                        <%if(item3.FieldName.Equals("ZDATE")){continue;} %>
                        <td><%=item3.ZhName %></td>
                        <% foreach (ZTTPP_POMOVE_LAG val3 in val3List)
                           { %>
                            <td><% try {  Response.Write(Convert.ToInt32(val3[item3])); }
                                   catch (Exception e) { Response.Write(val3[item3]); }%></td>
                        <%} %>
                    </tr>
                <%} %>
            </tbody>
        </table> 
       </div>

    <div class="row marginTopAdd2">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th></th>
                    <% foreach (ZTTPP_POMOVE_LAGER val4 in val4List)
                       {%>
                        <th><%=val4.ZDATE.Substring(5,2)+"/"+val4.ZDATE.Substring(8,2)%></th>
                    <%} %>
                </tr>
            </thead>
            <tbody>
                <%foreach (AttributeItem item4 in item4List)
                  {%>
                    <tr>
                        <%if(item4.FieldName.Equals("ZDATE")){continue;} %>
                        <td><%=item4.ZhName %></td>
                        <% foreach (ZTTPP_POMOVE_LAGER val4 in val4List)
                           { %>
                          <td><% try {  Response.Write(Convert.ToInt32(val4[item4])); }
                                   catch (Exception e) { Response.Write(val4[item4]); }%></td>
                        <%} %>
                    </tr>
                <%}%>
            </tbody>
        </table> 
       </div>--%>
    <%}%>

     <div class="row marginTopAdd2 col-lg-offset-4 ">
          <h4><%=tabnames[3] %></h4>
      </div>
      <div class="row marginTopAdd2 col-lg-12" style="overflow-x:auto;overflow-y:hidden;">
        <table class="table table-bordered table-striped mytable">
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
                <%foreach (var zddry in zddryMap)
                  {%>
                    <tr>
                        <td><%=zddry.Key %></td>
                        <%for(int i=1;i<=days;i++) {%>
                        <td><%=purchaseMap.ContainsKey(month+"-"+(i<10?"0"+i:""+i)+zddry.Key)?purchaseMap[month+"-"+(i<10?"0"+i:""+i)+zddry.Key]:"0" %></td>
                        <%} %>
                    </tr>
                <%} %>
            </tbody>
        </table> 
           </div>
      <%
      } %>
   </asp:Content>