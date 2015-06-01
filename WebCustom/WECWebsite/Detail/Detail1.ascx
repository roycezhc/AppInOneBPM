<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Detail1.ascx.cs" Inherits="WECWebsite_Detail_Detail1" %>
    <script type="text/javascript">

        document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/detail1.css?r=' + Math.random() + '"" media="all" />');
    </script>
    <div class="body" style="padding-bottom:65px;">
	<section>
		<img src="<%=preUrl %>Themes/WEC/img/v80_4.jpg" style="width:100%;"/>
	</section>
	<section class="section_body">
					<article class="article">
                    <% = mainvalue %>
			</article>
			</section>
	<section>
		<img src="<%=preUrl %>Themes/WEC/img/v80_6.jpg"style="width:100%;" />
	</section>

			<section style="width:95%; margin:0px auto;">



            <div id="Div1" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
		<img src="<%=preUrl %>UploadFiles/Menu/guide.png?='javascript:Math.random()'"/>
	</div>
	
	<div id="mcover" onclick="document.getElementById('mcover').style.display='';" style="display:none;">
		<img src="<%=preUrl %>UploadFiles/Menu/guide.png?='javascript:Math.random()'"/>
	</div>
	<div class="text" id="content">
		<div id="mess_share">
			<div id="share_1">
				<button class="button2" onclick="document.getElementById('mcover').style.display='block';">
					<img src="<%=preUrl %>UploadFiles/Menu/icon_msg.png?='javascript:Math.random()'"/>&nbsp;发送给朋友
				</button>
			</div>
			<div id="share_2">
				<button class="button2" onclick="document.getElementById('mcover').style.display='block';">
					<img src="<%=preUrl %>UploadFiles/Menu/icon_timeline.png?='javascript:Math.random()'"/>&nbsp;分享到朋友圈
				</button>
			</div>
			<div class="clr"></div>
		</div>
	</div>
</section>
	
	
			
<div style="padding-bottom:0!important;">
	<a href="javascript:window.scrollTo(0,0);" style="font-size:12px;margin:5px auto;display:block;color:#fff;text-align:center;line-height:35px;background:#333;margin-bottom:-10px;">返回顶部</a>
</div>

</div>      
