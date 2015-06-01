<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_entitynameEdit.aspx.cs" Inherits="Ec_entitynameEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
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
               <dt><%=Ec_entityname.Attribute.Tabid.ZhName %>：</dt><%--Tabid--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTabid" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_entityname.Attribute.Modulename.ZhName %>：</dt><%--IsTab英文--%>
               <dd><span>
               <!--文字-->
                    <input id="txtModulename" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_entityname.Attribute.Tablename.ZhName %>：</dt><%--表名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTablename" type="text" runat="server" ck="{type:0,min:0,max:100,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_entityname.Attribute.Fieldname.ZhName %>：</dt><%--表NAME--%>
               <dd><span>
               <!--文字-->
                    <input id="txtFieldname" type="text" runat="server" ck="{type:0,min:0,max:150,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_entityname.Attribute.Entityidfield.ZhName %>：</dt><%--表ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtEntityidfield" type="text" runat="server" ck="{type:0,min:0,max:150,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_entityname.Attribute.Remarks.ZhName %>：</dt><%--IsTab中文--%>
               <dd><span>
               <!--文字-->
                    <input id="txtRemarks" type="text" runat="server" ck="{type:0,min:0,max:255,need:1}"/></span>
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