<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_TableFieldSel" CodeFile="TableFieldSel.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <script type="text/javascript">
        var manager = new ListManager({ listCID: "tblist" });
        $(function () {
            manager.initBodyRows(); Sel_Load();
        });
        function setSelInfo(tds, index) {
            
            selInfo = "({colnote:'" + $(tds[0]).text() + "',colname:'" + $(tds[2]).text() + "',tablename:'" + $(tds[1]).text() + "',showname:'" + $(tds[3]).text() + "',iskey:" + $(tds[4]).text() + "})"; ; //选中td第一格
            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="tool">
<ol><li><span><input id="Button1" type="button" value="确定选择" onclick="window.close();" /></span></li></ol>
    
</div>
 <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td>描述</td><td>表名</td><td>字段名</td><td>显示字段名</td><td class="hide"></td><td>是否主键</td>
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <tr>
                   <td>部门ID</td><td>HR_DEPT</td><td>DEPT_ID</td><td>DEPT_NAME</td><td class="hide">1</td><td>是</td>
                </tr> 
                <tr>
                 <td>员工ID</td><td>HR_STAFF</td><td>STAFF_ID</td><td>STAFF_NAME</td><td class="hide">1</td><td>是</td>
                </tr> 
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                      
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
</asp:Content>

