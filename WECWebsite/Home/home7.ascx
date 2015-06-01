<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home7.ascx.cs" Inherits="WECWebsite_Home_home7" %>

<script type="text/javascript">
   
    document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-25.css?r=' + Math.random() + '"" media="all" />');
</script>


<div class="body" style="padding-bottom:52px;">
		<!--
	幻灯片管理
	-->
	<div style="-webkit-transform:translate3d(0,0,0);">
		<div id="banner_box" class="box_swipe">
			<ul>
					
                    <%=navigation %>				<%--<li>
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
                       <% foreach (AgileFrame.Orm.PersistenceLayer.Model.WEC_COLUMN wc in list1)
                           { %>
                               <li>
									<a href='<%=(wc.OUT_URL != "")? wc.OUT_URL : "list.aspx?id=" + wc.ID + "&aid=" + aid%>'>
                                    
									<div><span><img  src='<%= wc.SMALL_PIC != "" ? wc.SMALL_PIC : "return false"%>'/></span></div>
								<div>
									<p><big><%=wc.COLUMN_NAME%></big><%=wc.COLUMN_DES %></p>
								</div>
			                        </a>
						</li>
                          <% } %>
														<%--	<li>
															<a href="/weisite/channel?pid=98816&bid=202577&wechatid=fromUsername&categoryid=293178&wxref=mp.weixin.qq.com">
															<div><span class="icon-smile"></span></div>
								<div>
									<p><big>测试4</big>弹道导弹当地</p>
								</div>
							</a>
						</li>
																											<ol>
												<li>
															<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293179&wxref=mp.weixin.qq.com">
															<div><span class="icon-smile"></span></div>
								<div>
									<p>测试5</p>
								</div>
							</a>
						</li>
																																<li>
															<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293175&wxref=mp.weixin.qq.com">
															<div><span class="icon-gamepad"></span></div>
								<div>
									<p>测试</p>
								</div>
							</a>
						</li>
																																<li>
															<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293176&wxref=mp.weixin.qq.com">
															<div><span class="icon-food"></span></div>
								<div>
									<p>测试2</p>
								</div>
							</a>
						</li>
																																<li>
															<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293167&wxref=mp.weixin.qq.com">
															<div><span class="icon-smile"></span></div>
								<div>
									<p>习近平</p>
								</div>
							</a>
						</li>
													</ol>
																										<li>
															<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293177&wxref=mp.weixin.qq.com">
															<img src="http://stc.shengyt.com//img/template/lib/home-450300.jpg?v=2014-03-07-1?=2014-03-07-1" />
							</a>
						</li>
																				<li>
															<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=292743&wxref=mp.weixin.qq.com">
															<img src="http://stc.shengyt.com//img/template/lib/home-150150.jpg?v=2014-03-07-1?=2014-03-07-1" />
							</a>
						</li>--%>
												</ul>
		</section>