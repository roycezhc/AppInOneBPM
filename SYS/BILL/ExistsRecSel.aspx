<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_ExistsRecSel" CodeFile="ExistsRecSel.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <script type="text/javascript">
        var manager = new ListManager({ listCID: "tblist" });
        $(function () {
            manager.initBodyRows(); Sel_Load();
        });
        function setSelInfo(tds, index) {
            
            selInfo = "({ID:'" + $(tds[0]).text() + "',NAME:'" + $(tds[1]).text() + "'})"; ; //选中td第一格
            
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
                    <td>ID</td><td>显示名</td>
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Literal ID="litList" runat="server"></asp:Literal>
            </tbody>
         </table>
        </div>
 <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</asp:Content>

