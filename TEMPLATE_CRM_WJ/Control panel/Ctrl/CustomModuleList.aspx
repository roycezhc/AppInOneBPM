<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomModuleList.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Control_panel_Ctrl_CustomModuleList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


    <div style="width:75%;">
	<%--<form action="index.php" method="post" name="DetailForm">
		<input type="hidden" name="module" value="Settings">
		<input type="hidden" id="prodview" name="prodview" value="prodviewuli2">
		<input type="hidden" name="mode" value="">
		<input type="hidden" name="action" value="CustomModuleList">--%>
			<!-- <table border="0" cellpadding="5" cellspacing="0" width="100%">
			<tr>
			<td class="small">&nbsp;</td>
			<td class="small" align="right">&nbsp;&nbsp;

				
					<button  class="pure-button pure-button-edit"
					title="编辑"  onclick="document.DetailForm.mode.value='edit';document.DetailForm.submit();return false;">
					<i  class="icon-pencil"></i> 编辑 
					</button>&nbsp;
							   </td>
	
			</tr>
			</table> -->

			<table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
				<tbody><tr class="windLayerHead">
					<td width="3%" align="center"># </td>
                                      <td nowrap="">英文名称&nbsp;</td>
                                      <td nowrap="">中文名称&nbsp;</td>
                                      <td nowrap="">工具&nbsp;</td>
                   				</tr>
                                <% for (int i = 1; i < list.Count+1; i++)
                                   {
                                       if (i % 2 > 0)
                                       {%>
                                         <tr id="row_">
                                        <%}
                                       else
                                       {%> 
                                          <tr id="row_" class="crm-table-plural">
                                       <%} %>
										<td width="3%" align="center"><%=i %> </td>
										   <td nowrap=""><%=list[i-1].NAME %>&nbsp;</td>	
										   <td nowrap=""><%=list[i-1].Tablabel %>&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_2" style="cursor:pointer;" onclick="callShowModelEdit('<%=i %>','<%=list[i-1].NAME %>','<%=list[i-1].Tablabel %>');" alt="编辑" title="编辑"><img src="Ctrl/img/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
                                   <%} %>
				                   
														<%--	<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">2 </td>
										   <td nowrap="">Potentials&nbsp;</td>	
										   <td nowrap="">销售机会&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_2" style="cursor:pointer;" onclick="callShowModelEdit('2','Potentials','销售机会');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">3 </td>
										   <td nowrap="">Contacts&nbsp;</td>	
										   <td nowrap="">联系人&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_4" style="cursor:pointer;" onclick="callShowModelEdit('4','Contacts','联系人');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">4 </td>
										   <td nowrap="">Contacts&nbsp;</td>	
										   <td nowrap="">联系人&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_4" style="cursor:pointer;" onclick="callShowModelEdit('4','Contacts','联系人');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">5 </td>
										   <td nowrap="">Accounts&nbsp;</td>	
										   <td nowrap="">客户&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_6" style="cursor:pointer;" onclick="callShowModelEdit('6','Accounts','客户');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">6 </td>
										   <td nowrap="">Accounts&nbsp;</td>	
										   <td nowrap="">客户&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_6" style="cursor:pointer;" onclick="callShowModelEdit('6','Accounts','客户');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">7 </td>
										   <td nowrap="">Notes&nbsp;</td>	
										   <td nowrap="">联系记录&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_8" style="cursor:pointer;" onclick="callShowModelEdit('8','Notes','联系记录');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">8 </td>
										   <td nowrap="">Calendar&nbsp;</td>	
										   <td nowrap="">日程安排&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_9" style="cursor:pointer;" onclick="callShowModelEdit('9','Calendar','日程安排');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">9 </td>
										   <td nowrap="">HelpDesk&nbsp;</td>	
										   <td nowrap="">报修单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_13" style="cursor:pointer;" onclick="callShowModelEdit('13','HelpDesk','报修单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">10 </td>
										   <td nowrap="">Products&nbsp;</td>	
										   <td nowrap="">产品&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_14" style="cursor:pointer;" onclick="callShowModelEdit('14','Products','产品');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">11 </td>
										   <td nowrap="">Products&nbsp;</td>	
										   <td nowrap="">产品&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_14" style="cursor:pointer;" onclick="callShowModelEdit('14','Products','产品');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">12 </td>
										   <td nowrap="">Faq&nbsp;</td>	
										   <td nowrap="">常见问题&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_15" style="cursor:pointer;" onclick="callShowModelEdit('15','Faq','常见问题');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">13 </td>
										   <td nowrap="">Faq&nbsp;</td>	
										   <td nowrap="">常见问题&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_15" style="cursor:pointer;" onclick="callShowModelEdit('15','Faq','常见问题');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">14 </td>
										   <td nowrap="">Vendors&nbsp;</td>	
										   <td nowrap="">供应商&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_18" style="cursor:pointer;" onclick="callShowModelEdit('18','Vendors','供应商');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">15 </td>
										   <td nowrap="">PriceBooks&nbsp;</td>	
										   <td nowrap="">价目表&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_19" style="cursor:pointer;" onclick="callShowModelEdit('19','PriceBooks','价目表');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">16 </td>
										   <td nowrap="">Quotes&nbsp;</td>	
										   <td nowrap="">报价单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_20" style="cursor:pointer;" onclick="callShowModelEdit('20','Quotes','报价单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">17 </td>
										   <td nowrap="">PurchaseOrder&nbsp;</td>	
										   <td nowrap="">进货单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_21" style="cursor:pointer;" onclick="callShowModelEdit('21','PurchaseOrder','进货单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">18 </td>
										   <td nowrap="">PurchaseOrder&nbsp;</td>	
										   <td nowrap="">进货单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_21" style="cursor:pointer;" onclick="callShowModelEdit('21','PurchaseOrder','进货单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">19 </td>
										   <td nowrap="">SalesOrder&nbsp;</td>	
										   <td nowrap="">合同订单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_22" style="cursor:pointer;" onclick="callShowModelEdit('22','SalesOrder','合同订单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">20 </td>
										   <td nowrap="">Invoice&nbsp;</td>	
										   <td nowrap="">发货单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_23" style="cursor:pointer;" onclick="callShowModelEdit('23','Invoice','发货单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">21 </td>
										   <td nowrap="">Campaigns&nbsp;</td>	
										   <td nowrap="">营销活动&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_26" style="cursor:pointer;" onclick="callShowModelEdit('26','Campaigns','营销活动');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">22 </td>
										   <td nowrap="">Gathers&nbsp;</td>	
										   <td nowrap="">应收款&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_33" style="cursor:pointer;" onclick="callShowModelEdit('33','Gathers','应收款');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">23 </td>
										   <td nowrap="">Charges&nbsp;</td>	
										   <td nowrap="">应付款&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_34" style="cursor:pointer;" onclick="callShowModelEdit('34','Charges','应付款');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">24 </td>
										   <td nowrap="">Expenses&nbsp;</td>	
										   <td nowrap="">费用报销&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_35" style="cursor:pointer;" onclick="callShowModelEdit('35','Expenses','费用报销');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">25 </td>
										   <td nowrap="">Balances&nbsp;</td>	
										   <td nowrap="">库存余额&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_38" style="cursor:pointer;" onclick="callShowModelEdit('38','Balances','库存余额');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">26 </td>
										   <td nowrap="">Cares&nbsp;</td>	
										   <td nowrap="">客户关怀&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_39" style="cursor:pointer;" onclick="callShowModelEdit('39','Cares','客户关怀');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">27 </td>
										   <td nowrap="">Checks&nbsp;</td>	
										   <td nowrap="">盘点&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_40" style="cursor:pointer;" onclick="callShowModelEdit('40','Checks','盘点');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">28 </td>
										   <td nowrap="">Deliverys&nbsp;</td>	
										   <td nowrap="">出库单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_41" style="cursor:pointer;" onclick="callShowModelEdit('41','Deliverys','出库单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">29 </td>
										   <td nowrap="">Funnels&nbsp;</td>	
										   <td nowrap="">销售漏斗&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_42" style="cursor:pointer;" onclick="callShowModelEdit('42','Funnels','销售漏斗');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">30 </td>
										   <td nowrap="">Prdtnums&nbsp;</td>	
										   <td nowrap="">初始化库存&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_44" style="cursor:pointer;" onclick="callShowModelEdit('44','Prdtnums','初始化库存');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">31 </td>
										   <td nowrap="">Warehouses&nbsp;</td>	
										   <td nowrap="">入库单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_46" style="cursor:pointer;" onclick="callShowModelEdit('46','Warehouses','入库单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">32 </td>
										   <td nowrap="">Catalogs&nbsp;</td>	
										   <td nowrap="">产品分类&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_51" style="cursor:pointer;" onclick="callShowModelEdit('51','Catalogs','产品分类');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">33 </td>
										   <td nowrap="">Ureports&nbsp;</td>	
										   <td nowrap="">常用报表&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_52" style="cursor:pointer;" onclick="callShowModelEdit('52','Ureports','常用报表');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">34 </td>
										   <td nowrap="">Vcontacts&nbsp;</td>	
										   <td nowrap="">供应商联系人&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_53" style="cursor:pointer;" onclick="callShowModelEdit('53','Vcontacts','供应商联系人');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">35 </td>
										   <td nowrap="">Tuihuos&nbsp;</td>	
										   <td nowrap="">销售退货单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_54" style="cursor:pointer;" onclick="callShowModelEdit('54','Tuihuos','销售退货单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">36 </td>
										   <td nowrap="">Performances&nbsp;</td>	
										   <td nowrap="">员工绩效&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_55" style="cursor:pointer;" onclick="callShowModelEdit('55','Performances','员工绩效');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">37 </td>
										   <td nowrap="">Faqcategorys&nbsp;</td>	
										   <td nowrap="">常见问题分类&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_56" style="cursor:pointer;" onclick="callShowModelEdit('56','Faqcategorys','常见问题分类');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">38 </td>
										   <td nowrap="">Vnotes&nbsp;</td>	
										   <td nowrap="">供应商联系记录&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_57" style="cursor:pointer;" onclick="callShowModelEdit('57','Vnotes','供应商联系记录');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">39 </td>
										   <td nowrap="">Salesobjects&nbsp;</td>	
										   <td nowrap="">销售目标&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_58" style="cursor:pointer;" onclick="callShowModelEdit('58','Salesobjects','销售目标');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">40 </td>
										   <td nowrap="">Billings&nbsp;</td>	
										   <td nowrap="">发票管理&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_59" style="cursor:pointer;" onclick="callShowModelEdit('59','Billings','发票管理');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">41 </td>
										   <td nowrap="">Pools&nbsp;</td>	
										   <td nowrap="">客户池&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_60" style="cursor:pointer;" onclick="callShowModelEdit('60','Pools','客户池');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">42 </td>
										   <td nowrap="">Announcements&nbsp;</td>	
										   <td nowrap="">公告&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_61" style="cursor:pointer;" onclick="callShowModelEdit('61','Announcements','公告');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">43 </td>
										   <td nowrap="">Duishous&nbsp;</td>	
										   <td nowrap="">竞争对手&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_62" style="cursor:pointer;" onclick="callShowModelEdit('62','Duishous','竞争对手');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">44 </td>
										   <td nowrap="">Warehousetransfers&nbsp;</td>	
										   <td nowrap="">库间调拨&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_63" style="cursor:pointer;" onclick="callShowModelEdit('63','Warehousetransfers','库间调拨');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">45 </td>
										   <td nowrap="">Wareledgers&nbsp;</td>	
										   <td nowrap="">库存流水账&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_64" style="cursor:pointer;" onclick="callShowModelEdit('64','Wareledgers','库存流水账');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">46 </td>
										   <td nowrap="">Complaints&nbsp;</td>	
										   <td nowrap="">客户投诉&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_69" style="cursor:pointer;" onclick="callShowModelEdit('69','Complaints','客户投诉');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">47 </td>
										   <td nowrap="">Accountrecordss&nbsp;</td>	
										   <td nowrap="">客户服务&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_70" style="cursor:pointer;" onclick="callShowModelEdit('70','Accountrecordss','客户服务');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">48 </td>
										   <td nowrap="">Inboundsearchs&nbsp;</td>	
										   <td nowrap="">客服控制台&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_71" style="cursor:pointer;" onclick="callShowModelEdit('71','Inboundsearchs','客服控制台');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">49 </td>
										   <td nowrap="">Noteplans&nbsp;</td>	
										   <td nowrap="">客户任务计划&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_72" style="cursor:pointer;" onclick="callShowModelEdit('72','Noteplans','客户任务计划');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">50 </td>
										   <td nowrap="">Normaltasks&nbsp;</td>	
										   <td nowrap="">客户任务&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_73" style="cursor:pointer;" onclick="callShowModelEdit('73','Normaltasks','客户任务');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">51 </td>
										   <td nowrap="">Integradedreports&nbsp;</td>	
										   <td nowrap="">综合报表&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_74" style="cursor:pointer;" onclick="callShowModelEdit('74','Integradedreports','综合报表');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">52 </td>
										   <td nowrap="">Salesreports&nbsp;</td>	
										   <td nowrap="">年终销售报表&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_75" style="cursor:pointer;" onclick="callShowModelEdit('75','Salesreports','年终销售报表');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">53 </td>
										   <td nowrap="">Chargesrecords&nbsp;</td>	
										   <td nowrap="">付款单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_76" style="cursor:pointer;" onclick="callShowModelEdit('76','Chargesrecords','付款单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">54 </td>
										   <td nowrap="">Gathersrecords&nbsp;</td>	
										   <td nowrap="">收款单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_77" style="cursor:pointer;" onclick="callShowModelEdit('77','Gathersrecords','收款单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">55 </td>
										   <td nowrap="">Forthamounts&nbsp;</td>	
										   <td nowrap="">往来账&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_78" style="cursor:pointer;" onclick="callShowModelEdit('78','Forthamounts','往来账');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">56 </td>
										   <td nowrap="">Openingbalancess&nbsp;</td>	
										   <td nowrap="">期初余额&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_79" style="cursor:pointer;" onclick="callShowModelEdit('79','Openingbalancess','期初余额');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">57 </td>
										   <td nowrap="">Inventoryledgers&nbsp;</td>	
										   <td nowrap="">库存台账&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_80" style="cursor:pointer;" onclick="callShowModelEdit('80','Inventoryledgers','库存台账');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">58 </td>
										   <td nowrap="">Serialnumbers&nbsp;</td>	
										   <td nowrap="">产品序列号&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_81" style="cursor:pointer;" onclick="callShowModelEdit('81','Serialnumbers','产品序列号');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">59 </td>
										   <td nowrap="">Memdays&nbsp;</td>	
										   <td nowrap="">纪念日&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_82" style="cursor:pointer;" onclick="callShowModelEdit('82','Memdays','纪念日');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">60 </td>
										   <td nowrap="">Companyacctreports&nbsp;</td>	
										   <td nowrap="">公司账户统计&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_90" style="cursor:pointer;" onclick="callShowModelEdit('90','Companyacctreports','公司账户统计');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">61 </td>
										   <td nowrap="">Knowledgebases&nbsp;</td>	
										   <td nowrap="">公司平台&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_91" style="cursor:pointer;" onclick="callShowModelEdit('91','Knowledgebases','公司平台');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">62 </td>
										   <td nowrap="">Productspecs&nbsp;</td>	
										   <td nowrap="">产品规格&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_92" style="cursor:pointer;" onclick="callShowModelEdit('92','Productspecs','产品规格');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">63 </td>
										   <td nowrap="">Prodlocations&nbsp;</td>	
										   <td nowrap="">库位管理&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_93" style="cursor:pointer;" onclick="callShowModelEdit('93','Prodlocations','库位管理');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">64 </td>
										   <td nowrap="">Packsetups&nbsp;</td>	
										   <td nowrap="">装配方案&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_95" style="cursor:pointer;" onclick="callShowModelEdit('95','Packsetups','装配方案');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">65 </td>
										   <td nowrap="">WorkMaps&nbsp;</td>	
										   <td nowrap="">逍遥行&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_96" style="cursor:pointer;" onclick="callShowModelEdit('96','WorkMaps','逍遥行');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_" class="crm-table-plural">
										<td width="3%" align="center">66 </td>
										   <td nowrap="">Packorders&nbsp;</td>	
										   <td nowrap="">装配出入库单&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_97" style="cursor:pointer;" onclick="callShowModelEdit('97','Packorders','装配出入库单');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>
															<tr id="row_">
										<td width="3%" align="center">67 </td>
										   <td nowrap="">Zlgtwos&nbsp;</td>	
										   <td nowrap="">自定义模块2&nbsp;</td>	
										   <td nowrap=""><a href="javascript:;" id="img_98" style="cursor:pointer;" onclick="callShowModelEdit('98','Zlgtwos','自定义模块2');" alt="编辑" title="编辑"><img src="themes/softed/images/editfield.gif" border="0"> </a>&nbsp;</td>	
										</tr>--%>
							</tbody></table>
          
<%--</form>--%>
	</div>
    
			<table border="0" cellpadding="5" cellspacing="0" width="100%">
			<tbody><tr>
			<td class="small">&nbsp;</td>
			<td class="small" align="right">&nbsp;&nbsp;
			<button class="pure-button pure-button-success" title="新增模块" onclick="getCreateCustomModuleForm('');return false;">
			<i class="icon-plus"></i> 新增模块 
			</button>&nbsp;
			</td></tr>
			</tbody></table>

			<table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
			<tbody><tr height="28px" class="windLayerHead">
				<td width="3%" align="center" nowra="">#</td>
				<td>英文名称</td>
				<td>显示名称</td>
				<td>主菜单</td>
				<td>客户字段</td>
				<td>联系人字段</td>
				<td>显示顺序</td>
				<td>模块状态</td>
				<td>工具</td>
			</tr>
            <%for (int i = 1; i < list1.Count + 1; i++)
              {
                  if (i % 2 > 0)
                  {%>
                                         <tr id="Tr<%=i+1 %>">
                                        <%}
                  else
                  {%> 
                                          <tr id="Tr<%=i+1 %>" class="crm-table-plural">
                                       <%} %> 
													<td nowrap="" align="center"><%=i %>&nbsp;</td>	
												<td nowrap=""><%=list1[i-1].Enname%>&nbsp;</td>
												<td nowrap=""><%=list1[i-1].Cnname %>&nbsp;</td>
												<td nowrap="">工作台&nbsp;</td>
                                                <%if(list1[i-1].Is_accountid>0){ %>
                                              
												<td nowrap="">是&nbsp;</td>
                                                <%}else{%>
                                                <td nowrap="">否&nbsp;</td>
                                                <%} %>
                                                 <%if (list1[i - 1].Is_contactid > 0)
                                                   { %>
												<td nowrap="">是&nbsp;</td>
                                                <%}else{%>
                                                <td nowrap="">否&nbsp;</td>
                                                <%} %>
												<%--<td nowrap=""><%=list1[i-1].Is_contactid %>&nbsp;</td>--%>
												<td nowrap=""><%=list1[i-1].Displayorder %>&nbsp;</td>
												<td nowrap=""><%=list1[i-1].Status %>&nbsp;</td>
												<td nowrap=""><a href="#" onclick="deleteCustomModule(17)">删除</a>&nbsp;|&nbsp;安装&nbsp;|&nbsp;<a href="#" onclick="uninstallCustomModule(17)">卸载</a>&nbsp;|&nbsp;<a href="#" onclick="exportCustomModule(17)">导出</a>&nbsp;</td>
									</tr><%} %>
          
						</tbody></table>

			<table border="0" cellpadding="5" cellspacing="0" width="100%">
			<tbody><tr><td align="center"><img src="admin_files/builder_flow.jpg" border="0"></td></tr>
			<tr>

			<td class="small" align="right" nowrap="nowrap"><a href="#top">[上]</a></td>
			</tr>
			</tbody></table>
	
