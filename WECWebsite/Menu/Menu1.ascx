<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu1.ascx.cs" Inherits="WECWebsite_Menu_Menu1" %>
  <script type="text/javascript">
      document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/menu1.css?r=' + Math.random() + '"" media="all" />');
    </script>
<script>
    window.addEventListener("DOMContentLoaded", function () {
        var nav = document.getElementById("nav_10");

        var evts = {
            handleEvent: function (evt) {
                if ("A" == evt.target.nodeName) {
                    evt.target.classList.toggle("on");
                }
            }
        }
        nav.addEventListener("mousedown", evts, false);
        nav.addEventListener("mouseup", evts, false);
        nav.addEventListener("touchstart", evts, false);
        nav.addEventListener("touchend", evts, false);
    });
	</script>
	<article id="shareCover" class="share" onclick="$('#shareCover').toggleClass('on')">
		<table>
			<tr>
				<td colspan="2" style="text-align:right;">
					<img src="<%=preUrl %>UploadFiles/Menu/share_1.png?v='javascript:Math.random()'" style="width:120px!important;" />
					<img src="<%=preUrl %>UploadFiles/Menu/share_2.png?v='javascript:Math.random()'" style="width:30px!important;" />
				</td>
			</tr>
			<tr>
				<td style="width:50%;">
					<img src="<%=preUrl %>UploadFiles/Menu/share_4.png?v='javascript:Math.random()'" />
					<div>发送给朋友</div>
				</td>
				<td>
					<img src="<%=preUrl %>UploadFiles/Menu/share_3.png?v='javascript:Math.random()'" />
					<div>分享到朋友圈</div>
				</td>
			</tr>
		</table>
	</article>
	<nav class="nav_10" style="height:50px;">
		<ul id="nav_10" class="box">
			<li>
				<a href="javascript:window.history.go(-1);">
					<span class="back">&nbsp;</span>
					<label>返回</label>
				</a>
			</li>
									<li>

				<a href="Home.aspx?aid=<%=aid%>">
					<span class="home">&nbsp;</span>
					<label>主页</label>
				</a>
			</li>
			<li>
				<a href="javascript:$('#shareCover').toggleClass('on');">
					<span class="share1">&nbsp;</span>
					<label>分享</label>
				</a>
			</li>
		</ul>
	</nav>
	<style>
		footer {
			display:none;
		}
	</style>