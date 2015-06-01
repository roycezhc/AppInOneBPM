<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CK_USERINFOEdit" CodeFile="HR_CK_USERINFOEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
           $(function () {
               var keyid = $("input[id$='txtUSER_ID']").val();
               if (keyid != "" && keyid != undefined) {
                   var url = window.frames["ifrReal"].location.pathname;
                   window.frames["ifrReal"].location.href = url + "?oneid=" + keyid;
               }

               var checker = new formChecker({ formID: "divForm", btnIDS: 'btnOK,btnSave' });

           });

           function selStaff(me) {
               var result = window.showModalDialog("../../HR/STAFF/STAFFSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
               if (result != undefined && result != "") {
                   var obj = eval(result);
                   var txts = $(me).parent().find("input");
                   txts[0].value = obj.ID;
                   txts[1].value = obj.Name;
               }
               return false;
           }
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
               <dt><%=HR_CK_USERINFO.Attribute.USERID.ZhName %>：</dt><%--USERID--%>
               <dd><span>
                
                    <input id="txtUSERID" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.STAFF_ID.ZhName %>：</dt><%--STAFF_ID--%>
               <dd>
                  <SelStaff:wucSelStaff ID="wucSelStaff1" runat="server" />
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.BADGENUMBER.ZhName %>：</dt><%--BADGENUMBER--%>
               <dd><span>
                
                    <input id="txtBADGENUMBER" type="text" runat="server" ck="{need:1,len:12,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SSN.ZhName %>：</dt><%--SSN--%>
               <dd><span>
                
                    <input id="txtSSN" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.NAME.ZhName %>：</dt><%--NAME--%>
               <dd><span>
                
                    <input id="txtNAME" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.GENDER.ZhName %>：</dt><%--GENDER--%>
               <dd><span>
                
                    <input id="txtGENDER" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.TITLE.ZhName %>：</dt><%--TITLE--%>
               <dd><span>
                
                    <input id="txtTITLE" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.PAGER.ZhName %>：</dt><%--PAGER--%>
               <dd><span>
                
                    <input id="txtPAGER" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.BIRTHDAY.ZhName %>：</dt><%--BIRTHDAY--%>
               <dd><span>
               
                    <input id="txtBIRTHDAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.HIREDDAY.ZhName %>：</dt><%--HIREDDAY--%>
               <dd><span>
               
                    <input id="txtHIREDDAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.STREET.ZhName %>：</dt><%--STREET--%>
               <dd><span>
                
                    <input id="txtSTREET" type="text" runat="server" ck="{need:0,len:40,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.CITY.ZhName %>：</dt><%--CITY--%>
               <dd><span>
                
                    <input id="txtCITY" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.STATE.ZhName %>：</dt><%--STATE--%>
               <dd><span>
                
                    <input id="txtSTATE" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.ZIP.ZhName %>：</dt><%--ZIP--%>
               <dd><span>
                
                    <input id="txtZIP" type="text" runat="server" ck="{need:0,len:12,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.OPHONE.ZhName %>：</dt><%--OPHONE--%>
               <dd><span>
                
                    <input id="txtOPHONE" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.FPHONE.ZhName %>：</dt><%--FPHONE--%>
               <dd><span>
                
                    <input id="txtFPHONE" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.VERIFICATIONMETHOD.ZhName %>：</dt><%--VERIFICATIONMETHOD--%>
               <dd><span>
                
                    <input id="txtVERIFICATIONMETHOD" type="text" runat="server" ck="{need:0,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.DEFAULTDEPTID.ZhName %>：</dt><%--DEFAULTDEPTID--%>
               <dd><span>
                
                    <input id="txtDEFAULTDEPTID" type="text" runat="server" ck="{need:0,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SECURITYFLAGS.ZhName %>：</dt><%--SECURITYFLAGS--%>
               <dd><span>
                
                    <input id="txtSECURITYFLAGS" type="text" runat="server" ck="{need:0,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.ATT.ZhName %>：</dt><%--ATT--%>
               <dd><span>
                
                    <input id="txtATT" type="text" runat="server" ck="{need:1,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.INLATE.ZhName %>：</dt><%--INLATE--%>
               <dd><span>
                
                    <input id="txtINLATE" type="text" runat="server" ck="{need:1,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.OUTEARLY.ZhName %>：</dt><%--OUTEARLY--%>
               <dd><span>
                
                    <input id="txtOUTEARLY" type="text" runat="server" ck="{need:1,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.OVERTIME.ZhName %>：</dt><%--OVERTIME--%>
               <dd><span>
                
                    <input id="txtOVERTIME" type="text" runat="server" ck="{need:1,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SEP.ZhName %>：</dt><%--SEP--%>
               <dd><span>
                
                    <input id="txtSEP" type="text" runat="server" ck="{need:1,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.HOLIDAY.ZhName %>：</dt><%--HOLIDAY--%>
               <dd><span>
                
                    <input id="txtHOLIDAY" type="text" runat="server" ck="{need:1,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.MINZU.ZhName %>：</dt><%--MINZU--%>
               <dd><span>
                
                    <input id="txtMINZU" type="text" runat="server" ck="{need:0,len:8,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.PASSWORD.ZhName %>：</dt><%--PASSWORD--%>
               <dd><span>
                
                    <input id="txtPASSWORD" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.LUNCHDURATION.ZhName %>：</dt><%--LUNCHDURATION--%>
               <dd><span>
                
                    <input id="txtLUNCHDURATION" type="text" runat="server" ck="{need:1,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.MVerifyPass.ZhName %>：</dt><%--MVerifyPass--%>
               <dd><span>
                
                    <input id="txtMVerifyPass" type="text" runat="server" ck="{need:0,len:10,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CK_USERINFO.Attribute.PHOTO.ZhName %>：</dt><%--PHOTO--%>
               <dd><span>
                
                    <input id="txtPHOTO" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
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