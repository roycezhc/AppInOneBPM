<%@ Page Title="客户详细信息" Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Themes/Main/Base.master" Inherits="CRM_CustomerDetails_KS" CodeFile="CustomerDetails_KS.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %><%@ Import Namespace="AgileFrame.Core" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function editInfoTable(me) {
            $(me).parent().parent().find("table").find("a").hide();
            $(me).parent().parent().find("table").find("b").show();
            $(me).parent().find("a").show();
            $(me).hide();
        }
        function editCanel(me) {
            $(me).parent().parent().parent().parent().find("table").find("b").hide();
            $(me).parent().parent().parent().parent().find("table").find("a").show();
            $(me).parent().parent().parent().find("img").show();
            $(me).parent().parent().hide();
        }
        function editOk(me) {
            $(me).parent().parent().parent().parent().find("table").find("b").hide();
            $(me).parent().parent().parent().parent().find("table").find("a").show();
            $(me).parent().parent().parent().find("img").show();
            $(me).parent().parent().hide();
        }
        function clearContactRecords(me) {
            $("#<%=ContactRecords.ClientID%>").val("");
        }
        function clearSel(me) {
            $(me).parent().parent().parent().find("input").val("");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <asp:ScriptManager ID="smDetail" runat="server">
    </asp:ScriptManager>
    <div class="main">
        <div class="topnav">
            <dl>
                <dt>当前位置：</dt><dd><a>CRM系统</a><b></b><a><strong>>客户管理>客户资料管理>查看客户详情</strong></a></dd></dl>
            <ul>
                <li><a href="<%=PreviousUrlUrl %>">
                    <%=Uri.IsWellFormedUriString(PreviousUrlUrl,UriKind.Absolute)?"返回":"" %>返回</a></li></ul>
        </div>
        <div class="infobg">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div class="tbinfo">
                        <table>
                            <tr>
                                <td style="width: 80px;">
                                    <span>公司名称：</span>
                                </td>
                                <td>
                                    <a>
                                        <asp:Literal ID="lit_CompanyName" runat="server"></asp:Literal></a><b style="display: none"><input
                                            id="page_CompanyName" runat="server" type="text" maxlength="25" value="" /></b>
                                </td>
                                <td style="width: 80px;">
                                    <span>网店名称：</span>
                                </td>
                                <td>
                                    <a>
                                        <asp:Literal ID="lit_ShopName" runat="server"></asp:Literal></a><b style="display: none"><input
                                            id="page_ShopName" runat="server" type="text" maxlength="25" value="" /></b>
                                </td>
                                <td style="width: 80px;">
                                    <span>网店地址：</span>
                                </td>
                                <td>
                                    <a>
                                        <asp:Literal ID="lit_ShopNameURL" runat="server"></asp:Literal></a><b style="display: none"><input
                                            id="page_ShopNameURL" runat="server" type="text" maxlength="50" value="" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 80px;">
                                    <span>客户姓名：</span>
                                </td>
                                <td>
                                    <a>
                                        <asp:Literal ID="lit_Cus_Name" runat="server"></asp:Literal></a><b style="display: none"><input
                                            id="page_Cus_Name" runat="server" type="text" maxlength="75" value="" /></b>
                                </td>
                                <td style="width: 80px;">
                                    <span>电话号码：</span>
                                </td>
                                <td>
                                    <a>
                                        <asp:Literal ID="lit_Phone" runat="server"></asp:Literal></a><b style="display: none"><input
                                            id="page_Phone" runat="server" type="text" maxlength="15" value="" /></b>
                                </td>
                                <td style="width: 80px;">
                                    <span>QQ号码：</span>
                                </td>
                                <td>
                                    <a>
                                        <asp:Literal ID="lit_CustQQ" runat="server"></asp:Literal></a><b style="display: none"><input
                                            id="page_CustQQ" runat="server" type="text" maxlength="15" value="" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 80px;">
                                    <span>邮箱地址：</span>
                                </td>
                                <td>
                                    <a>
                                        <asp:Literal ID="lit_Email" runat="server"></asp:Literal></a><b style="display: none"><input
                                            id="page_Email" runat="server" type="text" maxlength="75" value="" /></b>
                                </td>
                                <td style="width: 80px;">
                                    <span>公司地址：</span>
                                </td>
                                <td>
                                    <a>
                                        <asp:Literal ID="lit_CompanyAddress" runat="server"></asp:Literal></a><b style="display: none"><input
                                            id="page_CompanyAddress" runat="server" type="text" maxlength="100" value="" /></b>
                                </td>
                                <td style="width: 80px;">
                                    <span>旺旺ID：</span>
                                </td>
                                <td>
                                    <a>
                                        <asp:Literal ID="lit_WangWangId" runat="server"></asp:Literal></a><b style="display: none"><input
                                            id="page_WangWangId" runat="server" type="text" maxlength="25" value="" /></b>
                                </td>
                            </tr>
                        </table>
                        <div class="tool" style="margin: 0px 10px 0px 0px">
                            <img alt="编辑" id="startedit" src="img/edit.png" width="15px" height="15px" title="编辑"
                                onclick="editInfoTable(this)" />
                            <a class="btn" style="display: none"><span>
                                <asp:Button ID="btnCusDetailUpDown" runat="server" Width="80px" Text="确定提交" OnClick="btnCusDetailUpDown_Click"
                                    OnClientClick="editOk(this)" />&nbsp;&nbsp;
                                <asp:Button ID="btnCusDetailChangeCanel" runat="server" Width="80px" Text="取消修改"
                                    OnClientClick="editCanel(this)" />
                            </span></a>
                        </div>
                        
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <dl>
                            <dt><span><a style="color: Red">*</a>客户状态：<asp:DropDownList ID="Cus_Status" runat="server"
                                Height="22px" Width="150px">
                            </asp:DropDownList>
                            </span></dt>
                            <%=showEditStr%>
                            <dt><span><a style="color: Red">*</a>添加联系记录</span></dt>
                            <dd>
                                <input id="ContactRecords" type="text" runat="server" maxlength="500" value="" /></dd>
                            <dt><span><a style="color: Red">*</a>请选择下次联系时间：<input id="NextContactTime" type="text"
                                size="8" readonly="readonly" onclick="setday(this)" runat="server" />请选择下次联系时间，不要遗忘每个客户。</span></dt>
                            <dt><a class="btn"><span>
                                <asp:Button ID="btnOk" runat="server" Width="80px" Text="确定提交" OnClick="btnOk_Click">
                                </asp:Button></span></a>&nbsp; <a class="btn"><span>
                                    <asp:Button ID="btnClear" runat="server" Width="80px" Text="重新填写" OnClientClick="clearContactRecords(this)">
                                    </asp:Button></span></a> <span><a style="font-size: 12px; font-weight: normal;">
                                        <asp:Literal ID="lit_Info" runat="server"></asp:Literal></a></span>
                            </dt>
                            <%=showEditEnd%>
                            <dt></dt>
                        </dl>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div style="display: none">
            <input id="txt_cus_id" type="text" runat="server" />
            <input id="txt_s_id" type="text" runat="server" />
            <input id="txt_s_name" type="text" runat="server" />
            <input id="txt_lastContactTime" type="text" runat="server" />
            <input id="txt_lastnextContactTime" type="text" runat="server" />
            <input id="txt_ContactDetailID" type="text" runat="server" />
            <input id="txt_cus_status" type="text" runat="server" />
            <input id="hidCondition" type="hidden" runat="server" />
        </div>
        <div>
            <dl style=" font-size:20px; font-weight:bold; display:inline; height:30px;"><dt>查看联系记录</dt></dl>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div class="tool">
                        <a>开始时间:</a><span><input id="startTime" type="text" size="8" readonly="readonly" onclick="setday(this)" runat="server" /></span>
                        <a>结束时间:</a><span><input id="endTime" type="text" size="8" readonly="readonly" onclick="setday(this)" runat="server" /></span>
                        <a class="btn"><span><asp:Button ID="btnFind" runat="server" Text="查询" 
                            Width="40px" onclick="btnFind_Click" /></span></a>
                        <a class="btn"><span><asp:Button ID="btnSelClear" runat="server" Text="清空查条件" 
                            Width="80px" OnClientClick="clearSel(this)" /></span></a>
                        <a class="btn"><span><asp:Button ID="btnClientToHighSeas" runat="server" Text="把该客户丢入公海" 
                            Width="140px" Font-Bold="true" ForeColor="Red" 
                            onclick="btnClientToHighSeas_Click"/></span></a> 
                    </div>
                    <div class="tblist">
                        <table cellpadding="0" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <td style="width:80px;">维护人员</td>
                                    <td style="width:150px;">维护时间</td>
                                    <td>维护日志</td>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="repList" runat="server" OnItemDataBound="repList_ItemDataBound">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#((V_CRM_STAFF_CUSTOMER_CONTACTRECORDS)Container.DataItem).SNAME%></td>
                                            <td><%#((V_CRM_STAFF_CUSTOMER_CONTACTRECORDS)Container.DataItem).ContactTime%></td>
                                            <td><%#((V_CRM_STAFF_CUSTOMER_CONTACTRECORDS)Container.DataItem).ContactRecords%></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <div class="pages">
                        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged" ShowCustomInfoSection="Never">
                        </WebCtrl:AspNetPager>
                    </div>
                
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
