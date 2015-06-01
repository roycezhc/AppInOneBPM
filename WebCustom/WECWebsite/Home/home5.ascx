<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home5.ascx.cs" Inherits="WECWebsite_Home_home5" %>
<script type="text/javascript">
    document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-21.css?r=' + Math.random() + '"" media="all" />');
</script>

<%--<link rel="stylesheet" type="text/css" href="http://stc.shengyt.com/css/template/home-21.css?2014-03-07-1" media="all" />--%>


<div class="body">
		<!--
	幻灯片管理
	-->
	<div style="-webkit-transform:translate3d(0,0,0);">
		<div id="banner_box" class="box_swipe">
			<ul>
            <%=navigation %>
								<%--	<li>
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
    </header> 	<div class="head_pic_cirrus">
		<img src="http://stc.shengyt.com/img/v22_1.png?v=2014-03-07-1" />
	</div>
    		<!--
		用户分类管理
		-->
		<section style="padding-bottom:20px">
            <ul class="list_font">
            <%=mainvalue %>
                                  <%--  <li>
													<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293178&wxref=mp.weixin.qq.com">
													<div><span class="icon-smile"></span></div>
							<div>
								<p>测试4<small>弹道导弹当地</small></p>
							</div>
                        </a>
                    </li>
                                    <li>
													<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293179&wxref=mp.weixin.qq.com">
													<div><span class="icon-smile"></span></div>
							<div>
								<p>测试5<small>的fewf</small></p>
							</div>
                        </a>
                    </li>
                                    <li>
													<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293175&wxref=mp.weixin.qq.com">
													<div><span class="icon-gamepad"></span></div>
							<div>
								<p>测试<small>测试</small></p>
							</div>
                        </a>
                    </li>
                                    <li>
													<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293176&wxref=mp.weixin.qq.com">
													<div><span class="icon-food"></span></div>
							<div>
								<p>测试2<small>去啊阿嫂</small></p>
							</div>
                        </a>
                    </li>
                                    <li>
													<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293167&wxref=mp.weixin.qq.com">
													<div><span class="icon-smile"></span></div>
							<div>
								<p>习近平<small>习主席夫妇着中式礼服亮相荷兰王室国宴</small></p>
							</div>
                        </a>
                    </li>
                                    <li>
													<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293177&wxref=mp.weixin.qq.com">
													<div><span class="icon-smile"></span></div>
							<div>
								<p>测试3<small>大赛</small></p>
							</div>
                        </a>
                    </li>
                                    <li>
													<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=292743&wxref=mp.weixin.qq.com">
													<div><span class="icon-smile"></span></div>
							<div>
								<p>汉字作为一种文字<small>汉字作为一种文字，它应该不会消失。几千年来，汉字在任何时代都表现了极强的适应性，不管是刻在龟甲上，还是刻在竹简上，还是写在帛上，或者写在纸上，乃至今天用计算机编码显示出来，汉字从来没有因为它的复杂性而被淘汰或异化。</small></p>
							</div>
                        </a>
                    </li>--%>
                            </ul>
        </section>
    </div>

	<script type="text/javascript">
	    window.shareData = {
	        "imgUrl": "",
	        "timeLineLink": "http://www.shengyt.com/weisite/home?pid=98816&bid=202577&wechatid=fromUsername&wxref=mp.weixin.qq.com",
	        "sendFriendLink": "http://www.shengyt.com/weisite/home?pid=98816&bid=202577&wechatid=fromUsername&wxref=mp.weixin.qq.com",
	        "weiboLink": "http://www.shengyt.com/weisite/home?pid=98816&bid=202577&wechatid=fromUsername&wxref=mp.weixin.qq.com",
	        "tTitle": "",
	        "tContent": "",
	        "fTitle": "",
	        "fContent": "",
	        "wContent": ""
	    };
			</script>
