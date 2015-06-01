<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKINOUTShow" CodeFile="HR_CHECKINOUTShow.aspx.cs" %>
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
               <dt><%=HR_CHECKINOUT.Attribute.USERID.ZhName %>£º</dt><%--USERID--%>
               <dd>
                
                    <asp:Label id="txtUSERID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTIME.ZhName %>£º</dt><%--CHECKTIME--%>
               <dd>
               
                    <asp:Label id="txtCHECKTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHECKINOUT.Attribute.STAFF_ID.ZhName %>£º</dt><%--STAFF_ID--%>
               <dd>
                
                    <asp:Label id="txtSTAFF_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTYPE.ZhName %>£º</dt><%--CHECKTYPE--%>
               <dd>
                
                    <asp:Label id="txtCHECKTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHECKINOUT.Attribute.VERIFYCODE.ZhName %>£º</dt><%--VERIFYCODE--%>
               <dd>
                
                    <asp:Label id="txtVERIFYCODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHECKINOUT.Attribute.SENSORID.ZhName %>£º</dt><%--SENSORID--%>
               <dd>
                
                    <asp:Label id="txtSENSORID" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>