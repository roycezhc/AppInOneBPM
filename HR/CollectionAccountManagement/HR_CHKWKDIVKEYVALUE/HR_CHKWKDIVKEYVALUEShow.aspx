<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHKWKDIVKEYVALUEShow2" CodeFile="HR_CHKWKDIVKEYVALUEShow.aspx.cs" %>
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
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId.ZhName %>：</dt><%--组ID--%>
               <dd>
                
                    <asp:Label id="txtGroupId" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID.ZhName %>：</dt><%--设备ID--%>
               <dd>
                
                    <asp:Label id="txtDeviceID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName.ZhName %>：</dt><%--AIO表名--%>
               <dd>
                
                    <asp:Label id="txtAIOTableName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName.ZhName %>：</dt><%--AIO关键字段名--%>
               <dd>
                
                    <asp:Label id="txtAIOKeyFieldName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName.ZhName %>：</dt><%--其他系统关键字段名--%>
               <dd>
                
                    <asp:Label id="txtOtherKeyFieldName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue.ZhName %>：</dt><%--AIO关键字段值--%>
               <dd>
                
                    <asp:Label id="txtAIOKeyValue" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue.ZhName %>：</dt><%--其他系统关键字段值--%>
               <dd>
                
                    <asp:Label id="txtOtherKeyValue" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>