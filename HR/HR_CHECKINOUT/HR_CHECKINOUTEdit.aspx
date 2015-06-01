<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKINOUTEdit" CodeFile="HR_CHECKINOUTEdit.aspx.cs" %>
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
               <dt><%=HR_CHECKINOUT.Attribute.USERID.ZhName %>：</dt><%--USERID--%>
               <dd><span>
                
                    <input id="txtUSERID" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTIME.ZhName %>：</dt><%--CHECKTIME--%>
               <dd><span>
               
                    <input id="txtCHECKTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHECKINOUT.Attribute.STAFF_ID.ZhName %>：</dt><%--STAFF_ID--%>
               <dd><span>
                
                    <input id="txtSTAFF_ID" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTYPE.ZhName %>：</dt><%--CHECKTYPE--%>
               <dd><span>
                
                    <input id="txtCHECKTYPE" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHECKINOUT.Attribute.VERIFYCODE.ZhName %>：</dt><%--VERIFYCODE--%>
               <dd><span>
                
                    <input id="txtVERIFYCODE" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHECKINOUT.Attribute.SENSORID.ZhName %>：</dt><%--SENSORID--%>
               <dd><span>
                
                    <input id="txtSENSORID" type="text" runat="server" ck="{need:0,len:5,type:0}"/></span>
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