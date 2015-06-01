<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SAP_CHART/SAPCHARTBLANK.master" CodeFile="SaleChart.aspx.cs" Inherits="SAP_CHART_Sale" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %> 
<%@ Import Namespace="AgileFrame.Common" %> 
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>销售图</title>
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
             <span ><label for="vkorg">销售组织</label></span>
           <input value="<%=vkorg %>" class="form-control" style="width:120px;display:inline;" type="text" id="vkorg" name="vkorg"/>
           <span ><label for="werk">工厂</label></span>
           <input value="<%=werk %>" class="form-control" style="width:120px;display:inline;" type="text" id="werk" name="werk"/>
          <span ><label for="month">月份</label></span>
          <input value="<%=month %>" class="form-control" style="width:200px;display:inline;" id="month" name="month"/>
          <asp:Button runat="server" Text="查询" CssClass="btn btn-primary"/>
        </form>
    </div>
    <% if(IsPostBack){ %>
       <script>
           $(function () {
               //Get context with jQuery - using jQuery's .get() method.
              <% foreach(List<string> datas in dataLists){
                     int index = dataLists.IndexOf(datas);
                     %>
           var ctx = $("#myChart<%=index%>").get(0).getContext("2d");
           //This will get the first returned node in the jQuery collection.
           var myNewChart = new Chart(ctx);

           var data = {
               labels: [<%=labels%>],
                  datasets: [

                      {
                          label: "<%=lineNames[index][0]%>",
                          fillColor: "rgba(<%=colorList[0]%>,0.5)",
                          strokeColor: "rgba(<%=colorList[0]%>,1)",
                          pointColor: "rgba(<%=colorList[0]%>,1)",
                          pointStrokeColor: "#fff",
                          data: [<%=datas[0]%>]
                      }
                       <% for (int i = 1; i < datas.Count;i++ )
                          {%>
                       ,
                      {
                          label: "<%=lineNames[index][i]%>",
                          fillColor: "rgba(<%=colorList[i%7]%>,0.5)",
                          strokeColor: "rgba(<%=colorList[i%7]%>,1)",
                          pointColor: "rgba(<%=colorList[i%7]%>,1)",
                          pointStrokeColor: "#fff",
                          data: [<%=datas[i%7]%>]
                      }
                      <%}%>
                     ]
              }
               myNewChart.Line(data, {
                   datasetFill: false,
                   animation: false,
                   multiTooltipTemplate: function (obj) {
                       return obj.datasetLabel+" "+ obj.value;
                   }
               });
           <%}%>

       });
      </script>
        <% }%>

    <% for(int i=0;i<tabnames.Count;i++){ %>
         <div class="row marginTopAdd2 col-lg-offset-4 ">
              <h4><%= tabnames[i]%></h4>
          </div>
         <canvas id="myChart<%=i %>" width="1000" height="400" style="overflow-x:auto;overflow-y:hidden;"></canvas>
    <%} %>
    
    </asp:Content>