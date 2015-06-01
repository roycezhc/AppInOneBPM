<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_TableFieldSel_DEV" CodeFile="TableFieldSel_DEV.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Common" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <script type="text/javascript">
        var manager = new ListManager({ listCID: "tblist" });
        $(function () {
            manager.initBodyRows(); Sel_Load();
        });
        function setSelInfo(tds, index) {
            selInfo = "({colnote:'" + $(tds[0]).text() + "',colname:'" + $(tds[2]).text() + "',tablename:'" + $(tds[1]).text() + "',showname:'" + $(tds[3]).text() + "',datatype:'" + $(tds[4]).text() + "',isAuto:'" + $(tds[5]).text() + "',iskey:'" + $(tds[6]).text() + "',defaultValue:'" + $(tds[7]).text() + "',datalen:'" + $(tds[8]).text() + "',datascale:'" + $(tds[9]).text() + "'})"; ; //选中td第一格

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
                    <td>描述</td><td>表名</td><td>字段名</td><td>显示字段名</td><td>数据类型</td><td>是否递增</td><td>是否主键</td><td>默认值</td><td>长度</td><td>精度</td>
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="body1" runat="server">
                <tr>
                   <td>部门ID</td><td>HR_DEPT</td><td>DEPT_ID</td><td>DEPT_NAME</td><td>nvarchar</td><td>是</td><td></td><td>0</td><td>0</td><td>0</td>
                </tr> 
                <tr>
                 <td>员工ID</td><td>HR_STAFF</td><td>STAFF_ID</td><td>STAFF_NAME</td><td>decimal</td><td>是</td><td></td><td>0</td><td>0</td><td>0</td>
                </tr> 
           </tbody>
            <tbody style="cursor:pointer;">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       <td><%#((DataBaseField)Container.DataItem).Desc.ZhName%></td>
                       <td><%#((DataBaseField)Container.DataItem).DataBaseTable.TableName%></td>
                       <td><%#((DataBaseField)Container.DataItem).FieldName%></td>
                       <td></td>
                       <td><%#((DataBaseField)Container.DataItem).DataType.TypeNameString%></td>
                       <td><%#((DataBaseField)Container.DataItem).IsAutoIncrease?"1":"0"%></td>
                       <td><%#((DataBaseField)Container.DataItem).IsKeyID ? "1" : "0"%></td>
                       <td><%#((DataBaseField)Container.DataItem).DefaultValue%></td>
                       <td><%#((DataBaseField)Container.DataItem).DataType.DataLen%></td>
                       <td><%#((DataBaseField)Container.DataItem).DataType.Scale%></td>
                    </tr> 
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
</asp:Content>

