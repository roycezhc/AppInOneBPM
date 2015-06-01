<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKWORKDEVICEShow2" CodeFile="HR_CHECKWORKDEVICEShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../../Lib/Mdl/detail.js" type="text/javascript"></script>
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
               <dt><%=HR_CHECKWORKDEVICE.Attribute.DeviceID.ZhName %>：</dt><%--设备ID--%>
               <dd>
                
                    <asp:Label id="txtDeviceID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHECKWORKDEVICE.Attribute.ORG_ID.ZhName %>：</dt><%--分支机构标识--%>
               <dd>
                
                    <asp:Label id="txtORG_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHECKWORKDEVICE.Attribute.USE_FLAG.ZhName %>：</dt><%--是否启用--%>
               <dd>
               
                    <asp:Label id="txtUSE_FLAG" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>