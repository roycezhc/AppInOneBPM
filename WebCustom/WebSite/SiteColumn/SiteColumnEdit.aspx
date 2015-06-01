<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SiteColumnEdit.aspx.cs" Inherits="Admin_WebSite_SiteColumn_SiteColumnEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
     $(function () {
         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
         var smImage = new creatSmImage('#btnPICURL', '#<%=txtPICURL.ClientID%>', '#<%=hidPICURL.ClientID%>');
         var smSmallImage = new creatSmImage('#btnSMALL_PIC', '#<%=txtSMALL_PIC.ClientID%>', '#<%=hidSMALL_PIC.ClientID%>');
     });
     KindEditor.ready(function (K) {
         var editor1 = K.create('#<%=txtCOLUMN_DES.ClientID%>', {
             cssPath: '/site/lib/kinderEditor/plugins/code/prettify.css',
             uploadJson: '/site/lib/kinderEditor/asp.net/upload_json.ashx',
             fileManagerJson: '/site/lib/kinderEditor/asp.net/file_manager_json.ashx',
             allowFileManager: true,
             afterCreate: function () {
                 var self = this;
                 K.ctrl(document, 13, function () {
                     self.sync();
                     K('form[name=form1]')[0].submit();
                 });
                 K.ctrl(self.edit.doc, 13, function () {
                     self.sync();
                     K('form[name=form1]')[0].submit();
                 });
             }
         });
         // prettyPrint();
     });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl class="hide" >
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtID" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.PID.ZhName %>：</dt><%--父编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPID" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.COLUMN_NAME.ZhName %>：</dt><%--栏目名称--%>
               <dd><span>
               <!--文字-->
                    <input id="txtCOLUMN_NAME" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.COLUMN_DES.ZhName %>：</dt><%--栏目描述--%>
               <dd><span>
               <!--文字-->
                    <input id="txtCOLUMN_DES" type="text" runat="server" style="width:668px;height:230px;"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.PIC_URL.ZhName %>：</dt><%--图片地址--%>
                    <dd>
                        <div class="controls">
                        <img id="txtPICURL" runat="server" style="max-height:100px;vertical-align: middle;">
                        <span class="insertimage"><a id="btnPICURL">选择图片</a></span> 
                        <input type="hidden" id="hidPICURL" runat="server" />
                        </div>
               </dd>
           </dl>
           <dl>
               <dt>栏目图标：</dt><%--图标--%>
                    <dd>
                        <div class="controls">
                        <img id="txtSMALL_PIC" runat="server" style="max-height:100px;vertical-align: middle;">
                        <span class="insertimage"><a id="btnSMALL_PIC">选择图标</a></span> 
                        <input type="hidden" id="hidSMALL_PIC" runat="server" />
                        </div>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.OUT_URL.ZhName %>：</dt><%--外链地址--%>
               <dd><span>
               <!--文字-->
                    <input id="txtOUT_URL" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.UP_FLAG.ZhName %>：</dt><%--是否显示在首页--%>
               <dd><span>
               
                    <select id="txtUP_FLAG" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt>模板：</dt><%--模版--%>
               <dd><span>
               <!--文字-->
                    <select id="txtMODEL_ID" runat="server" ck="{need:0,len:4,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl  class="hide">
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_COLUMN.Attribute.SORT_ID.ZhName %>：</dt><%--排序--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSORT_ID" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
</ul>
   </div>
</div>
</asp:Content>