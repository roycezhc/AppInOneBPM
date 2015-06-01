<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_DEPT_MoveTo2" Title="系统导航信息" CodeFile="MoveManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Register src="../../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {

        var checker = new formChecker({ btnIDS: 'btnOK,_btnOK' });
    });

    function selNames(me) {
        var txt1 = $("input[id$='txtSNAME']");
        var txt2 = $("input[id$='txtRNAME']");
        if (txt1.val() == "") {
            txt1.val(me.value);
        }
        if (txt2.val() == "") {
            txt2.val(me.value);
        }
    }
</script>
<style type="text/css">
.form dl dd input{width:300px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div class="main" style=" vertical-align:middle;">
<div class="titnav">
  <dl><dt><b><%=title%></b></dt>
  <dd></dd></dl>

</div>
<div class="tool">
<ul>
<li><span class="btn"><asp:Button ID="btnOK" runat="server" Text="保存" onclick="btnOK_Click" Width="60" /></span></li>
</ul>

</div>
    <div class="form" id="listform">
    <div>
        <dl>
            <dt>部门名称：</dt>
            <dd><span><input id="txtDeptName" onblur="selNames(this);" type="text" readonly="readonly" runat="server" ck="{need:1,len:240,dtype:0}"/></span></dd>
            
        </dl>
           <dl>
               <dt>转移到以下部门：</dt><%--所属父部门标识--%>
               <dd>
               <uc1:wucSelDept ID="wucSelDept1" runat="server" />
               </dd>
           </dl>
    </div>
    <div class="clear"></div>
  </div>

 </div>
</asp:Content>


