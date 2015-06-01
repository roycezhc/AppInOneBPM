<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" ValidateRequest="false" AutoEventWireup="true" Inherits="SYS_THEMEEdit" CodeFile="THEMEEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
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
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div><input id="txtTHEME_ID" type="hidden" runat="server"/>
           <dl>
               <dt><%=SYS_THEME.Attribute.THEME_NAME.ZhName %>：</dt><%--皮肤名称(英文)--%>
               <dd><span>
                
                    <input id="txtTHEME_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_THEME.Attribute.SYS_NAME.ZhName %>：</dt><%--系统名称--%>
               <dd><span>
               
                    <textarea id="txtSYS_NAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_THEME.Attribute.LOGIN_TIT.ZhName %>：</dt><%--登录界面标题--%>
               <dd><span>
               
                    <textarea id="txtLOGIN_TIT" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_THEME.Attribute.LOGIN_HTML.ZhName %>：</dt><%--LOGIN_HTML--%>
               <dd><span> <textarea id="txtLOGIN_HTML" cols="1" rows="1" style="height:200px;width:400px;overflow:scroll;" 
                            runat="server" ck="{need:0,len:950,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_THEME.Attribute.TECH_DES.ZhName %>：</dt><%--技术支持描述--%>
               <dd><span>
               
                    <textarea id="txtTECH_DES" cols="1" rows="1" style="height:40px;width:400px;overflow:auto;" 
                            runat="server" ck="{need:0,len:950,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_THEME.Attribute.RIGHT_DES.ZhName %>：</dt><%--版权描述--%>
               <dd><span>
               
                    <textarea id="txtRIGHT_DES" cols="1" rows="1" style="height:40px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:950,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_THEME.Attribute.VERSION.ZhName %>：</dt><%--版本信息--%>
               <dd><span>
               
                    <textarea id="txtVERSION" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
        <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                    onclick="btnOK_Click"/></span></li>
        <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
                onclick="btnOK_Click"/></span></li>
        <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
     </ul>
   </div>
</div>
</asp:Content>