<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_TableSel_DEV" CodeFile="TableSel_DEV.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Common" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <script type="text/javascript">
        var manager = new ListManager({ listCID: "tblist" });
        $(function () {
            manager.initBodyRows(); Sel_Load();
        });
        function setSelInfo(tds, index) {
            var devObj = $("select[id$='txtDEV']");
            var iskey = $(tds[5]).text() == "是" ? "1" : "0";
            selInfo = "({NAME:'" + $(tds[0]).text() + "',DEV:'" + devObj.val() + "',DES:'" + $(tds[1]).text() + "'})"; ; //选中td第一格

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="tool">

<ol><li><span><input id="Button1" type="button" value="确定选择" onclick="setSelInfo();window.close();" /></span></li></ol>
    
</div>
<div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
        <dl>
           <dt>数据源:</dt>
           <dd><span>
              <asp:DropDownList ID="txtDEV" style="width:150px;" runat="server" 
                        onselectedindexchanged="txtDEV_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
                </span></dd>
        </dl>
</div>
 <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td>表名</td><td>表描述</td>
                </tr>
            </thead>
            <tbody style="cursor:pointer;"
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       <td><%#((DataBaseTable)Container.DataItem).TableName%></td>
                       <td><%#((DataBaseTable)Container.DataItem).Desc.ZhName%></td>
                    </tr> 
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
</asp:Content>

