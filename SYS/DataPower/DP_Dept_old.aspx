<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_DataPower_DP_DEPT_old" CodeFile="DP_Dept_old.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<script type="text/javascript">

    var manager = new ListManager({ listCID: 'tbList' });
    $(function () {
        manager.initBodyRows();
    });

    function selDept(me) {

        var result = window.showModalDialog("../../HR/DEPT/DeptSel.aspx?r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result == undefined || result == "") return;
        var obj = eval(result);
        $.ajax({
            url: "USERDATABack.aspx?<%=paraStr %>&AddToUserData=" + obj.id + "&Data_Type=<%=date_type %>",
            cache: false,
            success: function (svrData) {
                if (svrData != "") {
                    //manager.addToList(svrData);
                    window.location.href = window.location.href;
                }
            },
            error: function (a, b, c) {
                alert(a);
            }
        });
    }

    function selAllDept(me) {
        if (me.checked == true) {
            if (!confirm("确定拥有所有部门权限吗？")) {
                return false;
            }
            $.ajax({
                url: "USERDATABack.aspx?<%=paraStr %>&AddToUserData=0&Data_Type=<%=date_type %>",
                cache: false,
                success: function (svrData) {
                    if (svrData != "") {
                        var bodyObj = $("#tbList").find("tbody");
                        bodyObj.empty();
                    }
                },
                error: function (a, b, c) {
                    alert(a);
                }
            });
        }
    }
</script>
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
        <ul>
            <li><input id="ckAllDept" name="ckAllDept" type="checkbox" onclick="selAllDept(this);" /><label for="ckAllDept">拥有所有部门权限</label></li>
            
            <li><span><input id="btn_New" type="button" value="新增" onclick="selDept(this);" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('USERDATABack.aspx?<%=paraStr %>&Data_Type=<%=date_type %>');" /></span></li>
        </ul>
        <ol>
            <li id="liToTop" runat="server"><a href="DP_Dept.aspx?<%=paraStr %>">返回顶级部门</a></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ORG_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td colname="<%=HR_DEPT.Attribute.DEPT_ID.FieldName%>"><%=HR_DEPT.Attribute.DEPT_ID._ZhName%></td><!--分支机构唯一ID-->
                    <td colname="<%=HR_DEPT.Attribute.DEPT_NAME.FieldName%>"><%=HR_DEPT.Attribute.DEPT_NAME._ZhName%></td><!--分支机构名-->
                    <td colname="<%=HR_DEPT.Attribute.P_DEPT_ID.FieldName%>"><%=HR_DEPT.Attribute.P_DEPT_ID._ZhName%></td><!--父分支机构ID-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_DEPT)Container.DataItem).DEPT_ID%>" id="ckORG" runat="server" /></td>
                    <td><%#((HR_DEPT)Container.DataItem).DEPT_ID%></td>
                    <td><%#((HR_DEPT)Container.DataItem).DEPT_NAME%><asp:Literal ID="litSub" runat="server"></asp:Literal></td>
                    <td><%#((HR_DEPT)Container.DataItem).P_DEPT_ID%></td>
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