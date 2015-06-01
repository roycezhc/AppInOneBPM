<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="RELAEdit.aspx.cs" Inherits="SYS_BILL_RELAEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });

       function setCol(me) { 
           
       }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div>
    <asp:Literal ID="litSynCols" runat="server"></asp:Literal>
</div>
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
               <dt><%=SYS_BILL_RELA.Attribute.BILL_ID.ZhName %>：</dt><%--表单ID--%>
               <dd><span>
                
                    <input id="txtBILL_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_RELA.Attribute.TABLE_COL_PK.ZhName %>：</dt><%--主键字段--%>
               <dd><span>
                
                    <input id="txtTABLE_COL_PK" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_RELA.Attribute.TABLE_COL_FK.ZhName %>：</dt><%--外键字段--%>
               <dd><span>
                
                    <input id="txtTABLE_COL_FK" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_RELA.Attribute.RELATION_TYPE.ZhName %>：</dt><%--关联类型--%>
               <dd><span>
               
                    <select id="txtRELATION_TYPE" runat="server" ck="{need:0,len:2147483647,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_RELA.Attribute.RELATION_TABLE.ZhName %>：</dt><%--第三方关联表--%>
               <dd><span>
                
                    <input id="txtRELATION_TABLE" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_RELA.Attribute.RELATION_NAME.ZhName %>：</dt><%--关系名--%>
               <dd><span>
                
                    <input id="txtRELATION_NAME" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
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