<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="DefaultFieldPermissions.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_DefaultFieldPermissions" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
    <td class="detail-content-td">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td valign="top">
     <div class="detail-panel-div">
											<script language="JAVASCRIPT" type="text/javascript" src="include/js/smoothscroll.js"></script>
<script language="JavaScript" type="text/javascript" src="include/js/menu.js"></script>
<br>
	<!-- DISPLAY -->
	<table border="0" cellspacing="0" cellpadding="5" width="100%" class="settingsSelUITopLine">
	<form action="index.aspx" method="post" name="new" id="form"></form>
	<input type="hidden" name="module" value="Users">
	<input type="hidden" name="parenttab" value="Settings">
	<input type="hidden" name="fld_module" id="fld_module" value="Accounts">
			<input type="hidden" name="action" value="EditDefOrgFieldLevelAccess">
		
	<tbody><tr>
		<td width="50" rowspan="2" valign="top"><img src="admin_files/orgshar.gif" alt="Users" width="48" height="48" border="0" title="Users"></td>
		<td colspan="2" class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 全局字段 </b></td>
		<td rowspan="2" class="small" align="right">&nbsp;</td>
	</tr>
	<tr>
		<td valign="top" class="small">定义模块的全局字段</td>
	</tr>
	</tbody></table>
	<table width="100%" border="0" cellpadding="5" cellspacing="0">
			<tbody><tr>
			<td style="padding-left:5px;" class="big">选择模块 :&nbsp; 
		<select name="Screen" style="width:30%;" onchange="changemodules(this)">
							
				<option value="Potentials">销售机会</option>
										
				<option value="Contacts">联系人</option>
												<option selected="" value="Accounts">客户</option>
										
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
			</td>
		<td class="small" align="right">
							<button class="pure-button pure-button-edit" title="编辑 [Alt+E]">
					<i class="icon-fixed-width icon-pencil"></i>编辑
				</button>&nbsp;
					</td>
			</tr>
	</tbody></table>
<div class="detail-panel-div" style="margin:5px;">
				<div id="Potentials_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 销售机会</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_1').className='prvPrfHoverOff'">销售机会名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_2').className='prvPrfHoverOff'">金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_3').className='prvPrfHoverOff'">客户名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_4').className='prvPrfHoverOff'">联系人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_1').className='prvPrfHoverOff'">预计成交日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_2').className='prvPrfHoverOff'">类型</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_3').className='prvPrfHoverOff'">下一步</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_4').className='prvPrfHoverOff'">客户来源</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_1').className='prvPrfHoverOff'">销售阶段</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_3').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_4').className='prvPrfHoverOff'">可能性 (%)</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_1').className='prvPrfHoverOff'">预期成交金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_2').className='prvPrfHoverOff'">营销活动</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_4').className='prvPrfHoverOff'">修改时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_5_1').className='prvPrfHoverOff'">阶段描述</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="1_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_5_2').className='prvPrfHoverOff'">状态</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Contacts_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 联系人</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_1').className='prvPrfHoverOff'">姓名</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_2').className='prvPrfHoverOff'">称呼</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_3').className='prvPrfHoverOff'">英文名</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_4').className='prvPrfHoverOff'">职位</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_1').className='prvPrfHoverOff'">客户名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_2').className='prvPrfHoverOff'">办公电话</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_3').className='prvPrfHoverOff'">手机</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_2_4"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_4').className='prvPrfHoverOff'">小灵通</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_1').className='prvPrfHoverOff'">传真</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_2').className='prvPrfHoverOff'">Email</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_3').className='prvPrfHoverOff'">客户来源</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_4').className='prvPrfHoverOff'">首要联系人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_3').className='prvPrfHoverOff'">家庭电话</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_4_4"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_4').className='prvPrfHoverOff'">其它电话</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_5_1"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_5_1').className='prvPrfHoverOff'">助理电话</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_5_2').className='prvPrfHoverOff'">部门</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_5_3"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_5_3').className='prvPrfHoverOff'">生日</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_5_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_5_4').className='prvPrfHoverOff'">经理</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_6_1"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_6_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_6_1').className='prvPrfHoverOff'">助理</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_6_2"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_6_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_6_2').className='prvPrfHoverOff'">MSN</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_6_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_6_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_6_3').className='prvPrfHoverOff'">QQ</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_6_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_6_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_6_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_7_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_7_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_7_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_7_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_7_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_7_2').className='prvPrfHoverOff'">联系人照片</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="2_7_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_7_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_7_3').className='prvPrfHoverOff'">描述</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Accounts_fields" style="display:block">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 客户</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_1_1" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">客户名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_1_2" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">客户编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_3').className='prvPrfHoverOff'">电话</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_4').className='prvPrfHoverOff'">网站</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_2_1" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">传真</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_2_2" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">其它电话</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_2_3" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">上级单位</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_2_4" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_4').className='prvPrfHoverOff'" class="prvPrfHoverOff">Email</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_3_1" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">员工人数</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_3_2" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">其它Email</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_3').className='prvPrfHoverOff'">客户来源</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_4').className='prvPrfHoverOff'">客户级别</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_4_1" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_4_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">客户状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_4_2" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_4_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">行业</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_4_3" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_4_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">公司性质</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_4_4" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_4_4').className='prvPrfHoverOff'" class="prvPrfHoverOff">类型</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_5_1"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_5_1').className='prvPrfHoverOff'">营业额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_5_2" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_5_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">公司成立时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_5_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_5_3').className='prvPrfHoverOff'">下次联系时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_5_4" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_5_4').className='prvPrfHoverOff'" class="prvPrfHoverOff">负责人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_6_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_6_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_6_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_6_2" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_6_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_6_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_6_3" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_6_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_6_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_6_4" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_6_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_6_4').className='prvPrfHoverOff'" class="prvPrfHoverOff">最新联系时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_7_1" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_7_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_7_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">最新发货日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_7_2" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_7_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_7_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">最新订单日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_7_3" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_7_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_7_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">最新报价日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_7_4" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_7_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_7_4').className='prvPrfHoverOff'" class="prvPrfHoverOff">联系次数</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_8_1" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_8_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_8_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">分配状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_8_2" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_8_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_8_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">保护开始日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_8_3" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_8_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_8_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">保护结束日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_8_4"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_8_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_8_4').className='prvPrfHoverOff'">开户行</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_9_1" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_9_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_9_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">开户名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_9_2" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_9_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_9_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">银行帐号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_9_3" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_9_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_9_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">纳税号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_9_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_9_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_9_4').className='prvPrfHoverOff'">支付方式</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_10_1"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_10_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_10_1').className='prvPrfHoverOff'">信用额度</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_10_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_10_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_10_2').className='prvPrfHoverOff'">订单数量</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_10_3" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_10_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_10_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">订单金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_10_4" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_10_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_10_4').className='prvPrfHoverOff'" class="prvPrfHoverOff">国家</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_11_1" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_11_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_11_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">省份</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_11_2" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_11_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_11_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">城市</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_11_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_11_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_11_3').className='prvPrfHoverOff'">地址</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_11_4" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_11_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_11_4').className='prvPrfHoverOff'" class="prvPrfHoverOff">邮箱地址</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_12_1" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_12_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_12_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">邮编</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_12_2" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_12_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_12_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_12_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_12_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_12_3').className='prvPrfHoverOff'">热点客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_12_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_12_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_12_4').className='prvPrfHoverOff'">热度</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_13_1" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_13_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_13_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">热点分类</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_13_2" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_13_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_13_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">热点说明</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_13_3"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_13_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_13_3').className='prvPrfHoverOff'">客户产品</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_13_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_13_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_13_4').className='prvPrfHoverOff'">首要联系人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_14_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_14_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_14_1').className='prvPrfHoverOff'">手机</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_14_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_14_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_14_2').className='prvPrfHoverOff'">最新进展</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_14_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_14_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_14_3').className='prvPrfHoverOff'">公用客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_14_4"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_14_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_14_4').className='prvPrfHoverOff'">旺旺</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_15_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_15_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_15_1').className='prvPrfHoverOff'">QQ</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="3_15_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_15_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_15_2').className='prvPrfHoverOff'">对对对</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Notes_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 联系记录</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_1').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_2').className='prvPrfHoverOff'">联系人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_3').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_4').className='prvPrfHoverOff'">联系类型</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_1').className='prvPrfHoverOff'">联系时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_3').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_2').className='prvPrfHoverOff'">销售机会</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_3').className='prvPrfHoverOff'">內容</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_4').className='prvPrfHoverOff'">最新评论时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_1').className='prvPrfHoverOff'">销售阶段</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_2').className='prvPrfHoverOff'">客户状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="4_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_3').className='prvPrfHoverOff'">下次回访日期</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="HelpDesk_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 报修单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_1').className='prvPrfHoverOff'">客户名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_2').className='prvPrfHoverOff'">联系人姓名</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_3').className='prvPrfHoverOff'">产品名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_4').className='prvPrfHoverOff'">负责人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_2').className='prvPrfHoverOff'">优先级</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_3').className='prvPrfHoverOff'">严重性</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_4').className='prvPrfHoverOff'">状态</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_1').className='prvPrfHoverOff'">分类</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_4').className='prvPrfHoverOff'">附件</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_1').className='prvPrfHoverOff'">描述</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="5_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_2').className='prvPrfHoverOff'">解决方案</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Products_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 产品</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_1').className='prvPrfHoverOff'">产品名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_2').className='prvPrfHoverOff'">产品编码</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_3').className='prvPrfHoverOff'">产品类别</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_4').className='prvPrfHoverOff'">型号</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_1').className='prvPrfHoverOff'">单位</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_2').className='prvPrfHoverOff'">安全库存量</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_3').className='prvPrfHoverOff'">供应商名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_4').className='prvPrfHoverOff'">网址</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_1').className='prvPrfHoverOff'">重量</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_2').className='prvPrfHoverOff'">总库存数量</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_4').className='prvPrfHoverOff'">修改时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_4_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_4_2').className='prvPrfHoverOff'">单价</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_4_3').className='prvPrfHoverOff'">建议成交价</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_4_4').className='prvPrfHoverOff'">成本价</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_5_1').className='prvPrfHoverOff'">产品图片</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_5_2').className='prvPrfHoverOff'">描述</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_5_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_5_3').className='prvPrfHoverOff'">是否启用产品序列号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_5_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_5_4').className='prvPrfHoverOff'">销量</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_6_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_6_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_6_1').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="6_6_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_6_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_6_2').className='prvPrfHoverOff'">是否启用产品规格</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Faq_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 常见问题</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_1').className='prvPrfHoverOff'">产品名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_2').className='prvPrfHoverOff'">分类</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_3').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_4').className='prvPrfHoverOff'">创建人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_1').className='prvPrfHoverOff'">关键字</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_2').className='prvPrfHoverOff'">编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_3').className='prvPrfHoverOff'">查看次数</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_4').className='prvPrfHoverOff'">问题</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_1').className='prvPrfHoverOff'">解决方案</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="7_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_3').className='prvPrfHoverOff'">修改时间</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Events_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 日程安排</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_1_3').className='prvPrfHoverOff'">开始日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_1_4').className='prvPrfHoverOff'">结束日期</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_2_1').className='prvPrfHoverOff'">优先级</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_2_2').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_2_3').className='prvPrfHoverOff'">事件类型</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_2_4').className='prvPrfHoverOff'">地点</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_3_1').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_3_2').className='prvPrfHoverOff'">联系人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_3_3').className='prvPrfHoverOff'">销售机会</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_3_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_4_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_4_2').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="8_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_4_3').className='prvPrfHoverOff'">创建人</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Vendors_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 供应商</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_1_1').className='prvPrfHoverOff'">供应商名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_1_3').className='prvPrfHoverOff'">编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_1_4').className='prvPrfHoverOff'">电话</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_2_1').className='prvPrfHoverOff'">传真</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_2_2').className='prvPrfHoverOff'">Email</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_2_3').className='prvPrfHoverOff'">网站</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_2_4').className='prvPrfHoverOff'">员工人数</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_3_1').className='prvPrfHoverOff'">供应商级别</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_3_2').className='prvPrfHoverOff'">供应商状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_3_3').className='prvPrfHoverOff'">行业</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_3_4').className='prvPrfHoverOff'">公司性质</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_4_1').className='prvPrfHoverOff'">营业额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_4_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_4_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_4_4').className='prvPrfHoverOff'">国家</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_5_1').className='prvPrfHoverOff'">省份</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_5_2').className='prvPrfHoverOff'">城市</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_5_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_5_3').className='prvPrfHoverOff'">街道</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_5_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_5_4').className='prvPrfHoverOff'">邮编</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="9_6_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_6_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_6_1').className='prvPrfHoverOff'">描述</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="PriceBooks_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 价目表</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="10_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_1_1').className='prvPrfHoverOff'">价目表名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="10_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_1_2').className='prvPrfHoverOff'">起订数量</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="10_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_1_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="10_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_1_4').className='prvPrfHoverOff'">修改时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="10_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_2_1').className='prvPrfHoverOff'">描述</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="10_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_2_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="10_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_2_3').className='prvPrfHoverOff'">创建人</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Quotes_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 报价单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_1_1').className='prvPrfHoverOff'">报价单编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_1_2').className='prvPrfHoverOff'">销售机会名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_1_3').className='prvPrfHoverOff'">报价单阶段</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_1_4').className='prvPrfHoverOff'">报价日期</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_2_1').className='prvPrfHoverOff'">客户名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_2_2').className='prvPrfHoverOff'">联系人姓名</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_2_3').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_2_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_3_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_3_2').className='prvPrfHoverOff'">货币</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_3_3').className='prvPrfHoverOff'">汇率</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_3_4').className='prvPrfHoverOff'">描述</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_4_1').className='prvPrfHoverOff'">付款条件</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_4_2').className='prvPrfHoverOff'">审批人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="11_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_4_3').className='prvPrfHoverOff'">审批状态</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="PurchaseOrder_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 进货单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_1_1').className='prvPrfHoverOff'">进货单</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_1_2').className='prvPrfHoverOff'">供应商名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_1_3').className='prvPrfHoverOff'">采购日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_1_4').className='prvPrfHoverOff'">状态</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_2_1').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_2_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_2_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_2_4').className='prvPrfHoverOff'">货币</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_3_1').className='prvPrfHoverOff'">汇率</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_3_2').className='prvPrfHoverOff'">审批状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_3_3').className='prvPrfHoverOff'">审批人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_3_4').className='prvPrfHoverOff'">合同订单</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_4_1').className='prvPrfHoverOff'">联系人姓名</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_4_2').className='prvPrfHoverOff'">描述</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_4_3').className='prvPrfHoverOff'">条件和条款</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_4_4').className='prvPrfHoverOff'">入库状态</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="12_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_5_1').className='prvPrfHoverOff'">付款状态</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="SalesOrder_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 合同订单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_1_1').className='prvPrfHoverOff'">合同订单编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_1_2').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_1_3').className='prvPrfHoverOff'">客户名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_1_4').className='prvPrfHoverOff'">联系人姓名</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_2_1').className='prvPrfHoverOff'">销售机会名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_2_2').className='prvPrfHoverOff'">报价编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_2_3').className='prvPrfHoverOff'">签约日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_2_4').className='prvPrfHoverOff'">负责人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_3_1').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_3_2').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_3_3').className='prvPrfHoverOff'">货币</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_3_4').className='prvPrfHoverOff'">汇率</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_4_1').className='prvPrfHoverOff'">审批状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_4_2').className='prvPrfHoverOff'">审批人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_4_3').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_4_4').className='prvPrfHoverOff'">描述</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_5_1').className='prvPrfHoverOff'">条件和条款</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_5_2').className='prvPrfHoverOff'">出库状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_5_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_5_3').className='prvPrfHoverOff'">订单毛利</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_5_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_5_4').className='prvPrfHoverOff'">收款状态</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_6_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_6_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_6_1').className='prvPrfHoverOff'">发票状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="13_6_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_6_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_6_2').className='prvPrfHoverOff'">结束日期</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Invoice_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 发货单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_1_1').className='prvPrfHoverOff'">发货单编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_1_2"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_1_2').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_1_3').className='prvPrfHoverOff'">客户名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_1_4').className='prvPrfHoverOff'">联系人名称</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_2_1').className='prvPrfHoverOff'">合同订单</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_2_2').className='prvPrfHoverOff'">开单日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_2_3').className='prvPrfHoverOff'">发货日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_2_4').className='prvPrfHoverOff'">负责人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_3_1').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_3_2').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_3_3').className='prvPrfHoverOff'">货币</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_3_4').className='prvPrfHoverOff'">汇率</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_4_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_4_2').className='prvPrfHoverOff'">快递单号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_4_3').className='prvPrfHoverOff'">审批人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_4_4"><img src="admin_files/no.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_4_4').className='prvPrfHoverOff'">审批状态</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_5_1').className='prvPrfHoverOff'">描述</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_5_2').className='prvPrfHoverOff'">付款条件</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_5_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_5_3').className='prvPrfHoverOff'">出库状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="14_5_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('14_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('14_5_4').className='prvPrfHoverOff'">收款状态</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Campaigns_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 营销活动</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_1_1').className='prvPrfHoverOff'">营销活动名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_1_2').className='prvPrfHoverOff'">营销活动类型</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_1_3').className='prvPrfHoverOff'">产品</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_1_4').className='prvPrfHoverOff'">营销活动状态</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_2_1').className='prvPrfHoverOff'">预期结束日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_2_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_2_3').className='prvPrfHoverOff'">发送数量</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_2_4').className='prvPrfHoverOff'">发起者</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_3_1').className='prvPrfHoverOff'">目标听众</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_3_2').className='prvPrfHoverOff'">目标大小</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_3_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_3_4').className='prvPrfHoverOff'">修改时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_4_1').className='prvPrfHoverOff'">预期反应</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_4_2').className='prvPrfHoverOff'">预期收入</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_4_3').className='prvPrfHoverOff'">成本预算</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_4_4').className='prvPrfHoverOff'">实际成本</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_5_1').className='prvPrfHoverOff'">预期反应数量</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_5_2').className='prvPrfHoverOff'">预期销售数量</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_5_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_5_3').className='prvPrfHoverOff'">预期回报率</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_5_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_5_4').className='prvPrfHoverOff'">实际反应数量</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_6_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_6_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_6_1').className='prvPrfHoverOff'">实际销售数量</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_6_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_6_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_6_2').className='prvPrfHoverOff'">实际回报率</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="15_6_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('15_6_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('15_6_3').className='prvPrfHoverOff'">描述</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Gathers_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 应收款</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_1_1').className='prvPrfHoverOff'">应收款编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_1_2').className='prvPrfHoverOff'">外币备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_1_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_1_4').className='prvPrfHoverOff'">合同订单</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_2_1').className='prvPrfHoverOff'">发货单</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_2_2').className='prvPrfHoverOff'">应收金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_2_3').className='prvPrfHoverOff'">应收日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_2_4').className='prvPrfHoverOff'">实收金额</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_3_1').className='prvPrfHoverOff'">收款日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_3_2').className='prvPrfHoverOff'">是否收款</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_3_3').className='prvPrfHoverOff'">是否开发票</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_3_4').className='prvPrfHoverOff'">期次</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_4_1').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_4_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_4_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_4_4').className='prvPrfHoverOff'">备注</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_5_1').className='prvPrfHoverOff'">货币</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="16_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('16_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('16_5_2').className='prvPrfHoverOff'">汇率</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Charges_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 应付款</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_1_1').className='prvPrfHoverOff'">应付款编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_1_2').className='prvPrfHoverOff'">外币备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_1_3').className='prvPrfHoverOff'">供应商</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_1_4').className='prvPrfHoverOff'">进货单</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_2_1').className='prvPrfHoverOff'">应付金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_2_2').className='prvPrfHoverOff'">应付日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_2_3').className='prvPrfHoverOff'">实付金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_2_4').className='prvPrfHoverOff'">付款日期</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_3_1').className='prvPrfHoverOff'">是否付款</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_3_2').className='prvPrfHoverOff'">是否开发票</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_3_3').className='prvPrfHoverOff'">期次</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_3_4').className='prvPrfHoverOff'">负责人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_4_1').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_4_2').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_4_3').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_4_4').className='prvPrfHoverOff'">Tuihuos</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_5_1').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_5_2').className='prvPrfHoverOff'">货币</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_5_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_5_3').className='prvPrfHoverOff'">汇率</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="17_5_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('17_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('17_5_4').className='prvPrfHoverOff'">付款类别</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Expenses_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 费用报销</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_1_1').className='prvPrfHoverOff'">费用编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_1_2').className='prvPrfHoverOff'">金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_1_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_1_4').className='prvPrfHoverOff'">联系人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_2_1').className='prvPrfHoverOff'">进度</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_2_2').className='prvPrfHoverOff'">日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_2_3').className='prvPrfHoverOff'">审批人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_2_4').className='prvPrfHoverOff'">审批状态</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_3_1').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_3_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_3_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_3_4').className='prvPrfHoverOff'">备注</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_4_1').className='prvPrfHoverOff'">销售机会</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_4_2').className='prvPrfHoverOff'">联系记录</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_4_3').className='prvPrfHoverOff'">财务信息</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="18_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('18_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('18_4_4').className='prvPrfHoverOff'">创建人</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Documents_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 文档中心</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="19_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('19_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('19_1_1').className='prvPrfHoverOff'">文档名称</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="19_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('19_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('19_1_2').className='prvPrfHoverOff'">文档类型</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="19_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('19_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('19_1_3').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="19_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('19_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('19_1_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="19_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('19_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('19_2_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="19_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('19_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('19_2_2').className='prvPrfHoverOff'">文档内容</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Cares_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 客户关怀</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_1_1').className='prvPrfHoverOff'">关怀主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_1_2').className='prvPrfHoverOff'">关怀日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_1_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_1_4').className='prvPrfHoverOff'">联系人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_2_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_2_2').className='prvPrfHoverOff'">执行人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_2_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_2_4').className='prvPrfHoverOff'">修改时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_3_1').className='prvPrfHoverOff'">关怀类型</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_3_2').className='prvPrfHoverOff'">反馈内容</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_3_3').className='prvPrfHoverOff'">报修单</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="20_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('20_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('20_3_4').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Checks_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 盘点</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="21_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('21_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('21_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="21_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('21_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('21_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="21_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('21_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('21_1_3').className='prvPrfHoverOff'">盘点日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="21_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('21_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('21_1_4').className='prvPrfHoverOff'">状态</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="21_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('21_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('21_2_1').className='prvPrfHoverOff'">盘点人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="21_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('21_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('21_2_2').className='prvPrfHoverOff'">仓库</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="21_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('21_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('21_2_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="21_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('21_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('21_2_4').className='prvPrfHoverOff'">修改时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="21_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('21_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('21_3_1').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Deliverys_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 出库单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_1_1').className='prvPrfHoverOff'">出库单编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_1_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_1_4').className='prvPrfHoverOff'">联系人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_2_1').className='prvPrfHoverOff'">合同订单</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_2_2').className='prvPrfHoverOff'">出库日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_2_3').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_2_4').className='prvPrfHoverOff'">仓库</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_3_1').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_3_2').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_3_3').className='prvPrfHoverOff'">审批状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_3_4').className='prvPrfHoverOff'">审批人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_4_1').className='prvPrfHoverOff'">发货单</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="22_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('22_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('22_4_2').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Warehouses_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 入库单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_1_1').className='prvPrfHoverOff'">入库单编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_1_3').className='prvPrfHoverOff'">进货单</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_1_4').className='prvPrfHoverOff'">入库日期</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_2_1').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_2_2').className='prvPrfHoverOff'">仓库</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_2_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_2_4').className='prvPrfHoverOff'">修改时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_3_1').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="23_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('23_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('23_3_2').className='prvPrfHoverOff'">供应商</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Vcontacts_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 供应商联系人</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_1_1').className='prvPrfHoverOff'">姓名</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_1_2').className='prvPrfHoverOff'">供应商</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_1_3').className='prvPrfHoverOff'">称呼</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_1_4').className='prvPrfHoverOff'">英文名</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_2_1').className='prvPrfHoverOff'">职位</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_2_2').className='prvPrfHoverOff'">公司电话</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_2_3').className='prvPrfHoverOff'">手机</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_2_4').className='prvPrfHoverOff'">小灵通</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_3_1').className='prvPrfHoverOff'">传真</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_3_2').className='prvPrfHoverOff'">Email</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_3_3').className='prvPrfHoverOff'">家庭电话</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_3_4').className='prvPrfHoverOff'">其他电话</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_4_1').className='prvPrfHoverOff'">助手</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_4_2').className='prvPrfHoverOff'">助手电话</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_4_3').className='prvPrfHoverOff'">部门</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_4_4').className='prvPrfHoverOff'">生日</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_5_1').className='prvPrfHoverOff'">MSN</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_5_2').className='prvPrfHoverOff'">QQ</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_5_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_5_3').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_5_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_5_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_6_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_6_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_6_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="24_6_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('24_6_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('24_6_2').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Tuihuos_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 销售退货单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_1_1').className='prvPrfHoverOff'">编号</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_1_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_1_4').className='prvPrfHoverOff'">客户编号</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_2_1').className='prvPrfHoverOff'">退货日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_2_2').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_2_3').className='prvPrfHoverOff'">经办人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_2_4').className='prvPrfHoverOff'">退货原因</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_3_1').className='prvPrfHoverOff'">审批状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_3_2').className='prvPrfHoverOff'">审批人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_3_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_3_4').className='prvPrfHoverOff'">修改时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_4_1').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_4_2').className='prvPrfHoverOff'">仓库</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_4_3').className='prvPrfHoverOff'">货币</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_4_4').className='prvPrfHoverOff'">汇率</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="25_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('25_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('25_5_1').className='prvPrfHoverOff'">合同单号</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Vnotes_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 供应商联系记录</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="26_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('26_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('26_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="26_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('26_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('26_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="26_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('26_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('26_1_3').className='prvPrfHoverOff'">供应商</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="26_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('26_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('26_1_4').className='prvPrfHoverOff'">供应商联系人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="26_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('26_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('26_2_1').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="26_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('26_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('26_2_2').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="26_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('26_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('26_2_3').className='prvPrfHoverOff'">联系类型</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="26_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('26_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('26_2_4').className='prvPrfHoverOff'">联系日期</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="26_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('26_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('26_3_1').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Billings_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 发票管理</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_1_1').className='prvPrfHoverOff'">开票内容</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_1_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_1_4').className='prvPrfHoverOff'">合同订单</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_2_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_2_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_2_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_2_4').className='prvPrfHoverOff'">票据类型</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_3_1').className='prvPrfHoverOff'">票据金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_3_2').className='prvPrfHoverOff'">发票号码</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_3_3').className='prvPrfHoverOff'">开票日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_3_4').className='prvPrfHoverOff'">经手人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_4_1').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_4_2').className='prvPrfHoverOff'">金额总计</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="27_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('27_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('27_4_3').className='prvPrfHoverOff'">成本总计</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Duishous_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 竞争对手</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_1_1').className='prvPrfHoverOff'">优势</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_1_2').className='prvPrfHoverOff'">竞争产品/方案</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_1_3').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_1_4').className='prvPrfHoverOff'">公司名称</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_2_1').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_2_2').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_2_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_2_4').className='prvPrfHoverOff'">修改时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_3_1').className='prvPrfHoverOff'">价格</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_3_2').className='prvPrfHoverOff'">竞争能力</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_3_3').className='prvPrfHoverOff'">劣势</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="28_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('28_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('28_3_4').className='prvPrfHoverOff'">应对策略</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Warehousetransfers_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 库间调拨</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_1_3').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_1_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_2_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_2_2').className='prvPrfHoverOff'">审批人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_2_3').className='prvPrfHoverOff'">审批状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_2_4').className='prvPrfHoverOff'">出货仓库</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_3_1').className='prvPrfHoverOff'">入货仓库</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_3_2').className='prvPrfHoverOff'">调拨日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_3_3').className='prvPrfHoverOff'">验货人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_3_4').className='prvPrfHoverOff'">状态</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="29_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('29_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('29_4_1').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Complaints_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 客户投诉</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_1_1').className='prvPrfHoverOff'">投诉分类</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_1_2').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_1_3').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_1_4').className='prvPrfHoverOff'">创建人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_2_1').className='prvPrfHoverOff'">联系人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_2_2').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_2_3').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_2_4').className='prvPrfHoverOff'">主题</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_3_1').className='prvPrfHoverOff'">投诉日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_3_2').className='prvPrfHoverOff'">投诉时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_3_3').className='prvPrfHoverOff'">紧急程度</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_3_4').className='prvPrfHoverOff'">处理结果</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_4_1').className='prvPrfHoverOff'">花费时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_4_2').className='prvPrfHoverOff'">处理过程</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_4_3').className='prvPrfHoverOff'">客户反馈</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_4_4').className='prvPrfHoverOff'">回访确认</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_5_1').className='prvPrfHoverOff'">描述</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="30_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('30_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('30_5_2').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Accountrecordss_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 客户服务</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_1_1').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_1_2').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_1_3').className='prvPrfHoverOff'">服务内容</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_1_4').className='prvPrfHoverOff'">客户反馈</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_2_1').className='prvPrfHoverOff'">记录单状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_2_2').className='prvPrfHoverOff'">花费时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_2_3').className='prvPrfHoverOff'">开始时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_2_4').className='prvPrfHoverOff'">开始日期</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_3_1').className='prvPrfHoverOff'">服务方式</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_3_2').className='prvPrfHoverOff'">服务类型</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_3_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_3_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_4_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_4_2').className='prvPrfHoverOff'">联系人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_4_3').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_4_4').className='prvPrfHoverOff'">负责人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="31_5_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('31_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('31_5_1').className='prvPrfHoverOff'">客户</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Noteplans_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 客户任务计划</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_1_2').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_1_3').className='prvPrfHoverOff'">认领</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_1_4').className='prvPrfHoverOff'">是否修改客户负责人为执行人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_2_1').className='prvPrfHoverOff'">开始日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_2_2').className='prvPrfHoverOff'">结束日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_2_3').className='prvPrfHoverOff'">执行人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_2_4').className='prvPrfHoverOff'">负责人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_3_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_3_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_3_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="32_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('32_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('32_3_4').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Chargesrecords_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 付款单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_1_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_1_4').className='prvPrfHoverOff'">供应商</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_2_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_2_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_2_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_2_4').className='prvPrfHoverOff'">付款日期</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_3_1').className='prvPrfHoverOff'">付款金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_3_2').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_3_3').className='prvPrfHoverOff'">摘要</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="33_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('33_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('33_3_4').className='prvPrfHoverOff'">帐号</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Gathersrecords_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 收款单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_1_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_1_4').className='prvPrfHoverOff'">创建人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_2_1').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_2_2').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_2_3').className='prvPrfHoverOff'">收款时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_2_4').className='prvPrfHoverOff'">收款金额</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_3_1').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_3_2').className='prvPrfHoverOff'">是否开发票</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_3_3').className='prvPrfHoverOff'">摘要</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="34_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('34_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('34_3_4').className='prvPrfHoverOff'">帐号</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Openingbalancess_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 期初余额</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_1_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_1_4').className='prvPrfHoverOff'">供应商</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_2_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_2_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_2_3').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_2_4').className='prvPrfHoverOff'">类型</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_3_1').className='prvPrfHoverOff'">摘要</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_3_2').className='prvPrfHoverOff'">期初金额</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="35_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('35_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('35_3_3').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Memdays_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 纪念日</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_1_1').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_1_2').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_1_3').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_1_4').className='prvPrfHoverOff'">下次提醒</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_2_1').className='prvPrfHoverOff'">联系人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_2_2').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_2_3').className='prvPrfHoverOff'">客户</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_2_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_3_1').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_3_2').className='prvPrfHoverOff'">纪念日类型</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_3_3').className='prvPrfHoverOff'">纪念日</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="36_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('36_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('36_3_4').className='prvPrfHoverOff'">日历类型</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Maillisttmps_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 邮件模板</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="37_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('37_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('37_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="37_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('37_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('37_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="37_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('37_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('37_1_3').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="37_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('37_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('37_1_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="37_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('37_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('37_2_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="37_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('37_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('37_2_2').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Qunfatmps_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 短信模板</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="38_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('38_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('38_1_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="38_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('38_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('38_1_2').className='prvPrfHoverOff'">负责人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="38_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('38_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('38_1_3').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="38_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('38_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('38_1_4').className='prvPrfHoverOff'">创建时间</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="38_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('38_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('38_2_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="38_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('38_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('38_2_2').className='prvPrfHoverOff'">备注</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
				<div id="Packorders_fields" style="display:none">	
		<table cellspacing="0" cellpadding="5" width="100%" class="small">
		<tbody><tr>
		<td colspan="2" valign="top" nowrap="">
		<b>可选的字段 装配出入库单</b>
		</td>
	</tr>
	<tr>
				<td valign="top" width="25%">
			<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
									<tbody><tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_1_1').className='prvPrfHoverOff'">备注</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_1_2').className='prvPrfHoverOff'">日期</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_1_3').className='prvPrfHoverOff'">类型</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_1_4').className='prvPrfHoverOff'">审批人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_2_1').className='prvPrfHoverOff'">修改时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_2_2').className='prvPrfHoverOff'">创建时间</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_2_3').className='prvPrfHoverOff'">创建人</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_2_4').className='prvPrfHoverOff'">负责人</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_3_1').className='prvPrfHoverOff'">主题</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_3_2').className='prvPrfHoverOff'">审批状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_3_3').className='prvPrfHoverOff'">入库仓库</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_3_4').className='prvPrfHoverOff'">出库仓库</td>
										</tr>
												<tr>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_4_1').className='prvPrfHoverOff'">装配方案</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_4_2').className='prvPrfHoverOff'">状态</td>
											<td style="width:20px">&nbsp;</td>
							<td width="5%" id="39_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
							<td width="25%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('39_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('39_4_3').className='prvPrfHoverOff'">装配数量</td>
										</tr>
											</tbody></table>
		</td>
			</tr>
			</tbody></table>
	</div>
	</div>
</div>
</td>
                </tr>
            </tbody>
        </table>
    </td>
</asp:Content>