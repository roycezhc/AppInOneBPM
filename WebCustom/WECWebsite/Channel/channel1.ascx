<%@ Control Language="C#" AutoEventWireup="true" CodeFile="channel1.ascx.cs" Inherits="WECWebsite_Channel_channel1" %>
  <script type="text/javascript">
      document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-65.css?r=' + Math.random() + '"" media="all" />');
    </script>

    <body onselectstart="return true;" ondragstart="return false;">
        <div class="body">
	<header>
		<div>
			<img src="http://stc.shengyt.com/img/template/lib/v80_4.jpg?v=2014-03-07-1"  style="width:100%;" />
		</div>
	</header>
	<section class="section_body">
		<header>
        <div class="snower">
            <script type="text/javascript"></script>
            <script type="text/javascript" src="http://stc.shengyt.com/src/template/snower.js"></script>
        </div>
    </header> 					<script>
              					    $(function () {
              					        window.swiper_2 = new Swipe(document.getElementById('list_uls'), {
              					            speed: 500,
              					            // auto:3000,
              					            callback: function () {
              					                var lis = $("#nav_for_list_ul li");
              					                lis.removeClass("on").eq(this.index).addClass("on");
              					            }
              					        });
              					    });
			</script>
						<div id="list_uls" class="list_uls box_swipe">
				<ul>
											<li style="width: 270px; display: table-cell; vertical-align: top;">
                                            <%=mainvalue %>
																								<%--<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=298053&wxref=mp.weixin.qq.com">
																	<label><small>12</small></label>
									<span class="icon-smile"></span>
								</a>
																								<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=298054&wxref=mp.weixin.qq.com">
																	<label><small>23</small></label>
									<span class="icon-smile"></span>
								</a>--%>
													</li>
									</ul>
			</div>
			<ul id="nav_for_list_ul" class="nav_for_list_ul">
															<li class="on"></li>
												</ul>
			</section>
	<div>
		<img src="http://stc.shengyt.com/img/template/lib/v80_6.jpg?v=2014-03-07-1"  style="width:100%;" />
	</div>
	