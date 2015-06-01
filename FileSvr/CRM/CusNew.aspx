<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Main/Base.master" AutoEventWireup="true" Inherits="PRCS_CusNew" CodeFile="CusNew.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="JS/detail.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="topnav">
  <dl><dt>当前位置：</dt><dd>
     <a>CRM系统</a><b></b><a>客户管里</a><b></b><a><strong>添加客户</strong></a>
  </dd></dl>
  <ul>
    <li><a href="CusList.aspx">返回</a></li>
  </ul>
</div>
<div class="form">
    <dl class="f-tit"><dt><a>基本信息</a></dt><dd><a></a></dd></dl>
    <dl><dt>客户名：</dt><dd>
        <input id="txtCustomer_Name" type="text"  runat="server"/>
    </dd></dl>
    <dl><dt>职位：</dt><dd>
        <input id="txtJob" type="text"  runat="server"/>
    </dd></dl>
    <dl class="f-tit"><dt><a>高级信息</a></dt><dd><em onclick="openMore(this);">+展开</em></dd></dl>
    <div style="display:none;">
    <dl><dt>描述：</dt><dd>
        <textarea id="txtRelationTxt" cols="120" rows="6" runat="server"></textarea>
    </dd></dl>
   </div>
   <dl class="f-btn"><dt></dt><dd>
      <a class="btn"><span><asp:Button ID="btnOK" runat="server" Text="确 定" onclick="btnOK_Click" /></span></a>
      <a class="btn"><span><input id="Reset1" type="reset" value="重新填写" /></span></a>
    </dd></dl>
</div>
</asp:Content>

