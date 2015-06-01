<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="V_SchedulingSchClassManage" CodeFile="V_SchedulingSchClassManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="System.Data"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
        tblistReSize('tblist');
    });

    function tblistReSize(meclass) {
        var tds = $("." + meclass + " table thead tr td");
        if (tds == null || tds == undefined || tds.length < 1)
            return;
        var td = tds[tds.length - 1];
        var wid = 0;
        for (var i = 0; i < tds.length - 1; i++) {
            wid += tds[i].offsetWidth;
        }
        var lasttdwid = $("." + meclass)[0].offsetWidth - wid - 2;
        if (lasttdwid <= 0) {
            td.style.display = "none";
        }
        else {
            td.style.display = "";
            td.width = lasttdwid; 
        }
    }

    function showatooltip(d1, me) {
        var div3 = document.getElementById(d1);
        div3.innerHTML = $(me)[0].tag;
        document.getElementById(d1).style.display = 'block';
        div3.style.left = event.clientX + 1;
        div3.style.top = event.clientY + 1;
        div3.style.position = "absolute";
    }

    function hideatooltip(d1) {
        document.getElementById(d1).style.display = 'none';
    }
</script>
<style type="text/css">
    .worktimeview{text-align:center;width:20px; min-width:20px;max-width:20px; border:none 0px #000; position:relative; }
    .selStf input{ background-color:White; border:1px solid #aad;}
    .selStf span #txtStaff_NAME{ background-color:White;border:1px solid #aad;}
</style>
<style type="text/css">
        .tool .toolselascx{margin:0px; padding:0px; float:left; width:160px; text-align:left; clear:right;}
        .tool .toolselascx span{ margin:0px; padding:0px; width:100%; height:20px; line-height:20px; border: 0px none #fff; }
        .tool .toolselascx span a{line-height:22px; float:left;}
        .tool .toolselascx span .selshowinput{background-color:#fff; height:18px; width:50%; float:left; line-height:18px; border:1px solid #aad;}
        .tool .toolselascx span input.sel{border:none;background:url(../../../Themes/Default/img/find.gif) center center no-repeat;height:20px;width:25px; cursor:pointer;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<asp:ScriptManager ID="ScriptManager1" runat = "server" ></asp:ScriptManager>
<div class="main">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
<ContentTemplate>
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="tool"><!--需要隐去时，用 style="display:none;"-->
       <ul style=" width:100%;">
           <li class="toolselascx"><selStaff:wucSelStaff ID="wucSelStaff1" LeftText="员工:" SWidth="55%" runat="server" /></li>
           <li><span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span></li>
           <li><span><asp:Button ID="btnReset" runat="server" Text="重置" onclick="btnReset_Click" /></span></li>
       </ul>      
    </div>
    <div class="tool">
        <ul style=" width:100%;">
            <li><span><input power="newV_SchedulingSchClass" id="btn_New" type="button" value="新建" onclick="manager.newRecord('../HR_Scheduling/HR_SchedulingEdit.aspx');" /></span></li>
            <li><span><input power="editV_SchedulingSchClass" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('../HR_Scheduling/HR_SchedulingEdit.aspx');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('V_SchedulingSchClassBack.aspx');" /></span></li>
            <li><span><input id="btnBuild" type="button" value="生成" onclick="manager.editRecord('V_SchedulingSchClassBuild.aspx');"  /></span></li>
            <li><span><asp:DropDownList ID="dll_Year" runat="server" onselectedindexchanged="dll_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList><a style=" line-height:18px;">年</a></span></li>
            <li><span><asp:DropDownList ID="dll_Month" runat="server" onselectedindexchanged="dll_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList><a style=" line-height:18px;">月</a></span></li>
            <li><span><asp:DropDownList ID="dll_Day" runat="server" onselectedindexchanged="dll_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList><a style=" line-height:18px;">日</a></span></li>
            <li><span><a style=" line-height:18px;">值班类型:</a><asp:DropDownList ID="dll_Type" runat="server" onselectedindexchanged="dll_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></span></li>
        </ul>
    </div>
    <div class="tblist" style=" text-align:left;" onresize="tblistReSize('tblist')">
         <table cellpadding="0" cellspacing="0" id="tbList" style="table-layout:fixed; width:660px;">
            <thead>
                <tr>
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <asp:Repeater ID="repHead" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                    <td <%#((DataColumn)Container.DataItem).ColumnName.Split(new string[] {spl}, StringSplitOptions.None)[1]%>><%#((DataColumn)Container.DataItem).ColumnName.Split(new string[] {spl}, StringSplitOptions.None)[0]%></td><!--日期-->
                    </ItemTemplate>
                </asp:Repeater>
                    <td></td>
                </tr>
            </thead>
            <tbody onresize="manager.initBodyRows();">
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#BindRow(Container) %>" /></td>
                    <asp:Repeater ID="repRow" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                    <td <%#Container.DataItem.ToString().Split(new string[]{"|*|"},StringSplitOptions.None)[1]%>><%#Container.DataItem.ToString().Split(new string[]{"|*|"},StringSplitOptions.None)[0]%></td>
                    </ItemTemplate>
                    </asp:Repeater>
                    <td></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="path-url hide">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
</ContentTemplate>
</asp:UpdatePanel>
<div id="tableatooltip" style="display:none; text-align:left; background-color:#ffeeaa; border:1px solid #eee"></div>
</div>
</asp:Content>