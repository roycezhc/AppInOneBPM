<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SAP_CHART/SAPCHARTBLANK.master" CodeFile="WeekTableChart.aspx.cs" Inherits="SAP_CHART_WeekTableChart" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="js/WeekTableChart.js"></script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="body">
        <div class="row marginTopAdd">
            <div class="col-lg-offset-1 col-lg-10 col-sm-offset-1 col-sm-10">
                
                 <div class="col-lg-6 col-sm-6 paddingLR2">
                    <div class="block paddingTopAdd9 hover3">生产订单汇总</div>
                </div>
                 <div class="col-lg-6 col-sm-6 paddingLR2">
                    <div class="block paddingTopAdd9 hover3">采购订单汇总</div>
                </div>
            </div>
        </div>
        <div class="row marginTopAdd">
            <div class="col-lg-offset-1 col-lg-10 col-sm-offset-1 col-sm-10">
                <div class="col-lg-6 col-sm-6 paddingLR2">
                    <div class="block paddingTopAdd9 hover3">销售订单汇总</div>
                </div>
                 <div class="col-lg-6 col-sm-6 paddingLR2">
                    <div class="block paddingTopAdd9 hover3">库存金额情况变动</div>
                </div>
            </div>
        </div>
    
</asp:Content>