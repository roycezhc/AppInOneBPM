<%@ Page Language="C#" Title="客户资料管理" AutoEventWireup="true" 
MasterPageFile="~/Themes/Main/Base.master" Inherits="CRM_CustomerInformationManagement" CodeFile="CustomerInformationManagement.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %><%@ Import Namespace="AgileFrame.Core" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script src="../Lib/JScript/myTabs.js" type="text/javascript"></script>
<script src="JS/ShowMessage.js" type="text/javascript"></script>
<script src="../Lib/MyDP/seldate.js" type="text/javascript"></script>
<script src="../Lib/JQuery/jquery.divbox.js" type="text/javascript"></script>
<script src="JS/manage.js" type="text/javascript"></script>
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
        });
        managePara.listID = "tbList1";
        //managePara.colselCID = "olAllColCBS";
        //managePara.cookieName = "UserManageHidCols";
        //managePara.cookieOut = 12; //小时
        _initBodyRow();
        //_initHeadRow();

        managePara.listID = "tbList2";
        _initBodyRow();

        managePara.listID = "tbList3";
        _initBodyRow();

        managePara.listID = "tbList4";
        _initBodyRow();

        managePara.listID = "tbList5";
        _initBodyRow();

    });
//    function selShowThisTab(str) {
////        document.getElementById("spanAllCus").className = "tabUnSelect";
////        document.getElementById("spanToDayMustCon").className = "tabUnSelect";
////        document.getElementById("spanExpired").className = "tabUnSelect";
////        document.getElementById("spanContracted").className = "tabUnSelect";
////        document.getElementById(me).className = "tabSelect";
//        $("#divAllCus").hide();
//        $("#divToDayMustCon").hide();
//        $("#divExpired").hide();
//        $("#divContracted").hide();
//        $("#" + str).show();
//    }

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

    function openNewTab(me) {
        parent.addLinkToTab($(me));
        return false;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <asp:ScriptManager ID="smDetail" runat="server">
    </asp:ScriptManager>
    <div class="main">
        <div class="topnav">
            <%--<dl>
                <dt>当前位置：</dt><dd><a>CRM系统</a><b></b><a><strong>客户信息</strong></a></dd></dl>
            <ul><li><a href="javascript:history.back()">返回</a></li></ul>--%>
        </div>
        <div class="topfind">
           <dl <%=styleDisplayNone %>><dt>按客户归属：</dt><dd><asp:DropDownList ID="ddl_CusToStf" runat="server" AutoPostBack="true"
                Width="80px" OnSelectedIndexChanged="ddl_OnSelectedIndexChanged">
            </asp:DropDownList></dd>
            <dt>按客户状态：</dt><dd><asp:DropDownList ID="ddl_CusStatus" runat="server" AutoPostBack="true" Width="100px" OnSelectedIndexChanged="ddl_OnSelectedIndexChanged">
                </asp:DropDownList></dd>
            <dt>网店名称：</dt><dd><input id="txt_ShopName" type="text" size="10" runat="server" /> </dd> 
            </dl>
           <dl>
           <dt>QQ号码：</dt><dd><input id="txt_QQ" type="text" size="8" runat="server" /></dd>
           <dt>旺旺ID：</dt><dd><input id="txt_WW" type="text" size="8" runat="server" /></dd>
           <dt>公司名称：</dt><dd><input id="txt_ComName" type="text" size="10" runat="server" /></dd>
           </dl>
           <dl><dt>下次联系时间：</dt><dd style="width:200px;"><input id="time_Staf" type="text" size="8" readonly="readonly" onclick="setday(this)" runat="server" />-<input id="time_End" type="text" size="8" readonly="readonly" onclick="setday(this)" runat="server" />
              </dd>
           <dt><a class="btn"><span> <asp:Button ID="btnSearch" runat="server" Width="40px" Text="搜索" OnClick="btnSearch_Click" /></span></a></dt>
                <dd><a class="btn"><span><input id="btnClear" type="reset" size="10" value="清空搜索条件"/></span></a></dd>
           <dd>
               <a class="btn"><span><input id="btnAddNewCust" type="button" value="添加新客户" onclick="openDiv('DragBody')" /></span></a>
           </dd>
        </dl>
        <div class="clear"></div>
        </div>
        <div class="tool" style="display: none;">
            <span>把客户分配给：<asp:DropDownList ID="ddl_Staf" runat="server" Width="80px">
            </asp:DropDownList>
                <a class="btn"><span>
                    <asp:Button ID="btnDistribution" runat="server" Width="80px" Text="分配" OnClick="btnDistribution_Click" /></span></a>&nbsp;</span>
                <a class="btn"><span>
                    <input id="Button1" type="button" value="添加新客户" onclick="openDiv('addNewCust')" /></span></a>
        </div>
        <div class="tabs">
          <p></p>
          <ul><li class="show"><a>全部客户</a></li>
             <%if (!string.IsNullOrEmpty(lit_todayConCusCount.Text) && int.Parse(lit_todayConCusCount.Text) > 0) spanColor = "style=\"color:red\""; else spanColor = "style=\"color:green\"";%>
              <li><a <%=spanColor %>>今日需联系客户(<asp:Literal ID="lit_todayConCusCount" runat="server"></asp:Literal>)</a></li>
              <%if (!string.IsNullOrEmpty(lit_ExpiredUnConCusCount.Text) && int.Parse(lit_ExpiredUnConCusCount.Text) > 0) spanColor = "style=\"color:red\""; else spanColor = "style=\"color:green\"";%>
              <li><a <%=spanColor %>>过期未联系客户(<asp:Literal ID="lit_ExpiredUnConCusCount" runat="server"></asp:Literal>)</a></li>
              <%if (!string.IsNullOrEmpty(lit_WillInHighSeasCusCount.Text) && int.Parse(lit_WillInHighSeasCusCount.Text) > 0) spanColor = "style=\"color:red\""; else spanColor = "style=\"color:green\"";%>
              <li><a <%=spanColor %>>即将投入公海(<asp:Literal ID="lit_WillInHighSeasCusCount" runat="server"></asp:Literal>)</a></li>
              <li><a>已签约客户(<asp:Literal ID="lit_ContractedCusCount" runat="server"></asp:Literal>)</a></li>
          </ul>
          
          <ol>
             <li class="show">
                <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <input id="hidAllCus" type="hidden" runat="server" />
                        <div class="tblist" id="tbList1">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.CompanyName.ZhName%>
                                        </td>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.ShopName.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#CRM_CUST.Attribute.Cus_Name.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_CUSTOMER.Attribute.CustQQ.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_CUSTOMER.Attribute.WangWangId.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.LastContactTime.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#HR_STAFF.Attribute.STAFF_NAME.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.CustStatus.ZhName%>
                                        </td>
                                        <%--<td>
                                            操作
                                        </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="repAllCusList" runat="server" OnItemDataBound="repList_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td><a onclick="return openNewTab(this);" data="{key:'kehuxinxiliulan'}" href="CustomerDetails.aspx?<%#"SID="+ ((V_CRM_STAFF_CUSTOMER)Container.DataItem).SID + "&CUSID=" + ((V_CRM_STAFF_CUSTOMER)Container.DataItem).Cus_ID%>">
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).CompanyName%></a>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).ShopName%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).Cus_Name%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).CustQQ%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).WangWangId%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).LastContactTime%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).SNAME%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).CustStatus == 0 ? "未知" : ddl_CusStatus.Items[((V_CRM_STAFF_CUSTOMER)Container.DataItem).CustStatus].Text%>
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
                            <WebCtrl:AspNetPager ID="aspAllCusPager" runat="server" OnPageChanged="aspPager_PageChanged"
                                ShowCustomInfoSection="Never">
                            </WebCtrl:AspNetPager>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
             </li>
             <li>
                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <input id="hidToDayMustCon" type="hidden" runat="server" />
                        <div class="tblist" id="tbList2">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.CompanyName.ZhName%>
                                        </td>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.ShopName.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#CRM_CUST.Attribute.Cus_Name.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_CUSTOMER.Attribute.CustQQ.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_CUSTOMER.Attribute.WangWangId.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.LastContactTime.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#HR_STAFF.Attribute.STAFF_NAME.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.CustStatus.ZhName%>
                                        </td>
                                        <%--<td>
                                            操作
                                        </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="repToDayMustConList" runat="server" OnItemDataBound="repList_ItemDataBound">
                                        <ItemTemplate>
                                           <tr>
                                                <td>
                                                     <a  onclick="return openNewTab(this);" data="{key:'kehuxinxiliulan'}" href="CustomerDetails.aspx?<%#"SID="+ ((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).STAFF_ID + "&CUSID=" + ((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).Cus_ID%>">
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CompanyName%></a>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).ShopName%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).Cus_Name%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CustQQ%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).WangWangId%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).LastContactTime%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).SNAME%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CustStatus==0?"未知":ddl_CusStatus.Items[((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CustStatus].Text%>
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
                            <WebCtrl:AspNetPager ID="aspToDayMustConPager" runat="server" OnPageChanged="aspPager_PageChanged"
                                ShowCustomInfoSection="Never">
                            </WebCtrl:AspNetPager>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
             </li>
             <li>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <input id="hidExpired" type="hidden" runat="server" />
                        <div class="tblist"  id="tbList3">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.CompanyName.ZhName%>
                                        </td>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.ShopName.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#CRM_CUST.Attribute.Cus_Name.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_CUSTOMER.Attribute.CustQQ.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_CUSTOMER.Attribute.WangWangId.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.LastContactTime.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#HR_STAFF.Attribute.STAFF_NAME.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.CustStatus.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            应联系时间
                                        </td>
                                        <%--<td>
                                            操作
                                        </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="repExpiredList" runat="server" OnItemDataBound="repList_ItemDataBound">
                                        <ItemTemplate>
                                            
                                            <tr>
                                                <td>
                                                    <a  onclick="return openNewTab(this);" data="{key:'kehuxinxiliulan'}" href="CustomerDetails.aspx?<%#"SID="+ ((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).STAFF_ID + "&CUSID=" + ((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).Cus_ID%>"><%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CompanyName%></a>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).ShopName%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).Cus_Name%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CustQQ%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).WangWangId%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).LastContactTime%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).SNAME%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CustStatus==0?"未知":ddl_CusStatus.Items[((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CustStatus].Text%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).NextContactTime%>
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
                            <WebCtrl:AspNetPager ID="aspExpiredPager" runat="server" OnPageChanged="aspPager_PageChanged"
                                ShowCustomInfoSection="Never">
                            </WebCtrl:AspNetPager>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
             </li>
             <li>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <input id="hidWillInHighSeas" type="hidden" runat="server" />
                        <div class="tblist" id="tbList4">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.CompanyName.ZhName%>
                                        </td>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.ShopName.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#CRM_CUST.Attribute.Cus_Name.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_CUSTOMER.Attribute.CustQQ.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_CUSTOMER.Attribute.WangWangId.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.LastContactTime.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#HR_STAFF.Attribute.STAFF_NAME.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.CustStatus.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            应联系时间
                                        </td>
                                        <td style="width: 100px;">
                                            抛入公海时间
                                        </td>
                                        <%--<td>
                                            操作
                                        </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="repWillInHighSeasList" runat="server" OnItemDataBound="repList_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <a  onclick="return openNewTab(this);" data="{key:'kehuxinxiliulan'}" href="CustomerDetails.aspx?<%#"SID="+ ((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).STAFF_ID + "&CUSID=" + ((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).Cus_ID%>">
                                            <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CompanyName%></a>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).ShopName%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).Cus_Name%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CustQQ%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).WangWangId%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).LastContactTime%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).SNAME%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CustStatus==0?"未知":ddl_CusStatus.Items[((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).CustStatus].Text%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).NextContactTime%>
                                                </td>
                                                <td>
                                                    <%#(60 - (DateTime.Now.Date - ((V_CRM_STAFF_CUSTOMER_NOTCONTACT)Container.DataItem).NextContactTime.Date).Days) + "天后"%>
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
                            <WebCtrl:AspNetPager ID="aspWillInHighSeasPager" runat="server" OnPageChanged="aspPager_PageChanged"
                                ShowCustomInfoSection="Never">
                            </WebCtrl:AspNetPager>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
             </li>
             <li>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <input id="hidContracted" type="hidden" runat="server" />
                        <div class="tblist" id="tbList5">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.CompanyName.ZhName%>
                                        </td>
                                        <td style="width: 140px;">
                                            <%#CRM_CUSTOMER.Attribute.ShopName.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#CRM_CUST.Attribute.Cus_Name.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_CUSTOMER.Attribute.CustQQ.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_CUSTOMER.Attribute.WangWangId.ZhName%>
                                        </td>
                                        <td style="width: 100px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.LastContactTime.ZhName%>
                                        </td>
                                        <td style="width: 80px;">
                                            <%#HR_STAFF.Attribute.STAFF_NAME.ZhName%>
                                        </td>
                                        <td style="width: 120px;">
                                            <%#CRM_STAFF_CUSTOMER.Attribute.CustStatus.ZhName%>
                                        </td>
                                        <%--<td>
                                            操作
                                        </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="repContractedList" runat="server" OnItemDataBound="repList_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <a onclick="return openNewTab(this);" data="{key:'kehuxinxiliulan'}"  href="CustomerDetails.aspx?<%#"SID="+ ((V_CRM_STAFF_CUSTOMER)Container.DataItem).SID + "&CUSID=" + ((V_CRM_STAFF_CUSTOMER)Container.DataItem).Cus_ID%>">
                                           <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).CompanyName%></a>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).ShopName%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).Cus_Name%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).CustQQ%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).WangWangId%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).LastContactTime%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).SNAME%>
                                                </td>
                                                <td>
                                                    <%#((V_CRM_STAFF_CUSTOMER)Container.DataItem).CustStatus == 0 ? "未知" : ddl_CusStatus.Items[((V_CRM_STAFF_CUSTOMER)Container.DataItem).CustStatus].Text%>
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
                            <WebCtrl:AspNetPager ID="aspContractedPager" runat="server" OnPageChanged="aspPager_PageChanged"
                                ShowCustomInfoSection="Never">
                            </WebCtrl:AspNetPager>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
             </li>
          </ol>
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
