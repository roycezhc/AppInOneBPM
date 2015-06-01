<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SAP_CHART/SAPCHARTBLANK.master" CodeFile="StockTableChart.aspx.cs" Inherits="SAP_CHART_Stock" %>

<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %> 
<%@ Import Namespace="AgileFrame.Common" %> 
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>库存图表</title>
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
          <div style="width:800px;">
            <div class="pull-left ">
           <span ><label for="werk">工厂</label></span>
           <input value="<%=werk %>" class="form-control" style="width:120px;display:inline;" type="text" id="werk" name="werk"/>
             </div>
            <div class="pull-left marginLeftAdd2">
          <span ><label for="month">月份</label></span>
          <input value="<%=month %>" class="form-control" style="width:200px;display:inline;"  id="month" name="month"/>
            </div>
            <div class="pull-left marginLeftAdd2 marginTop27" >
          <asp:Button runat="server" Text="查询" CssClass="btn btn-primary"/>
            </div>
            </div>
        </form>
    </div>
    <% if(IsPostBack){ %>
    <script>
        $(function () {
            //Get context with jQuery - using jQuery's .get() method.


            var ctx = $("#myChart1").get(0).getContext("2d");
            //This will get the first returned node in the jQuery collection.
            var myNewChart = new Chart(ctx);

            var data = {
                labels: [<%=labels%>],
                   datasets: [
                        <% if (lineNames.Count>0)
                          {%>

                   {
                           label: "<%=lineNames[0]%>",
                         fillColor: "rgba(<%=colorList[0]%>,0.5)",
                       strokeColor: "rgba(<%=colorList[0]%>,1)",
                       pointColor: "rgba(<%=colorList[0]%>,1)",
                       pointStrokeColor: "#fff",
                       data: [<%=datas[0]%>]
                   }
                   <%}%>
                       <% for (int i = 1; i < datas.Count;i++ )
                          {%>
                       ,
                      {
                          label: "<%=lineNames[i]%>",
                          fillColor: "rgba(<%=colorList[i%colorList.Count]%>,0.5)",
                          strokeColor: "rgba(<%=colorList[i%colorList.Count]%>,1)",
                          pointColor: "rgba(<%=colorList[i%colorList.Count]%>,1)",
                          pointStrokeColor: "#fff",
                          data: [<%=datas[i]%>]
                      }
                      <%}%>
               ]
               }
               myNewChart.Line(data, {
                   datasetFill: false,
                   animation: false,
                   multiTooltipTemplate: function (obj) {
                       return obj.datasetLabel + " " + obj.value;
                   },
                   scaleLineWidth: 3,
                   scaleLineColor: "rgba(144,144,144,1)",
                   scaleGridLineColor: "rgba(144,144,144,0.5)",
                   scaleGridLineWidth: 1<%--,
                   scaleOverride: true,
                   scaleSteps: 10,
                   scaleStepWidth:<%=stepList[0]%>,
                   scaleStartValue: 0--%>
               });


           });
      </script>
      <div class=" marginTopAdd2 col-lg-offset-4 ">
          <h4><%= "库存金额情况变动表"%></h4>
      </div>
       <div class=" marginTopAdd2 col-lg-12" style="overflow-x:auto;overflow-y:hidden;">
        <table class="table table-bordered table-striped mytable" style="border-top:1px solid #000;table-layout:fixed\9;">
            <thead>
                <tr>
                    <th class="firstTh" width="160"></th>
                    <% for(int i=1;i<=days;i++)
                       {%>
                        <th width="100"><%=monthStr+"/"+(i<10?"0"+i:""+i)%></th>
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
        <div style="clear:both;"></div>
        <%--<div class="row marginTopAdd2 col-lg-offset-4 ">
              <h4><%="库存金额情况变动表"%></h4>
          </div>--%>
         <canvas id="myChart1" width="1000" height="400" style="overflow-x:auto;overflow-y:hidden;"></canvas>
        <%} %>
    </asp:Content>