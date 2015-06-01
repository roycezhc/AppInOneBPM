<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="LayoutList.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_LayoutList" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
<td class="detail-content-td">
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
											<script language="JavaScript" type="text/javascript" src="include/js/customview.js"></script>
<script language="javascript">
    function getLayoutList(customField) {
        var modulename = customField.options[customField.options.selectedIndex].value;
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=LayoutList&fld_module=' + modulename + '&parenttab=Settings&ajax=true',
		    onComplete: function (response) {
		        var rest = response.responseText;
		        $("cfList").innerHTML = rest;
		        rest.evalScripts();
		    }
		}
	);
    }


    function deleteCustomBlock(blockid, fld_module) {
        if (confirm(alert_arr.SURE_TO_DELETE)) {
            document.form.action = "index.aspx?module=Settings&action=DeleteCustomBlock&fld_module=" + fld_module + "&blockid=" + blockid;
            document.form.submit();
        }
    }

    function getFieldLayoutForm(custommodule, fieldid, tabid, fieldlabel, blocklabel, order, blockid, typeofdata) {
        var modulename = custommodule;
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=CreateCustomLayout&fld_module=' + custommodule + '&parenttab=Settings&ajax=true&blockid=' + blockid + '&tabid=' + tabid + '&fieldlabel=' + fieldlabel + '&order=' + order + '&blocklabel=' + blocklabel + '&blockid=' + blockid + '&fieldid=' + fieldid + '&typeofdata=' + typeofdata,
		    onComplete: function (response) {
		        $("createLayoutContent").innerHTML = response.responseText;
		        ShowLockDiv("createLayout")
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
    var gselected_fieldtype = '';
    function validate_layout() {
        if (document.addtodb.fieldlabel.value == "") {
            alert("字段标签不能为空！");
            document.addtodb.fieldlabel.focus();
            return false;
        }
        if (document.addtodb.order.value == "") {
            alert("显示顺序不能为空！");
            document.addtodb.order.focus();
            return false;
        } else {
            if (isNaN(trim(document.addtodb.order.value))) {
                alert("无效的数字");
                document.addtodb.order.focus();
                return false;
            }
        }
        return true;
    }

</script>
<!-- <div id="createLayout" style="display:block;position:absolute;width:500px;"></div> -->

<div id="createLayout" class="windLayerDiv" style="display:none;width:380px; left:550px;top:200px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move" id="block-title">
		&nbsp;&nbsp;编辑页面布局
	</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('createLayout');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="createLayoutContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("createLayout", 'windLayerHeading');
</script>
</div>

<br>
			<!-- DISPLAY -->
						<b><font color="red"> </font></b>
						
				<table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
				<tbody><tr>
					<td rowspan="2" valign="top" width="50"><img src="admin_files/custom.gif" alt="Users" title="Users" border="0" height="48" width="48"></td>
					<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 页面布局</b></td>
				</tr>

				<tr>
					<td class="small" valign="top">字段所在的显示区域和显示顺序决定模块的页面布局，每行2个字段。您可以通过鼠标<b style="color:#21841D">拖动</b>字段调整模块的页面布局。</td>
				</tr>
				</tbody></table>
				
				<table border="0" cellpadding="10" cellspacing="0" width="100%">
				<tbody><tr>
				<td>

				<table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
				<tbody><tr>
				        <td class="small" align="left">
					<b>选择模块:</b>
		                	<select id="pick_module" name="pick_module" onchange="getLayoutList(this)">
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
					<strong>页面布局</strong>
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

<div id="connected">
			<div class="detail-content-heading" style="clear:both; float:none;margin-bottom: 2px;">基本信息</div>
		<div class="connected ui-sortable" id="layou-block-9">
							<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#1
							&nbsp;
															<font color="red">*</font>
														客户名称&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','1','6','客户名称','基本信息','1','9','true')">
							</i>
							<input type="hidden" class="layou-field-id" value="1">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#2
							&nbsp;
														客户编号&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','2','6','客户编号','基本信息','2','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="2">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#3
							&nbsp;
														网站&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','4','6','网站','基本信息','3','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="4">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#4
							&nbsp;
														员工人数&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','9','6','员工人数','基本信息','4','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="9">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#5
							&nbsp;
														行业&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','14','6','行业','基本信息','5','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="14">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#6
							&nbsp;
														上级单位&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','7','6','上级单位','基本信息','6','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="7">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#7
							&nbsp;
														下次联系时间&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','19','6','下次联系时间','基本信息','7','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="19">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#8
							&nbsp;
														公司性质&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','15','6','公司性质','基本信息','8','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="15">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#9
							&nbsp;
															<font color="red">*</font>
														负责人&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','20','6','负责人','基本信息','9','9','true')">
							</i>
							<input type="hidden" class="layou-field-id" value="20">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#10
							&nbsp;
														客户状态&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','13','6','客户状态','基本信息','10','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="13">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#11
							&nbsp;
														创建时间&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','22','6','创建时间','基本信息','11','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="22">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#12
							&nbsp;
														类型&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','16','6','类型','基本信息','12','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="16">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#13
							&nbsp;
														修改时间&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','23','6','修改时间','基本信息','13','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="23">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#14
							&nbsp;
															<font color="red">*</font>
														创建人&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','21','6','创建人','基本信息','14','9','true')">
							</i>
							<input type="hidden" class="layou-field-id" value="21">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#15
							&nbsp;
															<font color="red">*</font>
														公用客户&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','658','6','公用客户','基本信息','15','9','true')">
							</i>
							<input type="hidden" class="layou-field-id" value="658">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#16
							&nbsp;
														最新联系时间&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','24','6','最新联系时间','基本信息','16','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="24">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#17
							&nbsp;
														客户级别&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','12','6','客户级别','基本信息','17','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="12">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#18
							&nbsp;
														最新发货日期&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','25','6','最新发货日期','基本信息','18','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="25">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#19
							&nbsp;
														最新订单日期&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','26','6','最新订单日期','基本信息','19','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="26">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#20
							&nbsp;
														最新报价日期&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','27','6','最新报价日期','基本信息','20','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="27">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#21
							&nbsp;
														联系次数&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','28','6','联系次数','基本信息','21','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="28">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#22
							&nbsp;
														分配状态&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','29','6','分配状态','基本信息','22','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="29">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#23
							&nbsp;
														客户来源&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','11','6','客户来源','基本信息','23','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="11">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#24
							&nbsp;
														保护开始日期&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','30','6','保护开始日期','基本信息','24','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="30">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#25
							&nbsp;
														保护结束日期&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','31','6','保护结束日期','基本信息','25','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="31">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#26
							&nbsp;
														QQ&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','712','6','QQ','基本信息','26','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="712">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#27
							&nbsp;
														最新进展&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','564','6','最新进展','基本信息','27','9','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="564">
						</td>
					  </tr>
					</tbody></table>
				</div>
													<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div><br>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
						<br>
		</div>
			<div class="detail-content-heading" style="clear:both; float:none;margin-bottom: 2px;">自定义信息</div>
		<div class="connected ui-sortable" id="layou-block-10">
							<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#28
							&nbsp;
														热点客户&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','499','6','热点客户','自定义信息','28','10','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="499">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#29
							&nbsp;
														热度&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','501','6','热度','自定义信息','29','10','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="501">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#30
							&nbsp;
														热点分类&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','503','6','热点分类','自定义信息','30','10','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="503">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#31
							&nbsp;
														热点说明&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','505','6','热点说明','自定义信息','31','10','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="505">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#32
							&nbsp;
														对对对&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','844','6','对对对','自定义信息','32','10','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="844">
						</td>
					  </tr>
					</tbody></table>
				</div>
													<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div><br>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
						<br>
		</div>
			<div class="detail-content-heading" style="clear:both; float:none;margin-bottom: 2px;">联系信息</div>
		<div class="connected ui-sortable" id="layou-block-145">
							<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#33
							&nbsp;
														首要联系人&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','562','6','首要联系人','联系信息','33','145','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="562">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#34
							&nbsp;
														手机&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','563','6','手机','联系信息','34','145','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="563">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#35
							&nbsp;
														电话&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','3','6','电话','联系信息','35','145','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="3">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#36
							&nbsp;
														传真&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','5','6','传真','联系信息','36','145','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="5">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#37
							&nbsp;
														其它电话&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','6','6','其它电话','联系信息','37','145','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="6">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#38
							&nbsp;
														Email&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','8','6','Email','联系信息','38','145','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="8">
						</td>
					  </tr>
					</tbody></table>
				</div>
																				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
						<br>
		</div>
			<div class="detail-content-heading" style="clear:both; float:none;margin-bottom: 2px;">地址信息</div>
		<div class="connected ui-sortable" id="layou-block-11">
							<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#39
							&nbsp;
														国家&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','40','6','国家','地址信息','39','11','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="40">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#40
							&nbsp;
														省份&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','41','6','省份','地址信息','40','11','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="41">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#41
							&nbsp;
														城市&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','42','6','城市','地址信息','41','11','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="42">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#42
							&nbsp;
														地址&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','43','6','地址','地址信息','42','11','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="43">
						</td>
					  </tr>
					</tbody></table>
				</div>
																				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
						<br>
		</div>
			<div class="detail-content-heading" style="clear:both; float:none;margin-bottom: 2px;">银行财务信息</div>
		<div class="connected ui-sortable" id="layou-block-84">
							<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#43
							&nbsp;
														支付方式&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','36','6','支付方式','银行财务信息','43','84','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="36">
						</td>
					  </tr>
					</tbody></table>
				</div>
										<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#44
							&nbsp;
														订单数量&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','38','6','订单数量','银行财务信息','44','84','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="38">
						</td>
					  </tr>
					</tbody></table>
				</div>
												<br>
														<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#45
							&nbsp;
														订单金额&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','39','6','订单金额','银行财务信息','45','84','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="39">
						</td>
					  </tr>
					</tbody></table>
				</div>
													<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div><br>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
						<br>
		</div>
			<div class="detail-content-heading" style="clear:both; float:none;margin-bottom: 2px;">描述信息</div>
		<div class="connected ui-sortable" id="layou-block-12">
							<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							#46
							&nbsp;
														备注&nbsp;&nbsp;<i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="fnvshobj(this,'createLayout');getFieldLayoutForm('Accounts','46','6','备注','描述信息','46','12','false')">
							</i>
							<input type="hidden" class="layou-field-id" value="46">
						</td>
					  </tr>
					</tbody></table>
				</div>
													<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div><br>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
				<div class="layou-tab-div">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layou-tab-title">
					  <tbody><tr>
						<td>
							<input type="hidden" class="layou-field-id" value="">&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</div>
						<br>
		</div>
	</div>
<script>
    var blcokidstring = "9,10,145,11,84,12";
    var modulename = "Accounts";

    Jquery(function () {
        Jquery('.connected').sortable({
            opacity: 0.6,
            revert: true,
            cursor: 'move',
            connectWith: '.connected'
        });
        Jquery('.connected').sortable().bind("sortupdate", sortablelayouBind);
    });
    var currsortlayou = "";
    function sortablelayouBind() {
        var blcokidarr = blcokidstring.split(",");
        var newid = new Array();
        Jquery(blcokidarr).each(function (blcolkey, blockid) {
            if (Jquery("#layou-block-" + blockid).length > 0 && Jquery("#layou-block-" + blockid).find(".layou-field-id").length > 0) {
                Jquery("#layou-block-" + blockid).find(".layou-field-id").each(function (fieldkey, fieldid) {
                    if (Jquery(fieldid).val() != "" && Jquery(fieldid).val() != "undefined") {
                        blockidkey = blockid;
                        if (newid[blockidkey] && newid[blockidkey] != "") {
                            newid[blockidkey] += "," + Jquery(fieldid).val();
                        } else {
                            newid[blockidkey] = Jquery(fieldid).val();
                        }
                    }
                })
            }
        });
        var sortlayou = "";
        Jquery(blcokidarr).each(function (blcolkey, newblockid) {
            if (newid[newblockid] && newid[newblockid] != "") {
                if (sortlayou && sortlayou != "") {
                    sortlayou += "|";
                }
                sortlayou += newblockid + ":" + newid[newblockid] + "";
            }
        });
        if (currsortlayou != "" && currsortlayou == sortlayou) {
            return false;
        }
        if (sortlayou != "") {
            currsortlayou = sortlayou;
            Jquery.ajax({
                url: "index.aspx",
                data: 'module=Settings&action=SettingsAjax&file=LayouSortable&operation=updateViewList' +
					'&sortlayou=' + sortlayou + '&fld_module=' + modulename,
                success: function (rest) {
                    if (rest == "SUCCESS") {
                        Jquery("#pick_module").change();
                    }
                }
            });
        }
    }

</script>                </form></div>	
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