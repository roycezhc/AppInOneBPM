<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ROLEMange_Add.aspx.cs" Inherits="cmd123wj_ROLEMange_Add_crmwj" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%--<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>--%>

<head runat="server">
	<title>boss - 客户 - 客户 - 易客CRM</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<style type="text/css">@import url("themes/softed/style.black.css");</style>
		
	<link rel="stylesheet" href="themes/softed/font-awesome/buttons-min.css">
	<link rel="stylesheet" href="themes/softed/font-awesome/font-awesome.min.css">
	
	
	<style type="text/css">
	#ActivityRemindercallback{position:fixed;right:0px;bottom:2px;display:block;padding:0px;z-index:10;font-weight:normal;}
        </style>
	<script language="javascript" type="text/javascript" src="include/scriptaculous/jquery-1.10.1.min.js"></script>
	<script language="javascript" type="text/javascript" src="include/scriptaculous/jquery-ui-1.10.2.min.js"></script>
	<script type="text/javascript">
	    var Jquery = $;
	</script>
	<script language="javascript" type="text/javascript" src="include/scriptaculous/prototype.min.js"></script>
	<script language="javascript" type="text/javascript" src="include/scriptaculous/dom-drag.js"></script>
	<script language="JavaScript" type="text/javascript" src="include/js/zh_cn.lang.js"></script>
	<script language="JavaScript" type="text/javascript" src="include/js/general.js"></script>
	<script language="JavaScript" type="text/javascript" src="include/js/json.js"></script>
	
	<script language="javascript">
	    javaCalendarFirstDayOfWeek = 1;
	    var userDateFormat = "yyyy-mm-dd";
        </script>
</head>
	<body leftmargin=0 topmargin=0 marginheight=0 marginwidth=0 class=small runat="server">
	<TABLE border=0 cellspacing=0 cellpadding=0 width=100% class="crm-head-tab">
	<tr>
		<td valign=top style="white-space:nowrap;padding-left:20px;">
			<a href="http://www.c3crm.com" target="_blank" class="crm-one-link" style="font-size:14px;">
				上海瑞策软件有限公司
			</a>
		</td>
		<td width=100% align=center class="crm-tab-note">

<script language="javascript" type="text/javascript">

    var skip_module = "Accounts";
    var skip_action = "EditView";
    var skip_record = "";

    function selectTheme(stylecss) {
        if (stylecss != "") {
            if (!skip_module) skip_module = "Home";
            if (!skip_action) skip_action = "index";
            if (skip_record && skip_record > 0) {
                location.href = "index.php?module=" + skip_module + "&action=" + skip_action + "&record=" + skip_record + "" +
												"&parenttab=Home&stylecss=" + stylecss;
            } else {
                location.href = "index.php?module=" + skip_module + "&action=" + skip_action + "" +
												"&parenttab=Home&stylecss=" + stylecss;
            }
        }
    }
			    
			</script>
		</td>
		<td class=small nowrap>
			<table border=0 cellspacing=0 cellpadding=0 class="head-tool-tab">
				<tr>
					<td nowrap>
						今天是03月04日，欢迎您 &nbsp;&nbsp; 
						<a href="" onclick="ListBulkDownDrop(this,'headtooltabdiv');return false;">
							老板(总经理)
						</a>
						<i class="icon-angle-down">

						<div id="headtooltabdiv" class="list-bulk-div" style="width:100px;margin-left:20px;" 
							onMouseOut="ListBulkHideDrop('headtooltabdiv')" 
							onMouseOver="ListBulkShowDrop('headtooltabdiv')">

							<div onClick='location.href="index.php?module=Users&action=DetailView&record=37&modechk=prefview";'>
								我的设置
							</div>
							<div onClick='window.open("index.php?module=ApproveStatus&action=PopupListView","test",
											"width=800,height=450,resizable=1,scrollbars=1");'>
								我的审批
							</div>
							<div class="list-bulk-link" onclick='window.open("index.php?module=Home&action=PopupCommentInfoCenter","Comment","width=750,height=450,resizable=1,scrollbars=1");'>
								我的评论
							</div>
							<div onClick='window.open("index.php?module=CustomReminder&action=PopupReminders",
											"test","width=700,height=602,resizable=1,scrollbars=1");'>
								我的提醒
							</div>
							<div  onclick='window.open("index.php?module=Home&action=PopupPM","Chat","width=600,height=450,resizable=1,scrollbars=1");'>
								我的消息
							</div>
							<div class="list-bulk-link"    onclick='window.open("index.php?module=Home&action=PopupAttementInfoCenter","ATT","width=750,height=450,resizable=1,scrollbars=1");'>
								我的附件
							</div>
							<div onClick='location.href="index.php?module=Users&action=Logout";'>
								安全退出
							</div>
						</div>
					</td>

					<td nowrap>
						<i class="icon-info">&nbsp;
						<a href="http://www.c3crm.com/forum/" target="_blank">我要提问</a>
					</td>
					<td nowrap>
													<a href="" onclick="ListBulkDownDrop(this,'switchstylediv');return false;">
								默认
							</a>
							<i class="icon-angle-down">

							<div id="switchstylediv" class="list-bulk-div" style="width:70px;margin-left:50px;" 
								onMouseOut="ListBulkHideDrop('switchstylediv')" 
								onMouseOver="ListBulkShowDrop('switchstylediv')">
																	<div onclick="selectTheme('black');">
										默认
									</div>
																	<div onclick="selectTheme('green');">
										绿色
									</div>
																	<div onclick="selectTheme('red');">
										红色
									</div>
																	<div onclick="selectTheme('blue');">
										蓝色
									</div>
															</div>
											</td>
				</tr>
		</table>
	</td></tr>
	</TABLE>

<!-- header - master tabs -->
<TABLE border=0 cellspacing=0 cellpadding=0 width=100% class="crm-head-tab" height=33px style="margin-bottom:-1px;">
<tr>
	<td style="width:20px" class=small>&nbsp;</td>
	<td class=small nowrap> 
		<table border=0 cellspacing=0 cellpadding=0 height=27px>
			<tr>
																																			  <td class="crm-head-link"  onmouseover="fnDropDown(this,'Home_sub');" onMouseOut="fnHideDrop('Home_sub');" align="center" nowrap><a href="index.php?module=Home&action=index&parenttab=Home"><i class=icon-home> 工作台</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
																								  <td class="crm-head-link"  onmouseover="fnDropDown(this,'Marketing_sub');" onMouseOut="fnHideDrop('Marketing_sub');" align="center" nowrap><a href="index.php?module=Campaigns&action=index&parenttab=Marketing">营销</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
																								  <td class="crm-head-link"  onmouseover="fnDropDown(this,'sfa_sub');" onMouseOut="fnHideDrop('sfa_sub');" align="center" nowrap><a href="index.php?module=Aboutsfas&action=index&parenttab=sfa">销售自动化</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
																								  <td class="crm-head-link-on"  onmouseover="fnDropDown(this,'Customer_sub');" onMouseOut="fnHideDrop('Customer_sub');" align="center" nowrap><a href="index.php?module=Accounts&action=index&parenttab=Customer">客户</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
																								  <td class="crm-head-link"  onmouseover="fnDropDown(this,'Product_sub');" onMouseOut="fnHideDrop('Product_sub');" align="center" nowrap><a href="index.php?module=Products&action=index&parenttab=Product">产品</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
																								  <td class="crm-head-link"  onmouseover="fnDropDown(this,'Sales_sub');" onMouseOut="fnHideDrop('Sales_sub');" align="center" nowrap><a href="index.php?module=WorkMaps&action=index&parenttab=Sales">销售</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
																								  <td class="crm-head-link"  onmouseover="fnDropDown(this,'Support_sub');" onMouseOut="fnHideDrop('Support_sub');" align="center" nowrap><a href="index.php?module=Inboundsearchs&action=index&parenttab=Support">售后</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
																								  <td class="crm-head-link"  onmouseover="fnDropDown(this,'Inventory_sub');" onMouseOut="fnHideDrop('Inventory_sub');" align="center" nowrap><a href="index.php?module=Isteps&action=index&parenttab=Inventory">库存</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
																								  <td class="crm-head-link"  onmouseover="fnDropDown(this,'Accounting_sub');" onMouseOut="fnHideDrop('Accounting_sub');" align="center" nowrap><a href="index.php?module=Fsteps&action=index&parenttab=Accounting">财务</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
																								  <td class="crm-head-link"  onmouseover="fnDropDown(this,'Analytics_sub');" onMouseOut="fnHideDrop('Analytics_sub');" align="center" nowrap><a href="index.php?module=Integradedreports&action=index&parenttab=Analytics">报表</a></td>
					  
										<!--[if IE]>
					<td style="width:1px" class=small>&nbsp;</td>
					<![endif]-->
							</tr>
		</table>
	</td>
	<td align=right style="padding-right:10px" >
		<table border=0 cellspacing=0 cellpadding=0 id="search" style="border:1px solid #999999;background-color:white">
		   <tr>
			<form name="UnifiedSearch" method="post" action="index.php" style="margin:0px">
			<td style="height:19px;background-color:#ffffef" >
				<input type="hidden" name="action" value="UnifiedSearch" style="margin:0px"><!--AccountSearch-->
				<input type="hidden" name="module" value="Home" style="margin:0px">
				<input type="text" name="query_string" id="query_string" value="支持拼音字头..." class="searchBox" onFocus="this.value=''" >
			</td>
			<td style="background-color:#cccccc">
				<input type="submit" class="searchBtn" value="客户查找" alt="客户查询支持客户名称、拼音字头、完整的客户编号、手机号码、电话号码、传真号码、Email和QQ" title="客户查询支持客户名称、拼音字头、完整的客户编号、手机号码、电话号码、传真号码、Email和QQ">
			</td>
			</form>
		   </tr>
		</table>
	</td>
</td>
</tr>
</TABLE>
<!-- - level 2 tabs starts-->
<TABLE border=0 cellspacing=0 cellpadding=2 width=100% class="crm-head-level">
<tr>
	<td >
		<table border=0 cellspacing=0 cellpadding=0>
		<tr>
			<td style="width:20px" class=small>&nbsp;</td>
																																														<td class="crm-head-level-tab crm-head-level-tab-on" nowrap><a href="index.php?module=Accounts&action=index&parenttab=Customer">客户</a></td>
							
																		<td class="crm-head-level-tab" nowrap> <a href="index.php?module=Contacts&action=index&parenttab=Customer">联系人</a> </td>
							
																		<td class="crm-head-level-tab" nowrap> <a href="index.php?module=Notes&action=index&parenttab=Customer">联系记录</a> </td>
							
																		<td class="crm-head-level-tab" nowrap> <a href="index.php?module=Pools&action=index&parenttab=Customer">客户池</a> </td>
							
																		<td class="crm-head-level-tab" nowrap> <a href="index.php?module=Memdays&action=index&parenttab=Customer">纪念日</a> </td>
							
																																																								</tr>
		</table>
	</td>
</tr>
</TABLE>		
<!-- Drop Down Menu in the Main Tab -->
<div class="crm-head-dropmnu" id="Home_sub" onMouseOut="fnHideDrop('Home_sub')" onMouseOver="fnShowDrop('Home_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=Home&action=index&parenttab=Home">工作台</a></td></tr>
				<tr><td><a href="index.php?module=Knowledgebases&action=index&parenttab=Home">公司平台</a></td></tr>
				<tr><td><a href="index.php?module=Calendar&action=index&parenttab=Home">日程安排</a></td></tr>
				<tr><td><a href="index.php?module=Announcements&action=index&parenttab=Home">公告</a></td></tr>
			</table>
</div>
<div class="crm-head-dropmnu" id="Marketing_sub" onMouseOut="fnHideDrop('Marketing_sub')" onMouseOver="fnShowDrop('Marketing_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=Campaigns&action=index&parenttab=Marketing">营销活动</a></td></tr>
				<tr><td><a href="index.php?module=Qunfas&action=index&parenttab=Marketing">群发短信</a></td></tr>
				<tr><td><a href="index.php?module=Maillists&action=index&parenttab=Marketing">群发邮件</a></td></tr>
			</table>
</div>
<div class="crm-head-dropmnu" id="sfa_sub" onMouseOut="fnHideDrop('sfa_sub')" onMouseOver="fnShowDrop('sfa_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=Aboutsfas&action=index&parenttab=sfa">关于SFA</a></td></tr>
				<tr><td><a href="index.php?module=SfaDesktops&action=index&parenttab=sfa">SFA工作台</a></td></tr>
				<tr><td><a href="index.php?module=Sfalists&action=index&parenttab=sfa">SFA序列</a></td></tr>
				<tr><td><a href="index.php?module=Sfalogs&action=index&parenttab=sfa">执行日志</a></td></tr>
				<tr><td><a href="index.php?module=Sfasettings&action=index&parenttab=sfa">方案设置</a></td></tr>
			</table>
</div>
<div class="crm-head-dropmnu" id="Customer_sub" onMouseOut="fnHideDrop('Customer_sub')" onMouseOver="fnShowDrop('Customer_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=Accounts&action=index&parenttab=Customer">客户</a></td></tr>
				<tr><td><a href="index.php?module=Contacts&action=index&parenttab=Customer">联系人</a></td></tr>
				<tr><td><a href="index.php?module=Notes&action=index&parenttab=Customer">联系记录</a></td></tr>
				<tr><td><a href="index.php?module=Pools&action=index&parenttab=Customer">客户池</a></td></tr>
				<tr><td><a href="index.php?module=Memdays&action=index&parenttab=Customer">纪念日</a></td></tr>
			</table>
</div>
<div class="crm-head-dropmnu" id="Product_sub" onMouseOut="fnHideDrop('Product_sub')" onMouseOver="fnShowDrop('Product_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=Products&action=index&parenttab=Product">产品</a></td></tr>
				<tr><td><a href="index.php?module=Catalogs&action=index&parenttab=Product">产品分类</a></td></tr>
				<tr><td><a href="index.php?module=Serialnumbers&action=index&parenttab=Product">产品序列号</a></td></tr>
				<tr><td><a href="index.php?module=Productspecs&action=index&parenttab=Product">产品规格</a></td></tr>
				<tr><td><a href="index.php?module=Prodlocations&action=index&parenttab=Product">库位管理</a></td></tr>
				<tr><td><a href="index.php?module=Packsetups&action=index&parenttab=Product">装配方案</a></td></tr>
				<tr><td><a href="index.php?module=Packorders&action=index&parenttab=Product">装配出入库单</a></td></tr>
			</table>
</div>
<div class="crm-head-dropmnu" id="Sales_sub" onMouseOut="fnHideDrop('Sales_sub')" onMouseOver="fnShowDrop('Sales_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=WorkMaps&action=index&parenttab=Sales">逍遥行</a></td></tr>
				<tr><td><a href="index.php?module=Potentials&action=index&parenttab=Sales">销售机会</a></td></tr>
				<tr><td><a href="index.php?module=Funnels&action=index&parenttab=Sales">销售漏斗</a></td></tr>
				<tr><td><a href="index.php?module=Quotes&action=index&parenttab=Sales">报价单</a></td></tr>
				<tr><td><a href="index.php?module=Duishous&action=index&parenttab=Sales">竞争对手</a></td></tr>
				<tr><td><a href="index.php?module=SalesOrder&action=index&parenttab=Sales">合同订单</a></td></tr>
				<tr><td><a href="index.php?module=Invoice&action=index&parenttab=Sales">发货单</a></td></tr>
				<tr><td><a href="index.php?module=Performances&action=index&parenttab=Sales">员工绩效</a></td></tr>
				<tr><td><a href="index.php?module=Salesobjects&action=index&parenttab=Sales">销售目标</a></td></tr>
				<tr><td><a href="index.php?module=Tuihuos&action=index&parenttab=Sales">销售退货单</a></td></tr>
			</table>
</div>
<div class="crm-head-dropmnu" id="Support_sub" onMouseOut="fnHideDrop('Support_sub')" onMouseOver="fnShowDrop('Support_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=Inboundsearchs&action=index&parenttab=Support">客服控制台</a></td></tr>
				<tr><td><a href="index.php?module=Accountrecordss&action=index&parenttab=Support">客户服务</a></td></tr>
				<tr><td><a href="index.php?module=Complaints&action=index&parenttab=Support">客户投诉</a></td></tr>
				<tr><td><a href="index.php?module=Faq&action=index&parenttab=Support">常见问题</a></td></tr>
			</table>
</div>
<div class="crm-head-dropmnu" id="Inventory_sub" onMouseOut="fnHideDrop('Inventory_sub')" onMouseOver="fnShowDrop('Inventory_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=Isteps&action=index&parenttab=Inventory">库存导航</a></td></tr>
				<tr><td><a href="index.php?module=Warehouses&action=index&parenttab=Inventory">入库单</a></td></tr>
				<tr><td><a href="index.php?module=Deliverys&action=index&parenttab=Inventory">出库单</a></td></tr>
				<tr><td><a href="index.php?module=Checks&action=index&parenttab=Inventory">盘点</a></td></tr>
				<tr><td><a href="index.php?module=Balances&action=index&parenttab=Inventory">库存余额</a></td></tr>
				<tr><td><a href="index.php?module=Prdtnums&action=index&parenttab=Inventory">初始化库存</a></td></tr>
				<tr><td><a href="index.php?module=Warehousetransfers&action=index&parenttab=Inventory">库间调拨</a></td></tr>
				<tr><td><a href="index.php?module=Wareledgers&action=index&parenttab=Inventory">库存流水账</a></td></tr>
				<tr><td><a href="index.php?module=Inventoryledgers&action=index&parenttab=Inventory">库存台账</a></td></tr>
			</table>
</div>
<div class="crm-head-dropmnu" id="Accounting_sub" onMouseOut="fnHideDrop('Accounting_sub')" onMouseOver="fnShowDrop('Accounting_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=Fsteps&action=index&parenttab=Accounting">财务导航</a></td></tr>
				<tr><td><a href="index.php?module=Gathers&action=index&parenttab=Accounting">应收款</a></td></tr>
				<tr><td><a href="index.php?module=Charges&action=index&parenttab=Accounting">应付款</a></td></tr>
				<tr><td><a href="index.php?module=Gathersrecords&action=index&parenttab=Accounting">收款单</a></td></tr>
				<tr><td><a href="index.php?module=Chargesrecords&action=index&parenttab=Accounting">付款单</a></td></tr>
				<tr><td><a href="index.php?module=Forthamounts&action=index&parenttab=Accounting">往来账</a></td></tr>
				<tr><td><a href="index.php?module=Openingbalancess&action=index&parenttab=Accounting">期初余额</a></td></tr>
				<tr><td><a href="index.php?module=Expenses&action=index&parenttab=Accounting">费用报销</a></td></tr>
				<tr><td><a href="index.php?module=Billings&action=index&parenttab=Accounting">发票管理</a></td></tr>
			</table>
</div>
<div class="crm-head-dropmnu" id="Analytics_sub" onMouseOut="fnHideDrop('Analytics_sub')" onMouseOver="fnShowDrop('Analytics_sub')">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td><a href="index.php?module=Integradedreports&action=index&parenttab=Analytics">综合报表</a></td></tr>
				<tr><td><a href="index.php?module=Ureports&action=index&parenttab=Analytics">常用报表</a></td></tr>
				<tr><td><a href="index.php?module=Companyacctreports&action=index&parenttab=Analytics">公司账户统计</a></td></tr>
				<tr><td><a href="index.php?module=Salesreports&action=index&parenttab=Analytics">年终销售报表</a></td></tr>
			</table>
</div>
<div id="status" style="position:absolute;display:none;left:930px;top:95px;height:27px;white-space:nowrap;"><img src="themes/softed/images/status.gif"></div>
<!-- ActivityReminder Customization for callback -->
<div class="detail-panel-div" id="ActivityRemindercallback" align="left">
</div>
<div id="SelCustomer_popview" class="windLayerDiv" style="position:absolute;z-index:60;display:none;">
</div><script type="text/javascript" src="modules/Accounts/Account.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
<TABLE border=0 cellspacing=0 cellpadding=0 width=100% class=small>
<tr>
	<td style="padding-left:10px;padding-right:50px" class="moduleName" nowrap>客户 > <a class="hdrLink" href="index.php?action=ListView&module=Accounts&parenttab=Customer">客户</a></td>
	<td width=100% nowrap>
	
		<table border="0" cellspacing="0" cellpadding="0" width=100%>
		<tr>
		<td class="sep1" style="width:1px;"></td>
		<td class=small >
			<!-- Add and Search -->
			<table border=0 cellspacing=0 cellpadding=0>
			<tr>
			<td>
				<table border=0 cellspacing=0 cellpadding=5>
				<tr>
											<td style="padding-right:0px;padding-left:10px;">
							<span style="cursor:not-allowed;"
								title="创建 客户...">
							  <i class="icon-plus icon-2x pull-left icon-border crm-bu-style-error"></i>
							</span>
						</td>
										<td style="padding-right:0px;padding-left:10px;">
						<span style="cursor:not-allowed;"
								title="查找 客户...">
							 <i class="icon-search icon-2x pull-left icon-border crm-bu-style-error"></i>
						</span>
					</td>
					
												
							<td style="padding-right:0px;padding-left:10px;">
								<span style="cursor:not-allowed;"
									title="*导入 客户">
									  <i class="icon-upload-alt icon-2x pull-left icon-border crm-bu-style-error"></i>
								</span>
							</td>
							
							
							<td style="padding-right:0px;padding-left:10px;">
								<span style="cursor:not-allowed;"
									title="*导出 客户">
								  <i class="icon-download-alt icon-2x pull-left icon-border crm-bu-style-error"></i>
								</span>
							</td>
																
				</tr>
				</table>
			</td>
			</tr>
			</table>
		
		<!--	Tool	-->
		<td class=small align=right>
			<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="padding-left:10px" onclick="ShowMoreActionsList(this,'addfirsrtabdiv');return false;">
			<span style="cursor:pointer;"
				title="快速创建">
			  <i class="icon-plus-sign icon-2x pull-left icon-border crm-bu-style"></i>&nbsp;
			</span>			
			<div id="addfirsrtabdiv" class="list-bulk-div" style="width:110px;" 
				onMouseOut="ListBulkHideDrop('addfirsrtabdiv')" 
				onMouseOver="ListBulkShowDrop('addfirsrtabdiv')">
				<div class="" onClick="window.location.href='index.php?module=Accounts&action=EditView';">
					新增客户
				</div>
				<div class="" onClick="window.location.href='index.php?module=Contacts&action=EditView';">
					新增联系人
				</div>
				<div class="list-bulk-link" onClick="window.location.href='index.php?module=Notes&action=EditView';">
					新增联系记录
				</div>
				<div class="" onClick="window.location.href='index.php?module=Potentials&action=EditView';">
					新增销售机会
				</div>
				<div class="list-bulk-link" onClick="window.location.href='index.php?module=Quotes&action=EditView';">
					新增报价单
				</div>
				<div class="" onClick="window.location.href='index.php?module=SalesOrder&action=EditView';">
					新增合同订单
				</div>
				<div class="list-bulk-link" onClick="window.location.href='index.php?module=PurchaseOrder&action=EditView';">
					新增进货单
				</div>

				<!-- <div class="list-bulk-link" onClick="window.location.href='index.php?module=Performances&action=index';">
					员工绩效
				</div> -->
			</div>
		</td>

		<td style="padding-left:10px">
			<span style="cursor:pointer;"
				title="短消息..." 
				onclick='window.open("index.php?module=Home&action=PopupPM","Chat","width=600,height=450,resizable=1,scrollbars=1");return false;'>
			  <i class="icon-comment icon-2x pull-left icon-border crm-bu-style"></i>
			</span>
		</td>
		<td style="padding-left:10px">
			<span style="cursor:pointer;"
				title="手机短信" 
				onclick='window.open("index.php?module=Home&action=PopupSms","test",
				"width=700,height=602,resizable=1,scrollbars=1");return false;'>
			  <i class="icon-envelope-alt icon-2x pull-left icon-border crm-bu-style"></i>
			</span>
		</td>
		
		<td style="padding-left:10px">&nbsp;</td>
	</tr>
</table>		</td>
		<!--	Tool	-->

		</td>
		</tr>
		</table>
	</td>
</tr>
</TABLE>
</td>
  </tr>
</table>
<!--	共享		-->
<div id="sharerecorddiv" class="windLayerDiv" style="display:none;width:700px;left:320px;top:220px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">&nbsp;&nbsp;共享</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" 
			onClick="CloseLockDiv('sharerecorddiv');">&nbsp;
	</td>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=5 width=100% align=center> 
	<tr>
		<td class=small>
            <!-- popup specific content fill in starts -->
            <div id='sharerecordcontent'>&nbsp;</div>
		</td>
	</tr>
</table>
</form>
<br>
<script>
    WindLayerDrag("sharerecorddiv", 'windLayerHeading');
</script>
</div>
<script>
    var module = "Accounts";
    var image_path = "themes/softed/images/";

    /**
    * 显示共享信息
    */
    function callSharerecordDiv(record) {
        Jquery.ajax({
            url: "index.php",
            data: 'module=' + module + '&action=' + module + 'Ajax&file=ShareRecord&record=' + record,
            success: function (rest) {
                Jquery("#sharerecordcontent").html(rest);
                ShowLockDiv('sharerecorddiv');
            }
        });
    }
    /**
    * 共享层 部门打开关闭事件
    */
    function showhide_dept(deptId, imgId) {
        if (Jquery("#" + deptId).css("display") == 'none') {
            Jquery("#" + deptId).css("display", "");
            Jquery("#" + imgId).attr("src", image_path + "minus.gif");
        } else {
            Jquery("#" + deptId).css("display", "none");
            Jquery("#" + imgId).attr("src", image_path + "plus.gif");
        }
    }
    /**
    * 取得所有选中的共享用户
    */
    function getShareuserids() {
        var shareuserids = "";
        var fom = Jquery("#sharerecordform");
        var inpt = fom.find("input:checked");
        inpt.each(function () {
            if (shareuserids && shareuserids != '') {
                shareuserids += "," + Jquery(this).val();
            } else {
                shareuserids = Jquery(this).val();
            }
        });
        fom.find("[name=shareuserids]").val(shareuserids);
    }

</script>

<!--	审批		-->
<div id="createapprove_div" style="display:block;position:absolute;left:225px;top:150px;"></div>
<div id="createapprovehistory_div" class="windLayerDiv" style="display:none;position:absolute;left:425px;top:150px;cursor:move;z-index:10001;"></div><!--	审批历史 -->
<div id="createapprovestep_div" class="windLayerDiv" style="display:none;position:absolute;left:425px;top:150px;cursor:move;z-index:10001;"></div><!--	流程详情 -->
<span id="crmspanid" style="display:none;position:absolute;"  onmouseover="fnshow('crmspanid');"  onmouseout="fnhide('crmspanid');">
   <a class="link"  align="right" href="javascript:;">编辑</a>
</span>

<!--	产品库位显示	 -->
<div id="prodlocatdiv" class="windLayerDiv" style="display:none;width:400px; left:550px;top:480px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="layerHeadingULine">
<tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">
		&nbsp;&nbsp;
		产品库位显示
	</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" 
			onClick="CloseLockDiv('prodlocatdiv');">&nbsp;
	</td>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=5 width=100% align=center> 
	<tr>
		<td class=small>
            <!-- popup specific content fill in starts -->
                <table border=0 celspacing=0 cellpadding=5 width=100% align=center>
					<tr><td colspan=2>
						<div id="prodlocatinfodiv"></div>
					</td></tr>
                </table>
		</td>
	</tr>
</table><br>
<script>
    //new Draggable("prodlocatdiv",{handle:'windLayerHeading'});
    WindLayerDrag("prodlocatdiv", 'windLayerHeading');
</script>
</div>

<!--	创建相关信息	 -->
<div id="create-relatedinfo-div" class="windLayerDiv" style="display:none;width:800px; left:400px;top:150px;float:left;overflow-x:hidden;zoom:1;height:auto;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="layerHeadingULine">
<tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">
		&nbsp;&nbsp;
		创建相关信息
	</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" 
			onClick="CloseLockDiv('create-relatedinfo-div');">&nbsp;
	</td>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=5 width=100% align=center> 
	<tr>
		<td class=small>
            <!-- popup specific content fill in starts -->
			<div id="create-related-info-disp" style=""></div>
		</td>
	</tr>
</table><br>
<!-- <div class="windLayerFoot">&nbsp;</div>
<div class="windLayerCorner">&nbsp;</div> -->
<script>
    WindLayerDrag("create-relatedinfo-div", 'windLayerHeading');
</script>
</div><table width="98%" border="0" cellspacing="0" cellpadding="0" align=center>
  <tr>
    <td class="detail-left-td">
		<div class="detail-panel-div">
			<div class="detail-inner">
				<div class="detail-create-div">
					增加客户
				</div>
			</div>
			<div class="detail-heading">
				客户摘要
			</div>
			<div class="detail-inner detail-related">
				<div>
															<div class="detail-list-div" id="detail-list-1">
								联系记录</div>
											<div class="detail-list-div" id="detail-list-3">
								应收款</div>
											<div class="detail-list-div" id="detail-list-4">
								联系人</div>
											<div class="detail-list-div" id="detail-list-110">
								客户投诉</div>
											<div class="detail-list-div" id="detail-list-123">
								期初余额</div>
											<div class="detail-list-div" id="detail-list-72">
								客户关怀</div>
											<div class="detail-list-div" id="detail-list-113">
								客户服务</div>
											<div class="detail-list-div" id="detail-list-14">
								分配历史div>
											<div class="detail-list-div" id="detail-list-121">
								收款单</div>
											<div class="detail-list-div" id="detail-list-7">
								销售机会</div>
											<div class="detail-list-div" id="detail-list-8">
								报修单</div>
											<div class="detail-list-div" id="detail-list-9">
								报价单</div>
											<div class="detail-list-div" id="detail-list-10">
								发货单</div>
											<div class="detail-list-div" id="detail-list-11">
								合同订单</div>
											<div class="detail-list-div" id="detail-list-138">
								费用报销</div>
											<div class="detail-list-div" id="detail-list-12">
								意向产品信息</div>
											<div class="detail-list-div" id="detail-list-107">
								应付款</div>
											<div class="detail-list-div" id="detail-list-156">
								购买产品信息</div>
											<div class="detail-list-div" id="detail-list-139">
								短信</div>
										
								</div>
				<input type="hidden" id="seltrelatedid" value="">
			</div>
							<div class="detail-exit">&nbsp;</div>
						
		</div>
	</td>
	<td class="detail-content-td">
		<form name="EditView" method="POST" action="index.php">
			<input type="hidden" name="module" value="Accounts">
			<input type="hidden" name="record" value="">
			<input type="hidden" name="mode" value="">
			<input type="hidden" name="action">
			<input type="hidden" name="parenttab" value="Customer">
			<input type="hidden" name="return_module" value="Accounts">
			<input type="hidden" name="return_id" value="">
			<input type="hidden" name="return_action" value="DetailView">
			<input type="hidden" name="return_viewname" value="">
		<div id="DetailViewContent">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td>
					<!--	Detail		-->
						<div class="detail-panel-div">
							<table border=0 cellspacing=0 cellpadding=0 width=100% class="small">
							   <tr>
								<td  colspan=4 style="padding:5px">
									<div align="center">
											<button   class="pure-button pure-button-success" title="保存 [Alt+S]"			
												accessKey="S" name="savebutton" 
												onclick="this.form.action.value='Save';check_duplicate();return false;" >
												<i class="icon-ok"></i>保存
											</button>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<button  type="button" class="pure-button pure-button-cancel" 
												title="取消 [Alt+X]" 
													accessKey="X" 
												onclick="window.history.back();return false;" 
													name="button">
												<i class="icon-reply"></i> 取消
											</button>&nbsp;
									</div>
								</td>
							   </tr>

							   <!-- included to handle the edit fields based on ui types -->
							   								  <tr class="detail-content-heading" style="height:28px;">								
									<td colspan=4>
										<b>&nbsp;&nbsp;基本信息</b>
									</td>
								  </tr>

								<!-- Handle the ui types display -->
								
<!-- Added this file to display the fields in Create Entity page based on ui types  -->
			<tr style="height:25px">
																														        						        				
		

					<td width=20% class="detail-content-label" align=right>
				 <font color='red'>*</font> 客户名称
			</td>
			<td width=30% align=left class="detail-content-info">
				<input  type="text" name="accountname" id="accountname" tabindex="1" value="" tabindex="1" class=detailedViewTextBox  >
			</td>
																															        						        				
		

					<td width=20% class="detail-content-label" align=right> 客户编号</td>
			<td width=30% align=left class="detail-content-info">
              <input  type="text" tabindex="7" name="customernum" id ="customernum" value="" class=detailedViewTextBox  >
            </td>       
			   </tr>
			<tr style="height:25px">
																														        						        				
		

					<td width="20%" class="detail-content-label" align=right>
				 网站
			</td>
			<td width="30%" align=left class="detail-content-info">
				&nbsp;&nbsp;http://&nbsp;
				<input  type="text" tabindex="2" name="website" class="detailedViewTextBox" style="#bababa;width:200px;"  value="">
			</td>

																															        						        				
		

															<td width="20%" class="detail-content-label" align=right>
				 上级单位
			</td>
			<td width="30%" align=left class="detail-content-info">
				<input  readonly name="account_name" class="detailedViewTextBox"  type="text" value=""><input  name="account_id" type="hidden" value="">
                <br>①直接查客户: <input style='border: 1px solid rgb(186, 186, 186);' id='account_search_val' name='account_search_val' type="text" onkeydown="SearchAccountText_keydown(event);"  >&nbsp;
				<button class="pure-button pure-icon-bu"  
					style="width:28px;height:22px;color:#666;" 
						onclick='SearchAccountVal();return false;'>
					查
				</button>&nbsp;
                <br>②浏览选客户: 
				
				<button class="pure-button pure-button-share pure-icon-bu" 
					style="width:23px;height:21px;" type='button' title="选择"  
						onclick='window.open("index.php?module=Accounts&action=Popup&popuptype=specific_account_address&form=TasksEditView&form_submit=false","test","width=700,height=602,resizable=1,scrollbars=1");return false;'>
					<i class="icon-search"></i>
				</button>&nbsp;
				<button class="pure-button pure-button-approve pure-icon-bu" 
					style="width:23px;height:21px;" type='button' title="清除"  
						onClick="document.EditView.account_id.value=''; document.EditView.account_name.value='';return false;">
					<i class="icon-remove"></i>
				</button>&nbsp;
	

				<!-- <img tabindex="8" src="themes/softed/images/select.gif" alt="选择" title="选择" LANGUAGE=javascript onclick='return window.open("index.php?module=Accounts&action=Popup&popuptype=specific_account_address&form=TasksEditView&form_submit=false","test","width=700,height=602,resizable=1,scrollbars=1");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;<img   src="themes/softed/images/clear_field.gif" alt="清除" title="清除" LANGUAGE=javascript onClick="document.EditView.account_id.value=''; document.EditView.account_name.value='';return false;" align="absmiddle" style='cursor:hand;cursor:pointer'> -->
			</td>

			   </tr>
			<tr style="height:25px">
																														        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				员工人数
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="employees" tabindex="3" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="5 - 10 人" >                                                
								5 - 10 人
						</option>
																				<option value="11 - 50 人" >                                                
								11 - 50 人
						</option>
																				<option value="51 - 100 人" >                                                
								51 - 100 人
						</option>
																				<option value="101 - 200 人" >                                                
								101 - 200 人
						</option>
																				<option value="201 - 300 人" >                                                
								201 - 300 人
						</option>
																				<option value="301 - 500 人" >                                                
								301 - 500 人
						</option>
																				<option value="501 - 1000 人" >                                                
								501 - 1000 人
						</option>
																				<option value="1000 人以上" >                                                
								1000 人以上
						</option>
												   </select>
			</td>
        																													        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				客户来源
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="leadsource" tabindex="9" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="电话来访" >                                                
								电话来访
						</option>
																				<option value="老客户" >                                                
								老客户
						</option>
																				<option value="客户介绍" >                                                
								客户介绍
						</option>
																				<option value="独立开发" >                                                
								独立开发
						</option>
																				<option value="媒体宣传" >                                                
								媒体宣传
						</option>
																				<option value="促销活动" >                                                
								促销活动
						</option>
																				<option value="代理商" >                                                
								代理商
						</option>
																				<option value="合作伙伴" >                                                
								合作伙伴
						</option>
																				<option value="公开招标" >                                                
								公开招标
						</option>
																				<option value="直邮" >                                                
								直邮
						</option>
																				<option value="Email群发" >                                                
								Email群发
						</option>
																				<option value="网站" >                                                
								网站
						</option>
																				<option value="会议" >                                                
								会议
						</option>
																				<option value="展会" >                                                
								展会
						</option>
																				<option value="口碑" >                                                
								口碑
						</option>
																				<option value="其它" >                                                
								其它
						</option>
												   </select>
			</td>
        	   </tr>
			<tr style="height:25px">
																														        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				客户级别
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="grade" tabindex="4" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="1星" >                                                
								1星
						</option>
																				<option value="2星" >                                                
								2星
						</option>
																				<option value="3星" >                                                
								3星
						</option>
																				<option value="4星" >                                                
								4星
						</option>
																				<option value="5星" >                                                
								5星
						</option>
												   </select>
			</td>
        																													        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				客户状态
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="rating" tabindex="10" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="潜在" >                                                
								潜在
						</option>
																				<option value="有意向" >                                                
								有意向
						</option>
																				<option value="失败" >                                                
								失败
						</option>
																				<option value="已成交" >                                                
								已成交
						</option>
												   </select>
			</td>
        	   </tr>
			<tr style="height:25px">
																														        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				行业
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="industry" tabindex="5" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="农业" >                                                
								农业
						</option>
																				<option value="食品、饮料" >                                                
								食品、饮料
						</option>
																				<option value="服装" >                                                
								服装
						</option>
																				<option value="纺织、皮革" >                                                
								纺织、皮革
						</option>
																				<option value="电工电气" >                                                
								电工电气
						</option>
																				<option value="家用电器" >                                                
								家用电器
						</option>
																				<option value="电脑、软件" >                                                
								电脑、软件
						</option>
																				<option value="化工" >                                                
								化工
						</option>
																				<option value="冶金矿产" >                                                
								冶金矿产
						</option>
																				<option value="能源" >                                                
								能源
						</option>
																				<option value="环保" >                                                
								环保
						</option>
																				<option value="交通运输" >                                                
								交通运输
						</option>
																				<option value="建筑、建材" >                                                
								建筑、建材
						</option>
																				<option value="机械及行业设备" >                                                
								机械及行业设备
						</option>
																				<option value="家居用品" >                                                
								家居用品
						</option>
																				<option value="医药、保养" >                                                
								医药、保养
						</option>
																				<option value="礼品、工艺品、饰品" >                                                
								礼品、工艺品、饰品
						</option>
																				<option value="运动、休闲" >                                                
								运动、休闲
						</option>
																				<option value="办公、文教" >                                                
								办公、文教
						</option>
																				<option value="包装" >                                                
								包装
						</option>
																				<option value="商务服务" >                                                
								商务服务
						</option>
																				<option value="安全、防护" >                                                
								安全、防护
						</option>
																				<option value="库存积压" >                                                
								库存积压
						</option>
																				<option value="汽摩及配件" >                                                
								汽摩及配件
						</option>
																				<option value="印刷" >                                                
								印刷
						</option>
																				<option value="代理" >                                                
								代理
						</option>
																				<option value="纸业" >                                                
								纸业
						</option>
																				<option value="传媒" >                                                
								传媒
						</option>
																				<option value="服饰" >                                                
								服饰
						</option>
																				<option value="橡塑" >                                                
								橡塑
						</option>
																				<option value="精细化学品" >                                                
								精细化学品
						</option>
																				<option value="电子元器件" >                                                
								电子元器件
						</option>
																				<option value="照明工业" >                                                
								照明工业
						</option>
																				<option value="五金、工具" >                                                
								五金、工具
						</option>
																				<option value="通讯产品" >                                                
								通讯产品
						</option>
																				<option value="玩具" >                                                
								玩具
						</option>
																				<option value="加工" >                                                
								加工
						</option>
																				<option value="二手设备转让" >                                                
								二手设备转让
						</option>
																				<option value="项目合作" >                                                
								项目合作
						</option>
																				<option value="仪器仪表" >                                                
								仪器仪表
						</option>
																				<option value="其它" >                                                
								其它
						</option>
												   </select>
			</td>
        																													        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				公司性质
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="ownership" tabindex="11" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="国有企业" >                                                
								国有企业
						</option>
																				<option value="外资企业" >                                                
								外资企业
						</option>
																				<option value="民营企业" >                                                
								民营企业
						</option>
																				<option value="集体企业" >                                                
								集体企业
						</option>
																				<option value="股份制企业" >                                                
								股份制企业
						</option>
																				<option value="合资企业" >                                                
								合资企业
						</option>
																				<option value="独资企业" >                                                
								独资企业
						</option>
																				<option value="其他" >                                                
								其他
						</option>
												   </select>
			</td>
        	   </tr>
			<tr style="height:25px">
																														        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				类型
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="accounttype" tabindex="6" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="分析者" >                                                
								分析者
						</option>
																				<option value="竞争者" >                                                
								竞争者
						</option>
																				<option value="客户" >                                                
								客户
						</option>
																				<option value="集成商" >                                                
								集成商
						</option>
																				<option value="投资商" >                                                
								投资商
						</option>
																				<option value="合作伙伴" >                                                
								合作伙伴
						</option>
																				<option value="出版商" >                                                
								出版商
						</option>
																				<option value="目标" >                                                
								目标
						</option>
																				<option value="供应商" >                                                
								供应商
						</option>
																				<option value="其它" >                                                
								其它
						</option>
												   </select>
			</td>
        																													        						        				
		

					<td width="20%" class="detail-content-label" align=right>
				 <font color='red'>*</font> 负责人
			</td>
			<td width="30%" align=left class="detail-content-info">	
				<!-- <select  name="assigned_user_id" class="small" style="display:none;">
																		<option value="userid" 37>value</option>
																								<option value="username" boss>value</option>
																								<option value="lastname" 老板>value</option>
															</select> -->
				<!--	Selt User	-->
								<div class="chzn-select-div">
											<a href="javascript:ShowSeltUser_click('assigned_user_id');" class="chzn-single" tabindex="-1">
							<span id="assigned_user_id_name">老板</span>
							<input type="hidden" name="assigned_user_id" id="assigned_user_id" value="37" />
							<div>
								<b/>
							</div>
						</a>
										<input type="hidden" name="oldassigned_user_id" id="oldassigned_user_id" value="37" />
					<!--	 User List start	 -->
					<div class="chzn-userlist-div" id="assigned_user_id_div">
						<input type="text" name="assigned_user_id_text" id="assigned_user_id_text" 
							onkeydown="javascript:if(event.keyCode==13) return false;" 
							class="chzn-search" onKeyUp="SearchSmownerUser('assigned_user_id','37',this)">
						<div id="assigned_user_id_info_div" style="overflow-y:auto;max-height:300px;height:300px;">
						</div>
						<script>
						    setSmownerAllUserOpts("assigned_user_id", "37");
						</script>
					</div>
					<div id="assigned_user_id_bind_div" style="display: none;"></div>
					<!--	User List End		-->
				</div>
				
				<!--	End	-->
			</td>
			   </tr>

							   								  <tr class="detail-content-heading" style="height:28px;">								
									<td colspan=4>
										<b>&nbsp;&nbsp;自定义信息</b>
									</td>
								  </tr>

								<!-- Handle the ui types display -->
								
<!-- Added this file to display the fields in Create Entity page based on ui types  -->
			<tr style="height:25px">
																														        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				热点客户
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="cf_498" tabindex="13" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="是" >                                                
								是
						</option>
																				<option value="否" >                                                
								否
						</option>
												   </select>
			</td>
        																													        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				热度
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="cf_500" tabindex="16" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="低热" >                                                
								低热
						</option>
																				<option value="中热" >                                                
								中热
						</option>
																				<option value="高热" >                                                
								高热
						</option>
												   </select>
			</td>
        	   </tr>
			<tr style="height:25px">
																														        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				热点分类
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="cf_502" tabindex="14" class="small" onchange="setFieldLinkageChange(this)">
															<option value="无" >                                                
								无
						</option>
																				<option value="老客户" >                                                
								老客户
						</option>
																				<option value="新客户" >                                                
								新客户
						</option>
																				<option value="新合作" >                                                
								新合作
						</option>
												   </select>
			</td>
        																													        						        				
		

					<td width=20% class="detail-content-label" align=right> 热点说明</td>
			<td width=30% align=left class="detail-content-info">
              <input  type="text" tabindex="17" name="cf_504" id ="cf_504" value="" class=detailedViewTextBox  >
            </td>       
			   </tr>
			<tr style="height:25px">
																														        						        				
		

		                        <td width="20%" class="detail-content-label" align=right>
                                 旺旺
                        </td>
                        <td width="30%" align=left class="detail-content-info">
                                <img src="themes/softed/images/trade.jpg" align="absmiddle"><input  type="text" name="cf_686" style="border:1px solid #bababa;" size="27"  value="">
                        </td>
																															        						        				
		

			   </tr>

							   								  <tr class="detail-content-heading" style="height:28px;">								
									<td colspan=4>
										<b>&nbsp;&nbsp;联系信息</b>
									</td>
								  </tr>

								<!-- Handle the ui types display -->
								
<!-- Added this file to display the fields in Create Entity page based on ui types  -->
			<tr style="height:25px">
																														        						        				
		

					<td width=20% class="detail-content-label" align=right> 首要联系人</td>
			<td width=30% align=left class="detail-content-info">
              <input  type="text" tabindex="19" name="keycontact" id ="keycontact" value="" class=detailedViewTextBox  >
            </td>       
																															        						        				
		

					<td width=20% class="detail-content-label" align=right> 手机</td>
			<td width=30% align=left class="detail-content-info">
              <input  type="text" tabindex="23" name="keymobile" id ="keymobile" value="" class=detailedViewTextBox  >
            </td>       
			   </tr>
			<tr style="height:25px">
																														        						        				
		

					<td width=20% class="detail-content-label" align=right> 电话</td>
			<td width=30% align=left class="detail-content-info">
              <input  type="text" tabindex="20" name="phone" id ="phone" value="" class=detailedViewTextBox  >
            </td>       
																															        						        				
		

		                        <td width="20%" class="detail-content-label" align=right>
                                 QQ
                        </td>
                        <td width="30%" align=left class="detail-content-info">
                                <img border="0" src="themes/softed/images/qq.gif"  align="absmiddle"><input  type="text" name="keyqq" style="border:1px solid #bababa;" size="27"  value="">
                        </td>
			   </tr>
			<tr style="height:25px">
																														        						        				
		

					<td width=20% class="detail-content-label" align=right> 传真</td>
			<td width=30% align=left class="detail-content-info">
              <input  type="text" tabindex="21" name="fax" id ="fax" value="" class=detailedViewTextBox  >
            </td>       
																															        						        				
		

					<td width=20% class="detail-content-label" align=right> 其它电话</td>
			<td width=30% align=left class="detail-content-info">
              <input  type="text" tabindex="25" name="otherphone" id ="otherphone" value="" class=detailedViewTextBox  >
            </td>       
			   </tr>
			<tr style="height:25px">
																														        						        				
		

					<td width=20% class="detail-content-label" align=right> Email</td>
			<td width=30% align=left class="detail-content-info">
              <input  type="text" tabindex="22" name="email1" id ="email1" value="" class=detailedViewTextBox  >
            </td>       
																															        						        				
		

			   </tr>

							   								  <tr class="detail-content-heading" style="height:28px;">								
									<td colspan=4>
										<b>&nbsp;&nbsp;地址信息</b>
									</td>
								  </tr>

								<!-- Handle the ui types display -->
								
<!-- Added this file to display the fields in Create Entity page based on ui types  -->
			<tr style="height:25px">
																														        						        				
		

					<td width="20%" class="detail-content-label" align=right>
				 
				国家
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="bill_country" id="bill_country" tabindex="27" class="small" onchange="multifieldSelectChange('1021','2','Accounts',this);">
				
						<option value="无" relvalue="408" >
                                                        无

				
						<option value="中国" relvalue="1" >
                                                        中国

				
						<option value="美国" relvalue="411" >
                                                        美国

				
						<option value="欧洲" relvalue="412" >
                                                        欧洲

				
						<option value="日本" relvalue="413" >
                                                        日本

				
						<option value="新加坡" relvalue="414" >
                                                        新加坡

				
						<option value="韩国" relvalue="415" >
                                                        韩国

							   </select>
			</td>
																															        						        				
		

					<td width="20%" class="detail-content-label" align=right>
				 
				省份
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="bill_state" id="bill_state" tabindex="30" class="small" onchange="multifieldSelectChange('1022','2','Accounts',this);">
				
						<option value="无" relvalue="409" >
                                                        无

							   </select>
			</td>
			   </tr>
			<tr style="height:25px">
																														        						        				
		

					<td width="20%" class="detail-content-label" align=right>
				 
				城市
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="bill_city" id="bill_city" tabindex="28" class="small" onchange="multifieldSelectChange('1023','2','Accounts',this);">
				
						<option value="无" relvalue="410" >
                                                        无

							   </select>
			</td>
																															        						        				
		

					<td width=20% class="detail-content-label" align=right>
				 
				地址
			</td>
			<td width=30% align=left class="detail-content-info">
				<textarea  value="" name="bill_street" tabindex="31" class=detailedViewTextBox   rows=2></textarea>
			</td>
			   </tr>
			<tr style="height:25px">
																														        						        				
		

					<td width=20% class="detail-content-label" align=right> 邮箱地址</td>
			<td width=30% align=left class="detail-content-info">
              <input  type="text" tabindex="29" name="bill_pobox" id ="bill_pobox" value="" class=detailedViewTextBox  >
            </td>       
																															        						        				
		

			   </tr>

							   								  <tr class="detail-content-heading" style="height:28px;">								
									<td colspan=4>
										<b>&nbsp;&nbsp;银行财务信息</b>
									</td>
								  </tr>

								<!-- Handle the ui types display -->
								
<!-- Added this file to display the fields in Create Entity page based on ui types  -->
			<tr style="height:25px">
																														        						        				
		

		 <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td width="20%" class="detail-content-label" align=right>
				 
				支付方式
			</td>
			<td width="30%" align=left class="detail-content-info">
			   <select  name="paymenttype" tabindex="33" class="small" onchange="setFieldLinkageChange(this)">
															<option value="现金" >                                                
								现金
						</option>
																				<option value="支票" >                                                
								支票
						</option>
																				<option value="支付宝" >                                                
								支付宝
						</option>
																				<option value="paypal" >                                                
								paypal
						</option>
												   </select>
			</td>
        																													        						        				
		

			   </tr>

							   								  <tr class="detail-content-heading" style="height:28px;">								
									<td colspan=4>
										<b>&nbsp;&nbsp;描述信息</b>
									</td>
								  </tr>

								<!-- Handle the ui types display -->
								
<!-- Added this file to display the fields in Create Entity page based on ui types  -->
			<tr style="height:25px">
																														        						        				
		

					<!-- In Add Comment are we should not display anything -->
						<td width=20% class="detail-content-label" align=right>
				 
				备注
			</td>
			<td colspan=3>
								<textarea  class="detailedViewTextBox" tabindex="35"  name="description"   cols="90" rows="8"></textarea>
			</td>
																															        						        				
		

			   </tr>

							   

							  

							   <tr>
								<td  colspan=4 style="padding:5px">
									<div align="center">												
										<button  class="pure-button pure-button-success" title="保存 [Alt+S]"			
											accessKey="S" name="savebutton" 
											onclick="this.form.action.value='Save';check_duplicate();return false;" >
											<i class="icon-ok"></i>保存
										</button>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<button  type="button" class="pure-button pure-button-cancel" 
											title="取消 [Alt+X]" 
												accessKey="X" 
											onclick="window.history.back();return false;" 
												name="button">
											<i class="icon-reply"></i> 取消
										</button>&nbsp;
									</div>
								</td>
							   </tr>
							</table>
					</div>
					<!--	!Detail		-->
				</td>
			  </tr>
			</table>
		</div><!--	! Content	-->
		<div class="detail-panel-div" id="RelatedListContent">
		</div>
		<input type="hidden" name="issubmit" id="issubmit" value="1">

		</form>
	</td>
  </tr>
</table>
<a href="" style="display:none" id="relatedCreateList"><span id="relatedCreatespan">首页</span></a>

<script language="javascript">
    var relatedindex = "18";

    function relatedload(label) {
        if (Jquery("#refresh-" + label)) {
            Jquery("#refresh-" + label).click();
        } else {
            window.location.onload();
        }
    }
    ///
    (function (Jquery) {
        Jquery.fn.extend({
            Scroll: function (opt, callback) {
                if (!opt) var opt = {};
                var _btnUp = Jquery("#" + opt.up); //Shawphy:向上按钮 
                var _btnDown = Jquery("#" + opt.down); //Shawphy:向下按钮 
                //var _this = this;
                var _this = this.eq(0).find("div:first");
                var lineH = _this.find("div:first").height(); //获取行高 
                var line = opt.line ? parseInt(opt.line, 10) : parseInt(this.height() / lineH, 10); //每次滚动的行数，默认为一屏，即父容器高度 
                var speed = opt.speed ? parseInt(opt.speed, 10) : 600; //卷动速度，数值越大，速度越慢（毫秒）
                var m = line; //用于计算的变量
                var count = _this.find("div").length; //总共的<li>元素的个数
                var upHeight = line * lineH;
                function scrollUp() {
                    if (!_this.is(":animated")) {
                        if (m > line) { //判断m 是否大于一屏个数 
                            m -= line;
                            _this.animate({ marginTop: "+=" + upHeight + "px" }, speed);
                            Jquery("#pageDown").addClass("downroll").removeClass("downdisable");
                            if (m <= line) {
                                Jquery("#pageUp").addClass("updisable").removeClass("uproll");
                            }
                        } else {
                            Jquery("#pageUp").addClass("updisable").removeClass("uproll");
                        }
                    }
                    return false;
                }
                function scrollDown() {
                    if (!_this.is(":animated")) { //判断元素是否正处于动画，如果不处于动画状态，则追加动画。 
                        if (m < count) { //判断 m 是否小于总的个数 
                            m += line;
                            _this.animate({ marginTop: "-=" + upHeight + "px" }, speed);
                            Jquery("#pageUp").addClass("uproll").removeClass("updisable");
                            if (m >= count) {
                                Jquery("#pageDown").addClass("downdisable").removeClass("downroll");
                            }
                        } else {
                            Jquery("#pageDown").addClass("downdisable").removeClass("downroll");
                        }
                    }
                    return false;
                }
                _btnUp.bind("click", scrollUp);
                _btnDown.bind("click", scrollDown);
            }
        });
    })(Jquery);
    Jquery(function () {
        var relatedlen = Jquery(".detail-related").find("div.detail-list-div").length;
        if (relatedlen < 20) {
            return false;
        } else if (relatedlen > 20) {
            Jquery(".detail-related").Scroll({ line: 10, speed: 500, up: "pageUp", down: "pageDown" });
            var relatedheight = Jquery(window).height() - 255;
            if (relatedheight < 400) relatedheight = 400;
            Jquery(".detail-related").height(relatedheight);
        } else {
            var relatedheight = Jquery(".detail-related").height() + 10;
            Jquery(".detail-related").height(relatedheight);
        }
    }); 

</script>

<script>
    var fieldname = new Array('accountname', 'customernum', 'phone', 'website', 'fax', 'otherphone', 'account_id', 'email1', 'employees', 'email2', 'leadsource', 'grade', 'rating', 'industry', 'ownership', 'accounttype', 'annualrevenue', 'build_date', 'contact_date', 'assigned_user_id', 'bankname', 'bank_accountname', 'bank_accountid', 'bank_taxid', 'paymenttype', 'payment_credit', 'bill_country', 'bill_state', 'bill_city', 'bill_street', 'bill_pobox', 'bill_code', 'description', 'cf_498', 'cf_500', 'cf_502', 'cf_504', 'cf_535', 'keycontact', 'keymobile', 'cf_686', 'keyqq')
    var fieldlabel = new Array('客户名称', '客户编号', '电话', '网站', '传真', '其它电话', '上级单位', 'Email', '员工人数', '其它Email', '客户来源', '客户级别', '客户状态', '行业', '公司性质', '类型', '营业额', '公司成立时间', '下次联系时间', '负责人', '开户行', '开户名称', '银行帐号', '纳税号', '支付方式', '信用额度', '国家', '省份', '城市', '地址', '邮箱地址', '邮编', '备注', '热点客户', '热度', '热点分类', '热点说明', '', '首要联系人', '手机', '旺旺', 'QQ')
    var fielddatatype = new Array('V~M', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O', 'I~O', 'E~O', 'V~O', 'E~O', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O', 'D~O', 'D~O', 'V~M', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O~::2', 'V~O~::2', 'V~O~::2', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O~LE~200', 'V~O', 'V~O', 'V~O', 'V~O', 'V~O')

    var auto_gen_code = "自动生成";

    if (Jquery("#customernum")) {
        if (Jquery("#customernum").val() == '') {
            Jquery("#customernum").val(auto_gen_code);
        }
    }

    var spanel = document.createElement("span");
    spanel.id = "account_avail_span";
    var accountnameel = $('accountname');
    accountnameel.insert({ after: spanel });
    accountnameel.setAttribute("size", "27px");
    accountnameel.onblur = function () { };
    accountnameel.onfocus = function () { };
    accountnameel.removeClassName("detailedViewTextBox");
    $(spanel).update('&nbsp;<button class="pure-button pure-icon-bu" ' +
								'style="width:50px;height:22px;color:#666;" ' +
									'onclick="ajaxCheckAccount();return false;">' +
								'' + alert_arr['CHECK_DUPLICATE'] + '</button>&nbsp;');
	
</script>
<script language = 'JavaScript' type='text/javascript' src = 'include/js/popup.js'></script><br><br><br><table border=0 cellspacing=0 cellpadding=5 width=100% class=settingsSelectedUI ><tr><td class=small align=left><a href='http://www.c3crm.com' target='_blank'>E-CRM7.1.4</a> </td><td class=small align=right>
				Powered by <a href='http://www.c3crm.com' target='_blank'>&nbsp;<img src='themes/softed/images/crm-logo-red.png'  width='60' border=0></a>
					&nbsp;&nbsp;
					咨询热线: 400 680 5898 &nbsp;&nbsp; 
				&nbsp;&nbsp;
				<a href='http://vdisk.weibo.com/s/Cua0f9Y_gJH' target='_blank'>
					下载桌面提醒
				</a>&nbsp;
				<a href='http://www.c3crm.com/cpjs/298.html' target='_blank'>
					<i class='icon-mobile-phone icon-large'></i> 手机登陆
				</a>
			</td></tr></table><script type='text/javascript'>			                      if (typeof (ActivityReminderCallback) != 'undefined') ActivityReminderCallback();</script><!--end body panes-->
</td></tr>
<tr><td colspan="2" align="center">
</td></tr></table>
</body>



</html>
