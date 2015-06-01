<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_DP_STORAGEManage" CodeFile="DP_STORAGE.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
    });

    function selStorage(me) {

        var result = window.showModalDialog("../../IM/STORAGE/STORAGESels.aspx?r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeÀ¢–¬∏∏ª≠√Ê
        if (result == undefined || result == "") return;
        //alert(result);
        var obj = eval(result);
        if (obj.length > 0) {
            var arr = new Array();
            for (var i = 0; i < obj.length; i++) {
                arr.push(obj[i].ID);
            }

            $.ajax({
                url: "USERDATABack.aspx?<%=paraStr %>&AddToUserData=" + arr.toString() + "&Data_Type=<%=date_type %>",
                cache: false,
                success: function (svrData) {
                    if (svrData != "") {
                        //alert(svrData);
                        //manager.addToList(svrData);
                        window.location.href = window.location.href;
                    }
                },
                error: function (a, b, c) {
                    alert(a);
                }
            });
        }

    }

    function delFromUserRole(me) {
        alert(manager.getSelectedIDS());
        $.ajax({
            url: "USERDATABack.aspx?<%=paraStr %>&delFromUserRole=" + manager.getSelectedIDS() + "&Data_Type=<%=date_type %>",
            cache: false,
            success: function (svrData) {
                if (svrData != "") {
                    //alert(svrData);
                    //manager.addToList(svrData);
                    window.location.href = window.location.href;
                }
            },
            error: function (a, b, c) {
                alert(a);
            }
        });
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>

    <div class="tool">
        <ul>
            <li><span><input power="selStorage" id="btn_New" type="button" value="ÃÌº”" onclick="selStorage(this);" /></span></li>
            <li><span><input power="delFromUserRole" id="btn_Dels" type="button" value="…æ≥˝" onclick="delFromUserRole();" /></span></li>
        </ul>
        <ol>
            <li><b>√ø“≥œ‘ æ</b></li>
            <li><input id="txtPageNum" type="text" runat="server" style="width:25px;" /><b>Ãı</b></li>
            <li><span><asp:Button ID="btnSetPageNum" runat="server" Text="…Ë÷√" OnClick="btnSetPageNum_Click" /></span></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="STOR_ID">
                    <td class="first"><input type="checkbox" onclick="selAll(this);" /></td>
                   
                    <td colname="<%=IM_STORAGE.Attribute.STOR_ID.FieldName%>"><%=IM_STORAGE.Attribute.STOR_ID._ZhName %></td><!--≤÷ø‚Œ®“ª±Í ∂-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.NAME.FieldName%>"><%=IM_STORAGE.Attribute.NAME._ZhName %></td><!--≤÷ø‚√˚-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.SNAME.FieldName%>"><%=IM_STORAGE.Attribute.SNAME._ZhName %></td><!--≤÷ø‚ºÚ≥∆-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.RNAME.FieldName%>"><%=IM_STORAGE.Attribute.RNAME._ZhName %></td><!--÷˙º«¬Î-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.ORG_ID.FieldName%>"><%=IM_STORAGE.Attribute.ORG_ID._ZhName %></td><!--ª˙ππID-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.USE_FLAG.FieldName%>"><%=IM_STORAGE.Attribute.USE_FLAG._ZhName%></td><!--◊¥Ã¨-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((IM_STORAGE)Container.DataItem).STOR_ID%>" /></td>
                    <td><%#((IM_STORAGE)Container.DataItem).STOR_ID %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).NAME %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).SNAME %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).RNAME %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).ORG_ID %></td>
                    <td><%#FormHelper.GetText(IM_STORAGE.Attribute.USE_FLAG, ((IM_STORAGE)Container.DataItem).USE_FLAG)%></td>
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