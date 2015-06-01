<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_TYPEEdit" CodeFile="TYPEEdit.aspx.cs" %>
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

       function selBill(me) {
           var result = window.showModalDialog("BILLSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
           if (result != undefined && result != "") {
               var obj = eval(result);
               var txts = $(me).parent().find("input");
               txts[0].value = obj.ID;
               txts[1].value = obj.Name;
           }
           return false;
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
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
            <input id="txtTYPE_ID" type="hidden" runat="server"/></span>
           <dl>
               <dt><%=SYS_BILL_TYPE.Attribute.TYPE_NAME.ZhName %>：</dt><%--表单类型名--%>
               <dd><span>
                
                    <input id="txtTYPE_NAME" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_TYPE.Attribute.TYPE_DES.ZhName %>：</dt><%--表单类型描述--%>
               <dd><span>
                
                    <input id="txtTYPE_DES" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_TYPE.Attribute.BILL_ID.ZhName %>：</dt><%--此类型使用的表单--%>
               <dd class="btns"><span>
                    <input id="txtBILL_ID" type="hidden" value="0" runat="server" ck="{need:1,len:2147483647,type:1}"/>
                    <input id="txtBILL_NAME" type="text" runat="server" ck="{need:0,len:2147483647,type:1}" style="width:70%;"/>
                   <input id="Button1" type="button" value="" onclick="selBill(this);" class="sel" />
                    </span>
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