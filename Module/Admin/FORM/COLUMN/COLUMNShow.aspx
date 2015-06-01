<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMNShow" CodeFile="COLUMNShow.aspx.cs" %>
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
               <dt><%=TF_F_COLUMN.Attribute.COLUMN_ID.ZhName %>：</dt><%--COLUMN_ID--%>
               <dd>
                
                    <asp:Label id="txtCOLUMN_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.FORM_ID.ZhName %>：</dt><%--FORM_ID--%>
               <dd>
                
                    <asp:Label id="txtFORM_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.TB_ID.ZhName %>：</dt><%--栏目所属表--%>
               <dd>
                
                    <asp:Label id="txtTB_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.FIELD_ID.ZhName %>：</dt><%--FIELD_ID--%>
               <dd>
                
                    <asp:Label id="txtFIELD_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.SHOW_NAME.ZhName %>：</dt><%--显示名称--%>
               <dd>
                
                    <asp:Label id="txtSHOW_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.CTRL_TYPE.ZhName %>：</dt><%--CTRL_TYPE--%>
               <dd>
                
                    <asp:Label id="txtCTRL_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.MAX_VAL.ZhName %>：</dt><%--MAX_VAL--%>
               <dd>
                
                    <asp:Label id="txtMAX_VAL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.MIN_VAL.ZhName %>：</dt><%--MIN_VAL--%>
               <dd>
                
                    <asp:Label id="txtMIN_VAL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.IS_NEED.ZhName %>：</dt><%--IS_NEED--%>
               <dd>
                
                    <asp:Label id="txtIS_NEED" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.CAL_FORMULA.ZhName %>：</dt><%--行计算规则--%>
               <dd>
                
                    <asp:Label id="txtCAL_FORMULA" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.SUM_FIELD_ID.ZhName %>：</dt><%--合计到表字段ID,表ID.字段ID--%>
               <dd>
                
                    <asp:Label id="txtSUM_FIELD_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_F_COLUMN.Attribute.SORT_NO.ZhName %>：</dt><%--SORT_NO--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>