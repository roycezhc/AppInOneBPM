<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_CTRLManage" CodeFile="CTRLManage.aspx.cs" %>
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
         
            <dl colname="SYS_BILL_CTRL.CTRL_ID">
               <dt><%=SYS_BILL_CTRL.Attribute.CTRL_ID.ZhName %>：</dt><!--CTRL_ID-->
               <dd><span>
                
                    <input id="txtCTRL_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_CTRL.CTRL_NAME">
               <dt><%=SYS_BILL_CTRL.Attribute.CTRL_NAME.ZhName %>：</dt><!--CTRL_NAME-->
               <dd><span>
                
                    <input id="txtCTRL_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_CTRL.CTRL_CODE">
               <dt><%=SYS_BILL_CTRL.Attribute.CTRL_CODE.ZhName %>：</dt><!--CTRL_CODE-->
               <dd><span>
                
                    <input id="txtCTRL_CODE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_CTRL.P_CTRL_ID">
               <dt><%=SYS_BILL_CTRL.Attribute.P_CTRL_ID.ZhName %>：</dt><!--P_CTRL_ID-->
               <dd><span>
                
                    <input id="txtP_CTRL_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_CTRL.SORT_NO">
               <dt><%=SYS_BILL_CTRL.Attribute.SORT_NO.ZhName %>：</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_CTRL.EL_HTML">
               <dt><%=SYS_BILL_CTRL.Attribute.EL_HTML.ZhName %>：</dt><!--EL_HTML-->
               <dd><span>
               
                    <input id="txtEL_HTML" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_CTRL.JS_CODE">
               <dt><%=SYS_BILL_CTRL.Attribute.JS_CODE.ZhName %>：</dt><!--JS_CODE-->
               <dd><span>
               
                    <input id="txtJS_CODE" type="text" runat="server" />
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
            <li><span><input power="newSYS_BILL_CTRL" id="btn_New" type="button" value="新建" onclick="manager.newRecord('SYS_BILL_CTRLEdit.aspx');" /></span></li>
            <li><span><input power="editSYS_BILL_CTRL" id="btn_Edit" type="button" value="新建" onclick="manager.editRecord('SYS_BILL_CTRLEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newSYS_BILL_CTRL" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('SYS_BILL_CTRLBack.aspx');" /></span></li>
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
                <tr keyname="CTRL_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="SYS_BILL_CTRLManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=SYS_BILL_CTRL.Attribute.CTRL_ID.LongName%>',show:1}"><%=SYS_BILL_CTRL.Attribute.CTRL_ID._ZhName %></td><!--CTRL_ID-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_CTRL.Attribute.CTRL_NAME.LongName%>',show:1}"><%=SYS_BILL_CTRL.Attribute.CTRL_NAME._ZhName %></td><!--CTRL_NAME-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_CTRL.Attribute.CTRL_CODE.LongName%>',show:1}"><%=SYS_BILL_CTRL.Attribute.CTRL_CODE._ZhName %></td><!--CTRL_CODE-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_CTRL.Attribute.P_CTRL_ID.LongName%>',show:1}"><%=SYS_BILL_CTRL.Attribute.P_CTRL_ID._ZhName %></td><!--P_CTRL_ID-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_CTRL.Attribute.SORT_NO.LongName%>',show:1}"><%=SYS_BILL_CTRL.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_CTRL.Attribute.EL_HTML.LongName%>',show:1}"><%=SYS_BILL_CTRL.Attribute.EL_HTML._ZhName %></td><!--EL_HTML-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_CTRL.Attribute.JS_CODE.LongName%>',show:1}"><%=SYS_BILL_CTRL.Attribute.JS_CODE._ZhName %></td><!--JS_CODE-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            
            <td>{CTRL_ID}</td>
            
            <td>{CTRL_NAME}</td>
            
            <td>{CTRL_CODE}</td>
            
            <td>{P_CTRL_ID}</td>
            
            <td>{SORT_NO}</td>
            
            <td>{EL_HTML}</td>
            
            <td>{JS_CODE}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_BILL_CTRL)Container.DataItem).CTRL_ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((SYS_BILL_CTRL)Container.DataItem).PATH, ((SYS_BILL_CTRL)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((SYS_BILL_CTRL)Container.DataItem).CTRL_ID %></td>
                    
                    
                    <td><%#((SYS_BILL_CTRL)Container.DataItem).CTRL_NAME %></td>
                    
                    
                    <td><%#((SYS_BILL_CTRL)Container.DataItem).CTRL_CODE %></td>
                    
                    
                    <td><%#((SYS_BILL_CTRL)Container.DataItem).P_CTRL_ID %></td>
                    
                    
                    <td><%#((SYS_BILL_CTRL)Container.DataItem).SORT_NO %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((SYS_BILL_CTRL)Container.DataItem).EL_HTML) %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((SYS_BILL_CTRL)Container.DataItem).JS_CODE) %></td>
                    
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