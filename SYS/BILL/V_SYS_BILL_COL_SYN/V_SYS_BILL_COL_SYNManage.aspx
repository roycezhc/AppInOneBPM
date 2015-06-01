<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="V_SYS_BILL_COL_SYNManage.aspx.cs" Inherits="V_SYS_BILL_COL_SYNManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="SYS_BILL_COL_SYN.COL_SYNID">
               <dt><%=SYS_BILL_COL_SYN.Attribute.COL_SYNID.ZhName %>：</dt><!--COL_SYNID-->
               <dd><span>
                
                    <input id="txtCOL_SYNID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.BILL_ID">
               <dt><%=SYS_BILL_COL_SYN.Attribute.BILL_ID.ZhName %>：</dt><!--BILL_ID-->
               <dd><span>
                
                    <input id="txtBILL_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.COL_ID">
               <dt><%=SYS_BILL_COL_SYN.Attribute.COL_ID.ZhName %>：</dt><!--COL_ID-->
               <dd><span>
                
                    <input id="txtCOL_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.DB_SRC">
               <dt><%=SYS_BILL_COL_SYN.Attribute.DB_SRC.ZhName %>：</dt><!--DB_SRC-->
               <dd><span>
                
                    <input id="txtDB_SRC" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.TABLE_NAME">
               <dt><%=SYS_BILL_COL_SYN.Attribute.TABLE_NAME.ZhName %>：</dt><!--TABLE_NAME-->
               <dd><span>
                
                    <input id="txtTABLE_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.COL_NAME">
               <dt><%=SYS_BILL_COL_SYN.Attribute.COL_NAME.ZhName %>：</dt><!--COL_NAME-->
               <dd><span>
                
                    <input id="txtCOL_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.COL_NOTE">
               <dt><%=SYS_BILL_COL_SYN.Attribute.COL_NOTE.ZhName %>：</dt><!--COL_NOTE-->
               <dd><span>
                
                    <input id="txtCOL_NOTE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.DATA_TYPE">
               <dt><%=SYS_BILL_COL_SYN.Attribute.DATA_TYPE.ZhName %>：</dt><!--DATA_TYPE-->
               <dd><span>
                
                    <input id="txtDATA_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.DATA_LEN">
               <dt><%=SYS_BILL_COL_SYN.Attribute.DATA_LEN.ZhName %>：</dt><!--DATA_LEN-->
               <dd><span>
                
                    <input id="txtDATA_LEN" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.DATA_ACC">
               <dt><%=SYS_BILL_COL_SYN.Attribute.DATA_ACC.ZhName %>：</dt><!--DATA_ACC-->
               <dd><span>
                
                    <input id="txtDATA_ACC" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.IS_AUTO">
               <dt><%=SYS_BILL_COL_SYN.Attribute.IS_AUTO.ZhName %>：</dt><!--IS_AUTO-->
               <dd><span>
                
                    <input id="txtIS_AUTO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.ISPK">
               <dt><%=SYS_BILL_COL_SYN.Attribute.ISPK.ZhName %>：</dt><!--ISPK-->
               <dd><span>
                
                    <input id="txtISPK" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.DVAL">
               <dt><%=SYS_BILL_COL_SYN.Attribute.DVAL.ZhName %>：</dt><!--DVAL-->
               <dd><span>
                
                    <input id="txtDVAL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.PK_VALCODE">
               <dt><%=SYS_BILL_COL_SYN.Attribute.PK_VALCODE.ZhName %>：</dt><!--PK_VALCODE-->
               <dd><span>
                
                    <input id="txtPK_VALCODE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.ISFK">
               <dt><%=SYS_BILL_COL.Attribute.ISFK.ZhName %>：</dt><!--ISFK-->
               <dd><span>
                
                    <input id="txtISFK" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.SORT_NO">
               <dt><%=SYS_BILL_COL.Attribute.SORT_NO.ZhName %>：</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FK_NAME">
               <dt><%=SYS_BILL_COL.Attribute.FK_NAME.ZhName %>：</dt><!--FK_NAME-->
               <dd><span>
                
                    <input id="txtFK_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FK_SHOW">
               <dt><%=SYS_BILL_COL.Attribute.FK_SHOW.ZhName %>：</dt><!--FK_SHOW-->
               <dd><span>
                
                    <input id="txtFK_SHOW" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.DISPLAY_NAME">
               <dt><%=SYS_BILL_COL.Attribute.DISPLAY_NAME.ZhName %>：</dt><!--DISPLAY_NAME-->
               <dd><span>
                
                    <input id="txtDISPLAY_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.TITLE">
               <dt><%=SYS_BILL_COL.Attribute.TITLE.ZhName %>：</dt><!--TITLE-->
               <dd><span>
                
                    <input id="txtTITLE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.BILL_ROW_FORMULAR">
               <dt><%=SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR.ZhName %>：</dt><!--BILL_ROW_FORMULAR-->
               <dd><span>
               
                    <input id="txtBILL_ROW_FORMULAR" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.BILL_COL_FORMULAR">
               <dt><%=SYS_BILL_COL.Attribute.BILL_COL_FORMULAR.ZhName %>：</dt><!--BILL_COL_FORMULAR-->
               <dd><span>
               
                    <input id="txtBILL_COL_FORMULAR" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.BILL_ISHEADER">
               <dt><%=SYS_BILL_COL.Attribute.BILL_ISHEADER.ZhName %>：</dt><!--BILL_ISHEADER-->
               <dd><span>
                
                    <input id="txtBILL_ISHEADER" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.BILL_HERDERWIDTH">
               <dt><%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH.ZhName %>：</dt><!--BILL_HERDERWIDTH-->
               <dd><span>
                
                    <input id="txtBILL_HERDERWIDTH" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FORM_CHECKTYPE">
               <dt><%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE.ZhName %>：</dt><!--FORM_CHECKTYPE-->
               <dd><span>
                
                    <input id="txtFORM_CHECKTYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.BILL_AFTREDTL">
               <dt><%=SYS_BILL_COL.Attribute.BILL_AFTREDTL.ZhName %>：</dt><!--BILL_AFTREDTL-->
               <dd><span>
                
                    <input id="txtBILL_AFTREDTL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FORM_CTRL_ID">
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRL_ID.ZhName %>：</dt><!--FORM_CTRL_ID-->
               <dd><span>
                
                    <input id="txtFORM_CTRL_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FORM_SHOW">
               <dt><%=SYS_BILL_COL.Attribute.FORM_SHOW.ZhName %>：</dt><!--FORM_SHOW-->
               <dd><span>
                
                    <input id="txtFORM_SHOW" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FORM_NEED">
               <dt><%=SYS_BILL_COL.Attribute.FORM_NEED.ZhName %>：</dt><!--FORM_NEED-->
               <dd><span>
                
                    <input id="txtFORM_NEED" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FORM_MIN">
               <dt><%=SYS_BILL_COL.Attribute.FORM_MIN.ZhName %>：</dt><!--FORM_MIN-->
               <dd><span>
                
                    <input id="txtFORM_MIN" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FORM_MAX">
               <dt><%=SYS_BILL_COL.Attribute.FORM_MAX.ZhName %>：</dt><!--FORM_MAX-->
               <dd><span>
                
                    <input id="txtFORM_MAX" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FORM_ONEROW">
               <dt><%=SYS_BILL_COL.Attribute.FORM_ONEROW.ZhName %>：</dt><!--FORM_ONEROW-->
               <dd><span>
                
                    <input id="txtFORM_ONEROW" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.SEARCH_INBILL">
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_INBILL.ZhName %>：</dt><!--SEARCH_INBILL-->
               <dd><span>
                
                    <input id="txtSEARCH_INBILL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.FORM_CTRLWIDTH">
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH.ZhName %>：</dt><!--FORM_CTRLWIDTH-->
               <dd><span>
                
                    <input id="txtFORM_CTRLWIDTH" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.SEARCH_TYPE">
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_TYPE.ZhName %>：</dt><!--SEARCH_TYPE-->
               <dd><span>
                
                    <input id="txtSEARCH_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.SEARCH_FORMULAR">
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR.ZhName %>：</dt><!--SEARCH_FORMULAR-->
               <dd><span>
                
                    <input id="txtSEARCH_FORMULAR" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.STATUS">
               <dt><%=SYS_BILL_COL.Attribute.STATUS.ZhName %>：</dt><!--STATUS-->
               <dd><span>
                
                    <input id="txtSTATUS" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.SEL_TB_COL">
               <dt><%=SYS_BILL_COL.Attribute.SEL_TB_COL.ZhName %>：</dt><!--SEL_TB_COL-->
               <dd><span>
                
                    <input id="txtSEL_TB_COL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.IS_COL_EXISTS">
               <dt><%=SYS_BILL_COL.Attribute.IS_COL_EXISTS.ZhName %>：</dt><!--IS_COL_EXISTS-->
               <dd><span>
                
                    <input id="txtIS_COL_EXISTS" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.BILL_NAME">
               <dt><%=SYS_BILL.Attribute.BILL_NAME.ZhName %>：</dt><!--BILL_NAME-->
               <dd><span>
                
                    <input id="txtBILL_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.BILL_TYPE">
               <dt><%=SYS_BILL.Attribute.BILL_TYPE.ZhName %>：</dt><!--BILL_TYPE-->
               <dd><span>
                
                    <input id="txtBILL_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.BILL_SQL">
               <dt><%=SYS_BILL.Attribute.BILL_SQL.ZhName %>：</dt><!--BILL_SQL-->
               <dd><span>
                
                    <input id="txtBILL_SQL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.ADDTIME">
               <dt><%=SYS_BILL.Attribute.ADDTIME.ZhName %>：</dt><!--ADDTIME-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.EDITIME">
               <dt><%=SYS_BILL.Attribute.EDITIME.ZhName %>：</dt><!--EDITIME-->
               <dd><span>
               
                    <input id="txtEDITIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.ADDER">
               <dt><%=SYS_BILL.Attribute.ADDER.ZhName%>：</dt><!--ADDER-->
               <dd><span>
                
                    <input id="txtADDER" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_SYS_BILL_COL_SYN.Expr1">
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.Expr1.ZhName%>：</dt><!--Expr1-->
               <dd><span>
                
                    <input id="txtExpr1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.P_BILL_ID">
               <dt><%=SYS_BILL.Attribute.P_BILL_ID.ZhName %>：</dt><!--P_BILL_ID-->
               <dd><span>
                
                    <input id="txtP_BILL_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_SYS_BILL_COL_SYN.BILL_STATUS">
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_STATUS.ZhName%>：</dt><!--BILL_STATUS-->
               <dd><span>
                
                    <input id="txtBILL_STATUS" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.CONN_SOURCE">
               <dt><%=SYS_BILL.Attribute.CONN_SOURCE.ZhName %>：</dt><!--CONN_SOURCE-->
               <dd><span>
               
                    <input id="txtCONN_SOURCE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.IS_TABLE_EXISTS">
               <dt><%=SYS_BILL.Attribute.IS_TABLE_EXISTS.ZhName %>：</dt><!--IS_TABLE_EXISTS-->
               <dd><span>
                
                    <input id="txtIS_TABLE_EXISTS" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL_SYN.KEYS">
               <dt><%=SYS_BILL.Attribute.KEYS.ZhName %>：</dt><!--KEYS-->
               <dd><span>
                
                    <input id="txtKEYS" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newV_SYS_BILL_COL_SYN" id="btn_New" type="button" value="新建" onclick="manager.newRecord('V_SYS_BILL_COL_SYNEdit.aspx');" /></span></li>
            <li><span><input power="editV_SYS_BILL_COL_SYN" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('V_SYS_BILL_COL_SYNEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newV_SYS_BILL_COL_SYN" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('V_SYS_BILL_COL_SYNBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="COL_SYNID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="V_SYS_BILL_COL_SYNManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.COL_SYNID.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.COL_SYNID._ZhName %></td><!--COL_SYNID-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.BILL_ID.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.BILL_ID._ZhName %></td><!--BILL_ID-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.COL_ID.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.COL_ID._ZhName %></td><!--COL_ID-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.DB_SRC.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.DB_SRC._ZhName %></td><!--DB_SRC-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.TABLE_NAME.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.TABLE_NAME._ZhName %></td><!--TABLE_NAME-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.COL_NAME.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.COL_NAME._ZhName %></td><!--COL_NAME-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.COL_NOTE.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.COL_NOTE._ZhName %></td><!--COL_NOTE-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.DATA_TYPE.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.DATA_TYPE._ZhName %></td><!--DATA_TYPE-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.DATA_LEN.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.DATA_LEN._ZhName %></td><!--DATA_LEN-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.DATA_ACC.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.DATA_ACC._ZhName %></td><!--DATA_ACC-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.IS_AUTO.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.IS_AUTO._ZhName %></td><!--IS_AUTO-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.ISPK.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.ISPK._ZhName %></td><!--ISPK-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.DVAL.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.DVAL._ZhName %></td><!--DVAL-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL_SYN.Attribute.PK_VALCODE.LongName%>',show:1}"><%=SYS_BILL_COL_SYN.Attribute.PK_VALCODE._ZhName %></td><!--PK_VALCODE-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.ISFK.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.ISFK._ZhName %></td><!--ISFK-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.SORT_NO.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FK_NAME.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FK_NAME._ZhName %></td><!--FK_NAME-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FK_SHOW.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FK_SHOW._ZhName %></td><!--FK_SHOW-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.DISPLAY_NAME.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.DISPLAY_NAME._ZhName %></td><!--DISPLAY_NAME-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.TITLE.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.TITLE._ZhName %></td><!--TITLE-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR._ZhName %></td><!--BILL_ROW_FORMULAR-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_COL_FORMULAR.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_COL_FORMULAR._ZhName %></td><!--BILL_COL_FORMULAR-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_ISHEADER.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_ISHEADER._ZhName %></td><!--BILL_ISHEADER-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH._ZhName %></td><!--BILL_HERDERWIDTH-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE._ZhName %></td><!--FORM_CHECKTYPE-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_AFTREDTL.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_AFTREDTL._ZhName %></td><!--BILL_AFTREDTL-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_CTRL_ID.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_CTRL_ID._ZhName %></td><!--FORM_CTRL_ID-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_SHOW.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_SHOW._ZhName %></td><!--FORM_SHOW-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_NEED.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_NEED._ZhName %></td><!--FORM_NEED-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_MIN.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_MIN._ZhName %></td><!--FORM_MIN-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_MAX.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_MAX._ZhName %></td><!--FORM_MAX-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_ONEROW.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_ONEROW._ZhName %></td><!--FORM_ONEROW-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.SEARCH_INBILL.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.SEARCH_INBILL._ZhName %></td><!--SEARCH_INBILL-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH._ZhName %></td><!--FORM_CTRLWIDTH-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.SEARCH_TYPE.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.SEARCH_TYPE._ZhName %></td><!--SEARCH_TYPE-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR._ZhName %></td><!--SEARCH_FORMULAR-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.STATUS.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.STATUS._ZhName %></td><!--STATUS-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.SEL_TB_COL.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.SEL_TB_COL._ZhName %></td><!--SEL_TB_COL-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.IS_COL_EXISTS.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.IS_COL_EXISTS._ZhName %></td><!--IS_COL_EXISTS-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.BILL_NAME.LongName%>',show:1}"><%=SYS_BILL.Attribute.BILL_NAME._ZhName %></td><!--BILL_NAME-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.BILL_TYPE.LongName%>',show:1}"><%=SYS_BILL.Attribute.BILL_TYPE._ZhName %></td><!--BILL_TYPE-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.BILL_SQL.LongName%>',show:1}"><%=SYS_BILL.Attribute.BILL_SQL._ZhName %></td><!--BILL_SQL-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.ADDTIME.LongName%>',show:1}"><%=SYS_BILL.Attribute.ADDTIME._ZhName %></td><!--ADDTIME-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.EDITIME.LongName%>',show:1}"><%=SYS_BILL.Attribute.EDITIME._ZhName %></td><!--EDITIME-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.ADDER.LongName%>',show:1}"><%=SYS_BILL.Attribute.ADDER._ZhName %></td><!--ADDER-->
                    
                    
                    <td data="{colname:'<%=V_SYS_BILL_COL_SYN.Attribute.Expr1.LongName%>',show:1}"><%=V_SYS_BILL_COL_SYN.Attribute.Expr1._ZhName%></td><!--Expr1-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.P_BILL_ID.LongName%>',show:1}"><%=SYS_BILL.Attribute.P_BILL_ID._ZhName %></td><!--P_BILL_ID-->
                    
                    
                    <td data="{colname:'<%=V_SYS_BILL_COL_SYN.Attribute.BILL_STATUS.LongName%>',show:1}"><%=V_SYS_BILL_COL_SYN.Attribute.BILL_STATUS._ZhName%></td><!--BILL_STATUS-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.CONN_SOURCE.LongName%>',show:1}"><%=SYS_BILL.Attribute.CONN_SOURCE._ZhName %></td><!--CONN_SOURCE-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.IS_TABLE_EXISTS.LongName%>',show:1}"><%=SYS_BILL.Attribute.IS_TABLE_EXISTS._ZhName %></td><!--IS_TABLE_EXISTS-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL.Attribute.KEYS.LongName%>',show:1}"><%=SYS_BILL.Attribute.KEYS._ZhName %></td><!--KEYS-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            
            <td>{COL_SYNID}</td>
            
            <td>{BILL_ID}</td>
            
            <td>{COL_ID}</td>
            
            <td>{DB_SRC}</td>
            
            <td>{TABLE_NAME}</td>
            
            <td>{COL_NAME}</td>
            
            <td>{COL_NOTE}</td>
            
            <td>{DATA_TYPE}</td>
            
            <td>{DATA_LEN}</td>
            
            <td>{DATA_ACC}</td>
            
            <td>{IS_AUTO}</td>
            
            <td>{ISPK}</td>
            
            <td>{DVAL}</td>
            
            <td>{PK_VALCODE}</td>
            
            <td>{ISFK}</td>
            
            <td>{SORT_NO}</td>
            
            <td>{FK_NAME}</td>
            
            <td>{FK_SHOW}</td>
            
            <td>{DISPLAY_NAME}</td>
            
            <td>{TITLE}</td>
            
            <td>{BILL_ROW_FORMULAR}</td>
            
            <td>{BILL_COL_FORMULAR}</td>
            
            <td>{BILL_ISHEADER}</td>
            
            <td>{BILL_HERDERWIDTH}</td>
            
            <td>{FORM_CHECKTYPE}</td>
            
            <td>{BILL_AFTREDTL}</td>
            
            <td>{FORM_CTRL_ID}</td>
            
            <td>{FORM_SHOW}</td>
            
            <td>{FORM_NEED}</td>
            
            <td>{FORM_MIN}</td>
            
            <td>{FORM_MAX}</td>
            
            <td>{FORM_ONEROW}</td>
            
            <td>{SEARCH_INBILL}</td>
            
            <td>{FORM_CTRLWIDTH}</td>
            
            <td>{SEARCH_TYPE}</td>
            
            <td>{SEARCH_FORMULAR}</td>
            
            <td>{STATUS}</td>
            
            <td>{SEL_TB_COL}</td>
            
            <td>{IS_COL_EXISTS}</td>
            
            <td>{BILL_NAME}</td>
            
            <td>{BILL_TYPE}</td>
            
            <td>{BILL_SQL}</td>
            
            <td>{ADDTIME}</td>
            
            <td>{EDITIME}</td>
            
            <td>{ADDER}</td>
            
            <td>{Expr1}</td>
            
            <td>{P_BILL_ID}</td>
            
            <td>{BILL_STATUS}</td>
            
            <td>{CONN_SOURCE}</td>
            
            <td>{IS_TABLE_EXISTS}</td>
            
            <td>{KEYS}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((V_SYS_BILL_COL_SYN)Container.DataItem).COL_SYNID%>" /></td>
                   <%-- <td><%#showLeftLinks(((V_SYS_BILL_COL_SYN)Container.DataItem).PATH, ((V_SYS_BILL_COL_SYN)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).COL_SYNID %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_ID %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).COL_ID %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).DB_SRC %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).TABLE_NAME %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).COL_NAME %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).COL_NOTE %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).DATA_TYPE %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).DATA_LEN %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).DATA_ACC %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).IS_AUTO %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).ISPK %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).DVAL %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).PK_VALCODE %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).ISFK %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FK_NAME %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FK_SHOW %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).DISPLAY_NAME %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).TITLE %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_ROW_FORMULAR)%></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_COL_FORMULAR) %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_ISHEADER %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_HERDERWIDTH %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FORM_CHECKTYPE %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_AFTREDTL %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FORM_CTRL_ID %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FORM_SHOW %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FORM_NEED %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FORM_MIN %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FORM_MAX %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FORM_ONEROW %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).SEARCH_INBILL %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).FORM_CTRLWIDTH %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).SEARCH_TYPE %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).SEARCH_FORMULAR %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).STATUS %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).SEL_TB_COL %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).IS_COL_EXISTS %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_NAME %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_TYPE %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_SQL) %></td>
                    
                    
                    <td><%#(((V_SYS_BILL_COL_SYN)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((V_SYS_BILL_COL_SYN)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((V_SYS_BILL_COL_SYN)Container.DataItem).EDITIME == DateTime.MinValue) ? "" : ((V_SYS_BILL_COL_SYN)Container.DataItem).EDITIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).ADDER %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).Expr1 %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).P_BILL_ID %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).BILL_STATUS %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((V_SYS_BILL_COL_SYN)Container.DataItem).CONN_SOURCE) %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).IS_TABLE_EXISTS %></td>
                    
                    
                    <td><%#((V_SYS_BILL_COL_SYN)Container.DataItem).KEYS %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="path-url hide">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>