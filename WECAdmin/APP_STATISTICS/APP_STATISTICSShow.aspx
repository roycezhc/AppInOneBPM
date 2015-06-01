<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="APP_STATISTICSShow.aspx.cs" Inherits="APP_STATISTICSShow" %>
<%@ Import Namespace="AgileFrame.Core" %><%@ Import Namespace="AgileFrame.Common" %>
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
   <div class="relationlist">
       <%-- <%if(valObj.DataBaseTable()!=null)
              foreach (DataBaseTable dt1 in valObj.DataBaseTable().SubTable)
              {
                  %>
                  <a href=""><%=dt1.ZhName %>,<%=dt1.IDField %><%=dt1.NameField %></a>
                  <%
              }%>--%>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=APP_STATISTICS.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.AF_ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_AF_ADDTIME' runat='server' ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.IP.ZhName %>：</dt><%--IP--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_IP' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.LONG.ZhName %>：</dt><%--经度--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_LONG' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.LAT.ZhName %>：</dt><%--纬度--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_LAT' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.DEVICE_SYS.ZhName %>：</dt><%--设备系统--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_DEVICE_SYS' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.VER_CODE.ZhName %>：</dt><%--应用版本号--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_VER_CODE' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.DEVICE_MODEL.ZhName %>：</dt><%--设备型号--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_DEVICE_MODEL' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.STAFF_ID.ZhName %>：</dt><%--员工编号--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_STAFF_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.DEVICE_ID.ZhName %>：</dt><%--设备ID--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_DEVICE_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=APP_STATISTICS.Attribute.VER_NAME.ZhName %>：</dt><%--应用版本名--%>
               <dd>
               
                    <asp:Label id='txtAPP_STATISTICS_VER_NAME' runat='server'></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>