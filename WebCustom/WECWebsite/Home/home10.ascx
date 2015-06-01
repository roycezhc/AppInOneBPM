<%@ Control Language="C#" AutoEventWireup="true" CodeFile="home10.ascx.cs" Inherits="WECWebsite_Home_home10" %>
<script type="text/javascript">
    document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-60.css?r=' + Math.random() + '"" media="all" />');
</script>
    <body onselectstart="return true;" ondragstart="return false;">
        <script>
            $(function () {
                console.log(document.getElementById('list_uls'));
                window.swiper_2 = new Swipe(document.getElementById('list_uls'), {
                    speed: 500,
                    // auto:3000,
                    callback: function () {
                        var lis = $("#list_dots li");
                        lis.removeClass("on").eq(this.index).addClass("on");
                        var las = $("#list_icons a");
                        las.removeClass("on").eq(this.index).addClass("on");

                        var minIndex = 0;
                        var maxIndex = Math.max(0, list_icons.length - 5);
                        var range = [this.index - 1, minIndex, maxIndex];
                        //

                        range = range.sort(function (a, b) {
                            return a > b ? 1 : -1;
                        });
                        window.list_icons.slide(range[1]);
                    }
                });
            });

</script>
<script>
    $().ready(function () {
        $("#list_icons, #list_ul").on("touchstart touchend mousedown mouseup", function (a1) {
            a1.target.classList.toggle("on");
        });
    });
</script>
<div class="body">
	<section>
		<div>
			<header>
        <div class="snower">
            <script type="text/javascript"></script>
            <script type="text/javascript" src="http://stc.shengyt.com/src/template/snower.js"></script>
        </div>
    </header> 						<div class="header2">
												<img src="http://img.shengyt.com/static/91/ec/c5/image/20140324/20140324183359_28718.gif" alt="荷兰皇室招待习近平夫妇国宴菜单曝光(组图)" style="width:100%;" />
							
								<ul class="list_icons" style="width:235px;margin:auto;left:50%;margin-left:-117px">
					<div id="list_icons" style="width:47px;">
						<ol>
							<li><a href="javascript:swiper_2.slide(0);" class="on"><span class="icon-smile"></span></a></li><li><a href="javascript:swiper_2.slide(1);" ><span class="icon-smile"></span></a></li><li><a href="javascript:swiper_2.slide(2);" ><span class="icon-gamepad"></span></a></li><li><a href="javascript:swiper_2.slide(3);" ><span class="icon-food"></span></a></li><li><a href="javascript:swiper_2.slide(4);" ><span class="icon-smile"></span></a></li><li><a href="javascript:swiper_2.slide(5);" ><span class="icon-smile"></span></a></li><li><a href="javascript:swiper_2.slide(6);" ><span class="icon-smile"></span></a></li>								
						</ol>
					</div>
				</ul>
				<ul id="list_dots" class="list_dots">
					<li class="on"><li ><li ><li ><li ><li ><li >				</ul>
				<script>
				    window.list_icons = new Swipe(document.getElementById('list_icons'), {
				        speed: 500,
				        callback: function () {
				            if (this.index > (this.length - 5)) {
				                this.slide(this.length - 5);
				            }
				        }
				    });
				</script>
							</div>
			<div id="list_uls" class="list_ul box_swipe">
				<ul >
										<li>
						<dl>
							                    <dd>								<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=298053&wxref=mp.weixin.qq.com">
														<p><span class="icon-smile"></span><div><label>12</label></div></p>
						</a></dd>
							                    <dd>								<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=298054&wxref=mp.weixin.qq.com">
														<p><span class="icon-smile"></span><div><label>23</label></div></p>
						</a></dd>
												</dl>
					</li>
										<li>
						<dl>
							                    <dd>								<a onclick="return false;">
														<p><span class="icon-smile"></span><div><label>测试5</label></div></p>
						</a></dd>
												</dl>
					</li>
										<li>
						<dl>
							                    <dd>								<a onclick="return false;">
														<p><span class="icon-gamepad"></span><div><label>测试</label></div></p>
						</a></dd>
												</dl>
					</li>
										<li>
						<dl>
							                    <dd>								<a onclick="return false;">
														<p><span class="icon-food"></span><div><label>测试2</label></div></p>
						</a></dd>
												</dl>
					</li>
										<li>
						<dl>
							                    <dd>								<a onclick="return false;">
														<p><span class="icon-smile"></span><div><label>习近平</label></div></p>
						</a></dd>
												</dl>
					</li>
										<li>
						<dl>
							                    <dd>								<a onclick="return false;">
														<p><span class="icon-smile"></span><div><label>测试3</label></div></p>
						</a></dd>
												</dl>
					</li>
										<li>
						<dl>
							                    <dd>								<a onclick="return false;">
														<p><span class="icon-smile"></span><div><label>汉字作为一种文字</label></div></p>
						</a></dd>
												</dl>
					</li>
									</ul>
			</div>
		</div>
	</section>
</div>


