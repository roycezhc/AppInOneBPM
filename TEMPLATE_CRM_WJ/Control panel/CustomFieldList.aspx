
<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="CustomFieldList.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_CustomFieldList" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
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
		    postBody: 'module=Settings&action=SettingsAjax&file=CustomFieldList&fld_module=' + modulename + '&parenttab=Settings&ajax=true',
		    onComplete: function (response) {
		        $("cfList").innerHTML = response.responseText;
		    }
		}
	);
    }


    function deleteCustomField(id, fld_module, colName, uitype) {
        if (confirm(alert_arr.SURE_TO_DELETE)) {
            document.form.action = "index.aspx?module=Settings&action=DeleteCustomField&fld_module=" + fld_module + "&fld_id=" + id + "&colName=" + colName + "&uitype=" + uitype
            document.form.submit()
        }
    }

    function getCreateCustomFieldForm(customField, id, tabid, ui) {
    alert("aa")
        var modulename = customField;
///           var str = "<table border="+0+" cellspacing="+0+" cellpadding="+5+" width="+95%+" align="+"center"+"> 
///	                +"<tbody><tr>"
///		             +"<td class="+"small"+"> <div id="+"createblockContent"+">"
///	                +"<form action="+"index.aspx"+" method="+"post"+" name="+"addtodb"+" onsubmit="+"return validate_block()"+">
///	                 "<input type="+"hidden"+" name="+"module"+" value="+"Settings"+"><input type="+"hidden"+" name="+"fld_module"+" value="+"Accounts"+"><input type="+"hidden"+" name="+"parenttab"+" value="+"Settings"+"><input type="+"hidden"+" name="+"action"+" value="+"AddCustomBlockToDB"+"><input type="+"hidden"+" name="+"blockid"+" value="+""+"><input type="+"hidden"+" name="+"mode"+" value="+""+"><table width="+"100%"+" border="+"0"+" cellpadding="+"5"+" cellspacing="+"0"+" class="+"small"+"><tbody><tr><td width="+"50%"+" class="+"dataLabel"+" nowrap="+"nowrap"+" align="+"right"+"><b>显示区域标题</b></td><td width="+"50%"+" align="+"left"+"><input type="+"text"+" size="+"20"+" name="+"label"+" value="+""+" class="+"txtBox"+"></td></tr><tr><td class="+"dataLabel"+" nowrap="+"nowrap"+" align="+"right"+"><b>显示顺序</b></td><td align="+"left"+"><input type="+"text"+" size="+"20"+" name="+"order"+" value="+""+" class="+"txtBox"+"></td> </tr></tbody></table><table border="+"0"+" cellspacing="+"0"+" cellpadding="+"5"+" width="+"100%"+"><tbody><tr><td align="+"center"+"><button class="+"pure-button pure-button-success"+" title="+"保存"+"><i class="+"icon-ok"+"></i> 保存</button> &nbsp;&nbsp;&nbsp;&nbsp;<button class="+"pure-button pure-button-cancel"+" title="+"关闭"+" onclick="+"CloseLockDiv('createblock');return false;"+"> <i class="+"icon-off"+"></i> 关闭</button>&nbsp;</td></tr></tbody></table></form></div></td></tr></tbody></table>"; 
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=CreateCustomField&fld_module=' + customField + '&parenttab=Settings&ajax=true&fieldid=' + id + '&tabid=' + tabid + '&uitype=' + ui,
		    onComplete: function (response) {
		        $("createcfContent").innerHTML = response.responseText;
		     
		        ShowLockDiv('createcf');
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

</script>
<!-- <div id="createcf" style="display:block;position:absolute;width:500px;"></div> -->

<div id="createcf" class="windLayerDiv" style="display:none;width:550px; left:550px;top:200px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move" id="block-title">&nbsp;&nbsp;新增自定义字段</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('createcf');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="createcfContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("createcf", 'windLayerHeading');
</script>
</div>

<br>
			<!-- DISPLAY -->
						<b><font color="red"> </font></b>
						
				<table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
				<tbody><tr>
					<td rowspan="2" valign="top" width="50"><img src="admin_files/custom.gif" alt="Users" title="Users" border="0" height="48" width="48"></td>
					<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 自定义字段</b></td>
				</tr>

				<tr>
					<td class="small" valign="top">- 创建和管理自定义字段，新增的字段默认在自定义区域显示，可以在页面布局修改所在区域和位置。</td>
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
				<strong>自定义字段</strong>
			</td>
			<td align="right">
				<button class="pure-button pure-button-success" title="新建字段" accesskey="S" name="savebutton" onclick="getCreateCustomFieldForm('Accounts','','','');return false;">
					<i class="icon-plus"></i> 新建字段
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
                      	<td width="3%" align="center">#</td>
                      	<td>字段标签</td>
                      	<td>字段类型</td>
                     	<td>工具</td>
					</tr>
																		<tr>
																											<td nowrap="" align="center">1&nbsp;</td>
																												<td nowrap="">客户产品&nbsp;</td>
																												<td nowrap="">下拉框&nbsp;</td>
																												<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createcf');getCreateCustomFieldForm('Accounts','536','6','15')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomField(536,'Accounts', 'cf_535', '15');">
							</i>&nbsp;</td>
																		</tr>
																		<tr class="crm-table-plural">
																											<td nowrap="" align="center">2&nbsp;</td>
																												<td nowrap="">旺旺&nbsp;</td>
																												<td nowrap="">贸易通&nbsp;</td>
																												<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createcf');getCreateCustomFieldForm('Accounts','687','6','88')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomField(687,'Accounts', 'cf_686', '88');">
							</i>&nbsp;</td>
																		</tr>
																		<tr>
																											<td nowrap="" align="center">3&nbsp;</td>
																												<td nowrap="">热点客户&nbsp;</td>
																												<td nowrap="">下拉框&nbsp;</td>
																												<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createcf');getCreateCustomFieldForm('Accounts','499','6','15')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomField(499,'Accounts', 'cf_498', '15');">
							</i>&nbsp;</td>
																		</tr>
																		<tr class="crm-table-plural">
																											<td nowrap="" align="center">4&nbsp;</td>
																												<td nowrap="">热度&nbsp;</td>
																												<td nowrap="">下拉框&nbsp;</td>
																												<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createcf');getCreateCustomFieldForm('Accounts','501','6','15')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomField(501,'Accounts', 'cf_500', '15');">
							</i>&nbsp;</td>
																		</tr>
																		<tr>
																											<td nowrap="" align="center">5&nbsp;</td>
																												<td nowrap="">热点分类&nbsp;</td>
																												<td nowrap="">下拉框&nbsp;</td>
																												<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createcf');getCreateCustomFieldForm('Accounts','503','6','15')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomField(503,'Accounts', 'cf_502', '15');">
							</i>&nbsp;</td>
																		</tr>
																		<tr class="crm-table-plural">
																											<td nowrap="" align="center">6&nbsp;</td>
																												<td nowrap="">热点说明&nbsp;</td>
																												<td nowrap="">文本&nbsp;</td>
																												<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createcf');getCreateCustomFieldForm('Accounts','505','6','1')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomField(505,'Accounts', 'cf_504', '1');">
							</i>&nbsp;</td>
																		</tr>
																		<tr>
																											<td nowrap="" align="center">7&nbsp;</td>
																												<td nowrap="">对对对&nbsp;</td>
																												<td nowrap="">文本&nbsp;</td>
																												<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createcf');getCreateCustomFieldForm('Accounts','844','6','1')">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteCustomField(844,'Accounts', 'cf_843', '1');">
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