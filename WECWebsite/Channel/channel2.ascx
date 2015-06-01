<%@ Control Language="C#" AutoEventWireup="true" CodeFile="channel2.ascx.cs" Inherits="WECWebsite_Channel_channel2" %>
  <script type="text/javascript">
      document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-23.css?r=' + Math.random() + '"" media="all" />');
    </script>

<link rel="stylesheet" type="text/css" href="http://www.shengyt.com/wm-xin-a/font-awesome.css?v=2014032610" media="all" />

<div class="body" style="padding-bottom:50px;">
		<!--
	幻灯片管理
	-->
	<div style="-webkit-transform:translate3d(0,0,0);">
		<div id="banner_box" class="box_swipe">
			<ul>
            <%=navigation %>
									<%--<li>
												<a onclick="return false;">
																<img src="http://img.shengyt.com/static/91/ec/c5/image/20140324/20140324183359_28718.gif" alt="荷兰皇室招待习近平夫妇国宴菜单曝光(组图)" style="width:100%;" />
								</a>
					</li>
									<li>
													<a href="/weisite/detail?pid=98816&bid=202577&wechatid=fromUsername&did=400898&from=list&wxref=mp.weixin.qq.com">
																	<img src="http://img.shengyt.com/static/91/ec/c5/image/20140324/20140324183430_98719.jpg" alt="你我皆“键人”，汉字会死吗？" style="width:100%;" />
								</a>
					</li>--%>
							</ul>
			<ol>
									<li class="on"></li>
									<li ></li>
							</ol>
		</div>
	</div>
		<script>
		    $(function () {
		        new Swipe(document.getElementById('banner_box'), {
		            speed: 500,
		            auto: 3000,
		            callback: function () {
		                var lis = $(this.element).next("ol").children();
		                lis.removeClass("on").eq(this.index).addClass("on");
		            }
		        });
		    });
	</script>
<br/><header>
        <div class="snower">
            <script type="text/javascript"></script>
            <script type="text/javascript" src="http://stc.shengyt.com/src/template/snower.js"></script>
        </div>
    </header> 				<!--
		用户分类管理
        -->
		<section>
			<ul class="list_font">
            <%=mainvalue %>
								<%--	<li style="background:#dadada;">
													<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=298053&wxref=mp.weixin.qq.com">
													<div><span class="icon-smile"></span></div>
							<div>
								<p>12</p>
							</div>
						</a>
					</li>
									<li style="background:#dadada;">
													<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=298054&wxref=mp.weixin.qq.com">
													<div><span class="icon-smile"></span></div>
							<div>
								<p>23</p>
							</div>
						</a>
					</li>--%>
							</ul>
		</section>
	</div>