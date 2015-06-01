<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CheckWork_WDSFind" CodeFile="WDSFind.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="../../Lib/DHX/dhtmlxgrid.css" rel="stylesheet" type="text/css" />
    <link href="../../Lib/DHX/dhtmlxgrid_skins.css" rel="stylesheet" type="text/css" />
    <link href="../../Lib/DHX/skins/dhtmlxgrid_dhx_skyblue.css" rel="stylesheet" type="text/css"/>

    <script src="../../Lib/DHX/dhtmlxcommon.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/dhtmlxgrid.js" type="text/javascript"></script>

    <script src="../../Lib/DHX/dhtmlxgridcell.js" type="text/javascript"></script>

    <script src="../../Lib/DHX/excells/dhtmlxgrid_excell_link.js" type="text/javascript"></script>

 
    <script type="text/javascript">

        Date.prototype.getWeekName = function () {
            var d = this.getDay();
            var arr = ["日", "一", "二", "三", "四", "五", "六"];
            return arr[d];
        }
    </script>

    <!--TL-->
    <script src="../../Lib/DHX/tl-grid/trainquerycommon.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/tl-grid/dhtmlxgrid_splt.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div id="gridbox1"	style="text-align:left;background-color: white;width:500px;height:600px; overflow: hidden">
</div>
      <script type="text/javascript">
          function createGrid1() {
              var mygrid = new dhtmlXGridObject('gridbox1');
              mygrid.setImagePath("../../lib/DHX/grid_imgs/");
              var head1 = ",#cspan,#cspan,日期";
              var head2 = "序号,姓名,全勤,实际出勤";
              var widths = "40,40,40,70";
              for (var i = 1; i <= 7; i++) {
                  head1 += "," + i;
                  var d = new Date(2012, 8, i);
                  head2 += "," + d.getWeekName();
                  widths += ",70";
              }
              head1 += ",出勤情况,#cspan,#cspan";
              head2 += ",aaa,ccc,bbb";
              widths += ",70,70,70";

              //mygrid.enableAutoWidth("", 80, 80);
              mygrid.setHeader(head1);
              mygrid.attachHeader(head2);
              mygrid.setInitWidths(widths);
              mygrid.setSkin("dhx_skyblue");
              //mygrid.enableMultiselect(true);
              mygrid.enableKeyboardSupport(true)

              //mygrid.enableAlterCss("even", "uneven");
              //mygrid.enableSmartRendering(true, 50);

              mygrid.init();
              mygrid.setSkin("light");
              mygrid.splitAt(4);

              //mygrid.loadXMLString();
              //mygrid.loadXML("../test/wdsback.aspx");
//              mygrid.addRow(1, "3,莆田^skbcx.jsp?cxlx=czjgcc&zm=&date=20120906&stationName_passTrain=%E8%8E%86%E7%94%B0 ,D3208   , 09:54 , 09:55 , 00:52,--,--,--,41,337/380,171/190,--,--,--", 1);
//              mygrid.addRow(2, "3,莆田^skbcx.jsp?cxlx=czjgcc&zm=&date=20120906&stationName_passTrain=%E8%8E%86%E7%94%B0 ,D3208   , 09:54 , 09:55 , 00:52,--,--,--,41,337/380,171/190,--,--,--", 2);
//              mygrid.addRow(3, "4,福清^skbcx.jsp?cxlx=czjgcc&zm=&date=20120906&stationName_passTrain=%E7%A6%8F%E6%B8%85 ,D3208   , 10:14 , 10:15 , 01:12,--,--,--,56,337/380,171/190,--,--,--", 3);
//              mygrid.addRow(4, "4,福清^skbcx.jsp?cxlx=czjgcc&zm=&date=20120906&stationName_passTrain=%E7%A6%8F%E6%B8%85 ,D3208   , 10:14 , 10:15 , 01:12,--,--,--,56,337/380,171/190,--,--,--", 4);
//              mygrid.addRow(5, "4,福清^skbcx.jsp?cxlx=czjgcc&zm=&date=20120906&stationName_passTrain=%E7%A6%8F%E6%B8%85 ,D3208   , 10:14 , 10:15 , 01:12,--,--,--,56,337/380,171/190,--,--,--", 5);
//              mygrid.addRow(6, "4,福清^skbcx.jsp?cxlx=czjgcc&zm=&date=20120906&stationName_passTrain=%E7%A6%8F%E6%B8%85 ,D3208   , 10:14 , 10:15 , 01:12,--,--,--,56,337/380,171/190,--,--,--", 6);
//              mygrid.addRow(7, "4,福清^skbcx.jsp?cxlx=czjgcc&zm=&date=20120906&stationName_passTrain=%E7%A6%8F%E6%B8%85 ,D3208   , 10:14 , 10:15 , 01:12,--,--,--,56,337/380,171/190,--,--,--", 7);
//              mygrid.addRow(8, "4,福清^skbcx.jsp?cxlx=czjgcc&zm=&date=20120906&stationName_passTrain=%E7%A6%8F%E6%B8%85 ,D3208   , 10:14 , 10:15 , 01:12,--,--,--,56,337/380,171/190,--,--,--", 8);
//              mygrid.addRow(9, "4,福清^skbcx.jsp?cxlx=czjgcc&zm=&date=20120906&stationName_passTrain=%E7%A6%8F%E6%B8%85 ,D3208   , 10:14 , 10:15 , 01:12,--,--,--,56,337/380,171/190,--,--,--", 9);
              
          }

          window.onload = function () {
              createGrid1();
          }
        
    
    </script>
</asp:Content>

