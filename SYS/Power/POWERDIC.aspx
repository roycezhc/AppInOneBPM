<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="Admin_AU_POWERDICManage" CodeFile="POWERDIC.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
    });
    
    //    function addNewToList(str) {
    //        alert(str);
    //        manager.addToList(str);
    //    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<input id="hidMidId" type="hidden" runat="server" />
<div class="main">
    <div class="titnav"><dl><dt><b><%=title %></b></dt></dl></div>
    <div class="tool">
        <ul>
            <li><span class="btn"><input power="NewPOWERDIC" id="btn_new" type="button" value="新建" onclick='manager.newRecord("POWERDICEdit.aspx?MDL_ID=" + $("input[id$=\"hidMidId\"]").val());' /></span></li>
            <li><span class="btn"><input power="EditPOWERDIC" id="btn_Edit" type="button" value="编辑" onclick='manager.editRecord("POWERDICEdit.aspx?MDL_ID=" + $("input[id$=\"hidMidId\"]").val());'/></span></li>
            <li><span class="btn"><input power="DeleteSels" id="btn_Dels" type="button" value="删除" onclick='manager.delBySelIDS("POWERDICBack.aspx?MDL_ID=" + $("input[id$=\"hidMidId\"]").val());' /></span></li>
        </ul>
        <ol>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="olAllColCBS"></ol></li>
        </ol>
    </div>
     <div class="tblist" id="tbList">
         <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td colname="DIC_NAME"><%=SYS_MDLPOWER_DIC.Attribute.DIC_NAME._ZhName %><!--全名权限名称--></td>
                    <td colname="CTRL_TYPE"><%=SYS_MDLPOWER_DIC.Attribute.CTRL_TYPE._ZhName %><!--控制目标控件类型('目标控件界面ID')--></td>
                    <td colname="DIC_CODE"><%=SYS_MDLPOWER_DIC.Attribute.DIC_CODE._ZhName %><!--CTRL_ID--></td>
                    <td colname="DEAL_TYPE"><%=SYS_MDLPOWER_DIC.Attribute.DEAL_TYPE._ZhName %><!--处理方式--></td>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_MDLPOWER_DIC)Container.DataItem).DIC_ID%>" /></td>
                    <td><%#((SYS_MDLPOWER_DIC)Container.DataItem).DIC_NAME %></td>
                    <td><%#GetCtrlTypeName(((SYS_MDLPOWER_DIC)Container.DataItem).CTRL_TYPE.ToString())%></td>
                    <td><%#((SYS_MDLPOWER_DIC)Container.DataItem).DIC_CODE%></td>
                    <td><%#GetDealTypeName(((SYS_MDLPOWER_DIC)Container.DataItem).DEAL_TYPE.ToString())%></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
     </div>
</div>
</asp:Content>