<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SAP_CHART/SAPCHARTBLANK.master" CodeFile="Production.aspx.cs" Inherits="SAP_CHART_Production" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %> 
<%@ Import Namespace="AgileFrame.Common" %> 
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>生产表</title>
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
        <!-- Nav tabs -->
        <ul class="nav nav-tabs marginTopAdd2" role="tablist">
            <%for(int i=0;i<valLists.Count;i++){ %>
             <li role="presentation" class="<%=i==0?"active":"" %>"><a href="#tab<%=i%>" role="tab" data-toggle="tab"><%=panelnames[i] %></a></li>
            <%} %>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
        <%foreach(List<ITableImplement> valList in valLists){
              int index=valLists.IndexOf(valList);
           %>
      <div role="tabpanel" class="tab-pane <%=index==0?"active":"" %>" id="tab<%=index %>">
      <div class="row marginTopAdd2 col-lg-offset-4 ">
          <h4><%= tabnames[index]%></h4>
      </div>
        <div class="row marginTopAdd2 col-lg-12" style="overflow-x:auto;overflow-y:hidden;">
        <table class="table table-bordered table-striped mytable">
            <thead>
                <tr>
                    <th class="firstTh"></th>
                    <% foreach(ITableImplement val in valList ) {%>
                        <th><%=Convert.ToString(val["ZDATE"]).Substring(5,2)+"/"+Convert.ToString(val["ZDATE"]).Substring(8,2)%></th>
                    <%} %>
                </tr>
            </thead>
            <tbody>
                <%foreach (AttributeItem item in itemLists[valLists.IndexOf(valList)])
                  {%>
                    <tr>
                        <%if (item.FieldName.Equals("ZDATE")) { continue; } %>
                        <td><%=item.ZhName %></td>
                        <% foreach (ITableImplement val in valList)
                           { %>
                           <td><% try { Response.Write(Convert.ToInt32(val[item])); }
                                  catch (Exception e) { Response.Write(val[item]); }%></td>
                        <%} %>
                    </tr>
                <%} %>
            </tbody>
        </table> 
       </div>
        <div style="clear:both;"></div>
          </div>
      <%} %>
        </div>
           
    <%} %>
</asp:Content>