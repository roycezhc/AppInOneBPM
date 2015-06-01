$(function () {
    $(".hover3").click(function () {
        var str = $.trim($(this).html());
        if (str == "生产订单汇总") {
            location.href = "ProductionTableChart.aspx";
        } else if (str == "采购订单汇总") {
            location.href = "PurchaseTableChart.aspx";
        } else if (str == "销售订单汇总") {
            location.href = "SaleTableChart.aspx";
        } else if (str == "库存金额情况变动") {
            location.href = "StockTableChart.aspx";
        } 
    });
  
});