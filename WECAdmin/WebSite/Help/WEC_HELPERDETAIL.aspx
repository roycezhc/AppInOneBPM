<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WEC_HELPERDETAIL.aspx.cs" Inherits="WECAdmin_WebSite_Help_WEC_HELPERDETAIL" %>
<%@Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@Import Namespace="AgileFrame.Orm.PersistenceLayer.BLL"%>
<%@Import Namespace="AgileFrame.Orm.PersistenceLayer.BLL.Base"%>
<!DOCTYPE html>
<!-- saved from url=(0042)http://www.shengyt.com/site/help?help=1#1_1 -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap_min.css" media="all">
<link rel="stylesheet" type="text/css" href="css/index.css" media="all">
<link rel="stylesheet" type="text/css" href="css/help.css" media="all">
      <script src="../../../Lib/JQuery/jquery.min.js"></script>
<script type="text/javascript" src="js/weimob-index.js"></script>
<script charset="utf-8" src="js/v.js"></script></head>
  
<body>
	
<!--595 850-->
<script language="javascript">
    $(function () {
        $("a").click(function () {
            var rel = $(this).attr("rel");
            if (rel) {
                var pos = $(rel).offset().top - 60;
                $("html,body").animate({ scrollTop: pos }, 800);
            }

        })
    })
</script>
<script>
    $().ready(function () {

        window.onscroll = window.onresize = function () {
            showSideBar();
        }
       
        var pos = $("#<%=subid%>").offset().top - 60;
        $("html,body").animate({ scrollTop: pos }, 800);
    });
    function showSideBar() {
        if (!window.sideMenu) {
            window.sideMenu = $("#sideToolbar");
        }
        if ((document.body.scrollTop || document.documentElement.scrollTop) > 500) {
            sideMenu.addClass("on");
        } else {
            sideMenu.removeClass("on");
        }
    }



</script>




<div id="page">
   
        <div class="title">使用指南</div>
        <% foreach(WEC_HELPER help in helps) {%>
   	    <h3 id="<%=help.ID %>"><%=replace(help.TITLE) %></h3>
        <p><%=replace(help.HELPCONTEN) %></p>
        <%} %>

   
  <div id="sideToolbar" style="display: block; position: fixed; top:150px;  right: 0;" class="">
  <div id="sideCatalog" class="sideCatalogBg" style="visibility: visible;">
    <div id="sideCatalog-sidebar"></div>
    <div id="sideCatalog-catalog">
      <dl style="width:200px;zoom:1">
        <% for(int i=0;i<helps.Count;i++) {%>
   	          <dd><span><%=i+1 %></span><a href="javascript:void()" rel="#<%=helps[i].ID %>" title="<%=replace(help_p.TITLE) %>"><%=replace(helps[i].TITLE) %></a></dd>
        <%} %>
      
      </dl>
    </div>
  </div>
  <a id="sideCatalogBtn" href="<%="wec_helper.aspx" %>" style="visibility: visible;" title="查看帮助目录"></a>
  <a id="sideToolbar-up" href="javascript:void()" rel="#top" title="返回顶部" style="visibility: visible;"></a></div>
     
</div>




</body></html>
