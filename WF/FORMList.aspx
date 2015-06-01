<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_MOREList" CodeFile="FORMList.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="System.Data"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager({valIndex:1});
    $(function () {
        manager.initBodyRows();
        //manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);

        //一级菜单时间绑定
        var lis = $("ul.menu").find("li");
        for (var i = 0; i < lis.length; i++) {
            var liObj = $(lis[i]);

            liObj.bind("mouseover", liObj, function (e) {
                var subUL = e.data.find("ul:first");
                var www = $(window).width() - e.data.offset().left;
                window.status = www;
                subUL.show();
                if (www < subUL.width()) {
                    subUL.css({ left: "auto", right: "-1px" });
                } else {
                    subUL.css({ right: "auto", left: "-1px" });
                }
            });
            liObj.bind("mouseleave", liObj, function (e) {
                var subUL = e.data.find("ul:first");
                subUL.hide();
            });
            //            var aObj = liObj.find("a:first");
            //            aObj.bind("click", aObj, function (e) {
            //                var ahref = e.data.attr("href");
            //                if (ahref == "" || ahref == undefined) {
            //                    return false;
            //                }
            //                return false;
            //            });
        }

        var status = '<%=Request["txtSTATUS"] %>';
        $("select[name='txtSTATUS']")[0].value = status;

        var recno = '<%=Request["txtSTATUS"] %>';
        $("input[name='txtRECNO']")[0].value = recno;

        var dptname = '<%=Request["txtDEPT_NAME"] %>';
        $("input[name='txtDEPT_NAME']")[0].value = dptname;

        var sname = '<%=Request["txtSTAFF_NAME"] %>';
        $("input[name='txtSTAFF_NAME']")[0].value = sname;
    });

    function deleteRec() {

        if (window.confirm("您确定要删除所选的记录吗？")) {
            window.location.href = "Back.aspx?DEL_RECID=" + manager.getSelectedID() + "&preUrl=<%=curUrl %>";
        }
    }

    function editRec() {
        window.location.href = "Edit.aspx?WFID=<%=wf_obj_id %>&RECID=" + manager.getSelectedID() + "&preUrl=<%=curUrl %>";
        }
        //chx, wfid为0的时候，从记录中直接取得 流程ID
        function checkRec() {
            window.location.href = "Check.aspx?WFID=<%=wf_obj_id %>&RECID=" + manager.getSelectedID() + "&preUrl=<%=curUrl %>";
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
    <dl><dt><b><%=title %></b><a href="Edit.aspx?WFID=<%=wf_obj_id %>&preUrl=<%=curUrl %>">马上申请&gt;&gt;</a></dt><dd>
  <%--  <a href="FORMList.aspx?WFID=<%=wfid %>&mine=1">我发起的</a>
    <a href="FORMList.aspx?WFID=<%=wfid %>&getType=0">待审核</a>
    <a href="FORMList.aspx?WFID=<%=wfid %>&getType=1">我通过的</a>
    <a href="FORMList.aspx?WFID=<%=wfid %>&getType=2">我否决的</a>
    <a href="FORMList.aspx?WFID=<%=wfid %>&getType=-1">我参与的</a>--%>
     <ul class="menu"><li class="pretit"><b>转到：</b></li>
              <asp:Literal ID="litMenu" runat="server"></asp:Literal>
     </ul>
    </dd></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal> 审批状态：绿色标识已审批、粉色标志未审批、黄色标识审批中</div>
   <div class="topfind">
        <dl>
            <dt><%=WF_FORMBASE.Attribute.RECNO.ZhName %>：</dt><!--记录编号-->
            <dd><span><input name="txtRECNO" type="text"  /></span></dd>
        </dl>
        <dl>
               <dt><%=WF_FORMBASE.Attribute.DEPT_NAME.ZhName %>：</dt><!--部门名称-->
               <dd><span>
                
                    <input name="txtDEPT_NAME" type="text" />
               </span></dd>
               
        </dl>
        <dl>
               <dt><%=WF_FORMBASE.Attribute.STAFF_NAME.ZhName %>：</dt><!--员工名-->
               <dd><span>
                
                    <input name="txtSTAFF_NAME" type="text" />
               </span></dd>
        </dl>
        <dl colname="WF_FORMBASE.CSTAFF_NAME">
               <dt><%=WF_FORMBASE.Attribute.CSTAFF_NAME.ZhName %>：</dt><!--创建人名-->
               <dd><span><input name="txtCSTAFF_NAME" type="text" runat="server" /></span></dd>
        </dl>
        <dl>
               <dt><%=WF_FORMBASE.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span><select name="txtSTATUS" >
               <option value="0">未开始</option>
               <option value="1">审批中</option>
               <option value="2">未通过</option>
               <option value="3">已完成</option>
               <option value="4">终止</option>
               </select></span></dd>
        </dl>
        <dl class="btn"><dt></dt>
            <dd>
               <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               <span><input id="btnOut" type="button" value="导出" onclick="window.open('FORMListOut.aspx?wfid=<%=wf_obj_id %>&where=<%=strWhere %>');"/></span>
             </dd>
        </dl>
        <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
           <%-- <li><span><input id="btn_Check" type="button" value="审批" onclick="checkRec();" /></span></li>--%>
        </ul>
        <ol>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="deleteRec();" /></span></li>
            <li><span><input id="btn_edit" type="button" value="编辑" onclick="editRec();" /></span></li>
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
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.RECID.LongName%>',show:0}"><%=WF_FORMBASE.Attribute.RECID._ZhName %></th><!--RECID-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.RECNAME.LongName%>',show:1}">流程名称</th><!--RECID-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.CSTAFF_NAME.LongName%>',show:1}">申请人</th><!--创建人名-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.DEPT_NAME.LongName%>',show:1}">申请部门</th><!--部门名称-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.ADDTIME.LongName%>',show:1}">申请时间</th><!--录入时间-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.CHECK_INFO.LongName%>',show:1}">待审环节<%--<%=WF_FORMBASE.Attribute.CHECK_INFO._ZhName %>--%></th><!--审批情况-->
                   <%=strTHS%>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"></td>
                    <td><%#((DataRowView)Container.DataItem)["RECID"]%></td>
                    <td><%# clickUrl(((DataRowView)Container.DataItem)["STATUS"].ToString(), ((DataRowView)Container.DataItem)["CHECK_INFO"].ToString(), Convert.ToDecimal(((DataRowView)Container.DataItem)["RECID"]), Convert.ToInt32(((DataRowView)Container.DataItem)["WFID"]), ((DataRowView)Container.DataItem)["RECNAME"].ToString())%></td>
                    <td><%#((DataRowView)Container.DataItem)["CSTAFF_NAME"]%></td>
                    <%--<td><a  href="FORMShow.aspx?RECID=<%#((DataRowView)Container.DataItem)["RECID"]%>&preUrl=<%=curUrl %>"><%#showRECNAME(((DataRowView)Container.DataItem)["RECNAME"])%></a></td>--%>
                    <td><%#((DataRowView)Container.DataItem)["DEPT_NAME"]%></td>
                    <td><%#((DataRowView)Container.DataItem)["ADDTIME"]%></td>
                     <%#showStepState(((DataRowView)Container.DataItem)["STATUS"].ToString(), ((DataRowView)Container.DataItem)["CHECK_INFO"].ToString(), Convert.ToDecimal(((DataRowView)Container.DataItem)["RECID"]), Convert.ToInt32(((DataRowView)Container.DataItem)["WFID"]))%>
                     <asp:Literal ID="litCols" runat="server"></asp:Literal>
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