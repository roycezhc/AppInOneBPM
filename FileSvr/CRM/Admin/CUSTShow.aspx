<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTShow" CodeFile="CUSTShow.aspx.cs" %>
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
               <dt><%=CRM_CUST.Attribute.Cus_ID.ZhName %>：</dt><%--客户编号--%>
               <dd>
                
                    <asp:Label id="txtCus_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.Cus_Name.ZhName %>：</dt><%--客户名称--%>
               <dd>
                
                    <asp:Label id="txtCus_Name" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.Job.ZhName %>：</dt><%--客户职位--%>
               <dd>
               
                    <asp:Label id="txtJob" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.RelationTxt.ZhName %>：</dt><%--客户关系描述--%>
               <dd>
               
                    <asp:Label ID="txtRelationTxt" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.Recorder.ZhName %>：</dt><%--创建人--%>
               <dd>
                
                    <asp:Label id="txtRecorder" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.MobPhone.ZhName %>：</dt><%--手机--%>
               <dd>
                
                    <asp:Label id="txtMobPhone" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.Phone.ZhName %>：</dt><%--联系电话--%>
               <dd>
                
                    <asp:Label id="txtPhone" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.ContactName.ZhName %>：</dt><%--联系人姓名--%>
               <dd>
                
                    <asp:Label id="txtContactName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.ShopName.ZhName %>：</dt><%--网店名称--%>
               <dd>
                
                    <asp:Label id="txtShopName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.ShopAddr.ZhName %>：</dt><%--网店地址--%>
               <dd>
                
                    <asp:Label id="txtShopAddr" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.QQ.ZhName %>：</dt><%--QQ号码--%>
               <dd>
                
                    <asp:Label id="txtQQ" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.WW.ZhName %>：</dt><%--旺旺号码--%>
               <dd>
                
                    <asp:Label id="txtWW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.Email.ZhName %>：</dt><%--邮件地址--%>
               <dd>
                
                    <asp:Label id="txtEmail" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.Address.ZhName %>：</dt><%--详细地址--%>
               <dd>
                
                    <asp:Label id="txtAddress" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.Trade.ZhName %>：</dt><%--行业--%>
               <dd>
                
                    <asp:Label id="txtTrade" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.Type.ZhName %>：</dt><%--类别--%>
               <dd>
                
                    <asp:Label id="txtType" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.State.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtState" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.IsSign.ZhName %>：</dt><%--是否签约--%>
               <dd>
               
                    <asp:Label id="txtIsSign" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.AddTime.ZhName %>：</dt><%--录入时间--%>
               <dd>
               
                    <asp:Label id="txtAddTime" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.EditTime.ZhName %>：</dt><%--修改时间--%>
               <dd>
               
                    <asp:Label id="txtEditTime" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.PATH.ZhName %>：</dt><%--PATH--%>
               <dd>
               
                    <asp:Label id="txtPATH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=CRM_CUST.Attribute.PNAME.ZhName %>：</dt><%--PNAME--%>
               <dd>
               
                    <asp:Label id="txtPNAME" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>