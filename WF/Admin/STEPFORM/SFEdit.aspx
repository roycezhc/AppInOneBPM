<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_STEP_FORM_TPLEdit" CodeFile="SFEdit.aspx.cs" %>
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
       <div>
        
           <dl>
               <dt><%=WF_STEP_FORM_TPL.Attribute.STEP_FID.ZhName %>：</dt><%--动作表单ID--%>
               <dd><span>
                
                    <input id="txtSTEP_FID" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_STEP_FORM_TPL.Attribute.WFID.ZhName %>：</dt><%--流程ID--%>
               <dd><span>
                
                    <input id="txtWFID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_STEP_FORM_TPL.Attribute.PROCID.ZhName %>：</dt><%--过程ID--%>
               <dd><span>
                
                    <input id="txtPROCID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_STEP_FORM_TPL.Attribute.STEP_ID.ZhName %>：</dt><%--步骤ID--%>
               <dd><span>
                
                    <input id="txtSTEP_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_STEP_FORM_TPL.Attribute.FORM_ID.ZhName %>：</dt><%--字段数据类型--%>
               <dd><span>
                
                    <input id="txtFORM_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_STEP_FORM_TPL.Attribute.COLUMN_ID.ZhName %>：</dt><%--字段名--%>
               <dd><span>
                
                    <input id="txtCOLUMN_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
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