<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home1.ascx.cs" Inherits="WECWebsite_Home_home1" %>
    <script type="text/javascript">
        document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/shengyt-ui-1-1.css?r=' + Math.random() + '"" media="all" />');
        document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-0.css?r=' + Math.random() + '"" media="all" />');
    </script>
<div class="shengyt-page" style="display:block; padding-bottom:55px;">
    
		<!--
	幻灯片管理
	-->
	<div style="-webkit-transform:translate3d(0,0,0);">
		<div id="banner_box" class="box_swipe">
            <ul>
			    <%=navigation%>
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
<header>
        <div class="snower">
            <script type="text/javascript"></script>
           
        </div>
    </header>             <!--
		用户分类管理
        -->
		<div class="shengyt-content">
            <div class="shengyt-list">
            <%=mainvalue%>
                                                              <%--     <a href="/weisite/list?pid=87126&bid=180599&wechatid=fromUsername&ltid=254410&wxref=mp.weixin.qq.com" class="shengyt-list-item">
                                          <div class="shengyt-list-item-bg">
                           <div>
                                <img src="http://stc.shengyt.com//img/template/lib/home-300200.jpg?v=2014-03-07-1?=2014-03-07-1" alt="测试2" style="width:100%;" />
                        </div>
                         <div class="shengyt-list-item-box">
                            <div class="shengyt-list-item-line">
                                  <div class="shengyt-list-item-title">测试2</div>
                             </div>
                          </div>
                      </div>
                 </a>
                          <a href="/weisite/list?pid=87126&bid=180599&wechatid=fromUsername&ltid=254410&wxref=mp.weixin.qq.com" class="shengyt-list-item">
                             <div class="shengyt-list-item-bg">
                           <div>
                                <img src="http://stc.shengyt.com//img/template/lib/home-300200.jpg?v=2014-03-07-1?=2014-03-07-1" alt="测试1" style="width:100%;" />
                        </div>
                         <div class="shengyt-list-item-box">
                            <div class="shengyt-list-item-line">
                                  <div class="shengyt-list-item-title">测试1</div>
                             </div>
                          </div>
                      </div>
                 </a>										--%>
            </div>
        </div>
    </div>