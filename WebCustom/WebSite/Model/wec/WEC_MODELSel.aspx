<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true"
    CodeFile="WEC_MODELSel.aspx.cs" Inherits="WEC_MODELSel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <base target="_self" />
    <script type="text/javascript">
        var manager = new ListManager({ listCID: "tblist" });
        $(function () {
            manager.initBodyRows(); Sel_Load();
        });

        function selThis_B(tds) {
            var tdObj = $(tds[0]);
            var aObj = tdObj.find("a");
            if (aObj.length > 0) {
                _selERR = "不能选择有子节点的数据！";
                _selOK = false;
            }
        }
        function selOK_B(id) {
            //alert(id);
            $("input[id$='hidSelID']").val(id);
            //alert($("input[id$='hidSelID']").val());
            __doPostBack("ctl00$cphBody$LinkButton1", "");
        }
    </script>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="bootstrap_min.css" media="all">
    <link rel="stylesheet" type="text/css" href="bootstrap_responsive_min.css" media="all">
    <link rel="stylesheet" type="text/css" href="style.css" media="all">
    <link rel="stylesheet" type="text/css" href="themes.css" media="all">
    <link rel="stylesheet" type="text/css" href="todc_bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="inside.css" media="all">
    <link rel="stylesheet" type="text/css" href="official.css" media="all">
    <script type="text/javascript" src="<%=appPath %>"lib/JQuery/jquery.min.js"></script>

    <style type="text/css">
        .dropdown-submenu:hover > .dropdown-menu
        {
            display: none;
        }
    </style>
          <script>
              $(function () {//模板选择
                  $("div.tab-pane input[type='radio']").click(function () {
                      var $this = $(this), $key = $this.attr("name"), $value = $this.val();
                      var _pli = $this.parents("li");
                      _pli.siblings().removeClass("active")
                      _pli.addClass("active");
                      $.post('column.aspx?aid=<%=aid %>', { key: $key, value: $value }, function (rs) {
                      }, 'json');
                  })
              })
              
</script>
        <script>
            window.document.onkeydown = function (e) {
                if ('' == document.activeElement.id) {
                    var e = e || event;
                    var currKey = e.keyCode || e.which || e.charCode;
                    if (8 == currKey) {
                        return false;
                    }
                }
            };
	</script>
        <script type="text/javascript">
            $(function () {
                $("ul.nav-tabs li a").click(function () {
                    var $this = $(this)
                    var _li = $this.parents("li");
                    _li.siblings().removeClass("active");
                    _li.addClass("active");
                                 $("div.tab-pane ul.cateradio").removeClass("unstyled");
                                 $("div.tab-pane").removeClass("active");
                                 $("div.tab-pane").removeClass("in");
                                 $($this.attr("href")).addClass("active");
                                 $($this.attr("href")).addClass("in");
                    //$("div.tab-pane").find($this.attr("href")).addClass("in");
                                 $($this.attr("href")).children(".cateradio").addClass("unstyled");
                                

                })
            })

            
</script>
    <script charset="utf-8" src="v.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <input id="hidCondition" type="hidden" runat="server" />
    <body>
        <div id="main">
            <div class="container-fluid">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="box">
                       <%--网页浏览--%>
                            <div class="box-title">
                                <div class="span12">
                                    <h3>
                                        <i class="icon-edit"></i>模板管理</h3>
                                    <a class="btn preview pull-right btn-success" href="javascript:;">模板预览</a>
                                    <script type="text/javascript">
                                        $("a.preview").click(function () {
                                            if ($.browser.msie) {
                                                alert("不支持在IE浏览器下预览，建议使用谷歌浏览器或者360极速浏览器或者直接在微信上预览。");
                                                return;
                                            }
                                            var left = ($(window.parent.parent).width() - 450) / 2;
                                            window.open("/site/WECWebsite/Home.aspx?aid=<%=aid %>", "我的微官网", "height=650,width=450,top=0,left=" + left + ",toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
                                        });
								</script>
                                </div>
                            </div>
                       <%--选项卡--%>
                            <div class="box-content">
                                <ul class="nav nav-tabs"> 
                                <%=ordervalue %>
                                  <%--  <li class="active"><a href="#column"  data-toggle="tab" >栏目首页模板风格</a></li>
                                    <li><a href="#channel"  data-toggle="tab">频道模板风格</a></li>
                                    <li><a href="#list" data-toggle="tab">图文列表模板风格</a></li>
                                    <li><a href="#detailed" data-toggle="tab">图文详细页模板</a></li>
                                    <li><a href="#menu" data-toggle="tab">菜单导航模板</a></li>--%>
                                </ul>
                            </div>
                       <%--下面页面--%>
                            <div class="tab-content">
                            <%=mainvalue %>
                           <%-- //完整--%>
                             <%--   <div class="tab-pane fade active in" id="column">
                                    <ul class="cateradio unstyled">
                                        <li class="free" style="margin-left: 70px;">
                                            <label>
                                                <img  style="margin-left: -70px;" src="http://stc.shengyt.com/img/template/home-13.png?v=7" alt="TOP1" title="TOP1">
                                                <input type="radio" name="home" value="13">
                                                <span style="font-weight: bold;">TOP1</span>
                                            </label>
                                        </li>
                                        <li class="">
                                            <div class="mbtip">
                                                图标式模板，背景在微官网的首页幻灯片里添加，建议尺寸为960*640或近似等比例图；分类图标请选择系统图标。</div>
                                            <label>
                                                <img src="http://stc.shengyt.com/img/template/home-38.png?v=7" alt="TOP2" title="TOP2">
                                                <input type="radio" name="home" value="38" >
                                                <span style="font-weight: bold;">TOP2</span>
                                                <div style="padding: 5px 0px 10px;">
                                                    行业热度：<span style="color: red;"><i class="icon-star"></i><i class="icon-star"></i><i
                                                        class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span>
                                                </div>
                                            </label>
                                        </li>
                                        <li class="free">
                                            <div class="mbtip">
                                                左右图文式模版，顶部幻灯片建议使用尺寸为640*320或近似等比例图片；分类图片建议使用450*300或近似等比例图片，请不要使用高度大于或接近于宽度的图片。</div>
                                            <label>
                                                <img src="http://stc.shengyt.com/img/template/home-3.png?v=7" alt="TOP3" title="TOP3">
                                                <input type="radio" name="home" value="3">
                                                <span style="font-weight: bold;">TOP3</span>
                                            </label>
                                        </li>
                                        <li class="">
                                           <label>
                                                <img src="http://stc.shengyt.com/img/template/home-32.png?v=7" alt="TOP4" title="TOP4">
                                                <input type="radio" name="home" value="32" >
                                                <span style="font-weight: bold;">TOP4</span>
                                            </label>
                                        </li>
                                        <li class="active free">
                                            <label>
                                                <img src="http://stc.shengyt.com/img/template/home-16.png?v=7" alt="TOP5" title="TOP5">
                                                <input type="radio" name="home" value="16" checked="checked">
                                                <span style="font-weight: bold;">TOP5</span>
                                            </label>
                                        </li>
                                        <li class="">
                                            <div class="mbtip">
                                                图标式模版，顶部幻灯片建议使用尺寸为640*320或近似等比例图片；分类图片请使用正方形尺寸的图片。</div>
                                           <label>
                                                <img src="http://stc.shengyt.com/img/template/home-28.png?v=7" alt="TOP6" title="TOP6">
                                                <input type="radio" name="home" value="28" >
                                                <span style="font-weight: bold;">TOP6</span>
                                            </label>
                                        </li>
                                        <li class="">
                                            <div class="mbtip">
                                                图标式模版，顶部幻灯片建议使用尺寸为640*320或近似等比例图片；分类图片请使用正方形尺寸的图片。</div>
                                             <label>  
                                                <img src="http://stc.shengyt.com/img/template/home-26.png?v=7" alt="TOP7" title="TOP7">
                                                <input type="radio" name="home" value="26" >
                                                <span style="font-weight: bold;">TOP7</span>
                                            </label>
                                        </li>
                                        <li class="">
                                            <label>
                                                <img src="http://stc.shengyt.com/img/template/home-39.png?v=7" alt="TOP8" title="TOP8">
                                                <input type="radio" name="home" value="39" >
                                                <span style="font-weight: bold;">TOP8</span>
                                                <div style="padding: 5px 0px 10px;">
                                                    行业热度：<span style="color: red;"><i class="icon-star"></i><i class="icon-star"></i><i
                                                        class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span>
                                                </div>
                                            </label>
                                        </li>
                                        <li class="">
                                           <label>
                                                <img src="http://stc.shengyt.com/img/template/home-14.png?v=7" alt="TOP9" title="TOP9">
                                                <input type="radio" name="home" value="14" >
                                                <span style="font-weight: bold;">TOP9</span>
                                            </label>
                                        </li>
                                        <li class="">
                                            <label>
                                                <img src="http://stc.shengyt.com/img/template/home-17.png?v=7" alt="TOP10" title="TOP10">
                                                <input type="radio" name="home" value="17" >
                                                <span style="font-weight: bold;">TOP10</span>
                                            </label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="channel">
                                    <ul class="cateradio">
                                        <li>
                                            <label>
                                                <img src="./home-65.png" alt="模板0" title="模板0">
                                                <input type="radio" name="channel" value="home-65">频道0
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <img src="./home-64.png" alt="模板1" title="模板1">
                                                <input type="radio" name="channel" value="home-64">频道1
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                                图标式模版，顶部幻灯片建议使用尺寸为640*320或近似等比例图片；分类图片请使用正方形尺寸的图片。</div>
                                            <label>
                                                <img src="./home-28.png" alt="模板2" title="模板2">
                                                <input type="radio" name="channel" value="home-28">频道2
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="home-13.png" alt="模板3" title="模板3">
                                                <input type="radio" name="channel" value="home-13">频道3
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="home-14.png" alt="模板4" title="模板4">
                                                <input type="radio" name="channel" value="home-14">频道4
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                                左右双栏模版，顶部幻灯片尺寸为640*320或近似等比例图片，如使用正方形图片会使得页面不美观；分类图片建议使用300*200或近似等比例图片，使用宽度小于高度的(如200*300)尺寸图片将使页面惨不忍睹。</div>
                                            <label>
                                                <img src="home-0.png" alt="模板5" title="模板5">
                                                <input type="radio" name="channel" value="home-0">频道5
                                            </label>
                                        </li>
                                        <li class="active">
                                            <div class="mbtip">
                                                左右双栏模版，顶部幻灯片建议使用尺寸为640*320或近似等比例图片；分类图片建议使用300*300或近似等比例图片。</div>
                                            <label>
                                                <img src="home-2.png" alt="模板6" title="模板6">
                                                <input type="radio" name="channel" value="home-2" checked="checked">频道6
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                                图标式模版，顶部幻灯片建议使用尺寸为640*320或近似等比例图片；分类图片请使用系统提供的图标。</div>
                                            <label>
                                                <img src="home-4.png" alt="模板7" title="模板7">
                                                <input type="radio" name="channel" value="home-4">频道7
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                                图标式模版，顶部幻灯片建议使用尺寸为640*320或近似等比例图片；分类图片请使用系统提供的图标。</div>
                                            <label>
                                                <img src="home-23.png" alt="模板8" title="模板8">
                                                <input type="radio" name="channel" value="home-23">频道8
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <img src="home-29.png" alt="模板9" title="模板9">
                                                <input type="radio" name="channel" value="home-29">频道9
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <img src="home-15.png" alt="模板10" title="模板10">
                                                <input type="radio" name="channel" value="home-15">频道10
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <img src="home-16.png" alt="模板11" title="模板11">
                                                <input type="radio" name="channel" value="home-16">频道11
                                            </label>
                                        </li>
                                        <li>
                                            <label>
                                                <img src="home-1.png" alt="模板12" title="模板12">
                                                <input type="radio" name="channel" value="home-1">频道12
                                            </label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="list">
                                    <ul class="cateradio">
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-12.png" alt="模板0" title="模板0">
                                                <input type="radio" name="list" value="12">列表0
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-11.png" alt="模板1" title="模板1">
                                                <input type="radio" name="list" value="11">列表1
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-10.png" alt="模板2" title="模板2">
                                                <input type="radio" name="list" value="10">列表2
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-9.png" alt="模板3" title="模板3">
                                                <input type="radio" name="list" value="9">列表3
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-8.png" alt="模板4" title="模板4">
                                                <input type="radio" name="list" value="8">列表4
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-2.png" alt="模板5" title="模板5">
                                                <input type="radio" name="list" value="2">列表5
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-1.png" alt="模板6" title="模板6">
                                                <input type="radio" name="list" value="1">列表6
                                            </label>
                                        </li>
                                        <li class="active">
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-0.png" alt="模板7" title="模板7">
                                                <input type="radio" name="list" value="0" checked="checked">列表7
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-3.png" alt="模板8" title="模板8">
                                                <input type="radio" name="list" value="3">列表8
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-4.png" alt="模板9" title="模板9">
                                                <input type="radio" name="list" value="4">列表9
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-5.png" alt="模板10" title="模板10">
                                                <input type="radio" name="list" value="5">列表10
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-6.png" alt="模板11" title="模板11">
                                                <input type="radio" name="list" value="6">列表11
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="list-7.png" alt="模板12" title="模板12">
                                                <input type="radio" name="list" value="7">列表12
                                            </label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="detailed">
                                    <ul class="cateradio">
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="detail-5.png" alt="模板5" title="模板5">
                                                <input type="radio" name="detail" value="5">详情5
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="detail-4.png" alt="模板4" title="模板4">
                                                <input type="radio" name="detail" value="4">详情4
                                            </label>
                                        </li>
                                        <li class="active">
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="detail-0.png" alt="模板0" title="模板0">
                                                <input type="radio" name="detail" value="0" checked="checked">详情0
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="detail-1.png" alt="模板1" title="模板1">
                                                <input type="radio" name="detail" value="1">详情1
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="detail-2.png" alt="模板2" title="模板2">
                                                <input type="radio" name="detail" value="2">详情2
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="detail-3.png" alt="模板3" title="模板3">
                                                <input type="radio" name="detail" value="3">详情3
                                            </label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu">
                                    <ul class="cateradio">
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="menu-7.png" alt="模板7" title="模板7">
                                                <input type="radio" name="menu" value="7">详情0
                                            </label>
                                        </li>
                                        <li class="active">
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="menu-4.png" alt="模板4" title="模板4">
                                                <input type="radio" name="menu" value="4" checked="checked">详情1
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="menu-5.png" alt="模板5" title="模板5">
                                                <input type="radio" name="menu" value="5">详情2
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="menu-6.png" alt="模板6" title="模板6">
                                                <input type="radio" name="menu" value="6">详情3
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="menu-0.png" alt="模板0" title="模板0">
                                                <input type="radio" name="menu" value="0">详情4
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="menu-1.png" alt="模板1" title="模板1">
                                                <input type="radio" name="menu" value="1">详情5
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="menu-2.png" alt="模板2" title="模板2">
                                                <input type="radio" name="menu" value="2">详情6
                                            </label>
                                        </li>
                                        <li>
                                            <div class="mbtip">
                                            </div>
                                            <label>
                                                <img src="menu-3.png" alt="模板3" title="模板3">
                                                <input type="radio" name="menu" value="3">详情7
                                            </label>
                                        </li>
                                    </ul>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="fallr-overlay">
        </div>
    </body>
</asp:Content>
