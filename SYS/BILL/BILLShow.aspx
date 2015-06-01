<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILLShow" CodeFile="BILLShow.aspx.cs" %>
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
               <dt><%=SYS_BILL.Attribute.BILL_ID.ZhName %>：</dt><%--表单ID--%>
               <dd>
                
                    <asp:Label id="txtBILL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL.Attribute.BILL_NAME.ZhName %>：</dt><%--表单名称--%>
               <dd>
                
                    <asp:Label id="txtBILL_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL.Attribute.BILL_TYPE.ZhName %>：</dt><%--表单类型--%>
               <dd>
                
                    <asp:Label id="txtBILL_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL.Attribute.BILL_SQL.ZhName %>：</dt><%--单据查询SQL语句--%>
               <dd>
               
                    <asp:Label ID="txtBILL_SQL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL.Attribute.ADDTIME.ZhName %>：</dt><%--创建时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL.Attribute.EDITIME.ZhName %>：</dt><%--修改时间--%>
               <dd>
               
                    <asp:Label id="txtEDITIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL.Attribute.ADDER.ZhName %>：</dt><%--创建人--%>
               <dd>
                
                    <asp:Label id="txtADDER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL.Attribute.TABLE_NAME.ZhName %>：</dt><%--物理表名--%>
               <dd>
                
                    <asp:Label id="txtTABLE_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL.Attribute.P_BILL_ID.ZhName %>：</dt><%--父表单ID--%>
               <dd>
                
                    <asp:Label id="txtP_BILL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>