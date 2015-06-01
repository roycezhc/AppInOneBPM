<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_CTRLEdit" CodeFile="CTRLEdit.aspx.cs" %>
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
               <dt><%=SYS_BILL_CTRL.Attribute.CTRL_ID.ZhName %>：</dt><%--CTRL_ID--%>
               <dd><span>
                
                    <input id="txtCTRL_ID" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_CTRL.Attribute.CTRL_NAME.ZhName %>：</dt><%--CTRL_NAME--%>
               <dd><span>
                
                    <input id="txtCTRL_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_CTRL.Attribute.CTRL_CODE.ZhName %>：</dt><%--CTRL_CODE--%>
               <dd><span>
                
                    <input id="txtCTRL_CODE" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_CTRL.Attribute.P_CTRL_ID.ZhName %>：</dt><%--P_CTRL_ID--%>
               <dd><span>
                
                    <input id="txtP_CTRL_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_CTRL.Attribute.SORT_NO.ZhName %>：</dt><%--SORT_NO--%>
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_CTRL.Attribute.EL_HTML.ZhName %>：</dt><%--EL_HTML--%>
               <dd><span>
               
                    <textarea id="txtEL_HTML" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:550,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_CTRL.Attribute.JS_CODE.ZhName %>：</dt><%--JS_CODE--%>
               <dd><span>
               
                    <textarea id="txtJS_CODE" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:550,type:0}" /></span>
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