<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home3.ascx.cs" Inherits="WECWebsite_Home_home3" %>

    <script type="text/javascript">
        
        document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-38.css?r=' + Math.random() + '"" media="all" />');
    </script>    
<div class="body">
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
	
<br/>		<!--
		用户分类管理
        -->
		<section>
			<div id="navList_box" class="box_swipe">
				<ul>
                <%=mainvalue %>
																	<%--	<li>
																					<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293178&wxref=mp.weixin.qq.com" class="shengyt-list-item">
															<span class="icon-smile"></span>
								<img src="http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1" alt="测试4" />
								<div>测试4</div>
							</a>
																																<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293179&wxref=mp.weixin.qq.com" class="shengyt-list-item">
															<span class="icon-smile"></span>
								<img src="http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1" alt="测试5" />
								<div>测试5</div>
							</a>
																																<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293175&wxref=mp.weixin.qq.com" class="shengyt-list-item">
															<span class="icon-gamepad"></span>
								<img src="http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1" alt="测试" />
								<div>测试</div>
							</a>
																																<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293176&wxref=mp.weixin.qq.com" class="shengyt-list-item">
															<span class="icon-food"></span>
								<img src="http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1" alt="测试2" />
								<div>测试2</div>
							</a>
													</li>
																								<li>
																					<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293167&wxref=mp.weixin.qq.com" class="shengyt-list-item">
															<span class="icon-smile"></span>
								<img src="http://stc.shengyt.com//img/template/lib/home-150150.jpg?v=2014-03-07-1?=2014-03-07-1" alt="习近平" />
								<div>习近平</div>
							</a>
																																<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293177&wxref=mp.weixin.qq.com" class="shengyt-list-item">
															<span class="icon-smile"></span>
								<img src="http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1" alt="测试3" />
								<div>测试3</div>
							</a>
																																<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=292743&wxref=mp.weixin.qq.com" class="shengyt-list-item">
															<span class="icon-smile"></span>
								<img src="http://stc.shengyt.com//img/template/lib/home-150150.jpg?v=2014-03-07-1?=2014-03-07-1" alt="汉字作为一种文字" />
								<div>汉字作为一种文字</div>
							</a>
                            </li>--%>
															</ul>
				<ol>
					<a href="javascript:navList_box.prev();">&nbsp;</a>
					<a href="javascript:navList_box.next();">&nbsp;</a>
				</ol>
			</div>
		</section>
		
	</div>        			
