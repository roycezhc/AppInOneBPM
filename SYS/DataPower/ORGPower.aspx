<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_DataPower_ORGPower" CodeFile="ORGPower.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
<script type="text/javascript">

    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
    });

    function selORG(me) {

        var result = window.showModalDialog("../../HR/ORG/ORGSel.aspx?r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result == undefined || result == "") return;
        var obj = eval(result);

        var puts = $(me).parent().find("input");
        puts[1].value = obj.name;
        puts[0].value = obj.id;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
        <ul>
            <li><span><input id="btn_New" type="button" value="新增" onclick="selORG();" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('ORGBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li id="liToTop" runat="server"><a href="ORGManage.aspx<%=paraStr %>">返回顶级机构</a></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ORG_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td colname="<%=HR_ORG.Attribute.ORG_ID.FieldName%>"><%=HR_ORG.Attribute.ORG_ID._ZhName %></td><!--分支机构唯一ID-->
                    <td colname="<%=HR_ORG.Attribute.ORG_NAME.FieldName%>"><%=HR_ORG.Attribute.ORG_NAME._ZhName %></td><!--分支机构名-->
                    <td colname="<%=HR_ORG.Attribute.P_ORG_ID.FieldName%>"><%=HR_ORG.Attribute.P_ORG_ID._ZhName %></td><!--父分支机构ID-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_ORG)Container.DataItem).ORG_ID%>" id="ckORG" runat="server" /></td>
                    <td><%#((HR_ORG)Container.DataItem).ORG_ID %></td>
                    <td><%#((HR_ORG)Container.DataItem).ORG_NAME %><asp:Literal ID="litSub" runat="server"></asp:Literal></td>
                    <td><%#((HR_ORG)Container.DataItem).P_ORG_ID %></td>
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