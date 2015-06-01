<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_DEPT_MANAGERManage" CodeFile="MANAGERManage.aspx.cs" %>
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
    <dl><dt><b><%=name%> <%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
        <ul>
            <li><span><input id="btn_New" type="button" value="添加" onclick="manager.newRecord('MANAGEREdit.aspx','DEPT_ID=<%=deptid %>');" /></span></li>
<%--            <li><span class="btn"><input power="NewStaff" id="Button2" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('MANAGERBack.aspx');" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="DEPT_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <%--<td data="{colname:'<%=HR_DEPT_MANAGER.Attribute.DEPT_ID.LongName%>',show:1}"><%=HR_DEPT_MANAGER.Attribute.DEPT_ID._ZhName %></td><!--部门标识-->
                    --%>
                    
                    <td data="{colname:'<%=HR_DEPT_MANAGER.Attribute.STAFF_ID.LongName%>',show:1}" >主管姓名</td><!--员工标识-->
                    
                    
                    <td data="{colname:'<%=HR_DEPT_MANAGER.Attribute.MAG_NAME.LongName%>',show:1}">管理人级别</td><!--管理人级别-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_DEPT_MANAGER)Container.DataItem).MAG_ID%>" /></td>
                  <%--  <td><%#((HR_DEPT_MANAGER)Container.DataItem).DEPT_ID %></td>--%>
                    <td style="color:Blue"><%#((HR_DEPT_MANAGER)Container.DataItem).MAG_NAME %></td>

                    <td><%#FormHelper.GetText(HR_DEPT_MANAGER.Attribute.LEVEL_CODE, ((HR_DEPT_MANAGER)Container.DataItem).LEVEL_CODE)%></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
</div>
</asp:Content>