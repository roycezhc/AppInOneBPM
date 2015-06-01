<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_Admin_RecManage" CodeFile="RecManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager({valIndex:1});
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });

    function deleteRec() {

        if (window.confirm("您确定要删除所选的记录吗？")) {
            window.location.href = "../Back.aspx?WFID=<%=wfid %>&DEL_RECID=" + manager.getSelectedID() + "&preUrl=<%=curUrl %>&admin=1";
        }
    }

    function checkRec() {
        //window.location.href = "Check.aspx?WFID=<%=wfid %>&RECID=" + manager.getSelectedID() + "&preUrl=<%=curUrl %>";
        return false;
    }
</script>
<style type="text/css">
.tblist table tbody tr td.sta0{color:#999;}
.tblist table tbody tr td.sta1{color:#009;}
.tblist table tbody tr td.sta2{color:#f00;}
.tblist table tbody tr td.sta3{color:#090;}
.tblist table tbody tr td.sta4{color:#900;}
.tblist table tbody tr td.sta5{color:#660;}
.tblist table tbody tr td em{color:#666; font-style:normal;font-size:12px;font-weight:normal;}
.tblist table tbody tr td a{color:#006;font-weight:bold;}
.tblist table tbody tr td span{margin-left:3px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
   <div class="titnav">
       <input id="hidCondition" type="hidden" runat="server" />
    <dl><dt><b><%=title %></b></dt><dd>
    </dd></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal> 审批状态：绿色标识已审批、粉色标志未审批、黄色标识审批中</div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
        <dl colname="WF_FORMBASE.RECNO">
               <dt><%=WF_FORMBASE.Attribute.RECNO.ZhName %>：</dt><!--记录编号-->
               <dd><span>
                
                    <input id="txtRECNO" type="text" runat="server" />
               </span></dd>
               
        </dl>
       <dl colname="WF_FORMBASE.DEPT_NAME">
               <dt><%=WF_FORMBASE.Attribute.DEPT_NAME.ZhName %>：</dt><!--部门名称-->
               <dd><span>
                
                    <input id="txtDEPT_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl colname="WF_FORMBASE.STAFF_NAME">
               <dt><%=WF_FORMBASE.Attribute.STAFF_NAME.ZhName %>：</dt><!--员工名-->
               <dd><span>
                
                    <input id="txtSTAFF_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
        <dl colname="WF_FORMBASE.CSTAFF_NAME">
               <dt><%=WF_FORMBASE.Attribute.CSTAFF_NAME.ZhName %>：</dt><!--创建人名-->
               <dd><span>
                
                    <input id="txtCSTAFF_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
        <dl colname="WF_FORMBASE.CSTAFF_NAME">
               <dt><%=WF_FORMBASE.Attribute.STAFF_NAME.ZhName %>：</dt><!--创建人名-->
               <dd><span>
                
                    <input id="Text1" type="text" runat="server" />
               </span></dd>
               
        </dl>

        <dl colname="WF_FORMBASE.STATUS">
               <dt><%=WF_FORMBASE.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         <dl class="btn"><dt></dt><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
           <%-- <li><span><input id="btn_Check" type="button" value="审批" onclick="checkRec();" /></span></li>--%>
        </ul>
        <ol>
            <li><span><input id="btn_Dels" type="button" value="删除" power="p_deleteRec" onclick="deleteRec();" /></span></li>
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
        <input id="hidMoreCols" type="hidden" runat="server" />
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="RECID">
                    <th class="first"></th>
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.RECID.LongName%>',show:0}">流程单号</th><!--RECID--><%--<%=WF_FORMBASE.Attribute.RECID._ZhName %>--%>
                   <%--  <th data="{colname:'<%=WF_FORMBASE.Attribute.RECNO.LongName%>',show:1}"><%=WF_FORMBASE.Attribute.RECNO._ZhName %></th><!--RECID-->--%>
                   <%-- <th data="{colname:'<%=WF_FORMBASE.Attribute.CSTAFF_NAME.LongName%>',show:1}">申请人</th><!--提交人-->--%>
                     
                     <th data="{colname:'<%=WF_FORMBASE.Attribute.RECNAME.LongName%>',show:1}">流程名称</th><!--RECID-->
                    <th data="{colname:'<%=WF_FORMBASE.Attribute.STAFF_NAME.LongName%>',show:1}">申请人</th><!--创建人名-->
                    <th data="{colname:'<%=WF_FORMBASE.Attribute.DEPT_NAME.LongName%>',show:1}">申请部门</th><!--部门名称-->
                   
                    <th data="{colname:'<%=WF_FORMBASE.Attribute.ADDTIME.LongName%>',show:1}">申请时间</th><!--录入时间-->
<%--                    <th data="{colname:'<%=WF_FORMBASE.Attribute.STATUS.LongName%>',show:1}">&nbsp;<%=WF_FORMBASE.Attribute.STATUS._ZhName %>&nbsp;</th><!--状态-->--%>
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.CHECK_INFO.LongName%>',show:1}">待审环节<%--<%=WF_FORMBASE.Attribute.CHECK_INFO._ZhName %>--%></th><!--审批情况-->
                 <%--   <th>最近审批状态</th><!--状态-->--%>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"></td>
                    <td><%#((WF_FORMBASE)Container.DataItem).RECID%></td>
                    <%--<td><%#((WF_FORMBASE)Container.DataItem).RECNO%></td>--%>                    
                    <%--<td><%#((WF_FORMBASE)Container.DataItem).CSTAFF_NAME%></td>--%>

                   <td><a  href="../FORMShow.aspx?RECID=<%#((WF_FORMBASE)Container.DataItem).RECID%>&preUrl=<%=curUrl %>"><%#((WF_FORMBASE)Container.DataItem).RECNAME%></a></td>
                   <td><%#((WF_FORMBASE)Container.DataItem).STAFF_NAME%></td>
                 <%--    <td><%#((WF_FORMBASE)Container.DataItem).RECNAME%></td>--%>
                    <td><%#((WF_FORMBASE)Container.DataItem).DEPT_NAME%></td>
                    
                   <%-- <td><a href="FORMShow.aspx?RECID=<%#((WF_FORMBASE)Container.DataItem).RECID%>&WFID=<%#((WF_FORMBASE)Container.DataItem).WFID%>"><%#((WF_FORMBASE)Container.DataItem).RECNAME%></a></td>--%>
                    <td><%#((WF_FORMBASE)Container.DataItem).ADDTIME%></td>
                   <%-- <td class="sta<%#((WF_FORMBASE)Container.DataItem).STATUS%>">--%>
                     <%#showStepState(((WF_FORMBASE)Container.DataItem).STATUS, ((WF_FORMBASE)Container.DataItem).CHECK_INFO, ((WF_FORMBASE)Container.DataItem).RECID, ((WF_FORMBASE)Container.DataItem).WFID)%>
                   <%-- <td><%#showLastCheck(((WF_FORMBASE)Container.DataItem).CHECK_LAST)%></td>--%>
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