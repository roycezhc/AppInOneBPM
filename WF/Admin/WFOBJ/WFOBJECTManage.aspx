<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WFOBJECTManage.aspx.cs" Inherits="WF_WFOBJECTManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        //manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt><dd><a href="../WFINFO/WFINFOManage.aspx">返回</a></dd></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="WF_WFOBJECT.WF_OBJ_NAME">
               <dt><%=WF_WFOBJECT.Attribute.WF_OBJ_NAME.ZhName %>：</dt><!--流程实例名称-->
               <dd><span>
                
                    <input id="txtWF_OBJ_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_WFOBJECT.TYPE_ID">
               <dt><%=WF_WFOBJECT.Attribute.TYPE_ID.ZhName %>：</dt><!--TYPE_ID-->
               <dd><span>
                
                    <input id="txtTYPE_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_WFOBJECT.STATUS">
               <dt><%=WF_WFOBJECT.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
                
                    <input id="txtSTATUS" type="text" runat="server" />
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
            <li><span><input power="newWF_WFOBJECT" id="btn_New" type="button" value="新建" onclick="manager.newRecord('WFOBJECTEdit.aspx');" /></span></li>
            <li><span><input power="editWF_WFOBJECT" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('WFOBJECTEdit.aspx');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelID('WFOBJECTBack.aspx');" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="WF_OBJ_ID">
                    <td class="first"></td>
                    <td data="{colname:'<%=WF_WFOBJECT.Attribute.WF_OBJ_ID.LongName%>',show:1}"><%=WF_WFOBJECT.Attribute.WF_OBJ_ID._ZhName %></td><!--流程实例ID-->
                    <td data="{colname:'<%=WF_WFOBJECT.Attribute.WF_OBJ_NAME.LongName%>',show:1}"><%=WF_WFOBJECT.Attribute.WF_OBJ_NAME._ZhName %></td><!--流程实例名称-->
<%--                    <td data="{colname:'<%=WF_WFOBJECT.Attribute.WFID_SRC.LongName%>',show:1}"><%=WF_WFOBJECT.Attribute.WFID_SRC._ZhName %></td><!--所属流程ID-->
                    <td data="{colname:'<%=WF_WFOBJECT.Attribute.FORM_ID.LongName%>',show:1}"><%=WF_WFOBJECT.Attribute.FORM_ID._ZhName %></td><!--所属表单ID-->
                    <td data="{colname:'<%=WF_WFOBJECT.Attribute.TYPE_ID.LongName%>',show:1}"><%=WF_WFOBJECT.Attribute.TYPE_ID._ZhName %></td><!--TYPE_ID-->--%>
                    <td data="{colname:'<%=WF_WFOBJECT.Attribute.STATUS.LongName%>',show:1}"><%=WF_WFOBJECT.Attribute.STATUS._ZhName %></td><!--状态-->
                    <td data="{colname:'<%=WF_WFOBJECT.Attribute.ADDTIME.LongName%>',show:1}"><%=WF_WFOBJECT.Attribute.ADDTIME._ZhName %></td><!--ADDTIME-->
                    <td data="{colname:'<%=WF_WFOBJECT.Attribute.ADDER.LongName%>',show:1}"><%=WF_WFOBJECT.Attribute.ADDER._ZhName %></td><!--ADDER-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"></td>
             <td>{WF_OBJ_ID}</td>
             <td>{WF_OBJ_NAME}</td>
<%--             <td>{WFID_SRC}</td>
             <td>{FORM_ID}</td>
             <td>{TYPE_ID}</td>--%>
             <td>{STATUS}</td>
             <td>{ADDTIME}</td>
             <td>{ADDER}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"></td>
                    <td><%#((WF_WFOBJECT)Container.DataItem).WF_OBJ_ID %></td>
                    <td><%#((WF_WFOBJECT)Container.DataItem).WF_OBJ_NAME %></td>
<%--                    <td><%#((WF_WFOBJECT)Container.DataItem).WFID_SRC %></td>
                    <td><%#((WF_WFOBJECT)Container.DataItem).FORM_ID %></td>
                    <td><%#((WF_WFOBJECT)Container.DataItem).TYPE_ID %></td>--%>
                    <td><%#((WF_WFOBJECT)Container.DataItem).STATUS==1?"正常":"禁用" %></td>
                    <td><%#(((WF_WFOBJECT)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WF_WFOBJECT)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    <td><%#((WF_WFOBJECT)Container.DataItem).ADDER %></td>
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