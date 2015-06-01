<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="HR_STATION_LEVELShow.aspx.cs" Inherits="HR_STATION_LEVELShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
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
               <dt><%=HR_STATION_LEVEL.Attribute.LEVEL_ID.ZhName %>：</dt><%--岗位等级ID--%>
               <dd>
               
                    <asp:Label id="txtLEVEL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STATION_LEVEL.Attribute.LEVEL_NAME.ZhName %>：</dt><%--岗位等级名称--%>
               <dd>
               
                    <asp:Label id="txtLEVEL_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STATION_LEVEL.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>