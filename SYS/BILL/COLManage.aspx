<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLManage" CodeFile="COLManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
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

    function _FormView(me){
        var href = "BillView.aspx?BillID=<%=billid %>&r=" + Math.random();
        window.parent.frames["ifrShow"].location.href = href;
    }
</script>
<style type="text/css">
.topfind dl{width:265px;}
.topfind dl dt{width:120px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
        <dl colname="SYS_BILL_COL.COL_NAME">
               <dt><%=SYS_BILL_COL.Attribute.COL_NAME.ZhName %>：</dt><!--列明-->
               <dd><span>
                
                    <input id="txtCOL_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>

            <dl colname="SYS_BILL_COL.DATA_TYPE">
               <dt><%=SYS_BILL_COL.Attribute.DATA_TYPE.ZhName %>：</dt><!--数据类型-->
               <dd><span>
                
                    <input id="txtDATA_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
        <dl colname="SYS_BILL_COL.BILL_ISHEADER">
               <dt><%=SYS_BILL_COL.Attribute.BILL_ISHEADER.ZhName %>：</dt><!--是否显示在表头-->
               <dd><span>
                   <select id="txtBILL_ISHEADER" runat="server">
                       <option value="">全部</option>
                       <option value="1">是</option>
                       <option value="0">否</option>
                   </select>
               </span></dd>
               
        </dl>
       <dl colname="SYS_BILL_COL.FORM_SHOW">
               <dt><%=SYS_BILL_COL.Attribute.FORM_SHOW.ZhName %>：</dt><!--需要有表单界面输入-->
               <dd><span>
                <select id="txtFORM_SHOW" runat="server">
                       <option value="">全部</option>
                       <option value="1">需要</option>
                       <option value="0">不需要</option>
                   </select>
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_COL.FORM_NEED">
               <dt><%=SYS_BILL_COL.Attribute.FORM_NEED.ZhName %>：</dt><!--是否必填-->
               <dd><span>
                <select id="txtFORM_NEED" runat="server">
                       <option value="">全部</option>
                       <option value="1">是</option>
                       <option value="0">否</option>
                   </select>
               </span></dd>
               
        </dl>
        <dl colname="SYS_BILL_COL.FORM_ONEROW">
               <dt><%=SYS_BILL_COL.Attribute.FORM_ONEROW.ZhName %>：</dt><!--显示在整行-->
               <dd><span>
                 <select id="txtFORM_ONEROW" runat="server">
                       <option value="">全部</option>
                       <option value="1">是</option>
                       <option value="0">否</option>
                   </select>
               </span></dd>
               
        </dl>
        
            <dl colname="SYS_BILL_COL.SEARCH_INBILL">
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_INBILL.ZhName %>：</dt><!--表单列表里条件-->
               <dd><span>
                <select id="txtSEARCH_INBILL" runat="server">
                       <option value="">全部</option>
                       <option value="1">是</option>
                       <option value="0">否</option>
                   </select>
               </span></dd>
               
        </dl>
         <dl class="btn"><dd style="width:190px;">
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
                <span><input id="btnFormView" type="button" value="表单预览" onclick="_FormView(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool hide">
        <ul>
           <%-- <li><span><input power="newSYS_BILL_COL" id="btn_New" type="button" value="新建" onclick="manager.newRecord('COLEdit.aspx');" /></span></li>--%>
            <li><span><input power="editSYS_BILL_COL" id="btn_Edit" type="button" value="修改" onclick="manager.editRecord('COLEdit.aspx');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('COLBack.aspx');" /></span></li>
        </ul>

    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="COL_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.COL_ID.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.COL_ID._ZhName %></td><!--表单列ID-->
                    
                    <%--<td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_ID.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_ID._ZhName %></td><!--所属表单ID-->
                    --%>
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.TABLE_NAME.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.TABLE_NAME._ZhName %></td><!--列所属表-->
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.COL_NAME.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.COL_NAME._ZhName %></td><!--列明-->
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.COL_NOTE.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.COL_NOTE._ZhName %></td><!--列默认名-->
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.DATA_TYPE.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.DATA_TYPE._ZhName %></td><!--数据类型-->
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.DATA_LEN.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.DATA_LEN._ZhName %></td><!--数据长度-->
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.DATA_ACC.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.DATA_ACC._ZhName %></td><!--数据精度-->
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.IS_AUTO.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.IS_AUTO._ZhName %></td><!--是否是数字递增字段-->
 
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FK_SHOW.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FK_SHOW._ZhName%></td><!--用于显示信息的列名-->
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.DISPLAY_NAME.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.DISPLAY_NAME._ZhName %></td><!--列自定义显示名-->
                    
                    <%--
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.TITLE.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.TITLE._ZhName %></td><!--提示标题-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.DVAL.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.DVAL._ZhName %></td><!--默认值-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR._ZhName %></td><!--行之间计算关系公式，比容总金额＝某子表单列的和-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_COL_FORMULAR.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_COL_FORMULAR._ZhName %></td><!--列之间计算公式，比如金额＝单价*数量-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_ISHEADER.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_ISHEADER._ZhName %></td><!--是否显示在表头-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH._ZhName %></td><!--单据表头宽度-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE._ZhName %></td><!--验证数据类型-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_CTRL_ID.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_CTRL_ID._ZhName %></td><!--列表单控件类型-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_SHOW.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_SHOW._ZhName %></td><!--需要有表单界面输入-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_NEED.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_NEED._ZhName %></td><!--是否必填-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_MIN.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_MIN._ZhName %></td><!--最小值-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_MAX.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_MAX._ZhName %></td><!--最大值-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_ONEROW.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_ONEROW._ZhName %></td><!--显示在整行-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH._ZhName %></td><!--控件宽度-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.SEARCH_INBILL.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.SEARCH_INBILL._ZhName %></td><!--表单列表里条件-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.SEARCH_TYPE.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.SEARCH_TYPE._ZhName %></td><!--查询数据类型-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR.LongName%>',show:1}"><%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR._ZhName %></td><!--查询公式-->
                --%>
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            
            <td>{COL_ID}</td>
            
           <%-- <td>{BILL_ID}</td>--%>
            
            <td>{TABLE_NAME}</td>
            
            <td>{COL_NAME}</td>
            
            <td>{COL_NOTE}</td>
            
            <td>{DATA_TYPE}</td>
            
            <td>{DATA_LEN}</td>
            
            <td>{DATA_ACC}</td>
            
            <td>{IS_AUTO}</td>
            
  <%--          <td>{SORT_NO}</td>--%>
            
            <td>{COL_SHOW}</td>
            
            <td>{DISPLAY_NAME}</td>
            
           <%--  <td>{TITLE}</td>
            
           <td>{DVAL}</td>
            
            <td>{BILL_ROW_FORMULAR}</td>
            
            <td>{BILL_COL_FORMULAR}</td>
            
            <td>{BILL_ISHEADER}</td>
            
            <td>{BILL_HERDERWIDTH}</td>
            
            <td>{FORM_CHECKTYPE}</td>
            
            <td>{FORM_CTRL_ID}</td>
            
            <td>{FORM_SHOW}</td>
            
            <td>{FORM_NEED}</td>
            
            <td>{FORM_MIN}</td>
            
            <td>{FORM_MAX}</td>
            
            <td>{FORM_ONEROW}</td>
            
            <td>{FORM_CTRLWIDTH}</td>
            
            <td>{SEARCH_INBILL}</td>
            
            <td>{SEARCH_TYPE}</td>
            
            <td>{SEARCH_FORMULAR}</td>--%>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_BILL_COL)Container.DataItem).COL_ID%>" /></td>
                    <td><%#((SYS_BILL_COL)Container.DataItem).COL_ID %></td>
                    
                    
                   <%-- <td><%#((SYS_BILL_COL)Container.DataItem).BILL_ID %></td>--%>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).TABLE_NAME %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).COL_NAME %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).COL_NOTE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DATA_TYPE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DATA_LEN %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DATA_ACC %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).IS_AUTO=="1"?"是":"否" %></td>
                    
                    
                   <%-- <td><%#((SYS_BILL_COL)Container.DataItem).SORT_NO %></td>--%>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FK_SHOW%></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DISPLAY_NAME %></td>
                    
                    
                   <%-- <td><%#((SYS_BILL_COL)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DVAL %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((SYS_BILL_COL)Container.DataItem).BILL_ROW_FORMULAR) %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((SYS_BILL_COL)Container.DataItem).BILL_COL_FORMULAR) %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).BILL_ISHEADER %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).BILL_HERDERWIDTH %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_CHECKTYPE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_CTRL_ID %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_SHOW %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_NEED %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_MIN %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_MAX %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_ONEROW %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_CTRLWIDTH %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).SEARCH_INBILL %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).SEARCH_TYPE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).SEARCH_FORMULAR %></td>
                    --%>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
</div>
</asp:Content>