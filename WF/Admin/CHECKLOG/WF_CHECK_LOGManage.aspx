<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_CHECK_LOGManage" CodeFile="WF_CHECK_LOGManage.aspx.cs" %>
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
         
            <dl colname="WF_CHECK_LOG.LOG_ID">
               <dt><%=WF_CHECK_LOG.Attribute.LOG_ID.ZhName %>：</dt><!--日志ID-->
               <dd><span>
                
                    <input id="txtLOG_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.WFCID">
               <dt><%=WF_CHECK_LOG.Attribute.WFID.ZhName %>：</dt><!--WFCID-->
               <dd><span>
                
                    <input id="txtWFCID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.PROCID">
               <dt><%=WF_CHECK_LOG.Attribute.PROCID.ZhName %>：</dt><!--过程ID-->
               <dd><span>
                
                    <input id="txtPROCID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.STEP_ID">
               <dt><%=WF_CHECK_LOG.Attribute.STEP_ID.ZhName %>：</dt><!--步骤ID-->
               <dd><span>
                
                    <input id="txtSTEP_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.REC_ID">
               <dt><%=WF_CHECK_LOG.Attribute.RECID.ZhName%>：</dt><!--记录ID-->
               <dd><span>
                
                    <input id="txtREC_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.DETAIL_ID">
               <dt><%=WF_CHECK_LOG.Attribute.DETAIL_ID.ZhName %>：</dt><!--明细记录ID-->
               <dd><span>
                
                    <input id="txtDETAIL_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.RESULT">
               <dt><%=WF_CHECK_LOG.Attribute.RESULT.ZhName %>：</dt><!--最终结果-->
               <dd><span>
               
                    <select id="txtRESULT" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.CHECKER">
               <dt><%=WF_CHECK_LOG.Attribute.CHECKER.ZhName %>：</dt><!--最后审核人-->
               <dd><span>
                
                    <input id="txtCHECKER" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.CHECK_TIME">
               <dt><%=WF_CHECK_LOG.Attribute.CHECK_TIME.ZhName %>：</dt><!--最后审批时间-->
               <dd><span>
               
                    <input id="txtCHECK_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.NOTE">
               <dt><%=WF_CHECK_LOG.Attribute.NOTE.ZhName %>：</dt><!--最后审批意见-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.RESULTS">
               <dt><%=WF_CHECK_LOG.Attribute.RESULTS.ZhName %>：</dt><!--各次审批结果-->
               <dd><span>
                
                    <input id="txtRESULTS" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.CHECKERS">
               <dt><%=WF_CHECK_LOG.Attribute.CHECKERS.ZhName %>：</dt><!--各次审批人-->
               <dd><span>
                
                    <input id="txtCHECKERS" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.CHECK_TIMES">
               <dt><%=WF_CHECK_LOG.Attribute.CHECK_TIMES.ZhName %>：</dt><!--各次审批时间-->
               <dd><span>
                
                    <input id="txtCHECK_TIMES" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_CHECK_LOG.NOTES">
               <dt><%=WF_CHECK_LOG.Attribute.NOTES.ZhName %>：</dt><!--各次审批意见-->
               <dd><span>
                
                    <input id="txtNOTES" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl><dt></dt><dd class="btn">
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input id="btn_New" type="button" value="新建" onclick="manager.newRecord('WF_CHECK_LOGEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="NewStaff" id="Button2" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('WF_CHECK_LOGBack.aspx');" /></span></li>
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
                <tr keyname="LOG_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>

                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.LOG_ID.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.LOG_ID._ZhName %></td><!--日志ID-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.WFID.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.WFID._ZhName %></td><!--WFCID-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.PROCID.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.PROCID._ZhName %></td><!--过程ID-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.STEP_ID.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.STEP_ID._ZhName %></td><!--步骤ID-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.RECID.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.RECID._ZhName%></td><!--记录ID-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.DETAIL_ID.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.DETAIL_ID._ZhName %></td><!--明细记录ID-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.RESULT.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.RESULT._ZhName %></td><!--最终结果-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.CHECKER.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.CHECKER._ZhName %></td><!--最后审核人-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.CHECK_TIME.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.CHECK_TIME._ZhName %></td><!--最后审批时间-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.NOTE.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.NOTE._ZhName %></td><!--最后审批意见-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.RESULTS.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.RESULTS._ZhName %></td><!--各次审批结果-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.CHECKERS.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.CHECKERS._ZhName %></td><!--各次审批人-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.CHECK_TIMES.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.CHECK_TIMES._ZhName %></td><!--各次审批时间-->
                    
                    
                    <td data="{colname:'<%=WF_CHECK_LOG.Attribute.NOTES.LongName%>',show:1}"><%=WF_CHECK_LOG.Attribute.NOTES._ZhName %></td><!--各次审批意见-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WF_CHECK_LOG)Container.DataItem).LOG_ID%>" /></td>
                    
                    <td><%#((WF_CHECK_LOG)Container.DataItem).LOG_ID %></td>
                    
                    
                    <td><%#((WF_CHECK_LOG)Container.DataItem).WFID %></td>
                    
                    
                    <td><%#((WF_CHECK_LOG)Container.DataItem).PROCID %></td>
                    
                    
                    <td><%#((WF_CHECK_LOG)Container.DataItem).STEP_ID %></td>
                    
                    
                    <td><%#((WF_CHECK_LOG)Container.DataItem).RECID%></td>
                    
                    
                    <td><%#((WF_CHECK_LOG)Container.DataItem).DETAIL_ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WF_CHECK_LOG.Attribute.RESULT, ((WF_CHECK_LOG)Container.DataItem).RESULT)%></td>
                    
                    
                    <td><%#((WF_CHECK_LOG)Container.DataItem).CHECKER %></td>
                    
                    
                    <td><%#(((WF_CHECK_LOG)Container.DataItem).CHECK_TIME == DateTime.MinValue) ? "" : ((WF_CHECK_LOG)Container.DataItem).CHECK_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WF_CHECK_LOG)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((WF_CHECK_LOG)Container.DataItem).RESULTS %></td>
                    
                    
                     <td><%#((WF_CHECK_LOG)Container.DataItem).CHECKERS %></td>
                    
                    
                     <td><%#((WF_CHECK_LOG)Container.DataItem).CHECK_TIMES %></td>
                    
                    
                     <td><%#((WF_CHECK_LOG)Container.DataItem).NOTES %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>