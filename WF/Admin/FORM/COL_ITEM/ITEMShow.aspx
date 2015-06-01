<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMN_ITEMShow" CodeFile="ITEMShow.aspx.cs" %>
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
               <dt><%=TF_F_COLUMN_ITEM.Attribute.ITEM_ID.ZhName %>：</dt><%--ITEM_ID--%>
               <dd>
                
                    <asp:Label id="txtITEM_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.FORM_ID.ZhName %>：</dt><%--FORM_ID--%>
               <dd>
                
                    <asp:Label id="txtFORM_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.COLUMN_ID.ZhName %>：</dt><%--COLUMN_ID--%>
               <dd>
                
                    <asp:Label id="txtCOLUMN_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.VALUE.ZhName %>：</dt><%--选项值--%>
               <dd>
                
                    <asp:Label id="txtVALUE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.TEXT.ZhName %>：</dt><%--选项名--%>
               <dd>
                
                    <asp:Label id="txtTEXT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.DROP_REAL.ZhName %>：</dt><%--联动下拉框信息--%>
               <dd>
               
                    <asp:Label id="txtDROP_REAL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.COL_HIDE.ZhName %>：</dt><%--显示隐藏列信息--%>
               <dd>
               
                    <asp:Label id="txtCOL_HIDE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>