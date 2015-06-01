<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true"  CodeFile="FieldRules.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_FieldRules" %>
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
    var lbl_fldcas_del_title = "删除之后规则将无法恢复，请确定，是否删除？";

    /切换模块
    function getFieldRulesList(customField) {
        var modulename = customField.options[customField.options.selectedIndex].value;
        var fieldviewHid = document.getElementById("fieldviewHid").value;
        new Ajax.Request(
		'index.aspx',
		{ queue: { lposition: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=FieldRules&' +
							'fld_module=' + modulename + '&parenttab=Settings&' +
								'fieldview=' + fieldviewHid + '&ajax=true',
		    onComplete: function (response) {
		        $("cfList").innerHTML = response.responseText;
		    }
		}
	);
    }
    /切换标签
    function setFieldRulesType(setype, tabel) {
        if ($(tabel).hasClassName('selected')) return;
        var classmethods = $$('a.tablink');
        for (var i = 0; i < classmethods.length; i++) {
            classmethods[i].removeClassName('selected');
        }
        $(tabel).addClassName('selected');
        var modulename = document.getElementById("pick_module").value;
        document.getElementById("fieldviewHid").value = setype;
        new Ajax.Request(
		'index.aspx',
		{ queue: { lposition: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=FieldRules&' +
							'fld_module=' + modulename + '&parenttab=Settings&' +
								'fieldview=' + setype + '&ajax=true',
		    onComplete: function (response) {
		        $("cfList").innerHTML = response.responseText;
		    }
		}
	);
    }
    /add Field Rule
    function addFieldRules_click() {
        var modulename = document.getElementById("pick_module").value;
        var fieldviewHid = document.getElementById("fieldviewHid").value;
        var urlstring = "&modulename=" + modulename + "&fieldview=" + fieldviewHid + "&setype=create";
        document.location.href = 'index.aspx?module=Settings&action=FieldRulesEditView' + urlstring;
    }
    /Edit Field Mapping 编辑字段映射
    function EditFldMapping(modname, fldview, fldmappingid) {
        var urlstring = "&modulename=" + modname + "&fieldview=" + fldview + "&setype=edit&fldmappingid=" + fldmappingid + "";
        document.location.href = 'index.aspx?module=Settings&action=FieldRulesEditView' + urlstring;
    }
    /Delete Field Mapping 删除字段映射
    function DelFldMapping(modname, fldview, fldmappingid) {
        if (confirm(lbl_fldcas_del_title)) {
            var urlstring = "&modulename=" + modname + "&fieldview=" + fldview + "&setype=del&fldmappingid=" + fldmappingid + "";
            document.location.href = 'index.aspx?module=Settings&action=FieldRulesEditView' + urlstring;
        }
    }
    /编辑字段联动
    function EditFldCascade(modname, fldview, fldmappingid) {
        var relyonfld = document.getElementById("relyonfld" + fldmappingid).value;
        var controlfld = document.getElementById("controlfld" + fldmappingid).value;
        var urlstring = "&fieldmodule=" + modname + "&fieldfieldview=" + fldview + "&setype=edit&fldmappingid=" + fldmappingid + "";
        urlstring += "&relyonfld=" + relyonfld + "&controlfld=" + controlfld + "";
        document.location.href = 'index.aspx?module=Settings&action=FieldCascadeEditView' + urlstring;
    }
    /Delete Field Mapping 删除字段映射
    function DelFldCascade(modname, fldview, fldmappingid) {
        if (confirm(lbl_fldcas_del_title)) {
            var urlstring = "&fieldmodule=" + modname + "&fieldfieldview=" + fldview + "&setype=del&fldmappingid=" + fldmappingid + "";
            document.location.href = 'index.aspx?module=Settings&action=FieldCascadeEditView' + urlstring;
        }
    }

</script>
<div id="createcf" style="display:block;position:absolute;width:500px;"></div>
<br>
<!-- DISPLAY -->
<b><font color="red"> </font></b>

	<table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td rowspan="2" valign="top" width="50"><img src="admin_files/fieldrules.gif" alt="Users" title="Users" border="0" height="48" width="48"></td>
		<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 字段规则</b></td>
	</tr>

	<tr>
		<td class="small" valign="top">自定义字段间的规则</td>
	</tr>
	</tbody></table>
	
	<table border="0" cellpadding="10" cellspacing="0" width="100%">
	<tbody><tr>
	<td>

	<div>
		<ul id="countrytabs" class="shadetabs">
																			<li><a href="javascript:;" onclick="setFieldRulesType('FieldMapping',this);" style="font-family: 宋体;font-size: 14px;" class="tablink selected">字段传递</a></li>
															<li><a href="javascript:;" onclick="setFieldRulesType('FieldCascade',this);" style="font-family: 宋体;font-size: 14px;" class="tablink ">字段联动</a></li>
				</ul>
		<input type="hidden" id="fieldviewHid" value="FieldMapping">
	</div>
	<table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td class="small" align="left">
			<b>选择模块:</b>&nbsp;&nbsp;
			<select id="pick_module" name="pick_module" style="width:150px;" onchange="getFieldRulesList(this)">
																								<option value="Accounts" selected="">客户</option>
																									<option value="Contacts">联系人</option>
																									<option value="Potentials">销售机会</option>
																									<option value="Notes">联系记录</option>
																									<option value="HelpDesk">报修单</option>
																									<option value="Products">产品</option>
																									<option value="Events">日程安排</option>
																									<option value="Vendors">供应商</option>
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
			<strong>字段规则</strong>
		</td>
		<td class="small" align="right">
			<button class="pure-button pure-button-success" title="增加" onclick="addFieldRules_click();return false;">
				<i class="icon-plus"></i> 增加
			</button>
		</td>
		</tr>
	</tbody>
	</table>

	<div id="cfList">
		<form action="index.aspx" method="post" name="form">
	<input type="hidden" name="fld_module" value="Accounts">
	<input type="hidden" name="module" value="Settings">
	<input type="hidden" name="parenttab" value="Settings">
	<input type="hidden" name="mode">
	<table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
		<tbody><tr height="28px" class="windLayerHead">
			<td width="3%" align="center" nowrap="">序号</td><td nowrap="">接收传递模块&nbsp;</td><td nowrap="">接收传递字段&nbsp;</td><td nowrap="">传递模块&nbsp;</td><td nowrap="">传递字段&nbsp;</td><td nowrap="">操作人&nbsp;</td><td nowrap="">操作日期&nbsp;</td><td nowrap="">工具&nbsp;</td></tr><tr bgcolor="white" style="height: 25px;" class="lvtColData" onmouseover="this.className='lvtColDataHover'" onmouseout="this.className='lvtColData'">
			<td class="listTableRow small" nowrap="" valign="top" align="center" colspan="8">No Data</td></tr>
	</tbody></table>
</form>
		<br>
			<table cellspacing="0" cellpadding="5" width="100%" class="crmTable small" style="border-top: 2px dotted rgb(204, 204, 204);">
		<tbody><tr>
			<td valign="top" nowrap="">
				提示：
				<ul class="small">
					<li>已经添加字段联动规则的字段不可以成为字段传递规则的接受传递字段。</li>
					<li>创建一个字段传递，该字段传递规则在用户从另一个模块创建到当前模块，<br>
						或者在当前模块选择另一个模块时，可以将另一个模块的字段值按照字段传递规则传递到当前模块中。</li>
					<li>从【客户】中创建【合同订单】，或者在【合同订单】中选择【客户】时，<br>
						想要把【客户】的『备注』信息传递到【合同订单】中的『描述』中来，那<br>
						么【合同订单】、『描述』就是接受传递模块和接受传递字段，【客户】和<br>
						『备注』就是传递模块和传递字段。</li>
					<li>传递字段与接受传递字段的类型应该是一致的，例如时间字段就只能对应时间字段。</li>
					<li>下拉框项之间，接受传递的下拉框字段必须有传递字段的字段值。</li>
					<li>字段传递规则不可以重复。</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="small" align="right" nowrap="nowrap"><a href="#top">[上]</a></td>
		</tr>
	</tbody></table>
	</div>
</td>
</tr>
</tbody></table>
<!-- End of Display -->
</div></td>
</tr>
</tbody></table>
</td>
</asp:Content>