<%@ Page Language="C#" StylesheetTheme="" AutoEventWireup="true" Inherits="HR_CheckWork_wds3" CodeFile="wds3.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="../../Lib/DHX/dhtmlxgrid.css" rel="stylesheet" type="text/css" />
    <link href="../../Lib/DHX/dhtmlxgrid_skins.css" rel="stylesheet" type="text/css" />
    <link href="../../Lib/DHX/skins/dhtmlxgrid_dhx_skyblue.css" rel="stylesheet" type="text/css"/>

    <script src="../../Lib/DHX/dhtmlxcommon.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/dhtmlxgrid.js" type="text/javascript"></script>

    <script src="../../Lib/DHX/dhtmlxgridcell.js" type="text/javascript"></script>

    <script src="../../Lib/DHX/excells/dhtmlxgrid_excell_link.js" type="text/javascript"></script>

 
    <script type="text/javascript">
        //dhtmlx.skin = "dhx_skyblue";

        Date.prototype.getWeekName = function () {
            var d = this.getDay();
            var arr =["日", "一", "二", "三", "四", "五", "六"];
            return arr[d];
        }
    </script>


    <!--TL-->
    <script src="../../Lib/DHX/tl/trainquerycommon.js" type="text/javascript"></script>
    <script src="../../Lib/DHX/tl/dhtmlxgrid_splt.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="gridbox1"	style="text-align:left;background-color: white;width:1000px;height:600px; overflow: hidden">
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
              mygrid.init();
              mygrid.setSkin("light");
              mygrid.splitAt(4);

              //mygrid.loadXMLString();
              mygrid.loadXML("wdsback.aspx");
          }

          window.onload = function () {
              createGrid1();
          }
        
    
    </script>
    </form>
</body>
</html>
