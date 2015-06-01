<%@ Page Title="客户详细信息" Language="C#" AutoEventWireup="true"
    MasterPageFile="~/Themes/Main/Base.master" Inherits="CRM_CustomerDetails" CodeFile="CustomerDetails.aspx.cs" %>

<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Lib/MyDP-AD/seldate.js" type="text/javascript"></script>
    <script src="JS/detail.js" type="text/javascript"></script>
    <script type="text/javascript">
        function editInfoTable(me) {
            var divs = $(me).parent().parent().next().children();
            $(divs[0]).hide();
            $(divs[1]).show();
            
            $(me).next().show();
            $(me).next().next().show();
            $(me).hide();
        }
        function editCanel(me) {
            var divs = $(me).parent().parent().next().children();
            $(divs[1]).hide();
            $(divs[0]).show();

            $(me).prev().hide();
            $(me).prev().prev().show();
            $(me).hide();
        }
        function clearContactRecords(me) {
            $("#<%=ContactRecords.ClientID%>").val("");
        }
        function clearSel(me) {
            $(me).parent().parent().parent().find("input").val("");
        }
        function setSizeBig(me) {
            var src1 = document.getElementById("startedit");
            src1.width = "18";
            src1.height = "18";
        }
        function setSizeSma(me) {
            var src1 = document.getElementById("startedit");
            src1.width = "12";
            src1.height = "12";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <asp:ScriptManager ID="smDetail" runat="server">
    </asp:ScriptManager>
    <div class="main">
        <div class="titnav">
        <dl><dt><b>客户详细信息</b></dt></dl>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
            <div class="form">
                <dl class="f-tit">
                    <dt><em onclick="openMore(this);" class='opened'></em><a>基本信息</a></dt>
                    <dd><input id="btn_EditBase" type="button" value="编辑" class="btn" title="点击启用编辑" onclick="editInfoTable(this);" />
                        <asp:Button ID="btnCusDetailUpDown" runat="server" CssClass="hide" Width="80px" Text="确定提交" OnClick="btnCusDetailUpDown_Click"
                                OnClientClick="editCanel(this)" />
                        <asp:Button ID="btnCusDetailChangeCanel" runat="server" CssClass="hide" Width="80px" Text="取消修改"
                                        OnClientClick="editCanel(this)" />
                    </dd>
                </dl>
                <div>
                <div>
                    <dl>
                        <dt>公司名称:</dt><dd><asp:Literal ID="lit_CompanyName" runat="server" Text=""></asp:Literal></dd>
                        <dt>网店名称:</dt><dd><asp:Literal ID="lit_ShopName" runat="server" Text=""></asp:Literal></dd>
                        <dt>网店地址:</dt><dd><asp:Literal ID="lit_ShopNameURL" runat="server" Text=""></asp:Literal></dd>
                    </dl>
                    <dl>
                        <dt>客户姓名:</dt><dd><asp:Literal ID="lit_Cus_Name" runat="server" Text=""></asp:Literal></dd>
                        <dt>电话号码:</dt><dd><asp:Literal ID="lit_Phone" runat="server" Text=""></asp:Literal></dd>
                        <dt>QQ号码:</dt><dd><asp:Literal ID="lit_CustQQ" runat="server" Text=""></asp:Literal></dd>
                    </dl>
                    <dl>
                        <dt>邮箱地址:</dt><dd><asp:Literal ID="lit_Email" runat="server" Text=""></asp:Literal></dd>
                        <dt>公司地址:</dt><dd><asp:Literal ID="lit_CompanyAddress" runat="server" Text=""></asp:Literal></dd>
                        <dt>旺旺ID:</dt><dd><asp:Literal ID="lit_WangWangId" runat="server" Text=""></asp:Literal></dd>
                    </dl>
                </div>
                <div style="display: none;">
                    <dl>
                        <dt>公司名称:</dt><dd><input size="10" id="page_CompanyName" type="text" runat="server" value="" /></dd>
                        <dt>网店名称:</dt><dd><input size="10"  id="page_ShopName" type="text" runat="server" value="" /></dd>
                        <dt>网店地址:</dt><dd><input size="10"  id="page_ShopNameURL" type="text" runat="server" value="" /></dd>
                    </dl>
                    <dl>
                        <dt>客户姓名:</dt><dd><input size="10"  id="page_Cus_Name" type="text" runat="server" value="" /></dd>
                        <dt>电话号码:</dt><dd><input size="10"  id="page_Phone" type="text" runat="server" value="" /></dd>
                        <dt>QQ号码:</dt><dd><input size="10"  id="page_CustQQ" type="text" runat="server" value="" /></dd>
                    </dl>
                    <dl>
                        <dt>邮箱地址:</dt><dd><input size="10"  id="page_Email" type="text" runat="server" value="" /></dd>
                        <dt>公司地址:</dt><dd><input size="10"  id="page_CompanyAddress" type="text" runat="server" value="" /></dd>
                        <dt>旺旺ID:</dt><dd><input size="10"  id="page_WangWangId" type="text" runat="server" value="" /></dd>
                    </dl>
                </div>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <div class="form"  id="addCustConnDailt" runat="server">
                    <dl class="f-tit">
                        <dt><em onclick="openMore(this);" class='opened'></em><a>客户联系记录</a></dt>
                    </dl>
                   <div>
                    <dl>
                        <dt>客户状态：</dt><dd style="width: 200px;"><asp:DropDownList ID="Cus_Status" runat="server" Width="150px">
                        </asp:DropDownList>
                            <a style="color: Red">*</a></dd>
                    </dl>
                    <dl>
                        <dt>联系记录：</dt>
                        <dd style="width: 500px; height: 100px;">
                            <textarea  rows="7" cols="8" id="ContactRecords" runat="server" wrap="virtual"></textarea><a
                                style="color: Red">*</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>下次联系时间：</dt><dd style="width: 500px;"><input id="NextContactTime" type="text"
                            size="8" readonly="readonly" onclick="setday(this)" runat="server" /><a style="color: Red">*</a>请选择下次联系时间，不要遗忘每个客户。</dd>
                    </dl>
                    <dl>
                        <dt><a class="btn"><span>
                            <asp:Button ID="btnOk" runat="server" Width="80px" Text="确定提交" OnClick="btnOk_Click">
                            </asp:Button></span></a></dt>
                        <dt></dt>
                        <dt><a class="btn"><span>
                            <asp:Button ID="btnClear" runat="server" Width="80px" Text="重新填写" OnClientClick="clearContactRecords(this)">
                            </asp:Button></span></a></dt>
                        <dd style="width: 300px;"><span><a style="font-size: 12px; font-weight: normal;">
                            <asp:Literal ID="lit_Info" runat="server"></asp:Literal></a></span></dd>
                    </dl>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

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
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <div class="form">
                    <dl class="f-tit">
                        <dt><em class="opened"></em><a>查看联系记录</a></dt></dl>
                    <dl>
                        <dt style="width: 60px;">开始时间:</dt><dd><span><input id="startTime"
                            type="text"  readonly="readonly" onclick="setday(this)" runat="server" /></span></dd>
                        <dt style="width: 60px;">结束时间:</dt><dd><span><input id="endTime"
                            type="text" readonly="readonly" onclick="setday(this)" runat="server" /></span></dd>
                        <dd style="width: 150px;">
                            <a class="btn"><span>
                                <asp:Button ID="btnFind" runat="server" Text="查询" Width="40px" OnClick="btnFind_Click" /></span></a>
                            <a class="btn"><span>
                                <asp:Button ID="btnSelClear" runat="server" Text="清空查条件" Width="80px" OnClientClick="clearSel(this)" /></span></a>
                        </dd>
                        <dd style="border: border:solid 0px #789;">
                            <a class="btn"><span>
                                <asp:Button ID="btnClientToHighSeas" runat="server" Text="把该客户丢入公海" Width="140px"
                                    Font-Bold="true" ForeColor="Red" OnClick="btnClientToHighSeas_Click" /></span></a></dd>
                    </dl>
                </div>
                <div class="tblist">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <thead>
                            <tr>
                                <td style="width: 80px;">维护人员</td>
                                <td style="width: 150px;">维护时间</td>
                                <td style="width: 150px;">维护后客户状态</td>
                                <td>维护日志</td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="repList" runat="server" OnItemDataBound="repList_ItemDataBound">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#((V_CRM_STAFF_CUSTOMER_CONTACTRECORDS)Container.DataItem).SNAME%>
                                        </td>
                                        <td><%#((V_CRM_STAFF_CUSTOMER_CONTACTRECORDS)Container.DataItem).ContactTime%>
                                        </td>
                                        <td><%#((V_CRM_STAFF_CUSTOMER_CONTACTRECORDS)Container.DataItem).CustStatus == 0 ? "未知" : Cus_Status.Items[((V_CRM_STAFF_CUSTOMER_CONTACTRECORDS)Container.DataItem).CustStatus].Text%>
                                        </td>
                                        <td><%#((V_CRM_STAFF_CUSTOMER_CONTACTRECORDS)Container.DataItem).ContactRecords%>
                                        </td>
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
</asp:Content>
