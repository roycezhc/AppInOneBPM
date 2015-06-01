<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLITEMEdit" CodeFile="COLITEMEdit.aspx.cs" %>
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

       function _valChg() {
           var ooo = $("input[id$='ckVal']");
           if (ooo[0].checked == true) {
               $("#dlVal").show();
           } else {
               $("#dlVal").hide();
           }
       }
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
    <%--<li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
         <input id="txtITEM_ID" type="hidden" runat="server"/>
           <dl>
               <dt><%=SYS_BILL_COLITEM.Attribute.TXT.ZhName %>：</dt><%--选项名--%>
               <dd><span>
                
                    <input id="txtTXT" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl><dt>区分名称和值：</dt><dd><input id="ckVal" type="checkbox" runat="server" onclick="_valChg();" /></dd></dl>
           <dl id="dlVal" class="hide">
               <dt><%=SYS_BILL_COLITEM.Attribute.VAL.ZhName %>：</dt><%--选项值--%>
               <dd><span>
                    <input id="txtVAL" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           
           <dl>
               <dt><%=SYS_BILL_COLITEM.Attribute.SHOW_COL_REAL.ZhName %>：</dt><%--根据其他列值是否显示此选项--%>
               <dd><span>
                
                    <input id="txtSHOW_COL_REAL" type="text" runat="server" ck="{need:0,len:150,type:0}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <%--<li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>