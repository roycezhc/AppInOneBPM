<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CUSTOM_WEB_SETEdit.aspx.cs" Inherits="WEC_CUSTOM_WEB_SETEdit" %>
<%@ Import Namespace="AgileFrame.Core" %><%@ Import Namespace="AgileFrame.Common" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
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
<%--<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="±£´æÍË³ö"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="±£´æ"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="¹Ø±Õ" type="button" /></span></li>
</ul>
</div>--%>
<div class="form" id="divForm">
       <div>
        
           <dl class = "">
               <dt><%=WEC_CUSTOM_WEB_SET.Attribute.ID.ZhName %>£º</dt><%--±àºÅ--%>
               <dd><span>
               <!--ÎÄ×Ö-->
                    <input id='txtWEC_CUSTOM_WEB_SET_ID' type='text' runat='server' ck='{type:1,min:0,max:4,need:1}'/></span>
               </dd>
           </dl>
          
           <dl class = "">
               <dt><%=WEC_CUSTOM_WEB_SET.Attribute.A_ID.ZhName %>£º</dt><%--ÍøÕ¾±àºÅ--%>
               <dd><span>
               <!--ÎÄ×Ö-->
                    <input id='txtWEC_CUSTOM_WEB_SET_A_ID' type='text' runat='server' ck='{type:1,min:0,max:4,need:1}'/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="±£´æÍË³ö"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="±£´æ"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="¹Ø±Õ" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>