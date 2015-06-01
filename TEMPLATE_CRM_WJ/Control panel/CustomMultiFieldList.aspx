
<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="CustomMultiFieldList.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_CustomMultiFieldList" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<td class="detail-content-td">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
											<script language="JavaScript" type="text/javascript" src="include/js/customview.js"></script>
<script language="javascript">
    function getCustomFieldList(customField) {
        var modulename = customField.options[customField.options.selectedIndex].value;
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=CustomMultiFieldList&fld_module=' + modulename + '&parenttab=Settings&ajax=true',
		    onComplete: function (response) {
		        $("cfList").innerHTML = response.responseText;
		    }
		}
	);
    }


    function deleteMultiCustomField(multifieldid, fld_module, colName, uitype) {
        if (confirm(alert_arr.SURE_TO_DELETE)) {
            /document.form.action="index.aspx?module=Settings&action=DeleteMultiCustomField&multifieldid="+multifieldid+"&parenttab=Settings";
            /document.form.submit();
            window.location.href = "index.aspx?module=Settings&action=DeleteMultiCustomField&multifieldid=" + multifieldid + "&parenttab=Settings";
        }
    }

    function gotoEditCustomField(customField, id, tabid, ui) {
        window.location.href = "index.aspx?module=Settings&action=EditMultiCustomField&multifieldid=" + id + "&parenttab=Settings";
    }
    function getCreateCustomFieldForm(customField, id, tabid, ui) {
        var modulename = customField;
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=CreateMultiCustomField&fld_module=' + customField + '&parenttab=Settings&ajax=true&fieldid=' + id + '&tabid=' + tabid + '&uitype=' + ui,
		    onComplete: function (response) {
		        $("orgLayContent").innerHTML = response.responseText;
		        ShowLockDiv("orgLay");
		        gselected_fieldtype = '';
		    }
		}
	);

    }
    function makeFieldSelected(oField, fieldid) {
        if (gselected_fieldtype != '') {
            $(gselected_fieldtype).className = 'customMnu';
        }
        oField.className = 'customMnuSelected';
        gselected_fieldtype = oField.id;
        selFieldType(fieldid)
        document.getElementById('selectedfieldtype').value = fieldid;
    }
    function CustomFieldMapping() {
        document.form.action = "index.aspx?module=Settings&action=LeadCustomFieldMapping";
        document.form.submit();
    }
    var gselected_fieldtype = '';

    function theformvalidate() {
        var nummaxlength = 255;


        lengthLayer = getObj("lengthdetails")

        var str = getObj("fldLabel").value;
        if (!emptyCheck("fldLabel", '字段标签'))
            return false;
        return true;

    }


</script>
<div id="createcf" style="display:block;position:absolute;width:350px;"></div>


<div id="orgLay" class="windLayerDiv" style="display:none;width:300px; left:550px;top:200px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">
		&nbsp;&nbsp;新增级联字段</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('orgLay');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="orgLayContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("orgLay", 'windLayerHeading');
</script>
</div>

<br>
<!-- DISPLAY -->
<b><font color="red"> </font></b>

	<table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td rowspan="2" valign="top" width="50"><img src="admin_files/relatedfield.gif" alt="Users" title="Users" border="0" height="48" width="48"></td>
		<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 级联字段</b></td>
	</tr>

	<tr>
		<td class="small" valign="top">- 创建和管理级联字段。</td>
	</tr>
	</tbody></table>
	
	<table border="0" cellpadding="10" cellspacing="0" width="100%">
	<tbody><tr>
	<td>

	
	<div id="cfList">
					
 <table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td class="small" align="left">
			<b>选择模块:</b>
			<select name="pick_module" onchange="getCustomFieldList(this)">
																								<option value="Accounts" selected="">客户</option>
																									<option value="Contacts">联系人</option>
																									<option value="Potentials">销售机会</option>
																									<option value="Notes">联系记录</option>
																									<option value="HelpDesk">报修单</option>
																									<option value="Products">产品</option>
																									<option value="Faq">常见问题</option>
																									<option value="Events">日程安排</option>
																									<option value="Vendors">供应商</option>
																									<option value="PriceBooks">价目表</option>
																									<option value="Quotes">报价单</option>
																									<option value="PurchaseOrder">进货单</option>
																									<option value="SalesOrder">合同订单</option>
																									<option value="Invoice">发货单</option>
																									<option value="Campaigns">营销活动</option>
																									<option value="Gathers">应收款</option>
																									<option value="Charges">应付款</option>
																									<option value="Expenses">费用报销</option>
																									<option value="Documents">文档中心</option>
																									<option value="Cares">客户关怀</option>
																									<option value="Checks">盘点</option>
																									<option value="Deliverys">出库单</option>
																									<option value="Warehouses">入库单</option>
																									<option value="Vcontacts">供应商联系人</option>
																									<option value="Tuihuos">销售退货单</option>
																									<option value="Vnotes">供应商联系记录</option>
																									<option value="Billings">发票管理</option>
																									<option value="Duishous">竞争对手</option>
																									<option value="Warehousetransfers">库间调拨</option>
																									<option value="Complaints">客户投诉</option>
																									<option value="Accountrecordss">客户服务</option>
																									<option value="Noteplans">客户任务计划</option>
																									<option value="Chargesrecords">付款单</option>
																									<option value="Gathersrecords">收款单</option>
																									<option value="Openingbalancess">期初余额</option>
																									<option value="Memdays">纪念日</option>
																									<option value="Maillisttmps">邮件模板</option>
																									<option value="Qunfatmps">短信模板</option>
																									<option value="Packorders">装配出入库单</option>
							</select>
			<strong>级联字段</strong>
		</td>
		<td class="small" align="right">&nbsp;&nbsp;
			<button class="pure-button pure-button-success" title="新增级联字段" onclick="getCreateCustomFieldForm('Accounts','','','');return false;">
				<i class="icon-plus"></i> 新增级联字段
			</button>
		</td>
	</tr></tbody>
	</table>
				<form action="index.aspx" method="post" name="form">
				<input type="hidden" name="fld_module" value="Accounts">
				<input type="hidden" name="module" value="Settings">
				<input type="hidden" name="parenttab" value="Settings">
				<input type="hidden" name="mode">

				<table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
					<tbody><tr height="28px" class="windLayerHead">
                      	<td width="3%">#</td>
                      	<td>字段标签</td>
                      	<td>级联字段数</td>
                     	<td>工具</td>
					</tr>
																		<tr>
																			<td nowrap="">1&nbsp;</td>
													<td nowrap="">收货国省市&nbsp;</td>
													<td nowrap="">3&nbsp;</td>
													<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="gotoEditCustomField('Accounts','1','6','')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteMultiCustomField(1,'Accounts', '', '');">
							</i>&nbsp;</td>
											</tr>
																		<tr class="crm-table-plural">
																			<td nowrap="">2&nbsp;</td>
													<td nowrap="">付款国省市&nbsp;</td>
													<td nowrap="">3&nbsp;</td>
													<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="gotoEditCustomField('Accounts','2','6','')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteMultiCustomField(2,'Accounts', '', '');">
							</i>&nbsp;</td>
											</tr>
							</tbody></table>
		</form>
		<br>
			</div>	
<table border="0" cellpadding="5" cellspacing="0" width="100%">
<tbody><tr>

<td class="small" align="right" nowrap="nowrap"><a href="#top">[上]</a></td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>
<!-- End of Display -->

</div></td>
</tr>
</tbody></table>
</td>
</asp:Content>