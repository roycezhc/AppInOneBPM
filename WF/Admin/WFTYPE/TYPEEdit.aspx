<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_TYPEEdit" CodeFile="TYPEEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: '_btnOK,_btnSave' });
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
        <input id="txtTYPE_ID" type="hidden" runat="server" ck="{need:0,len:2147483647,type:1}"/>
           <dl>
               <dt><%=WF_TYPE.Attribute.TYPE_NAME.ZhName %>：</dt><%--分类名--%>
               <dd><span>
                
                    <input id="txtTYPE_NAME" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_TYPE.Attribute.CREATER.ZhName %>：</dt><%--创建人--%>
               <dd><span>
                
                    <input id="txtCREATER" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_TYPE.Attribute.CREATE_TIME.ZhName %>：</dt><%--创建时间--%>
               <dd><span>
               
                    <input id="txtCREATE_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl id="dlStatus" runat="server">
               <dt><%=WF_TYPE.Attribute.STATUS.ZhName%>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:0,len:2,type:0}">
                    </select></span>
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