<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_CHECKER_TPLManage" CodeFile="CHECKERManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();

        //parent.setCheckerPageH(window.document.body.scrollHeight);
        //parent.setCheckersToSpan(getListCheckerStr());

    });

    function getListCheckerStr() {
        var trs = $("#bodyID").children();
        var str = "";
        for (var a = 0; a < trs.length; a++) {
            if (str != "") {
                str += "、";
            }
            str += $($(trs[a]).children()[3]).text();
        }
        return str;
    }

    function _delByKeyIDS_End(trDel) {
        //parent.setCheckersToSpan(getListCheckerStr());

    }

    function setShowCond(checkerid, isRe) {

        if (checkerid == '') {
            var cks = $(".first").find("input[type='checkbox']");

            for (var i = 0; i < cks.length; i++) {
                if (cks[i].checked == true) {
                    checkerid = cks[i].value;
                }
            }
        }
        var url = "../CondSet.aspx?WFID=<%=wfid %>&from=3&KeyID=" + checkerid + "&r=" + Math.random();
        window.showModalDialog(url, "winCondSet", "dialogHeight=650px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;");
    }

    function addChecker() {
        var trs = $("#bodyID").children();
        var ids = "";
        for (var a = 0; a < trs.length; a++) {
            if ($($(trs[a]).children()[4]).text() == "指定审核人") {
                if (ids != "") { ids += ","; }
                ids += $($(trs[a]).children()[2]).text();
            }
        }
        //alert(ids);
        var url = "../../../HR/STAFF/StaffSels.aspx?ids=" + ids + "&r=" + Math.random();
        var sels = window.showModalDialog(url, "winCondSet", "dialogHeight=650px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;"); if (!sels) { sels = window.returnValue; } //jin-shenjian chrome刷新父画面
        if (sels != undefined && sels != "") {
            var selObj = eval(sels);
            var str = "";
            for (var a = 0; a < selObj.length; a++) {
                if (str != "") {
                    str += ",";
                }
                str += selObj[a].ID;
            }
            var id = '<%=stepid %>';
            //alert(id);alert(str);
            if (id != "") {
                $.ajax({
                    url: "CHECKERBack.aspx?SetToStep=" + str + "&StepID=" + id,
                    cache: false,
                    success: function (svrData) {
                        __doPostBack("ctl00$cphBody$LinkButton1", "");
                    },
                    error: function (a, b, c) {
                        alert("error:" + a);
                    }
                });
            }
        }
    }

    function _doPostBackRe() {
        __doPostBack("ctl00$cphBody$LinkButton1", "");
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<%--   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>--%>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal>
   <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton>
   </div>
    <div class="tool">
        <ol>
        <%--    <li><span><input id="btn_New" type="button" value="添加" onclick="addChecker();" /></span></li>--%>
            <li><span><input id="Button1" type="button" value="添加" onclick="manager.newRecord('CHECKEREdit.aspx','STEP_ID=<%=stepid %>');" /></span></li>
            <%--<li><span><input id="Button2" type="button" value="修改" onclick="manager.editRecord('CHECKEREdit.aspx','STEP_ID=<%=stepid %>');" /></span></li>
            --%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('CHECKERBack.aspx');" /></span></li>
             <li><span><input id="btn_Cond" type="button" value="条件设置" onclick="setShowCond('');" /></span></li>
        </ol>
    </div>
    <div class="tblist" style="min-height:100px;">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="CHECKER_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=WF_CHECKER_TPL.Attribute.CHECKER_ID.LongName%>',show:0}"><%=WF_CHECKER_TPL.Attribute.CHECKER_ID._ZhName %></td><!--审核人配置表主键-->
                    <td data="{colname:'<%=WF_CHECKER_TPL.Attribute.STAFF_ID.LongName%>',show:0}"><%=WF_CHECKER_TPL.Attribute.STAFF_NAME._ZhName %></td><!--STAFF_NAME-->
                    <td data="{colname:'<%=WF_CHECKER_TPL.Attribute.STAFF_NAME.LongName%>',show:1}"><%=WF_CHECKER_TPL.Attribute.STAFF_NAME._ZhName %></td><!--STAFF_NAME-->
                    <td data="{colname:'<%=WF_CHECKER_TPL.Attribute.CHECKER_TYPE.LongName%>',show:1}"><%=WF_CHECKER_TPL.Attribute.CHECKER_TYPE._ZhName %></td><!--审批人类型-->
                    <td data="{colname:'<%=WF_CHECKER_TPL.Attribute.CONDITION.LongName%>',show:0}"><%=WF_CHECKER_TPL.Attribute.CONDITION._ZhName %></td><!--使用此审批人条件-->
                    <td data="{colname:'<%=WF_CHECKER_TPL.Attribute.FORMULAR.LongName%>',show:0}"><%=WF_CHECKER_TPL.Attribute.FORMULAR._ZhName %></td><!--条件公式-->
                    <td data="{colname:'<%=WF_CHECKER_TPL.Attribute.STATUS.LongName%>',show:1}"><%=WF_CHECKER_TPL.Attribute.STATUS._ZhName%></td><!--条件公式-->
                </tr>
            </thead>
            <tbody id="bodyID">
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WF_CHECKER_TPL)Container.DataItem).CHECKER_ID%>" /></td>
                    <td><%#((WF_CHECKER_TPL)Container.DataItem).CHECKER_ID %></td>
                    <td><%#((WF_CHECKER_TPL)Container.DataItem).STAFF_ID %></td>
                    <td><%#((WF_CHECKER_TPL)Container.DataItem).STAFF_NAME %></td>
                    <td><%#FormHelper.GetText(WF_CHECKER_TPL.Attribute.CHECKER_TYPE,((WF_CHECKER_TPL)Container.DataItem).CHECKER_TYPE)%></td>
                    <td><%#string.IsNullOrEmpty(((WF_CHECKER_TPL)Container.DataItem).CONDITION) ? "未<a onclick='setShowCond(" + ((WF_CHECKER_TPL)Container.DataItem).CHECKER_ID + ");'>设置</a>" : "已设置<a onclick='setShowCond(" + ((WF_CHECKER_TPL)Container.DataItem).CHECKER_ID + ",true);'>重设</a>"%></td>
                    <td><%#string.IsNullOrEmpty(((WF_CHECKER_TPL)Container.DataItem).FORMULAR) ? "无" : "有"%></td>
                    <td><%#FormHelper.GetText(WF_CHECKER_TPL.Attribute.STATUS, ((WF_CHECKER_TPL)Container.DataItem).STATUS)%></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>

</asp:Content>