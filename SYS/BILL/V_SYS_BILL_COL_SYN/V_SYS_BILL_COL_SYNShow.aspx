<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="V_SYS_BILL_COL_SYNShow.aspx.cs" Inherits="V_SYS_BILL_COL_SYNShow" %>
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
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_SYNID.ZhName %>£º</dt><%--COL_SYNID--%>
               <dd>
                
                    <asp:Label id="txtCOL_SYNID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_ID.ZhName %>£º</dt><%--BILL_ID--%>
               <dd>
                
                    <asp:Label id="txtBILL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_ID.ZhName %>£º</dt><%--COL_ID--%>
               <dd>
                
                    <asp:Label id="txtCOL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DB_SRC.ZhName %>£º</dt><%--DB_SRC--%>
               <dd>
                
                    <asp:Label id="txtDB_SRC" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.TABLE_NAME.ZhName %>£º</dt><%--TABLE_NAME--%>
               <dd>
                
                    <asp:Label id="txtTABLE_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_NAME.ZhName %>£º</dt><%--COL_NAME--%>
               <dd>
                
                    <asp:Label id="txtCOL_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_NOTE.ZhName %>£º</dt><%--COL_NOTE--%>
               <dd>
                
                    <asp:Label id="txtCOL_NOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DATA_TYPE.ZhName %>£º</dt><%--DATA_TYPE--%>
               <dd>
                
                    <asp:Label id="txtDATA_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DATA_LEN.ZhName %>£º</dt><%--DATA_LEN--%>
               <dd>
                
                    <asp:Label id="txtDATA_LEN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DATA_ACC.ZhName %>£º</dt><%--DATA_ACC--%>
               <dd>
                
                    <asp:Label id="txtDATA_ACC" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.IS_AUTO.ZhName %>£º</dt><%--IS_AUTO--%>
               <dd>
                
                    <asp:Label id="txtIS_AUTO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ISPK.ZhName %>£º</dt><%--ISPK--%>
               <dd>
                
                    <asp:Label id="txtISPK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DVAL.ZhName %>£º</dt><%--DVAL--%>
               <dd>
                
                    <asp:Label id="txtDVAL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.PK_VALCODE.ZhName %>£º</dt><%--PK_VALCODE--%>
               <dd>
                
                    <asp:Label id="txtPK_VALCODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ISFK.ZhName %>£º</dt><%--ISFK--%>
               <dd>
                
                    <asp:Label id="txtISFK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SORT_NO.ZhName %>£º</dt><%--SORT_NO--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FK_NAME.ZhName %>£º</dt><%--FK_NAME--%>
               <dd>
                
                    <asp:Label id="txtFK_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FK_SHOW.ZhName %>£º</dt><%--FK_SHOW--%>
               <dd>
                
                    <asp:Label id="txtFK_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DISPLAY_NAME.ZhName %>£º</dt><%--DISPLAY_NAME--%>
               <dd>
                
                    <asp:Label id="txtDISPLAY_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.TITLE.ZhName %>£º</dt><%--TITLE--%>
               <dd>
                
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_ROW_FORMULAR.ZhName %>£º</dt><%--BILL_ROW_FORMULAR--%>
               <dd>
               
                    <asp:Label id="txtBILL_ROW_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_COL_FORMULAR.ZhName %>£º</dt><%--BILL_COL_FORMULAR--%>
               <dd>
               
                    <asp:Label id="txtBILL_COL_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_ISHEADER.ZhName %>£º</dt><%--BILL_ISHEADER--%>
               <dd>
                
                    <asp:Label id="txtBILL_ISHEADER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_HERDERWIDTH.ZhName %>£º</dt><%--BILL_HERDERWIDTH--%>
               <dd>
                
                    <asp:Label id="txtBILL_HERDERWIDTH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_CHECKTYPE.ZhName %>£º</dt><%--FORM_CHECKTYPE--%>
               <dd>
                
                    <asp:Label id="txtFORM_CHECKTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_AFTREDTL.ZhName %>£º</dt><%--BILL_AFTREDTL--%>
               <dd>
                
                    <asp:Label id="txtBILL_AFTREDTL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_CTRL_ID.ZhName %>£º</dt><%--FORM_CTRL_ID--%>
               <dd>
                
                    <asp:Label id="txtFORM_CTRL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_SHOW.ZhName %>£º</dt><%--FORM_SHOW--%>
               <dd>
                
                    <asp:Label id="txtFORM_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_NEED.ZhName %>£º</dt><%--FORM_NEED--%>
               <dd>
                
                    <asp:Label id="txtFORM_NEED" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_MIN.ZhName %>£º</dt><%--FORM_MIN--%>
               <dd>
                
                    <asp:Label id="txtFORM_MIN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_MAX.ZhName %>£º</dt><%--FORM_MAX--%>
               <dd>
                
                    <asp:Label id="txtFORM_MAX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_ONEROW.ZhName %>£º</dt><%--FORM_ONEROW--%>
               <dd>
                
                    <asp:Label id="txtFORM_ONEROW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEARCH_INBILL.ZhName %>£º</dt><%--SEARCH_INBILL--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_INBILL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_CTRLWIDTH.ZhName %>£º</dt><%--FORM_CTRLWIDTH--%>
               <dd>
                
                    <asp:Label id="txtFORM_CTRLWIDTH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEARCH_TYPE.ZhName %>£º</dt><%--SEARCH_TYPE--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEARCH_FORMULAR.ZhName %>£º</dt><%--SEARCH_FORMULAR--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.STATUS.ZhName %>£º</dt><%--STATUS--%>
               <dd>
                
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEL_TB_COL.ZhName %>£º</dt><%--SEL_TB_COL--%>
               <dd>
                
                    <asp:Label id="txtSEL_TB_COL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.IS_COL_EXISTS.ZhName %>£º</dt><%--IS_COL_EXISTS--%>
               <dd>
                
                    <asp:Label id="txtIS_COL_EXISTS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_NAME.ZhName %>£º</dt><%--BILL_NAME--%>
               <dd>
                
                    <asp:Label id="txtBILL_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_TYPE.ZhName %>£º</dt><%--BILL_TYPE--%>
               <dd>
                
                    <asp:Label id="txtBILL_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_SQL.ZhName %>£º</dt><%--BILL_SQL--%>
               <dd>
               
                    <asp:Label ID="txtBILL_SQL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ADDTIME.ZhName %>£º</dt><%--ADDTIME--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.EDITIME.ZhName %>£º</dt><%--EDITIME--%>
               <dd>
               
                    <asp:Label id="txtEDITIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ADDER.ZhName %>£º</dt><%--ADDER--%>
               <dd>
                
                    <asp:Label id="txtADDER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.Expr1.ZhName %>£º</dt><%--Expr1--%>
               <dd>
                
                    <asp:Label id="txtExpr1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.P_BILL_ID.ZhName %>£º</dt><%--P_BILL_ID--%>
               <dd>
                
                    <asp:Label id="txtP_BILL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_STATUS.ZhName %>£º</dt><%--BILL_STATUS--%>
               <dd>
                
                    <asp:Label id="txtBILL_STATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.CONN_SOURCE.ZhName %>£º</dt><%--CONN_SOURCE--%>
               <dd>
               
                    <asp:Label id="txtCONN_SOURCE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.IS_TABLE_EXISTS.ZhName %>£º</dt><%--IS_TABLE_EXISTS--%>
               <dd>
                
                    <asp:Label id="txtIS_TABLE_EXISTS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.KEYS.ZhName %>£º</dt><%--KEYS--%>
               <dd>
                
                    <asp:Label id="txtKEYS" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>