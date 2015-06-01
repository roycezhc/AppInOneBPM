<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_ROLE_ManageMulti" CodeFile="ROLEManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initPageSizeEvt("txtPageNum");

        bindWinResize(40);
    });

    function setRolePower(me) {
        var roleid = manager.getSelectedID();
        if (roleid == "") {
            alert("请单击某行选择一个角色！");
            return;
        }
        var result = window.showModalDialog("../Power/PowerSet.aspx?ROLE_ID="+roleid+"&r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        return false;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
    <div class="titnav">
    <dl><dt><b>角色管理</b></dt></dl>
    </div>
    <div class="warn">
        <div class="warn"><asp:Literal ID="litWarn" runat="server">“新建”：打开窗体新建角色。在表格中选中一行，点“编辑”打开窗口编辑角色；点“新建下级”可以建立子层级数据。在表格左边多选角色，再点“删除”可批删除角色。</asp:Literal></div>
    </div>
    <div class="topfind">  
          <dl><dt><%=SYS_ROLE.Attribute.ROLE_NAME.ZhName %>：</dt><dd><span><input id="txtROLE_NAME" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/></span></dd></dl>
          <dl><dt><%=SYS_ROLE.Attribute.CREATER.ZhName %>：</dt><dd><span><input id="txtCREATER" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/></span></dd></dl>
          <dl class="btn"><dt></dt><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="topFindClear(this);"/></span>
          </dd></dl>
          <div class="clear"></div>
    </div>   
    <div class="tool">
        <ul>
            <li><span><input power="NewUser"  type="button" value="新建" onclick="manager.newRecord('RoleEdit.aspx','PID=<%=pid %>');" /></span></li>
            <li><span><input power="NewStaff" id="Button1" type="button" value="新建下级" onclick="manager.newRecord('RoleEdit.aspx','PID');" /></span></li>
            <li><span><input power="EditUser" type="button" value="编辑" onclick="manager.editRecord('RoleEdit.aspx');" /></span></li>
            <li><span><input power="DeleteSels" type="button" value="删除" onclick="manager.delBySelIDS('RoleBack.aspx');" /></span></li>
            <li><span><input power="SetPower" type="button" value="权限设置" onclick="setRolePower(this);" /></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageNum" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="btnSetPageNum" runat="server" Text="设置" OnClick="btnSetPageNum_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="olAllColCBS"></ol></li>
        </ol>
    </div>
    <div class="tblist" id="tbList">
         <table cellpadding="0" cellspacing="0">
            <thead>
                <tr keyname="ROLE_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td><a href="ROLEManage.aspx" id="a_top" runat="server"><b>/顶级</b></a></td>

                    <td colname="ROLE_ID"><%=SYS_ROLE.Attribute.ROLE_ID._ZhName %></td><!--角色ID-->
                    <td colname="ROLE_NAME"><%=SYS_ROLE.Attribute.ROLE_NAME._ZhName %></td><!--角色名-->
                    <td colname="CREATER"><%=SYS_ROLE.Attribute.CREATER._ZhName %></td><!--CREATER-->
                    <td colname="CREATIME"><%=SYS_ROLE.Attribute.CREATIME._ZhName %></td><!--创建时间-->
                    <td colname="PNAME"><%=SYS_ROLE.Attribute.PNAME._ZhName %></td>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_ROLE)Container.DataItem).ROLE_ID%>" /><input value="<%#((SYS_ROLE)Container.DataItem).PATH%>" type="hidden" /></td>
                    <td><%#showLeftLinks(((SYS_ROLE)Container.DataItem).PATH, ((SYS_ROLE)Container.DataItem).PNAME, Container.ItemIndex)%></td>
                    <td><%#((SYS_ROLE)Container.DataItem).ROLE_ID %></td>
                    <td><a href="RoleUsers.aspx?ROLE_ID=<%#((SYS_ROLE)Container.DataItem).ROLE_ID %>&preUrl=<%=curUrl %>"><%#((SYS_ROLE)Container.DataItem).ROLE_NAME %></a></td>
                    <td><%#((SYS_ROLE)Container.DataItem).CREATER %></td>
                    <td><%#(((SYS_ROLE)Container.DataItem).CREATIME == DateTime.MinValue) ? "" : ((SYS_ROLE)Container.DataItem).CREATIME.ToString("yyyy-MM-dd")%></td>
                     <td><%#((SYS_ROLE)Container.DataItem).PNAME%></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
     </div>
      <div class="path-url">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
      <div class="pages">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
      </div>
</div>
</asp:Content>