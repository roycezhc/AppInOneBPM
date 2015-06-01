<%@ Page Language="C#" Title="客户公海" AutoEventWireup="true" 
MasterPageFile="~/Themes/Main/Base.master" Inherits="CRM_AddNewCust" CodeFile="AddNewCust.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %><%@ Import Namespace="AgileFrame.Core" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script type="text/javascript" src="../Lib/JQuery/jquery.divbox.js"></script>
<script src="JS/ShowMessage.js" type="text/javascript"></script>
<script src="JS/detail.js" type="text/javascript"></script>
<script src="../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var checker = new formChecker({ formID: "divForm", btnIDS: 'btnSubAndCon' });

    });

    //这里自定义验证脚本
    function myCheck() {
        var val1 = $("input[id$='txt_addMobPhone']")[0].value;
        var val2 = $("input[id$='txt_addPhone']")[0].value;
        var val3 = $("input[id$='txt_addQQ']")[0].value;
        var val4 = $("input[id$='txt_addEmail']")[0].value;
        if (val1 == "" && val2 == "" && val3 == "" && val4 == "") {
            alert("至少填写一项联系方式：手机，电话，QQ，邮箱");
            return false;
        }
        return true;//必须写--chx
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
   <%-- <asp:ScriptManager ID="smDetail" runat="server">
    </asp:ScriptManager>--%>
    <div class="main">
        <div class="titnav">
           <dl>
                <dt><b>客户信息编辑</b></dt><dd></dd></dl>
        </div>
            <div class="form" id="divForm">
                <dl class="f-tit"><dt><em onclick="openMore(this);" class="opened"></em><a>基本信息</a></dt><dd><a></a></dd></dl>
                <div>
                <dl>
                    <dt>主旺旺ID：</dt><dd><input id="txt_addWangWangId" runat="server" type="text" ck="{type:0,min:3,max:50,need:1}" /></dd></dl>
                <dl>
                    <dt>网店名称：</dt><dd><input id="txt_addShopName" runat="server" type="text"   ck="{type:0,min:3,max:100,need:1}" /></dd><dd><a class="btn"><span><asp:Button ID="btnAddShop" runat="server" Text="添加" Width="40px" OnClick="btnAddShop_Click"/></span></a></dd></dl>
                <dl>
                    <dt>网店地址：</dt><dd><input id="txt_addShopUrl" runat="server" type="text"  ck="{type:0,min:4,max:100,need:1}" /></dd></dl>
                <dl>
                    <dt>顾客姓名：</dt><dd><input id="txt_addCustName" runat="server" type="text"   ck="{type:0,min:1,max:50,need:1}" /></dd></dl>
                <dl>
                    <dt>顾客性别：</dt><dd><input id="txt_addCustSexMan" runat="server" type="radio" value="checked" style=" width:20px; height:20px;border:0px;"/>男<input id="txt_addCustSexWoman" runat="server" type="radio" style=" width:20px; height:20px; border:0px;"/>女</dd></dl>
                <dl>
                    <dt>联系方式：</dt><dt>(必填一项)</dt></dl>
                <dl>
                    <dt>手机号码：</dt><dd><input id="txt_addMobPhone" runat="server" type="text"  ck="{type:6,need:0}" /></dd></dl>
                <dl>
                    <dt>电话号码：</dt><dd><input id="txt_addPhone" runat="server" type="text"   ck="{type:5,need:0}" /></dd></dl>
                <dl>
                    <dt>QQ号码：</dt><dd><input id="txt_addQQ" runat="server" type="text"  ck="{type:2,min:5,max:15,len:12,need:0}" /></dd></dl>
                <dl>
                    <dt>电子邮箱：</dt><dd><input id="txt_addEmail" runat="server" type="text"  ck="{type:4,min:6,max:50,need:0}" /></dd>
                </dl>
                </div>
                <dl class="f-tit"><dt><em onclick="openMore(this);"></em><a>选填信息</a></dt><dd></dd></dl>
                <div class="hide">
                    <dl><dt>公司名称：</dt><dd><input id="txt_addComName" runat="server" type="text" /></dd><dd id="dd_ComName" runat="server"></dd></dl>
                    <dl><dt>公司地址：</dt><dd><input id="txt_addComAddress" runat="server" type="text" /></dd></dl>
                    <dl><dt>客户状态：</dt><dd><asp:DropDownList ID="ddl_CusStatus" runat="server"></asp:DropDownList></dd></dl>
                    <dl><dt>联系记录：</dt><dd><input id="txt_addConDailts" runat="server" type="text" /></dd></dl>
                </div>
               <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                <ContentTemplate>--%>
                <dl class="f-btn" style="text-align:center;"><dt></dt>
                    <dd><a class="btn"><span><asp:Button ID="btnSubAndCon" runat="server" Text="提交" onclick="btnSub_Click" /></span></a>
                 <%--    OnClientClick="showMsg('提交成功！','addNewCust')"--%>
                    <a class="btn"><span><input id="btnReset" type="reset" value="重置" /></span></a> 
                    <asp:Literal ID="lit_AddInfo" runat="server" Visible="false"></asp:Literal></dd>
                </dl>
<%--                </ContentTemplate>
            </asp:UpdatePanel>--%>
            </div>
            <input id="hid_ShopCount" runat="server" type="hidden" value="1"/>
            <input id="hid_SID" runat="server" type="hidden" value=""/>
    </div>
</asp:Content>