<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu2.ascx.cs" Inherits="WECWebsite_Menu_Menu2" %>
  <script type="text/javascript">
      document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/menu2.css?r=' + Math.random() + '"" media="all" />');
    </script>
<article id="shareCover" class="toshare" onclick="$('#shareCover').toggleClass('on')">
		<table>
			<tr>
				<td colspan="2"  style="text-align:right;">
					<img src="http://stc.shengyt.com/img/share_1.png?v=2014-03-07-1" style="width:120px!important;" />
					<img src="http://stc.shengyt.com/img/share_2.png?v=2014-03-07-1" style="width:30px!important;" />
				</td>
			</tr>
			<tr>
				<td style="width:50%;">
					<img src="http://stc.shengyt.com/img/share_4.png?v=2014-03-07-1" />
					<div>发送给朋友</div>
				</td>
				<td>
					<img src="http://stc.shengyt.com/img/share_3.png?v=2014-03-07-1" />
					<div>分享到朋友圈</div>
				</td>
			</tr>
		</table>
	</article>
	<script>
	    window.addEventListener("DOMContentLoaded", function () {
	        var nav = document.querySelectorAll(".nav_8")[0];

	        var evts = {
	            handleEvent: function (evt) {
	                if ("A" == evt.target.nodeName) {
	                    evt.target.classList.toggle("active");
	                }
	            }
	        }
	        nav.addEventListener("mousedown", evts, false);
	        nav.addEventListener("mouseup", evts, false);
	        nav.addEventListener("touchstart", evts, false);
	        nav.addEventListener("touchend", evts, false);
	    });
	</script>
	<div class="top_bar footer_bar">
			<section>
					<div class="nav_8">
						<ul class="box">
							<li>
								<a href="javascript:history.go(-1);">
									<p class="back2"></p>
									<span>返回</span>
								</a>
							</li>
																					<li>
								<a href="Home.aspx?aid=<%=aid%>">
									<p class="home"></p>
									<span>首页</span>
								</a>
							</li>
							<li>
								<a href="javascript:$('#shareCover').toggleClass('on');">
									<p class="share"></p>
									<span>分享</span>
								</a>
							</li>
						</ul>
					</div>
			</section>
		</div>