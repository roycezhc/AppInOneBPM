<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="RelatedList.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_RelatedList" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
<td class="detail-content-td">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
											<script language="JavaScript" type="text/javascript" src="include/js/customview.js"></script>
<script language="javascript">
    function getRelatedList(customField) {
        var modulename = customField.options[customField.options.selectedIndex].value;
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=RelatedList&fld_module=' + modulename + '&parenttab=Settings&ajax=true',
		    onComplete: function (response) {
		        var rest = response.responseText;
		        $("cfList").innerHTML = rest;
		        rest.evalScripts();
		    }
		}
	);
    }




    function getCreateRelatedListForm(fld_module, relation_id, label, sequence, presence) {
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=CreateRelatedList&fld_module=' + fld_module + '&parenttab=Settings&ajax=true&relation_id=' + relation_id + '&label=' + label + '&sequence=' + sequence + '&presence=' + presence,
		    onComplete: function (response) {
		        $("createrelatedlistContent").innerHTML = response.responseText;
		        ShowLockDiv("createrelatedlist");
		    }
		}
	);

    }
    function validate_relatedlist() {
        if (document.addtodb.label.value == "") {
            alert("相关信息不能为空！");
            document.addtodb.label.focus();
            return false;
        }
        if (document.addtodb.sequence.value == "") {
            alert("显示顺序不能为空！");
            document.addtodb.sequence.focus();
            return false;
        } else {
            if (isNaN(trim(document.addtodb.sequence.value))) {
                alert("无效的数字");
                document.addtodb.sequence.focus();
                return false;
            }
        }
        return true;
    }

</script>

<div id="createrelatedlist" class="windLayerDiv" style="display:none;width:300px; left:550px;top:200px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move" id="block-title">&nbsp;&nbsp;编辑相关信息</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('createrelatedlist');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="createrelatedlistContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("createrelatedlist", 'windLayerHeading');
</script>
</div>

<br>
<!-- DISPLAY -->
<b><font color="red"> </font></b>

	<table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td rowspan="2" valign="top" width="50"><img src="admin_files/relatedinfo.gif" alt="Users" title="Users" border="0" height="48" width="48"></td>
		<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 相关信息</b></td>
	</tr>

	<tr>
		<td class="small" valign="top">管理每个模块的相关信息及其显示顺序</td>
	</tr>
	</tbody></table>
	
	<table border="0" cellpadding="10" cellspacing="0" width="100%">
	<tbody><tr>
	<td>

	<table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
		<td class="small" align="left">
		<b>选择模块:</b>
				<select name="pick_module" id="pick_module" onchange="getRelatedList(this)">
																													<option value="Accounts" selected="">客户</option>
																														<option value="Contacts">联系人</option>
																														<option value="Potentials">销售机会</option>
																														<option value="Notes">联系记录</option>
																														<option value="HelpDesk">报修单</option>
																														<option value="Products">产品</option>
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
		<strong>相关信息</strong>
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

<table class="crm-table" id="crm-relate-table" width="100%" border="0" cellpadding="3" cellspacing="1">
<tbody class="ui-sortable"><tr height="28px" class="windLayerHead">
	<td width="3%" align="center">#</td>
	<td>相关信息</td>
	<td>显示顺序</td>
	<td>是否显示</td>
	<td width="8%">工具</td>
</tr>
</tbody><tbody id="related-tbody-Accounts" class="ui-sortable">
			<tr style="cursor: move;">
							<td nowrap="">1&nbsp;</td>
								<td nowrap="">联系记录&nbsp;</td>
								<td nowrap="">1&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','1','联系记录','1','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="1">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">2&nbsp;</td>
								<td nowrap="">电子邮件&nbsp;</td>
								<td nowrap="">2&nbsp;</td>
								<td nowrap="">否&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','6','电子邮件','2','1')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="6">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">3&nbsp;</td>
								<td nowrap="">客户投诉&nbsp;</td>
								<td nowrap="">3&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','110','客户投诉','3','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="110">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">4&nbsp;</td>
								<td nowrap="">应收款&nbsp;</td>
								<td nowrap="">4&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','3','应收款','4','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="3">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">5&nbsp;</td>
								<td nowrap="">日程安排&nbsp;</td>
								<td nowrap="">5&nbsp;</td>
								<td nowrap="">否&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','5','日程安排','5','1')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="5">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">6&nbsp;</td>
								<td nowrap="">销售退货单&nbsp;</td>
								<td nowrap="">6&nbsp;</td>
								<td nowrap="">否&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','77','销售退货单','6','1')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="77">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">7&nbsp;</td>
								<td nowrap="">附件&nbsp;</td>
								<td nowrap="">7&nbsp;</td>
								<td nowrap="">否&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','2','附件','7','1')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="2">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">8&nbsp;</td>
								<td nowrap="">发票管理&nbsp;</td>
								<td nowrap="">8&nbsp;</td>
								<td nowrap="">否&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','80','发票管理','8','1')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="80">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">9&nbsp;</td>
								<td nowrap="">纪念日&nbsp;</td>
								<td nowrap="">9&nbsp;</td>
								<td nowrap="">否&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','126','纪念日','9','1')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="126">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">10&nbsp;</td>
								<td nowrap="">客户关怀&nbsp;</td>
								<td nowrap="">10&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','72','客户关怀','10','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="72">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">11&nbsp;</td>
								<td nowrap="">期初余额&nbsp;</td>
								<td nowrap="">11&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','123','期初余额','11','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="123">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">12&nbsp;</td>
								<td nowrap="">客户服务&nbsp;</td>
								<td nowrap="">12&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','113','客户服务','12','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="113">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">13&nbsp;</td>
								<td nowrap="">付款单&nbsp;</td>
								<td nowrap="">13&nbsp;</td>
								<td nowrap="">否&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','116','付款单','13','1')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="116">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">14&nbsp;</td>
								<td nowrap="">联系人&nbsp;</td>
								<td nowrap="">14&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','4','联系人','14','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="4">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">15&nbsp;</td>
								<td nowrap="">相关点评&nbsp;</td>
								<td nowrap="">15&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','15','相关点评','15','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="15">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">16&nbsp;</td>
								<td nowrap="">分配历史&nbsp;</td>
								<td nowrap="">16&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','14','分配历史','16','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="14">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">17&nbsp;</td>
								<td nowrap="">销售机会&nbsp;</td>
								<td nowrap="">17&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','7','销售机会','17','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="7">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">18&nbsp;</td>
								<td nowrap="">报修单&nbsp;</td>
								<td nowrap="">18&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','8','报修单','18','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="8">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">19&nbsp;</td>
								<td nowrap="">收款单&nbsp;</td>
								<td nowrap="">19&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','121','收款单','19','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="121">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">20&nbsp;</td>
								<td nowrap="">报价单&nbsp;</td>
								<td nowrap="">20&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','9','报价单','20','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="9">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">21&nbsp;</td>
								<td nowrap="">发货单&nbsp;</td>
								<td nowrap="">21&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','10','发货单','21','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="10">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">22&nbsp;</td>
								<td nowrap="">合同订单&nbsp;</td>
								<td nowrap="">22&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','11','合同订单','22','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="11">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">23&nbsp;</td>
								<td nowrap="">应付款&nbsp;</td>
								<td nowrap="">23&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','107','应付款','23','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="107">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">24&nbsp;</td>
								<td nowrap="">产品&nbsp;</td>
								<td nowrap="">24&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','12','产品','24','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="12">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">25&nbsp;</td>
								<td nowrap="">费用报销&nbsp;</td>
								<td nowrap="">25&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','138','费用报销','25','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="138">
				</tr>
			<tr class="crm-table-plural" style="cursor: move;">
							<td nowrap="">26&nbsp;</td>
								<td nowrap="">短信&nbsp;</td>
								<td nowrap="">26&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','139','短信','26','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="139">
				</tr>
			<tr style="cursor: move;">
							<td nowrap="">27&nbsp;</td>
								<td nowrap="">营销活动&nbsp;</td>
								<td nowrap="">27&nbsp;</td>
								<td nowrap="">是&nbsp;</td>
								<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createrelatedlist');getCreateRelatedListForm('Accounts','13','营销活动','27','0')">
						</i>&nbsp;</td>
								<input type="hidden" name="relation-id" value="13">
				</tr>
</tbody>	
</table>
</form>

<script>

    Jquery(function () {
        Jquery(function () {
            Jquery("#crm-relate-table tbody").sortable({/������talbe tbody������ ��sortable
                axis: "y",
                start: function (e, ui) {
                    return ui;
                },
                stop: function (e, ui) {
                    return ui;
                }
            }).disableSelection();
        });
        Jquery('#crm-relate-table tbody').sortable().bind("sortupdate", sortableRelateListBind);
    });
    function sortableRelateListBind() {
        var fld_module = Jquery("[name=form]").find("[name=fld_module]").val();
        var newid = '';
        Jquery("#related-tbody-" + fld_module).find("[name=relation-id]").each(function (relationkey, relationid) {
            if (newid && newid != "") {
                newid += ",";
            }
            newid += Jquery(relationid).val();
        });
        if (newid != "") {
            Jquery.ajax({
                url: "index.aspx",
                data: 'module=Settings&action=SettingsAjax&file=RelatedSortable' +
					'&sortrelated=' + newid + '&fld_module=' + fld_module,
                success: function (rest) {
                    if (rest == "SUCCESS") {
                        Jquery("#pick_module").change();
                    }
                }
            });
        }
    }

</script>	</div>	
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
