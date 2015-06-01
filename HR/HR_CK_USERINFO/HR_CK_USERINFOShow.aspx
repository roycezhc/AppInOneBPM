<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CK_USERINFOShow" CodeFile="HR_CK_USERINFOShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.USERID.ZhName %>£º</dt><%--USERID--%>
               <dd>
                
                    <asp:Label id="txtUSERID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.STAFF_ID.ZhName %>£º</dt><%--STAFF_ID--%>
               <dd>
                
                    <asp:Label id="txtSTAFF_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.BADGENUMBER.ZhName %>£º</dt><%--BADGENUMBER--%>
               <dd>
                
                    <asp:Label id="txtBADGENUMBER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SSN.ZhName %>£º</dt><%--SSN--%>
               <dd>
                
                    <asp:Label id="txtSSN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.NAME.ZhName %>£º</dt><%--NAME--%>
               <dd>
                
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.GENDER.ZhName %>£º</dt><%--GENDER--%>
               <dd>
                
                    <asp:Label id="txtGENDER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.TITLE.ZhName %>£º</dt><%--TITLE--%>
               <dd>
                
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.PAGER.ZhName %>£º</dt><%--PAGER--%>
               <dd>
                
                    <asp:Label id="txtPAGER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.BIRTHDAY.ZhName %>£º</dt><%--BIRTHDAY--%>
               <dd>
               
                    <asp:Label id="txtBIRTHDAY" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.HIREDDAY.ZhName %>£º</dt><%--HIREDDAY--%>
               <dd>
               
                    <asp:Label id="txtHIREDDAY" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.STREET.ZhName %>£º</dt><%--STREET--%>
               <dd>
                
                    <asp:Label id="txtSTREET" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.CITY.ZhName %>£º</dt><%--CITY--%>
               <dd>
                
                    <asp:Label id="txtCITY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.STATE.ZhName %>£º</dt><%--STATE--%>
               <dd>
                
                    <asp:Label id="txtSTATE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.ZIP.ZhName %>£º</dt><%--ZIP--%>
               <dd>
                
                    <asp:Label id="txtZIP" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.OPHONE.ZhName %>£º</dt><%--OPHONE--%>
               <dd>
                
                    <asp:Label id="txtOPHONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.FPHONE.ZhName %>£º</dt><%--FPHONE--%>
               <dd>
                
                    <asp:Label id="txtFPHONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.VERIFICATIONMETHOD.ZhName %>£º</dt><%--VERIFICATIONMETHOD--%>
               <dd>
                
                    <asp:Label id="txtVERIFICATIONMETHOD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.DEFAULTDEPTID.ZhName %>£º</dt><%--DEFAULTDEPTID--%>
               <dd>
                
                    <asp:Label id="txtDEFAULTDEPTID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SECURITYFLAGS.ZhName %>£º</dt><%--SECURITYFLAGS--%>
               <dd>
                
                    <asp:Label id="txtSECURITYFLAGS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.ATT.ZhName %>£º</dt><%--ATT--%>
               <dd>
                
                    <asp:Label id="txtATT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.INLATE.ZhName %>£º</dt><%--INLATE--%>
               <dd>
                
                    <asp:Label id="txtINLATE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.OUTEARLY.ZhName %>£º</dt><%--OUTEARLY--%>
               <dd>
                
                    <asp:Label id="txtOUTEARLY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.OVERTIME.ZhName %>£º</dt><%--OVERTIME--%>
               <dd>
                
                    <asp:Label id="txtOVERTIME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SEP.ZhName %>£º</dt><%--SEP--%>
               <dd>
                
                    <asp:Label id="txtSEP" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.HOLIDAY.ZhName %>£º</dt><%--HOLIDAY--%>
               <dd>
                
                    <asp:Label id="txtHOLIDAY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.MINZU.ZhName %>£º</dt><%--MINZU--%>
               <dd>
                
                    <asp:Label id="txtMINZU" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.PASSWORD.ZhName %>£º</dt><%--PASSWORD--%>
               <dd>
                
                    <asp:Label id="txtPASSWORD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.LUNCHDURATION.ZhName %>£º</dt><%--LUNCHDURATION--%>
               <dd>
                
                    <asp:Label id="txtLUNCHDURATION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.MVerifyPass.ZhName %>£º</dt><%--MVerifyPass--%>
               <dd>
                
                    <asp:Label id="txtMVerifyPass" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.PHOTO.ZhName %>£º</dt><%--PHOTO--%>
               <dd>
                
                    <asp:Label id="txtPHOTO" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>