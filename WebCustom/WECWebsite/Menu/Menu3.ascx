<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu3.ascx.cs" Inherits="WECWebsite_Menu_Menu3" %>
  <script type="text/javascript">
      document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/menu3.css?r=' + Math.random() + '"" media="all" />');
    </script>
<footer class="nav_footer">
		<ul class="box">
			<li><a href="javascript:history.go(-1);">返回</a></li>
			<li><a href="javascript:history.go(1);">前进</a></li>
			<li><a href="Home.aspx?aid=<%=aid%>">主页</a></li>
			<li><a href="javascript:location.reload();">刷新</a></li>
		</ul>
	</footer>
