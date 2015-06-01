<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="V_DEVICELISTShow.aspx.cs" Inherits="V_DEVICELISTShow" %>
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
               <dt><%=V_DEVICELIST.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_DEVICELIST.Attribute.USER_ID.ZhName %>：</dt><%--用户编号--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_USER_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_DEVICELIST.Attribute.DEVICE_ID.ZhName %>：</dt><%--TOKEN_I--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_DEVICE_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_DEVICELIST.Attribute.KIND.ZhName %>：</dt><%--类型--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_KIND' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_DEVICELIST.Attribute.DEBUG.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_DEBUG' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_DEVICELIST.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_STATUS' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_DEVICELIST.Attribute.AF_ADDTIEM.ZhName %>：</dt><%--AF_ADDT--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_AF_ADDTIEM' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_DEVICELIST.Attribute.AF_EDITTIME.ZhName %>：</dt><%--AF_EDIT--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_AF_EDITTIME' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_DEVICELIST.Attribute.TOKEN_ID.ZhName %>：</dt><%--TOKEN_I--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_TOKEN_ID' runat='server'></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_DEVICELIST.Attribute.STAFF_NAME.ZhName %>：</dt><%--员工姓名--%>
               <dd>
               
                    <asp:Label id='txtV_DEVICELIST_STAFF_NAME' runat='server'></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>