<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLShow" CodeFile="COLShow.aspx.cs" %>
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
               <dt><%=SYS_BILL_COL.Attribute.COL_ID.ZhName %>：</dt><%--表单列ID--%>
               <dd>
                
                    <asp:Label id="txtCOL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_ID.ZhName %>：</dt><%--所属表单ID--%>
               <dd>
                
                    <asp:Label id="txtBILL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.TABLE_NAME.ZhName %>：</dt><%--列所属表--%>
               <dd>
                
                    <asp:Label id="txtTABLE_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.COL_NAME.ZhName %>：</dt><%--列明--%>
               <dd>
                
                    <asp:Label id="txtCOL_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.COL_NOTE.ZhName %>：</dt><%--列默认名--%>
               <dd>
                
                    <asp:Label id="txtCOL_NOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DATA_TYPE.ZhName %>：</dt><%--数据类型--%>
               <dd>
                
                    <asp:Label id="txtDATA_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DATA_LEN.ZhName %>：</dt><%--数据长度--%>
               <dd>
                
                    <asp:Label id="txtDATA_LEN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DATA_ACC.ZhName %>：</dt><%--数据精度--%>
               <dd>
                
                    <asp:Label id="txtDATA_ACC" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.IS_AUTO.ZhName %>：</dt><%--是否是数字递增字段--%>
               <dd>
                
                    <asp:Label id="txtIS_AUTO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.SORT_NO.ZhName %>：</dt><%--SORT_NO--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FK_SHOW.ZhName%>：</dt><%--用于显示信息的列名--%>
               <dd>
                
                    <asp:Label id="txtCOL_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DISPLAY_NAME.ZhName %>：</dt><%--列自定义显示名--%>
               <dd>
                
                    <asp:Label id="txtDISPLAY_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.TITLE.ZhName %>：</dt><%--提示标题--%>
               <dd>
                
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DVAL.ZhName %>：</dt><%--默认值--%>
               <dd>
                
                    <asp:Label id="txtDVAL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR.ZhName %>：</dt><%--行之间计算关系公式，比容总金额＝某子表单列的和--%>
               <dd>
               
                    <asp:Label id="txtBILL_ROW_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_COL_FORMULAR.ZhName %>：</dt><%--列之间计算公式，比如金额＝单价*数量--%>
               <dd>
               
                    <asp:Label id="txtBILL_COL_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_ISHEADER.ZhName %>：</dt><%--是否显示在表头--%>
               <dd>
                
                    <asp:Label id="txtBILL_ISHEADER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH.ZhName %>：</dt><%--单据表头宽度--%>
               <dd>
                
                    <asp:Label id="txtBILL_HERDERWIDTH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE.ZhName %>：</dt><%--验证数据类型--%>
               <dd>
                
                    <asp:Label id="txtFORM_CHECKTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRL_ID.ZhName %>：</dt><%--列表单控件类型--%>
               <dd>
                
                    <asp:Label id="txtFORM_CTRL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_SHOW.ZhName %>：</dt><%--需要有表单界面输入--%>
               <dd>
                
                    <asp:Label id="txtFORM_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_NEED.ZhName %>：</dt><%--是否必填--%>
               <dd>
                
                    <asp:Label id="txtFORM_NEED" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_MIN.ZhName %>：</dt><%--最小值--%>
               <dd>
                
                    <asp:Label id="txtFORM_MIN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_MAX.ZhName %>：</dt><%--最大值--%>
               <dd>
                
                    <asp:Label id="txtFORM_MAX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_ONEROW.ZhName %>：</dt><%--显示在整行--%>
               <dd>
                
                    <asp:Label id="txtFORM_ONEROW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH.ZhName %>：</dt><%--控件宽度--%>
               <dd>
                
                    <asp:Label id="txtFORM_CTRLWIDTH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_INBILL.ZhName %>：</dt><%--表单列表里条件--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_INBILL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_TYPE.ZhName %>：</dt><%--查询数据类型--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR.ZhName %>：</dt><%--查询公式--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>