<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true"  CodeFile="CustomModEntityNo.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_CustomModEntityNo" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<td class="detail-content-td">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
											<script language="JavaScript" type="text/javascript" src="include/js/customview.js"></script>
<script language="javascript" type="text/javascript" src="include/ajaxtabs/ajaxtabs.js"></script>
<link rel="stylesheet" type="text/css" href="include/ajaxtabs/ajaxtabs.css">
<script language="javascript">
    var lbl_start_sequence_check = "起始序号不能为空!";
    var lbl_start_sequence_number = "起始序号必须是数字.";
    var lbl_curr_sequence_check = "当前序号不能为空!";
    var lbl_curr_sequence_number = "当前序号必须是数字.";

    /切换模块
    function getFieldRulesList(customField) {
        var modulename = customField.options[customField.options.selectedIndex].value;
        new Ajax.Request(
		'index.aspx',
		{ queue: { lposition: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=CustomModEntityNo&' +
							'fld_module=' + modulename + '&parenttab=Settings&ajax=true',
		    onComplete: function (response) {
		        $("cfList").innerHTML = response.responseText;
		    }
		}
	);
    }
    function SaveModEntityNum_click() {
        var pick_module = document.getElementById("pick_module");
        var modulename = pick_module.value;
        var inputs = document.form;
        /	if(inputs["start_id"].value == '') {
        /		alert(lbl_start_sequence_check);
        /		return;
        /	}
        /	if(inputs["start_id"].value.match(/[^0-9]+/) != null) {
        /		alert(lbl_start_sequence_number);
        /		return;
        /	}
        if (inputs["cur_id"].value == '') {
            alert(lbl_curr_sequence_check);
            return;
        }
        if (inputs["cur_id"].value.match(/[^0-9]+/) != null) {
            alert(lbl_curr_sequence_number);
            return;
        }
        if (inputs["issubmit"].value == "1") {
            inputs["issubmit"].value = "2";
            inputs.submit();
        }
    }

</script>
<div id="createcf" style="display:block;position:absolute;width:500px;"></div>
<br>
<!-- DISPLAY -->
<b><font color="red"> </font></b>

	<table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td rowspan="2" valign="top" width="50"><img src="admin_files/settingsInvNumber.gif" alt="Users" title="Users" border="0" height="48" width="48"></td>
		<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 自定义记录编号</b></td>
	</tr>

	<tr>
		<td class="small" valign="top">模块编号定制</td>
	</tr>
	</tbody></table>
	
	<table border="0" cellpadding="10" cellspacing="0" width="100%">
	<tbody><tr>
	<td>
	<table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td class="small" align="left">
			<b>选择模块:</b>&nbsp;
			<select id="pick_module" name="pick_module" onchange="getFieldRulesList(this)">
																								<option value="Accounts" selected="">客户</option>
																									<option value="Products">产品</option>
																									<option value="SalesOrder">合同订单</option>
																									<option value="Quotes">报价单</option>
																									<option value="Invoice">发货单</option>
																									<option value="Deliverys">出库单</option>
																									<option value="PurchaseOrder">进货单</option>
																									<option value="Warehouses">入库单</option>
																									<option value="Gathers">应收款</option>
																									<option value="Gathersrecords">收款单</option>
																									<option value="Charges">应付款</option>
																									<option value="Chargesrecords">付款单</option>
																									<option value="Openingbalancess">期初余额</option>
																									<option value="Expenses">费用报销</option>
																									<option value="Vendors">供应商</option>
																									<option value="Tuihuos">销售退货单</option>
							</select>
		</td>
		<td class="small" align="right">&nbsp;</td>
		</tr>
	</tbody>
	</table>

	<div id="cfList">
		<form action="index.aspx" method="post" name="form">
<input type="hidden" name="fld_module" value="Accounts">
<input type="hidden" name="module" value="Settings">
<input type="hidden" name="action" value="CustomModEntityNo">
<input type="hidden" name="savesetype" value="modentitynum">
<input type="hidden" name="issubmit" value="1">
<input type="hidden" name="parenttab" value="Settings">
<input type="hidden" name="num_id" value="1">
<table class="listTable" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td class="detail-content-label" width="15%">使用前缀</td>
		<td class="dvtCellInfo" align="left">
			<input name="prefix" id="prefix" value="AC" style="padding-left:1px;width:100px;" class="detailedViewTextBox">
		</td>
	</tr>
	<!-- <tr>
		<td class="detail-content-label">起始序号</td>
		<td class="dvtCellInfo" align="left">
			<input name="start_id" id="start_id" value="1" 
			style="padding-left:1px;width:100px;" class="detailedViewTextBox" 
			 >
		</td>
	</tr> -->
	<tr>
		<td class="detail-content-label">当前序号</td>
		<td class="dvtCellInfo" align="left">
			<!-- 			&nbsp;&nbsp;&nbsp;&nbsp; -->
			<input name="cur_id" id="cur_id" value="67" style="padding-left:1px;width:100px;" class="detailedViewTextBox">	
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button class="pure-button pure-button-success" title="保存" onclick="SaveModEntityNum_click();return false;">
				<i class="icon-ok"></i> 保存
			</button>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="pure-button pure-button-cancel" title="取消 [Alt+X]" onclick="location.href='index.aspx?module=Settings&amp;action=ListView&amp;parenttab=Settings';return false;">
				<i class="icon-reply"></i> 取消 
			</button>&nbsp;
		</td>
	  </tr>
</tbody></table>
</form>
<br>
	</div>
</td>
</tr>
</tbody></table>
<!-- End of Display -->

</div></td>
</tr>
</tbody></table>
<</td>
</asp:Content>
