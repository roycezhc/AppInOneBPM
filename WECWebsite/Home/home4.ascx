<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home4.ascx.cs" Inherits="WECWebsite_Home_home4" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>

<script type="text/javascript">
document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/cate12_2.css?r=' + Math.random() + '"" media="all" />');
document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/plugmenu.css?r=' + Math.random() + '"" media="all" />');
//document.write('<script src="<%=preUrl %>themes/wec/template/js/snower.js?r=' + Math.random() + '" type="text/javascript"><' + '/script>');
document.write('<script src="<%=preUrl %>themes/wec/template/js/wtj.js?r=' + Math.random() + '" type="text/javascript"><' + '/script>');
//document.write('<script src="<%=preUrl %>themes/wec/template/js/idangerous_swiper.js?r=' + Math.random() + '" type="text/javascript"><' + '/script>');
</script>

<style type="text/css">
	.body{ max-width:640px; margin:auto; }
	.themeStyle{background:#2BBA14!important; background-color:#2BBA14 !important; }
</style>
<body id="cate12">
<div class="body">
		<!--
	幻灯片管理
	-->
	<div style="-webkit-transform:translate3d(0,0,0);">
		<div id="banner_box" class="box_swipe" >
			<ul style="list-style: none; width: 1280px; transition: 500ms; -webkit-transition: 500ms; -webkit-transform: translate3d(-640px, 0px, 0px);">
            <%for (int i = 0; i < list.Count; i++)
              { %>
									<li style="width: 640px; display: table-cell; vertical-align: top;">
                                        <a onclick= '<%=list[i].OUT_URL==""?"return false":list[i].OUT_URL %>;'>
																<img src="<%=list[i].PIC_URL %>" alt="<%=list[i].NAME %>" style="width:100%;"/>
								</a>
					</li>
							
                    <%
                } %>
			</ul>
			<ol>
									<li class=""></li>
									<li class="on"></li>
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
<br><header>
        <div class="snower">
            <script type="text/javascript"></script>
            <script type="text/javascript" src="./home4_files/snower.js"></script>
           
        </div>
    </header> 			<!--
		用户分类管理
        -->
		<div id="insert1"></div>
        <% 
            for (int i = 0; i < list1.Count; i++)
            {
                WEC_COLUMN wn = new WEC_COLUMN();
                wn.PID = list1[i].ID;
                string path = "";
                if (!AgileFrame.Orm.PersistenceLayer.BLL.Base.BLLTable<WEC_COLUMN>.Exists(wn))
                {
                    path = "list.aspx?id=" + list1[i].ID + "&aid=" + aid;
                }
                else
                {
                    path = "channel.aspx?id=" + list1[i].ID + "&aid=" + aid;
                }               
            %>
            <div class="Category">
				<div class="cname">
					<% =list1[i].COLUMN_NAME%><a href="<%=list1[i].OUT_URL=="" ? path : list1[i].OUT_URL%>" class="more">查看更多</a>
				</div>
				<div class="clist clist<%=i+1 %>> swiper-container">
					<div class="swiper-wrapper" style="width: 614.390625px;">
						<div class="swiper-slide swiper-slide-visible swiper-slide-active" style="width: 614.390625px;">
							<ul>
																											<li>
																							<a onclick="return false;">
																							<div>
													<img src="<%=list1[i].PIC_URL %>"/>
												</div>
												<span><% =list1[i].COLUMN_NAME%></span>
											</a>
										</li>
																								</ul>
						</div>
											</div>
					<div class="cpager"><span class="swiper-pagination-switch swiper-visible-switch swiper-active-switch"></span></div>
			<%--		<script>
					    $(function () {
					        new Swiper('.clist<%=i+1 %>', {
					            pagination: '.clist<%=i+1 %> .cpager'
					        });
					    });
					</script>--%>
				</div>
            </div>
                 <%
            } 
                %>
			

					
			</div>
            </body>
