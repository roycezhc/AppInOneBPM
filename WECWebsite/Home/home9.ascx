<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home9.ascx.cs" Inherits="WECWebsite_Home_home9" %>

<script type="text/javascript">
    document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-3.css?r=' + Math.random() + '"" media="all" />');
</script>
        <!-- Mobile Devices Support @end -->
        <link rel="shortcut icon" href="http://stc.shengyt.com/img/favicon.ico" />


<div class="shengyt-page" style="display:block; padding-bottom:56px;">
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
    </header>     		<!--
		用户分类管理
		-->
		<div class="shengyt-content">
            <div class="shengyt-list">
            <% foreach (AgileFrame.Orm.PersistenceLayer.Model.WEC_COLUMN wc in list1)
        {
            int a = 0;%>
                 <a class="list-item _C0 _L1" href='<%=!string.IsNullOrEmpty(wc.OUT_URL) ? wc.OUT_URL : "list.aspx?id=" + wc.ID + "&aid=" + aid %>'>
                            <div class="item-title"><div class="title-text"><%=wc.COLUMN_NAME %></div></div>
                            <div class="item-image" style="background-image: url(<%=wc.PIC_URL%>)">
                                <div class="item_title2"><%=wc.COLUMN_DES %></div>
                            </div>
                        </a>
            <% a++;
        }%>

                                                          
                    <%--
                                            <a class="list-item  _C1" href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293179&wxref=mp.weixin.qq.com">
                            <div class="item-title"><div class="title-text">测试5</div></div>
                            <div class="item-image"></div>
                        </a>
                    
                                            <a class="list-item  _C2" href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293175&wxref=mp.weixin.qq.com">
                            <div class="item-title"><div class="title-text">测试</div></div>
                            <div class="item-image"></div>
                        </a>
                    
                                            <a class="list-item  _C3" href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293176&wxref=mp.weixin.qq.com">
                            <div class="item-title"><div class="title-text">测试2</div></div>
                            <div class="item-image"></div>
                        </a>
                    
                                            <a class="list-item _C0 _L1" href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293167&wxref=mp.weixin.qq.com">
                            <div class="item-title"><div class="title-text">习近平</div></div>
                            <div class="item-image" style="background-image: url(http://stc.shengyt.com//img/template/lib/home-150150.jpg?v=2014-03-07-1?=2014-03-07-1)">
                                <div class="item_title2">习主席夫妇着中式礼服亮相荷兰王室国宴</div>
                            </div>
                        </a>
                    
                                            <a class="list-item  _C1" href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=293177&wxref=mp.weixin.qq.com">
                            <div class="item-title"><div class="title-text">测试3</div></div>
                            <div class="item-image"></div>
                        </a>
                    
                                            <a class="list-item  _C2" href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=292743&wxref=mp.weixin.qq.com">
                            <div class="item-title"><div class="title-text">汉字作为一种文字</div></div>
                            <div class="item-image"></div>
                        </a>
                    --%>
                                                </div>
        </div>
    	<style>
		.shengyt-page{
			min-height:inherit!important;
			padding-bottom:30px!important;
		}
	</style>
</div>
