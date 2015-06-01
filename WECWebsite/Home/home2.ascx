<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home2.ascx.cs" Inherits="WECWebsite_Home_home2" %>
    <script type="text/javascript">

        document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-13.css?r=' + Math.random() + '"" media="all" />');
    </script>
<div class="body" style="padding-bottom:52px;">
		<!--
	幻灯片管理
	-->
	<div style="-webkit-transform:translate3d(0,0,0);">
		<div id="banner_box" class="box_swipe">
			<ul>
            <%=navigation %>
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
           <%-- <script type="text/javascript" src="http://stc.shengyt.com/src/template/snower.js"></script>--%>
        </div>
    </header>         		<!--
		用户分类管理
		-->
		<section>
    
            <ul class="list_font">
                <%=mainvalue%>
                            </ul>
        </section>
   </div>   
