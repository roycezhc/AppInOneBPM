<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="V_SYS_BILL_COL_SYNEdit.aspx.cs" Inherits="V_SYS_BILL_COL_SYNEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_SYNID.ZhName %>：</dt><%--COL_SYNID--%>
               <dd><span>
                
                    <input id="txtCOL_SYNID" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_ID.ZhName %>：</dt><%--BILL_ID--%>
               <dd><span>
                
                    <input id="txtBILL_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_ID.ZhName %>：</dt><%--COL_ID--%>
               <dd><span>
                
                    <input id="txtCOL_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DB_SRC.ZhName %>：</dt><%--DB_SRC--%>
               <dd><span>
                
                    <input id="txtDB_SRC" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.TABLE_NAME.ZhName %>：</dt><%--TABLE_NAME--%>
               <dd><span>
                
                    <input id="txtTABLE_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_NAME.ZhName %>：</dt><%--COL_NAME--%>
               <dd><span>
                
                    <input id="txtCOL_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_NOTE.ZhName %>：</dt><%--COL_NOTE--%>
               <dd><span>
                
                    <input id="txtCOL_NOTE" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DATA_TYPE.ZhName %>：</dt><%--DATA_TYPE--%>
               <dd><span>
                
                    <input id="txtDATA_TYPE" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DATA_LEN.ZhName %>：</dt><%--DATA_LEN--%>
               <dd><span>
                
                    <input id="txtDATA_LEN" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DATA_ACC.ZhName %>：</dt><%--DATA_ACC--%>
               <dd><span>
                
                    <input id="txtDATA_ACC" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.IS_AUTO.ZhName %>：</dt><%--IS_AUTO--%>
               <dd><span>
                
                    <input id="txtIS_AUTO" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ISPK.ZhName %>：</dt><%--ISPK--%>
               <dd><span>
                
                    <input id="txtISPK" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DVAL.ZhName %>：</dt><%--DVAL--%>
               <dd><span>
                
                    <input id="txtDVAL" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.PK_VALCODE.ZhName %>：</dt><%--PK_VALCODE--%>
               <dd><span>
                
                    <input id="txtPK_VALCODE" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ISFK.ZhName %>：</dt><%--ISFK--%>
               <dd><span>
                
                    <input id="txtISFK" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SORT_NO.ZhName %>：</dt><%--SORT_NO--%>
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FK_NAME.ZhName %>：</dt><%--FK_NAME--%>
               <dd><span>
                
                    <input id="txtFK_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FK_SHOW.ZhName %>：</dt><%--FK_SHOW--%>
               <dd><span>
                
                    <input id="txtFK_SHOW" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DISPLAY_NAME.ZhName %>：</dt><%--DISPLAY_NAME--%>
               <dd><span>
                
                    <input id="txtDISPLAY_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.TITLE.ZhName %>：</dt><%--TITLE--%>
               <dd><span>
                
                    <input id="txtTITLE" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_ROW_FORMULAR.ZhName %>：</dt><%--BILL_ROW_FORMULAR--%>
               <dd><span>
               
                    <textarea id="txtBILL_ROW_FORMULAR" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:950,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_COL_FORMULAR.ZhName %>：</dt><%--BILL_COL_FORMULAR--%>
               <dd><span>
               
                    <textarea id="txtBILL_COL_FORMULAR" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:950,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_ISHEADER.ZhName %>：</dt><%--BILL_ISHEADER--%>
               <dd><span>
                
                    <input id="txtBILL_ISHEADER" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_HERDERWIDTH.ZhName %>：</dt><%--BILL_HERDERWIDTH--%>
               <dd><span>
                
                    <input id="txtBILL_HERDERWIDTH" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_CHECKTYPE.ZhName %>：</dt><%--FORM_CHECKTYPE--%>
               <dd><span>
                
                    <input id="txtFORM_CHECKTYPE" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_AFTREDTL.ZhName %>：</dt><%--BILL_AFTREDTL--%>
               <dd><span>
                
                    <input id="txtBILL_AFTREDTL" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_CTRL_ID.ZhName %>：</dt><%--FORM_CTRL_ID--%>
               <dd><span>
                
                    <input id="txtFORM_CTRL_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_SHOW.ZhName %>：</dt><%--FORM_SHOW--%>
               <dd><span>
                
                    <input id="txtFORM_SHOW" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_NEED.ZhName %>：</dt><%--FORM_NEED--%>
               <dd><span>
                
                    <input id="txtFORM_NEED" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_MIN.ZhName %>：</dt><%--FORM_MIN--%>
               <dd><span>
                
                    <input id="txtFORM_MIN" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_MAX.ZhName %>：</dt><%--FORM_MAX--%>
               <dd><span>
                
                    <input id="txtFORM_MAX" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_ONEROW.ZhName %>：</dt><%--FORM_ONEROW--%>
               <dd><span>
                
                    <input id="txtFORM_ONEROW" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEARCH_INBILL.ZhName %>：</dt><%--SEARCH_INBILL--%>
               <dd><span>
                
                    <input id="txtSEARCH_INBILL" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_CTRLWIDTH.ZhName %>：</dt><%--FORM_CTRLWIDTH--%>
               <dd><span>
                
                    <input id="txtFORM_CTRLWIDTH" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEARCH_TYPE.ZhName %>：</dt><%--SEARCH_TYPE--%>
               <dd><span>
                
                    <input id="txtSEARCH_TYPE" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEARCH_FORMULAR.ZhName %>：</dt><%--SEARCH_FORMULAR--%>
               <dd><span>
                
                    <input id="txtSEARCH_FORMULAR" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.STATUS.ZhName %>：</dt><%--STATUS--%>
               <dd><span>
                
                    <input id="txtSTATUS" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEL_TB_COL.ZhName %>：</dt><%--SEL_TB_COL--%>
               <dd><span>
                
                    <input id="txtSEL_TB_COL" type="text" runat="server" ck="{need:0,len:150,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.IS_COL_EXISTS.ZhName %>：</dt><%--IS_COL_EXISTS--%>
               <dd><span>
                
                    <input id="txtIS_COL_EXISTS" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_NAME.ZhName %>：</dt><%--BILL_NAME--%>
               <dd><span>
                
                    <input id="txtBILL_NAME" type="text" runat="server" ck="{need:0,len:150,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_TYPE.ZhName %>：</dt><%--BILL_TYPE--%>
               <dd><span>
                
                    <input id="txtBILL_TYPE" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_SQL.ZhName %>：</dt><%--BILL_SQL--%>
               <dd><span>
               
                    <FCKV2:FCKeditor ID="txtBILL_SQL" runat="server" Height="250" Width="400" ToolbarSet="Basic" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ADDTIME.ZhName %>：</dt><%--ADDTIME--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.EDITIME.ZhName %>：</dt><%--EDITIME--%>
               <dd><span>
               
                    <input id="txtEDITIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ADDER.ZhName %>：</dt><%--ADDER--%>
               <dd><span>
                
                    <input id="txtADDER" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.Expr1.ZhName %>：</dt><%--Expr1--%>
               <dd><span>
                
                    <input id="txtExpr1" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.P_BILL_ID.ZhName %>：</dt><%--P_BILL_ID--%>
               <dd><span>
                
                    <input id="txtP_BILL_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_STATUS.ZhName %>：</dt><%--BILL_STATUS--%>
               <dd><span>
                
                    <input id="txtBILL_STATUS" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.CONN_SOURCE.ZhName %>：</dt><%--CONN_SOURCE--%>
               <dd><span>
               
                    <textarea id="txtCONN_SOURCE" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:750,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.IS_TABLE_EXISTS.ZhName %>：</dt><%--IS_TABLE_EXISTS--%>
               <dd><span>
                
                    <input id="txtIS_TABLE_EXISTS" type="text" runat="server" ck="{need:0,len:1,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.KEYS.ZhName %>：</dt><%--KEYS--%>
               <dd><span>
                
                    <input id="txtKEYS" type="text" runat="server" ck="{need:0,len:150,type:0}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>