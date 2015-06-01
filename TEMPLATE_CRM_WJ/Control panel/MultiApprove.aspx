<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="MultiApprove.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_MultiApprove" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<td class="detail-content-td">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
											<script language="JavaScript" type="text/javascript" src="include/js/customview.js"></script>
<script language="javascript">
    function getCustomBlockList(customField) {
        var modulename = customField.options[customField.options.selectedIndex].value;
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=MultiApprove&fld_module=' + modulename + '&parenttab=Settings&ajax=true',
		    onComplete: function (response) {
		        $("cfList").innerHTML = response.responseText;
		    }
		}
	);
    }


    function deleteCustomBlock(blockid, fld_module) {
        if (confirm(alert_arr.SURE_TO_DELETE)) {
            new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=ApproveDelete&record=' + blockid,
		    onComplete: function (response) {
		        if (response.responseText == "SUCCESS") {
		            getCustomBlockList($("pick_module"));
		        } else if (response.responseText == "USED") {
		            alert("该流程正在被使用，无法删除");
		        }
		    }
		});

            /            document.form.action="index.aspx?module=Settings&action=DeleteCustomBlock&fld_module="+fld_module+"&blockid="+blockid;
            /            document.form.submit();
        }
    }

    function getCreateCustomBlockForm(customModule, blockid, tabid, label, order) {
        var modulename = customModule;
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=ApproveDelete&delete=false&record=' + blockid,
		    onComplete: function (response) {
		        if (response.responseText == "SUCCESS") {
		            document.location.href = "index.aspx?module=Settings&action=EditMultiApprove&mode=edit&parenttab=Settings&record=" + blockid + "&fld_module=" + customModule;
		        } else if (response.responseText == "USED") {
		            if (confirm("该流程正在被使用，是否继续？")) {
		                document.location.href = "index.aspx?module=Settings&action=EditMultiApprove&mode=edit&parenttab=Settings&record=" + blockid + "&fld_module=" + customModule;
		            }
		        }
		    }
		});



    }

    function getCreateCustomBlockForm1(customModule, blockid, tabid, label, order) {
        var modulename = customModule;
        document.location.href = "index.aspx?module=Settings&parenttab=Settings&action=EditMultiApprove&record=" + blockid + "&fld_module=" + customModule;


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
    var gselected_fieldtype = '';
    function validate_block() {
        if (document.addtodb.label.value == "") {
            alert(alert_arr.BLOCK_LABEL_IS_NULL);
            document.addtodb.label.focus();
            return false;
        }
        if (document.addtodb.order.value == "") {
            alert(alert_arr.DISPLAY_ORDER_IS_NULL);
            document.addtodb.order.focus();
            return false;
        } else {
            if (isNaN(trim(document.addtodb.order.value))) {
                alert(alert_arr.LBL_ENTER_VALID_NO);
                document.addtodb.order.focus();
                return false;
            }
        }
        return true;
    }

</script>
<br>
<!-- DISPLAY -->
<b><font color="red"> </font></b>

	<table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td rowspan="2" valign="top" width="50"><img src="admin_files/approvelist.gif" alt="Users" title="Users" border="0" height="48" width="48"></td>
		<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 审批流程</b></td>
	</tr>

	<tr>
		<td class="small" valign="top"></td>
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
			<select id="pick_module" name="pick_module" onchange="getCustomBlockList(this)">
																									<option value="Quotes">报价单</option>
																									<option value="PurchaseOrder">进货单</option>
																								<option value="SalesOrder" selected="">合同订单</option>
																									<option value="Invoice">发货单</option>
																									<option value="Expenses">费用报销</option>
																									<option value="Deliverys">出库单</option>
																									<option value="Tuihuos">销售退货单</option>
																									<option value="Warehousetransfers">库间调拨</option>
																									<option value="Packorders">装配出入库单</option>
							</select>
			<strong>审批流程</strong>
		</td>
		<td class="small" align="right">&nbsp;&nbsp;
			<button class="pure-button pure-button-success" title="新增审批流程" onclick="getCreateCustomBlockForm1('SalesOrder','','','','');return false;">
				<i class="icon-plus"></i> 新增审批流程
			</button>
		</td></tr>
		
	</tbody>
	</table>






				<form action="index.aspx" method="post" name="form">
				<input type="hidden" name="fld_module" value="SalesOrder">
				<input type="hidden" name="module" value="Settings">
				<input type="hidden" name="parenttab" value="Settings">
				<input type="hidden" name="mode">
				<table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
					<tbody><tr height="28px" class="windLayerHead">
						<td width="3%">#</td>
						<td>流程名称</td>
						<td>是否激活</td>
						<td>工具</td>
					</tr>

																		<tr>
																			<td valign="top" nowrap="">1&nbsp;</td>
													<td valign="top" nowrap=""><a href="index.aspx?module=Settings&amp;action=EditMultiApprove&amp;parenttab=Settings&amp;step=2&amp;record=1">经理</a>&nbsp;</td>
													<td valign="top" nowrap="">激活&nbsp;</td>
													<td valign="top" nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="getCreateCustomBlockForm('SalesOrder','1','22','经理','')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomBlock(1,'SalesOrder', '', '');">
							</i>&nbsp;</td>
											</tr>
																		<tr class="crm-table-plural">
																			<td valign="top" nowrap="">2&nbsp;</td>
													<td valign="top" nowrap=""><a href="index.aspx?module=Settings&amp;action=EditMultiApprove&amp;parenttab=Settings&amp;step=2&amp;record=3">销售审批</a>&nbsp;</td>
													<td valign="top" nowrap="">激活&nbsp;</td>
													<td valign="top" nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="getCreateCustomBlockForm('SalesOrder','3','22','销售审批','')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomBlock(3,'SalesOrder', '', '');">
							</i>&nbsp;</td>
											</tr>
																		<tr>
																			<td valign="top" nowrap="">3&nbsp;</td>
													<td valign="top" nowrap=""><a href="index.aspx?module=Settings&amp;action=EditMultiApprove&amp;parenttab=Settings&amp;step=2&amp;record=4">审批流程</a>&nbsp;</td>
													<td valign="top" nowrap="">激活&nbsp;</td>
													<td valign="top" nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="getCreateCustomBlockForm('SalesOrder','4','22','审批流程','')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomBlock(4,'SalesOrder', '', '');">
							</i>&nbsp;</td>
											</tr>
									</tbody></table>
				<table cellspacing="0" cellpadding="5" width="100%" class="listTable small">
				<tbody><tr>
					<td valign="top" nowrap="">
					提示：
					<ul class="small">
					<li>每个模块可以新增多个审批流程，如果没有设置审批流程，审批将是单级审批，记录负责人的上级具有审批权限。</li>
					<li>点击查看审批步骤可以新增和修改审批步骤，每个审批流程可以具有多个审批步骤，步骤数量没有限制。</li>
					<li>如果记录正在通过审批流程处理，那么所在的审批流程将不能修改和删除。</li>			
					</ul>
					</td>
				</tr>
				</tbody></table>
				</form>
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