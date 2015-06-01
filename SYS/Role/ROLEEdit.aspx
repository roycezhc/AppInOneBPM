<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_ROLEEdit" CodeFile="ROLEEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
   <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
<div class="titnav">
    <dl><dt><b>角色编辑</b></dt></dl>    
</div>
<div class="warn">
<asp:Label ID="lbInfo" runat="server" Text="" Visible="false"></asp:Label>
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
<div class="form">
     <input id="txtROLE_ID" type="hidden" runat="server"/>
        <dl>
            <dt><%=SYS_ROLE.Attribute.ROLE_NAME.ZhName %>：</dt><%--角色名--%>
            <dd><span><input id="txtROLE_NAME"  onblur="selNamesByThis(this);" type="text" runat="server" ck="{need:1,len:50,dtype:0}"/></span>
            </dd>
        </dl>
        <dl>
            <dt><%=SYS_ROLE.Attribute.CREATER.ZhName %>：</dt><%--CREATER--%>
            <dd><span><input id="txtCREATER" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/></span>
            </dd>
        </dl>
        <dl>
               <dt><%=SYS_ROLE.Attribute.SNAME.ZhName%>：</dt><%--SNAME--%>
               <dd>
                
                    <span><input id="txtSNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
            </dl>
         <dl>
               <dt><%=SYS_ROLE.Attribute.RNAME.ZhName%>：</dt><%--RNAME--%>
               <dd>
                
                    <span><input id="txtRNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
        <div class="clear"></div>
 </div>
 <div class="tool"></div>
 </div>
</asp:Content>
