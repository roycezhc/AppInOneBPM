<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WEC_HELPER.aspx.cs" Inherits="WECAdmin_WebSite_Help_WEC_HELPER" %>
<%@Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@Import Namespace="AgileFrame.Orm.PersistenceLayer.BLL"%>
<%@Import Namespace="AgileFrame.Orm.PersistenceLayer.BLL.Base"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="css/bootstrap_min.css" rel="stylesheet" type="text/css"/>
<link href="css/help.css" rel="stylesheet" type="text/css"/>
<link href="css/index.css" rel="stylesheet" type="text/css"/>
    <title></title>
</head>
<body style="width:auto;">
   <div id="top"></div><div id="page">
    <div class="title">微信生意通 产品使用指南（目 录）</div>
   <div id="menuList" class="z-catalog nslog-area log-set-param">
      <dl class="holder">
      <%--  <dd class="catalog-item">
          <p><span>1</span><a id="1">微盟简介</a><span id="weimob-video" onclick="playVideo(0);">▶查看视频教程</span></p>
           <ol>
              <li><span>1.1</span><a href="http://www.shengyt.com/site/help?help=1#1_1" rel="#1_1">什么是微盟</a></li>
              <li><span>1.2</span><a href="http://www.shengyt.com/site/help?help=1#1_2" rel="#1_2">企业为什么开通微信公众号</a></li>
              <li><span>1.3</span><a href="http://www.shengyt.com/site/help?help=1#1_3" rel="#1_3">微盟平台优势</a></li>
              <li><span>1.4</span><a href="http://www.shengyt.com/site/package" target="_blank" rel="#1_4">微盟套餐介绍</a></li>
              <li><span>1.5</span><a href="http://www.shengyt.com/site/help?help=1#1_5" rel="#1_5">微盟如何购买充值</a></li> 
          </ol>
        </dd>--%>
        <% for (int i=0; i < helps.Count;i++ )
           { %>
              <dd class="catalog-item">
              <p><span><%=i+1%></span><a id="1"><%=replace(helps[i].TITLE)%></a><span id="weimob-video" onclick="playVideo(0);">▶查看视频教程</span></p>
               <ol>
                   <%
                       WEC_HELPER conf=new WEC_HELPER();
                       conf.PID=helps[i].ID;
                       List<WEC_HELPER> subhelpers=BLLTable<WEC_HELPER>.Select(new WEC_HELPER(),conf);
                       for (int j = 0; j < subhelpers.Count;j++ )
                       { %>
                            <li><span><%=(i+1)+"."+(j+1) %></span><a href="<%="http://115.29.224.227/appinone/wecadmin/website/help/wec_helperdetail.aspx?subid="+subhelpers[j].ID%>" ><%=replace(subhelpers[j].TITLE)%></a></li>
                        <%} %>
              </ol>
            </dd>
        
        <%} %>
      </dl>
    </div>
</body>
</html>
