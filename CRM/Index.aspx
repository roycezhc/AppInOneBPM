<%@ Page Language="C#" AutoEventWireup="true" Inherits="CRM_Index" CodeFile="Index.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Themes/Main/Index.css" rel="stylesheet" type="text/css" />
    <script src="../Lib/JQuery/jquery.min.js" type="text/javascript"></script>
    <script src="../Themes/Main/index.js" type="text/javascript"></script>
    <script type="text/javascript">
        function setA_indexUrl(url) {
            var src1 = document.getElementById("a_index");
            src1.src = url;
        }

        $(function () {
//            var aObjs = $("#left").find("li").find("a");
//            aObjs.each(function (i) {
//                $(this).bind("click", $(this), function (e) {
//                    parent.addLinkToTab(e.data);
//                    return false;
//                });
//            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="index">
    <div id="main">
        <div id="left">
           <dl><dt></dt><dd>创建</dd></dl>
           <ul>
             <li id="li_AddNewCust" runat="server" class="gzrz"><a href="AddNewCust.aspx" data="{key:'addcust'}">新建客户</a></li>
             
           </ul>

           <dl><dt></dt><dd>客户管理</dd></dl>
           <ul class="list1">
                <li class="gzrz"><a href="CustHighSeas.aspx" data="{key:'kehuguanli'}">公海客户</a></li>
                <li class="gzrz"><a href="CustomerInformationManagement.aspx?show=1" data="{key:'wodekehu'}">我的客户</a></li>
                <li class="gzrz" style="display:none;"><a href="CustomerInformationManagement.aspx?show=2" data="{key:'kehuguanli'}">今日需联系客户</a></li>
                <li class="gzrz" style="display:none;"><a href="CustomerInformationManagement.aspx?show=3" data="{key:'kehuguanli'}">将过期客户</a></li>
                <li class="gzrz" style="display:none;"><a href="CusNew.aspx" data="{key:'kehuguanli'}">所有最最重要客户</a></li>
                <li class="gzrz" style="display:none;"><a href="CusNew.aspx" data="{key:'kehuguanli'}">所有客户</a></li>
           </ul>  
           <dl style=" display:none;"><dt></dt><dd>最近查看的</dd></dl>
           <ul class="list2" style=" display:none;">             
             <li><a href="#" target="_blank">客户蒙娜丽莎</a></li>
             <li><a href="#" target="_blank">客户王志坚</a></li>
             <li><a href="#" target="_blank">任务送资料</a></li>
           </ul>        
           <dl style=" display:none;"><dt></dt><dd>常用导航</dd></dl>
           <ul class="list2" style=" display:none;">             
             <li><a href="#" target="_blank">研发产品管理</a></li>             
             <li><a href="#" target="_blank">财务管理</a></li>
           </ul>
        </div>
        <div id="right">
           <div id="tabs">
            <ul>
               <li class="sel"><a href="Main.aspx" class="home" data="{key:'a_index'}">首页</a></li>
            </ul>
            <div id="tabMore">
               <b></b>
               <ol></ol>
            </div>
           </div>
          <div id="divFrames">
            <iframe id="a_index" name="ifrMain" src="Main.aspx" frameborder="0" scrolling="auto" ></iframe>
          </div>
        </div>
        <div class="clear"></div>
    </div>
    </div>
    </form>
</body>
</html>
