<%@ Page Language="C#" AutoEventWireup="true" CodeFile="guaguaka.aspx.cs" Inherits="WECAdmin_ReCall_WEC_ACTIVITY_guaguaka" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.BLL.Base"%>
<!DOCTYPE html>
<!-- saved from url=(0326)http://www.shengyt.com/activity/ScratchCard?_tj_twtype=11&_tj_pid=105588&_tt=1&_tj_graphicid=21861&_tj_title=%E5%88%AE%E5%88%AE%E5%8D%A1%E6%B4%BB%E5%8A%A8%E5%BC%80%E5%A7%8B%E4%BA%86&_tj_keywords=%E5%88%AE%E5%88%AE%E5%8D%A12&id=21861&bid=207595&wechatid=oWKVbt8s-eF1Hjxs-iUykz5mDvp0&pid=105588&v=4a12207616277f4cc516383a02e07870 -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="微信生意通/政务通、微信营销、微信代运营、微信定制开发、微信托管、微网站、微商城、微营销" name="Keywords">
	<meta content="微信生意通/政务通，国内最大的微信公众智能服务平台，微信生意通/政务通八大微体系：微菜单、微官网、微会员、微活动、微商城、微推送、微服务、微统计，企业微营销必备。" name="Description">
    <link rel="stylesheet" type="text/css" href="./guaguaka_files/activity_style.css" media="all">
<script type="text/javascript" async="" src="./guaguaka_files/wtj.js"></script><script type="text/javascript" src="./guaguaka_files/zepto.js"></script>
<script type="text/javascript" src="./guaguaka_files/alert.js"></script><style type="text/css">

.window {
	width:290px;
	position:absolute;
	display:none;
	bottom:30px;
	left:50%;
	 z-index:9999;
	margin:-50px auto 0 -145px;
	padding:2px;
	border-radius:0.6em;
	-webkit-border-radius:0.6em;
	-moz-border-radius:0.6em;
	background-color: #ffffff;
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	-o-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	font:14px/1.5 Microsoft YaHei,Helvitica,Verdana,Arial,san-serif;
}
.window .title {
	
	background-color: #A3A2A1;
	line-height: 26px;
    padding: 5px 5px 5px 10px;
	color:#ffffff;
	font-size:16px;
	border-radius:0.5em 0.5em 0 0;
	-webkit-border-radius:0.5em 0.5em 0 0;
	-moz-border-radius:0.5em 0.5em 0 0;
	background-image: -webkit-gradient(linear, left top, left bottom, from( #585858 ), to( #565656 )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient(#585858, #565656); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient(#585858, #565656); /* FF3.6 */
	background-image:     -ms-linear-gradient(#585858, #565656); /* IE10 */
	background-image:      -o-linear-gradient(#585858, #565656); /* Opera 11.10+ */
	background-image:         linear-gradient(#585858, #565656);
	
}
.window .content {
	/*min-height:100px;*/
	overflow:auto;
	padding:10px;
	background: linear-gradient(#FBFBFB, #EEEEEE) repeat scroll 0 0 #FFF9DF;
    color: #222222;
    text-shadow: 0 1px 0 #FFFFFF;
	border-radius: 0 0 0.6em 0.6em;
	-webkit-border-radius: 0 0 0.6em 0.6em;
	-moz-border-radius: 0 0 0.6em 0.6em;
}
.window #txt {
	min-height:30px;font-size:16px; line-height:22px;
}
.window .txtbtn {
	
	background: #f1f1f1;
	background-image: -webkit-gradient(linear, left top, left bottom, from( #DCDCDC ), to( #f1f1f1 )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #ffffff , #DCDCDC ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #ffffff , #DCDCDC ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #ffffff , #DCDCDC ); /* IE10 */
	background-image:      -o-linear-gradient( #ffffff , #DCDCDC ); /* Opera 11.10+ */
	background-image:         linear-gradient( #ffffff , #DCDCDC );
	border: 1px solid #CCCCCC;
	border-bottom: 1px solid #B4B4B4;
	color: #555555;
	font-weight: bold;
	text-shadow: 0 1px 0 #FFFFFF;
	border-radius: 0.6em 0.6em 0.6em 0.6em;
	display: block;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	text-overflow: ellipsis;
	white-space: nowrap;
	cursor: pointer;
	text-align: windowcenter;
	font-weight: bold;
	font-size: 18px;
	padding:6px;
	margin:10px 0 0 0;
}
.window .txtbtn:visited {
	background-image: -webkit-gradient(linear, left top, left bottom, from( #ffffff ), to( #cccccc )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #ffffff , #cccccc ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #ffffff , #cccccc ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #ffffff , #cccccc ); /* IE10 */
	background-image:      -o-linear-gradient( #ffffff , #cccccc ); /* Opera 11.10+ */
	background-image:         linear-gradient( #ffffff , #cccccc );
}
.window .txtbtn:hover {
	background-image: -webkit-gradient(linear, left top, left bottom, from( #ffffff ), to( #cccccc )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #ffffff , #cccccc ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #ffffff , #cccccc ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #ffffff , #cccccc ); /* IE10 */
	background-image:      -o-linear-gradient( #ffffff , #cccccc ); /* Opera 11.10+ */
	background-image:         linear-gradient( #ffffff , #cccccc );
}
.window .txtbtn:active {
	background-image: -webkit-gradient(linear, left top, left bottom, from( #cccccc ), to( #ffffff )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #cccccc , #ffffff ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #cccccc , #ffffff ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #cccccc , #ffffff ); /* IE10 */
	background-image:      -o-linear-gradient( #cccccc , #ffffff ); /* Opera 11.10+ */
	background-image:         linear-gradient( #cccccc , #ffffff );
	border: 1px solid #C9C9C9;
	border-top: 1px solid #B4B4B4;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3) inset;
}

.window .title .close {
	float:right;
	background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACTSURBVEhL7dNtCoAgDAZgb60nsGN1tPLVCVNHmg76kQ8E1mwv+GG27cestQ4PvTZ69SFocBGpWa8+zHt/Up+IN+MhgLlUmnIE1CpBQB2COZibfpnXhHFaIZkYph0SOeeK/QJ8o7KOek84fkCWSBtfL+Ny2MPpCkPFMH6PWEhWhKncIyEk69VfiUuVhqJefds+YcwNbEwxGqGIFWYAAAAASUVORK5CYII=");
	width:26px;
	height:26px;
	display:block;	
}
</style>
<script charset="utf-8" src="./guaguaka_files/v.js"></script></head><body data-role="page" class="activity-scratch-card-winning"><div class="window" id="windowcenter">
	<div id="title" class="title">消息提醒<span class="close" id="alertclose"></span></div>
	<div class="content">
	 <div id="txt"></div>
	 <input type="button" value="确定" id="windowclosebutton" name="确定" class="txtbtn">	
	</div>
</div>

<title>刮刮卡</title>
	<link rel="shortcut icon" href="http://stc.shengyt.com/img/favicon.ico">
    <!--[if lte IE 9]><script src="http://stc.shengyt.com/src/watermark.js"></script><![endif]-->
	<!--[if IE 7]><link href="http://stc.shengyt.com/css/font_awesome_ie7.css" rel="stylesheet" /><![endif]-->


	


    
    <meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="刮刮卡">
    <title>刮刮卡</title>
    <%                      
                WEC_ACTIVITY conf=new WEC_ACTIVITY();
                conf.ID=Convert.ToDecimal(HttpUtil.GetReqStrValue("a_id"));
                WEC_ACTIVITY activity= BLLTable<WEC_ACTIVITY>.GetRowData(new WEC_ACTIVITY(),conf);
                activity.SCAN_NUM += 1;
                BLLTable<WEC_ACTIVITY>.Update(activity,WEC_ACTIVITY.Attribute.ID);
                
    %>
	<script src="./guaguaka_files/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var times = "<%=activity.NUMBER_TIMES%>";
            var all_play = "<%=detail.ALL_PLAY %>";
            var zjll="<%=isGet%>";
         
            if(zjll=="True"){
                zjl=true;
            }else{
                zjl=false;
            }
            if(zjl){
                
                 $("#zjl").removeAttr("style");
                 $("#scratchpad").attr("style", "display:none");
                 $("#desc").attr("style", "display:none");
            }
            else{
                if (times <= all_play) {
              
                    $("#ywl").removeAttr("style");
                      $("#scratchpad").attr("style", "display:none");
                    //$(".cover").attr("style","display:none");
                }
            }
           
           // alert(times + " " + all_play);
            <%  
                lottery();

             %>

        });
        function loading(canvas, options) {
            this.canvas = canvas;
            if (options) {
                this.radius = options.radius || 12;
                this.circleLineWidth = options.circleLineWidth || 4;
                this.circleColor = options.circleColor || 'lightgray';
                this.moveArcColor = options.moveArcColor || 'gray';
            } else {
                this.radius = 12;
                this.circelLineWidth = 4;
                this.circleColor = 'lightgray';
                this.moveArcColor = 'gray';
            }
        }
        loading.prototype = {
            show: function () {
                var canvas = this.canvas;
                if (!canvas.getContext) return;
                if (canvas.__loading) return;
                canvas.__loading = this;
                var ctx = canvas.getContext('2d');
                var radius = this.radius;
                var me = this;
                var rotatorAngle = Math.PI * 1.5;
                var step = Math.PI / 6;
                canvas.loadingInterval = setInterval(function () {
                    ctx.clearRect(0, 0, canvas.width, canvas.height);
                    var lineWidth = me.circleLineWidth;
                    var center = { x: canvas.width / 2, y: canvas.height / 2 };

                    ctx.beginPath();
                    ctx.lineWidth = lineWidth;
                    ctx.strokeStyle = me.circleColor;
                    ctx.arc(center.x, center.y + 20, radius, 0, Math.PI * 2);
                    ctx.closePath();
                    ctx.stroke();
                    //在圆圈上面画小圆   
                    ctx.beginPath();
                    ctx.strokeStyle = me.moveArcColor;
                    ctx.arc(center.x, center.y + 20, radius, rotatorAngle, rotatorAngle + Math.PI * .45);
                    ctx.stroke();
                    rotatorAngle += step;

                }, 100);
            },
            hide: function () {
                var canvas = this.canvas;
                canvas.__loading = false;
                if (canvas.loadingInterval) {
                    window.clearInterval(canvas.loadingInterval);
                }
                var ctx = canvas.getContext('2d');
                if (ctx) ctx.clearRect(0, 0, canvas.width, canvas.height);
            }
        };
    </script>
    <script>
        
    
    </script>


    <script src="./guaguaka_files/wScratchPad.js"></script>
    <div class="main">
            <div class="cover">
            <img src="./guaguaka_files/activity-scratch-card-bannerbg.png"> 
            <div id="prize"></div><div id="scratchpad">
            <div style="position: relative; width: 150px; height: 40px; cursor: default; ">
            <canvas width="150" height="40" style="cursor: default;"></canvas>
            </div>
            </div>        
            </div>
	    
         <div class="content">
            
            <div id="ywl" style="display: none" class="boxcontent boxwhite">
                <div class="box">
                    <div class="title-red"><span>你的抽奖机会已经用完了</span></div>
                  </div>
                
            </div>

        <div class="content">
            
            <div id="zjl" style="display: none" class="boxcontent boxwhite">
                <div class="box">
                    <div class="title-red"><span>恭喜你中奖了</span></div>
                    <div class="Detail">
                        <p>你中了：<span class="red"><%=info %></span></p>
                        <p>兑奖SN码：<span class="red" id="sncode"><%=sn_code%></span></p>
						                                                <p class="red"><%=activity.INFORMATION %></p>
                                                <p>
                        <%
                            if (phone == null || phone.Equals(""))
                            {
                                 
                             %>
                        <input name="" class="px" id="tel" value="" type="text" placeholder="用户请输入您的手机号">
                        </p>
                        <p>
                        </p><p>
                            <input class="pxbtn" name="提 交" id="save-btn" type="button" value="用户提交">
                        </p>
                        <%
                            }
                            else
                            {
                                 %>

                                <div>你提交的手机号码为：<%=phone %>,请耐心等待工作人员联系</div>
                                 <%
                            } %>
                                                                       <p>

                                                                    </div>
                  <!--  <div class="Detail">
                        <p>你中了：<span class="red">一等奖</span></p>
                        <p>兑奖SN码：<span class="red" id="Span1">080731995610087932</span></p>
                        <p class="red">请在下方提交你的手机号，方便我们联系你兑奖!兑奖请联系我们，电话18950099999</p>

                        <p class="red">中奖者手机号：144444 </p>
                        <p>
                    </div>-->
                </div>
                
            </div>
              
            <div class="boxcontent boxwhite">
                <div class="box">
                    <div class="title-red"><span>奖项设置：</span></div>
                    <div class="Detail">
                        <% 
                           
                            string[] name1=new string[]{activity.TYPE_ONE,activity.TYPE_TWO,activity.TYPE_THREE,activity.TYPE_FOUR,activity.TYPE_FIVE,activity.TYPE_SIX};
                            string[] name2 = new string[] { activity.NAME_ONE,activity.NAME_TWO,activity.NAME_THREE,activity.NAME_FOUR,activity.NAME_FIVE,activity.NAME_SIX};
                            int[] name3 = new int[] { activity.NUM_ONE,activity.NUM_TWO,activity.NUM_THREE,activity.NUM_FOUR,activity.NUM_FIVE,activity.NUM_SIX};
                            for (int i = 0; i < 6;i++ )
                           {
                               if (name1[i] == null || name1[i].Equals(""))
                                   break;
                               %>
                         <p><%=name1[i]%>： <%=name2[i]%>。数量：<%=name3[i]%></p>                        
              
                        <%}
                           
                            
                            %>
                    </div>
                </div>
            </div>
              <div class="boxcontent boxwhite" id="desc">
                <div class="box">
                    <div class="title-red">活动说明：</div>
                    <div class="Detail">
                        <p class="red">本次活动总共可以刮<%=activity.NUMBER_TIMES %>次,你已经刮了<%=detail.ALL_PLAY%>次,机会如果没用完重新进入本页面可以再刮! 如果已中奖，则不可再刮！</p>
                        <p><%=activity.INFO %>  </p>
                    </div>
                </div>
            </div>
                    </div>
        <div style="clear: both;"></div>
    </div>
    <script src="./guaguaka_files/alert(1).js"></script><style type="text/css">

.window {
	width:290px;
	position:absolute;
	display:none;
	bottom:30px;
	left:50%;
	 z-index:9999;
	margin:-50px auto 0 -145px;
	padding:2px;
	border-radius:0.6em;
	-webkit-border-radius:0.6em;
	-moz-border-radius:0.6em;
	background-color: #ffffff;
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	-o-box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	font:14px/1.5 Microsoft YaHei,Helvitica,Verdana,Arial,san-serif;
}
.window .title {
	
	background-color: #A3A2A1;
	line-height: 26px;
    padding: 5px 5px 5px 10px;
	color:#ffffff;
	font-size:16px;
	border-radius:0.5em 0.5em 0 0;
	-webkit-border-radius:0.5em 0.5em 0 0;
	-moz-border-radius:0.5em 0.5em 0 0;
	background-image: -webkit-gradient(linear, left top, left bottom, from( #585858 ), to( #565656 )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient(#585858, #565656); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient(#585858, #565656); /* FF3.6 */
	background-image:     -ms-linear-gradient(#585858, #565656); /* IE10 */
	background-image:      -o-linear-gradient(#585858, #565656); /* Opera 11.10+ */
	background-image:         linear-gradient(#585858, #565656);
	
}
.window .content {
	/*min-height:100px;*/
	overflow:auto;
	padding:10px;
	background: linear-gradient(#FBFBFB, #EEEEEE) repeat scroll 0 0 #FFF9DF;
    color: #222222;
    text-shadow: 0 1px 0 #FFFFFF;
	border-radius: 0 0 0.6em 0.6em;
	-webkit-border-radius: 0 0 0.6em 0.6em;
	-moz-border-radius: 0 0 0.6em 0.6em;
}
.window #txt {
	min-height:30px;font-size:16px; line-height:22px;
}
.window .txtbtn {
	
	background: #f1f1f1;
	background-image: -webkit-gradient(linear, left top, left bottom, from( #DCDCDC ), to( #f1f1f1 )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #ffffff , #DCDCDC ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #ffffff , #DCDCDC ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #ffffff , #DCDCDC ); /* IE10 */
	background-image:      -o-linear-gradient( #ffffff , #DCDCDC ); /* Opera 11.10+ */
	background-image:         linear-gradient( #ffffff , #DCDCDC );
	border: 1px solid #CCCCCC;
	border-bottom: 1px solid #B4B4B4;
	color: #555555;
	font-weight: bold;
	text-shadow: 0 1px 0 #FFFFFF;
	border-radius: 0.6em 0.6em 0.6em 0.6em;
	display: block;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	text-overflow: ellipsis;
	white-space: nowrap;
	cursor: pointer;
	text-align: windowcenter;
	font-weight: bold;
	font-size: 18px;
	padding:6px;
	margin:10px 0 0 0;
}
.window .txtbtn:visited {
	background-image: -webkit-gradient(linear, left top, left bottom, from( #ffffff ), to( #cccccc )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #ffffff , #cccccc ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #ffffff , #cccccc ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #ffffff , #cccccc ); /* IE10 */
	background-image:      -o-linear-gradient( #ffffff , #cccccc ); /* Opera 11.10+ */
	background-image:         linear-gradient( #ffffff , #cccccc );
}
.window .txtbtn:hover {
	background-image: -webkit-gradient(linear, left top, left bottom, from( #ffffff ), to( #cccccc )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #ffffff , #cccccc ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #ffffff , #cccccc ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #ffffff , #cccccc ); /* IE10 */
	background-image:      -o-linear-gradient( #ffffff , #cccccc ); /* Opera 11.10+ */
	background-image:         linear-gradient( #ffffff , #cccccc );
}
.window .txtbtn:active {
	background-image: -webkit-gradient(linear, left top, left bottom, from( #cccccc ), to( #ffffff )); /* Saf4+, Chrome */
	background-image: -webkit-linear-gradient( #cccccc , #ffffff ); /* Chrome 10+, Saf5.1+ */
	background-image:    -moz-linear-gradient( #cccccc , #ffffff ); /* FF3.6 */
	background-image:     -ms-linear-gradient( #cccccc , #ffffff ); /* IE10 */
	background-image:      -o-linear-gradient( #cccccc , #ffffff ); /* Opera 11.10+ */
	background-image:         linear-gradient( #cccccc , #ffffff );
	border: 1px solid #C9C9C9;
	border-top: 1px solid #B4B4B4;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3) inset;
}

.window .title .close {
	float:right;
	background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACTSURBVEhL7dNtCoAgDAZgb60nsGN1tPLVCVNHmg76kQ8E1mwv+GG27cestQ4PvTZ69SFocBGpWa8+zHt/Up+IN+MhgLlUmnIE1CpBQB2COZibfpnXhHFaIZkYph0SOeeK/QJ8o7KOek84fkCWSBtfL+Ny2MPpCkPFMH6PWEhWhKncIyEk69VfiUuVhqJefds+YcwNbEwxGqGIFWYAAAAASUVORK5CYII=");
	width:26px;
	height:26px;
	display:block;	
}
</style>
<div class="window" id="windowcenter">
	<div id="title" class="title">消息提醒<span class="close" id="alertclose"></span></div>
	<div class="content">
	 <div id="txt"></div>
	 <input type="button" value="确定" id="windowclosebutton" name="确定" class="txtbtn">	
	</div>
</div>


    <script type="text/javascript">
        //window.sncode = "null啊";
        //window.prize = "谢谢参与呵呵";
        //alert("aaaaaa");
        var zjl =false;//没中奖为false中奖为true 
        var num = 0;
        var goon = true;
        var info="";
        $(function () {
        zjll="<%=isGet%>";
        //alert(zjll);
        if(zjll=="True"){
            zjl=true;
        }else{
            zjl=false;
        }
       
        if(zjl==true){
         info="<%=info%>";

        }else{
            info="谢谢参与";
        }
		var useragent = window.navigator.userAgent.toLowerCase();
            $("#scratchpad").wScratchPad({
                width: 150,
                height: 40,
                color: "#a9a9a7",
                scratchMove: function () {
                    num++;
                    
                    if (num == 2) {
                        document.getElementById('prize').innerHTML = info;
                        <%
                              detail.ALL_PLAY += 1;
                              if(detail.ALL_PLAY>activity.NUMBER_TIMES){
                              }else{
                                  BLLTable<WEC_USER_ACTIVITY_DETAIL>.Update(detail,WEC_USER_ACTIVITY_DETAIL.Attribute.ID);
                                  activity.JOIN_NUM += 1;
                                 BLLTable<WEC_ACTIVITY>.Update(activity,WEC_ACTIVITY.Attribute.ID);
                             }
                         %>
                    }
                    if (zjl && num > 5 && goon) {
                        //$("#zjl").fadeIn();
                        goon = false; 
                        //$("#zjl").slideToggle(500);
                        $("#zjl").removeAttr("style");
                        //$("#outercont").slideUp(500)
                    }
					if (useragent.indexOf("android 4") > 0) {
                        if ($("#scratchpad").css("color").indexOf("51") > 0) {
                            $("#scratchpad").css("color", "rgb(50,50,50)");
                        } else if ($("#scratchpad").css("color").indexOf("50") > 0) {
                            $("#scratchpad").css("color", "rgb(51,51,51)");
                        }
                    }

                }
            });

            //$("#prize").html("谢谢参与");
            //loadingObj.hide();
            //$(".loading-mask").remove();
        });

        $("#save-btn").bind("click",
        function () {
            var btn = $(this);
            var tel = $("#tel").val();
            if (tel == '') {
                alert("请输入手机号");
                return
            }

            var submitData = {
                    a_id:"<%=a_id%>",
                   code: $("#sncode").text(),
                   tel: tel,
                   open_id:'<%=open_id%>',
                   kind:'1'
            };
            $.post('../WEC_ACTIVITY_SNCODE/WEC_ACTIVITY_SNCODESave.aspx', submitData,
            function (data) {
             //alert(aaaaa);
               location.reload();
            },
            "text");
        });

        $("#save-btnn").bind("click",
        function () {
            //var btn = $(this);
            var submitData = {
            	 id: 21861,
                 code: $("#sncode").text(),
                 sdid: 207595,
                 parssword: $("#parssword").val(),
                 Confirm_pwd : '12',
                 fromUsername:'oWKVbt8s-eF1Hjxs-iUykz5mDvp0',
                 tk:'4a12207616277f4cc516383a02e07870'
            };
            $.post('/activity/AddCard', submitData,
            function (data) {
                if (data.success == true) {
                    alert(data.msg);
                    if (data.changed == true) {
                        window.location.href = location.href;
                    }
                    return
                } else { }
            },
            "json")
        });
                document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
        window.shareData = {  
            "imgUrl": "http://stc.shengyt.com/img/web_bb/activity/activity-scratch-card-start.jpg", 
            "timeLineLink": "http://www.shengyt.com/activity/ScratchCard?id=21861&bid=207595&pid=105588&wechatid=fromUsername&v=4a12207616277f4cc516383a02e07870",
            "sendFriendLink": "http://www.shengyt.com/activity/ScratchCard?id=21861&bid=207595&pid=105588&wechatid=fromUsername&v=4a12207616277f4cc516383a02e07870",
            "weiboLink": "http://www.shengyt.com/activity/ScratchCard?id=21861&bid=207595&pid=105588&wechatid=fromUsername&v=4a12207616277f4cc516383a02e07870",
            "tTitle": "刮刮卡活动开始了",
            "tContent": "亲，请点击进入刮刮卡页面，快来参加活动吧！~",
            "fTitle": "刮刮卡活动开始了",
            "fContent": "亲，请点击进入刮刮卡页面，快来参加活动吧！~",
            "wContent": "亲，请点击进入刮刮卡页面，快来参加活动吧！~" 
        };
        // 发送给好友
        WeixinJSBridge.on('menu:share:appmessage', function (argv) {
            WeixinJSBridge.invoke('sendAppMessage', { 
                "img_url": window.shareData.imgUrl,
                "img_width": "640",
                "img_height": "640",
                "link": window.shareData.sendFriendLink,
                "desc": window.shareData.fContent,
                "title": window.shareData.fTitle
            }, function (res) {
                _report('send_msg', res.err_msg);
            })
        });

        // 分享到朋友圈
        WeixinJSBridge.on('menu:share:timeline', function (argv) {
            WeixinJSBridge.invoke('shareTimeline', {
                "img_url": window.shareData.imgUrl,
                "img_width": "640",
                "img_height": "640",
                "link": window.shareData.timeLineLink,
                "desc": window.shareData.tContent,
                "title": window.shareData.tTitle
            }, function (res) {
                _report('timeline', res.err_msg);
            });
        });

        // 分享到微博
        WeixinJSBridge.on('menu:share:weibo', function (argv) {
            WeixinJSBridge.invoke('shareWeibo', {
                "content": window.shareData.wContent,
                "url": window.shareData.weiboLink,
            }, function (res) {
                _report('weibo', res.err_msg);
            });
        });
        }, false)
    </script>
    <footer style="text-align:center; color:#ffd800;margin-right:20px"><a href="http://www.shengyt.com/weisite/home?pid=105588&bid=207595&wechatid=oWKVbt8s-eF1Hjxs-iUykz5mDvp0&wxref=mp.weixin.qq.com">©个人介绍</a></footer>



<script type="text/javascript">
    (function () {
        var wtj = document.createElement('script'); wtj.type = 'text/javascript'; wtj.async = true;
        wtj.src = 'http://tj.shengyt.com/wtj.js?url=' + encodeURIComponent(location.href);
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(wtj, s);
    })();
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd80741dd59de91e1846b2add2c0ad2a2' type='text/javascript'%3E%3C/script%3E"));
    function shengytAfterShare(shareFromWechatId, sendFriendLink, shareToPlatform) {
        var wmShare = document.createElement('script'); wmShare.type = 'text/javascript'; wmShare.async = true;
        wmShare.src = 'http://' + getShareApiRouter() + '/api-share.js?fromWechatId=' + shareFromWechatId + '&shareToPlatform=';
        wmShare.src += shareToPlatform + '&pid=105588&sendFriendLink=' + encodeURIComponent(sendFriendLink);
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(wmShare, s);
    }
    function getShareApiRouter() {
        var str_domain = location.href.split('/', 4)[2];
        var tj_domain = '127.0.0.1';
        switch (str_domain) {
            case 'www.shengyt.com':
                tj_domain = 'tj.shengyt.com';
                break;
            case '112.124.28.82':
                tj_domain = '112.124.28.82:400';
                break;
        }
        return tj_domain;
    }
    if (typeof (window.shareData) == 'undefined') {
        window.shareData = {
            "imgUrl": "",
            "timeLineLink": "http://www.shengyt.com/activity/ScratchCard?_tj_twtype=11&_tj_pid=105588&_tt=1&_tj_graphicid=21861&_tj_title=%E5%88%AE%E5%88%AE%E5%8D%A1%E6%B4%BB%E5%8A%A8%E5%BC%80%E5%A7%8B%E4%BA%86&_tj_keywords=%E5%88%AE%E5%88%AE%E5%8D%A12&id=21861&bid=207595&wechatid=fromUsername&pid=105588&v=4a12207616277f4cc516383a02e07870",
            "sendFriendLink": "http://www.shengyt.com/activity/ScratchCard?_tj_twtype=11&_tj_pid=105588&_tt=1&_tj_graphicid=21861&_tj_title=%E5%88%AE%E5%88%AE%E5%8D%A1%E6%B4%BB%E5%8A%A8%E5%BC%80%E5%A7%8B%E4%BA%86&_tj_keywords=%E5%88%AE%E5%88%AE%E5%8D%A12&id=21861&bid=207595&wechatid=fromUsername&pid=105588&v=4a12207616277f4cc516383a02e07870",
            "weiboLink": "http://www.shengyt.com/activity/ScratchCard?_tj_twtype=11&_tj_pid=105588&_tt=1&_tj_graphicid=21861&_tj_title=%E5%88%AE%E5%88%AE%E5%8D%A1%E6%B4%BB%E5%8A%A8%E5%BC%80%E5%A7%8B%E4%BA%86&_tj_keywords=%E5%88%AE%E5%88%AE%E5%8D%A12&id=21861&bid=207595&wechatid=fromUsername&pid=105588&v=4a12207616277f4cc516383a02e07870",
            "tTitle": document.title,
            "tContent": document.title,
            "fTitle": document.title,
            "fContent": document.title,
            "wContent": document.title
        }
    }
    document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
        // 发送给好友
        WeixinJSBridge.on('menu:share:appmessage', function (argv) {
            WeixinJSBridge.invoke('sendAppMessage', {
                "img_url": window.shareData.imgUrl,
                "img_width": "640",
                "img_height": "640",
                "link": window.shareData.sendFriendLink,
                "desc": window.shareData.fContent,
                "title": window.shareData.fTitle
            }, function (res) {
                shengytAfterShare("oWKVbt8s-eF1Hjxs-iUykz5mDvp0", window.shareData.sendFriendLink, 'appmessage');
                _report('send_msg', res.err_msg);
            })
        });

        // 分享到朋友圈
        WeixinJSBridge.on('menu:share:timeline', function (argv) {
            WeixinJSBridge.invoke('shareTimeline', {
                "img_url": window.shareData.imgUrl,
                "img_width": "640",
                "img_height": "640",
                "link": window.shareData.timeLineLink,
                "desc": window.shareData.tContent,
                "title": window.shareData.tTitle
            }, function (res) {
                //shengytAfterShare("oWKVbt8s-eF1Hjxs-iUykz5mDvp0",window.shareData.timeLineLink,'timeline');
                _report('timeline', res.err_msg);
            });
        });

        // 分享到微博
        WeixinJSBridge.on('menu:share:weibo', function (argv) {
            WeixinJSBridge.invoke('shareWeibo', {
                "content": window.shareData.wContent,
                "url": window.shareData.weiboLink
            }, function (res) {
                shengytAfterShare("oWKVbt8s-eF1Hjxs-iUykz5mDvp0", window.shareData.weiboLink, 'weibo');
                _report('weibo', res.err_msg);
            });
        });
    }, false);
</script><script src="./guaguaka_files/h.js" type="text/javascript"></script>
<script type="text/javascript" src="./guaguaka_files/ChatFloat.js"></script>
<script type="text/javascript">
    var str_domain = location.href.split('/', 4)[2];
    var boolIsTest = true;
    if (str_domain == 'www.shengyt.com') {
        boolIsTest = false;
    }
    new ChatFloat({
        AId: '105588',
        openid: "oWKVbt8s-eF1Hjxs-iUykz5mDvp0",
        top: 150,
        right: 0,
        IsTest: boolIsTest
    });
</script>

</body></html>
