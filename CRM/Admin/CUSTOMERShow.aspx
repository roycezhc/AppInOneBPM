<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTOMERShow" CodeFile="CUSTOMERShow.aspx.cs" %>
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
               <dt><%=CRM_CUSTOMER.Attribute.CompanyName.ZhName %>：</dt><%--公司名称--%>
               <dd>
                
                    <asp:Label id="txtCompanyName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.CompanyAddress.ZhName %>：</dt><%--公司地址--%>
               <dd>
                
                    <asp:Label id="txtCompanyAddress" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.ShopName.ZhName %>：</dt><%--网店名称--%>
               <dd>
                
                    <asp:Label id="txtShopName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.ShopNameURL.ZhName %>：</dt><%--网店网址--%>
               <dd>
                
                    <asp:Label id="txtShopNameURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.CustSex.ZhName %>：</dt><%--性别--%>
               <dd>
                
                    <asp:Label id="txtCustSex" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.Birthday.ZhName %>：</dt><%--生日--%>
               <dd>
               
                    <asp:Label id="txtBirthday" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.WangWangId.ZhName %>：</dt><%--旺旺ID--%>
               <dd>
                
                    <asp:Label id="txtWangWangId" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.CustQQ.ZhName %>：</dt><%--QQ号码--%>
               <dd>
                
                    <asp:Label id="txtCustQQ" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.LastEditors.ZhName %>：</dt><%--最后编辑者--%>
               <dd>
                
                    <asp:Label id="txtLastEditors" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.LoadHighSeasTime.ZhName %>：</dt><%--加入公海时间--%>
               <dd>
               
                    <asp:Label id="txtLoadHighSeasTime" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUSTOMER.Attribute.Cus_Id.ZhName %>：</dt><%--客户编码--%>
               <dd>
                
                    <asp:Label id="txtCus_Id" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>