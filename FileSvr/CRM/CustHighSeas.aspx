<%@ Page Language="C#" Title="客户公海" AutoEventWireup="true" 
MasterPageFile="~/Themes/Main/Base.master" Inherits="CRM_CustHighSeas" CodeFile="CustHighSeas.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %><%@ Import Namespace="AgileFrame.Core" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script type="text/javascript" src="../Lib/JQuery/jquery.divbox.js"></script>
<script src="JS/ShowMessage.js" type="text/javascript"></script>
<script src="../Lib/MyDP-AD/seldate.js" type="text/javascript"></script>
<script src="../Lib/Mdl/manage.js" type="text/javascript"></script>
<script type="text/javascript">
    var bool = false;
    var offsetX = 0;
    var offsetY = 0;
    $('document').ready(function () {
        $("#DragTitle").mousedown(function (event) {
            bool = true;
            offsetX = event.offsetX ? event.offsetX : event.layerX;
            offsetY = event.offsetY ? event.offsetY : event.layerY;
        })
        $(document).mouseup(function () {
            bool = false;
        })
        $(document).mousemove(function (event) {
            if (!bool) {
                return;
            }
            else {
                var x = event.clientX - offsetX;
                var y = event.clientY - offsetY;
                $("#DragBody").css("position", "absolute");
                $("#DragBody").css("left", x);
                $("#DragBody").css("top", y);
            }
        })
    });
    function clearSearchText(me) {
        $(me).parent().parent().parent().prev().find("input").val("");
        $(me).parent().parent().parent().prev().prev().find("input").val("");
    }
    function selAll(me) { 
        var chk = $(me);
        if (chk.checked)
        { }
        else
        { }
    }
    function openDiv(str) {
        $("#" + str).OpenDiv();
        $("#" + str).show();
     }
     function closeDiv(str) {
         $("#" + str).hide();
         $("#" + str).CloseDiv();
     }
     function saveAndCloseDiv(str, msg, id) {
         $("#" + str).hide();
         $("#" + str).CloseDiv();
         showMsg(msg, id);
     }
     function openMore(me) {
         var txt = $(me).val();
         if (txt == "+展开") {
             $(me).parent().parent().next().show();
             $(me).val("-展开");
         }
         else {
             $(me).parent().parent().next().hide();
             $(me).val("+展开");
         }
     }
     function setSizeBig(me) {
         var src1 = document.getElementById(me);
         src1.width = "20";
         src1.height = "20";
     }
     function setSizeSma(me) {
         var src1 = document.getElementById(me);
         src1.width = "15";
         src1.height = "15";
     }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <asp:ScriptManager ID="smDetail" runat="server">
    </asp:ScriptManager>
    <div id="main" class="main">
        <div class="topnav">
            
        </div>
        <div class="topfind">
                <dl>
                    <dt>公司名称：</dt><dd><input id="txt_ComName" type="text" size="10" runat="server" /></dd>
                    <dt>网店名称：</dt><dd><input id="txt_ShopName" type="text" size="10" runat="server" /></dd>
                    <dt>旺旺ID：</dt><dd><input id="txt_WW" type="text" size="8" runat="server" /></dd>
                </dl>
                <dl>
                    <dt>电话：</dt><dd><input id="txt_Phone" type="text" size="8" runat="server" /></dd>
                    <dt>手机：</dt><dd><input id="txt_MobPhone" type="text" size="8" runat="server" /></dd>
                    <dt>QQ号码：</dt><dd><input id="txt_QQ" type="text" size="8" runat="server" /></dd>
                </dl>
                <dl>
                    <dt>加入公海时间：</dt><dd style=" width:180px;"><input id="time_Staf" type="text" size="8" readonly="readonly" onclick="setday(this)" runat="server" />-<input id="time_End" type="text" size="8" readonly="readonly" onclick="setday(this)" runat="server" /></dd>
                    <dt><a class="btn"><span><asp:Button ID="btnSearch" runat="server" Width="80px" Text="搜索" OnClick="btnSearch_Click" /></span></a></dt>
                    <dd><a class="btn"><span><input id="btnClear" type="reset" value="清空搜索条件" /></span></a></dd>
                </dl>
                <dl>
                </dl>
                <dl>
                    <dt>把客户分配给：</dt><dd style=" width:180px;"><asp:DropDownList ID="ddl_Staf" runat="server" Width="120px"></asp:DropDownList></dd>
                    <dt><a class="btn"><span><asp:Button ID="btnDistribution" runat="server" Width="80px" Text="分配" OnClick="btnDistribution_Click" /></span></a></dt>
                    <dd><a class="btn" href="AddNewCust.aspx?SID=<%=SID %>"><span><input id="btnAddNewCus" type="button" value="添加新客户" onclick="openDiv('DragBody');" /></span></a></dd>
                    <dd style=" width:200px;"><asp:Literal ID="lit_CustInfo" runat="server" Visible="false"></asp:Literal></dd>
                </dl>
        </div>
        <div style=" margin:10px 0px 0px 0px;">
            <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <input id="hidHighSeas" type="hidden" runat="server" />
                    <div class="tblist">
                        <table cellpadding="0" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <td style="width: 40px;">
                                        选择
                                    </td>
                                    <td style="width: 140px;">
                                        <%=CRM_CUSTOMER.Attribute.CompanyName.ZhName%>
                                    </td>
                                    <td style="width: 140px;">
                                        <%=CRM_CUSTOMER.Attribute.ShopName.ZhName%>
                                    </td>
                                    <td style="width: 80px;">
                                        <%=CRM_CUST.Attribute.Cus_Name.ZhName%>
                                    </td>
                                    <td style="width: 100px;">
                                        <%=CRM_CUST.Attribute.Phone.ZhName%>
                                    </td>
                                    <td style="width: 120px;">
                                        <%=CRM_CUST.Attribute.MobPhone.ZhName%>
                                    </td>
                                    <td style="width: 100px;">
                                        <%=CRM_CUSTOMER.Attribute.CustQQ.ZhName%>
                                    </td>
                                    <td style="width: 120px;">
                                        <%=CRM_CUSTOMER.Attribute.WangWangId.ZhName%>
                                    </td>
                                    <td style="width: 100px;">
                                        <%=CRM_CUSTOMER.Attribute.LoadHighSeasTime.ZhName%>
                                    </td>
                                    <%--<td>
                                        操作
                                    </td>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="repList" runat="server" OnItemDataBound="repList_ItemDataBound">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <input name="selThis" runat="server" type="checkbox" value="<%#((V_CUSTHIGHSEAS)Container.DataItem).Cus_ID + cusIdAndCompanyName + ((V_CUSTHIGHSEAS)Container.DataItem).CompanyName%>" />
                                            </td>
                                            <td>
                                                <%#((V_CUSTHIGHSEAS)Container.DataItem).CompanyName%>
                                            </td>
                                            <td>
                                                <%#((V_CUSTHIGHSEAS)Container.DataItem).ShopName%>
                                            </td>
                                            <td>
                                                <%#((V_CUSTHIGHSEAS)Container.DataItem).Cus_Name%>
                                            </td>
                                            <td>
                                                <%#((V_CUSTHIGHSEAS)Container.DataItem).Phone%>
                                            </td>
                                            <td>
                                                <%#((V_CUSTHIGHSEAS)Container.DataItem).MobPhone%>
                                            </td>
                                            <td>
                                                <%#((V_CUSTHIGHSEAS)Container.DataItem).CustQQ%>
                                            </td>
                                            <td>
                                                <%#((V_CUSTHIGHSEAS)Container.DataItem).WangWangId%>
                                            </td>
                                            <td>
                                                <%#((V_CUSTHIGHSEAS)Container.DataItem).LoadHighSeasTime%>
                                            </td>
                                            <%--<td>
                                                操作
                                            </td>--%>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <div class="pages">
                        <WebCtrl:AspNetPager ID="aspPager" runat="server" OnPageChanged="aspPager_PageChanged"
                            ShowCustomInfoSection="Never">
                        </WebCtrl:AspNetPager>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="DragBody" class="moveText">
             <div id="DragTitle" class="moveDiv">
                 <img id="addnewcustClose" alt="关闭" title="关闭" width="15px" height="15px" src="img/close.png" onclick="closeDiv('DragBody')" onmousemove="setSizeBig('addnewcustClose')" onmouseout="setSizeSma('addnewcustClose')" />
             </div>
             <div>
                 <iframe id="addNewCustPage" name="addNewCustPage" src="AddNewCust.aspx?SID=<%=SID %>" width="100%" height="500px" frameborder="1" scrolling="auto" ></iframe>
             </div>
        </div>
    </div>
</asp:Content>