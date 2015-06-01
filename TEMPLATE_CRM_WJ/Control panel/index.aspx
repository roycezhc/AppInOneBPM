<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Control_panel_admin" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>

<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
   <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>admin - 控制面板 - 控制面板 - 易客CRM</title>
	
			<style type="text/css">@import url("./admin_files/style.black.css");</style>
		
	<link rel="stylesheet" href="admin_files/buttons-min.css"/>
	<link rel="stylesheet" href="admin_files/font-awesome.min.css"/>
	<style type="text/css">
	#ActivityRemindercallback{position:fixed;right:0px;bottom:2px;display:block;padding:0px;z-index:10;font-weight:normal;width:205px;}
        </style>
	<script language="javascript" type="text/javascript" src="./admin_files/jquery-1.10.1.min.js"></script>
	<script language="javascript" type="text/javascript" src="./admin_files/jquery-ui-1.10.2.min.js"></script>
	<script type="text/javascript">
	    var Jquery = $;
	</script>
	<script language="javascript" type="text/javascript" src="./admin_files/prototype.min.js"></script>
	<script language="javascript" type="text/javascript" src="./admin_files/dom-drag.js"></script>
	<script language="JavaScript" type="text/javascript" src="./admin_files/zh_cn.lang.js"></script>
	<script language="JavaScript" type="text/javascript" src="./admin_files/general.js"></script>
	<script language="JavaScript" type="text/javascript" src="./admin_files/json.js"></script>
	
	<script language="javascript">
	    javaCalendarFirstDayOfWeek = 1;
	    var userDateFormat = "yyyy-mm-dd";
	   
        </script>
</head>
	<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" class="small" style="">
 
  
<div id="status" style="position: absolute; display: none; left: 930px; top: 95px; height: 27px; white-space: nowrap;"><img src="./admin_files/status.gif"></div>
<div id="SelCustomer_popview" class="windLayerDiv" style="position:absolute;z-index:60;display:none;">
</div><br/>
<!--	! Setting List	-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tbody><tr>
    <td class="detail-left-td">
		<div class="detail-panel-div">
<table border="0" cellspacing="0" cellpadding="0" width="100%" id="setting-menu-tab">
	<tbody><tr class="detail-heading" onmouseover="this.className='detail-heading-over';" onmouseout="this.className='detail-heading'">
		<td nowrap="">&nbsp;&nbsp;基本设置</td>
	</tr>

	<!--	系统用户	 -->
			<tr onclick="location.href='index.aspx?module=Users&action=index&parenttab=Settings'">
           
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			系统用户</td>
	</tr>

	<!--	角色权限	 -->
			<tr onclick="location.href='index.aspx?module=Users&action=listroles&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			角色权限</td>
	</tr>

	
	<!--	全局共享规则	 -->
			<tr onclick="location.href='index.aspx?module=Users&action=OrgSharingDetailView&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			全局共享规则</td>
	</tr>

	<!--	自定义共享规则	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=CustomSharingDetailView&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			自定义共享规则</td>
	</tr>

	<!--	系统日志	 -->
			<tr onclick="location.href='index.aspx?module=Users&action=AuditTrailList&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			系统日志</td>
	</tr>

	<!--	登陆地址	 -->
			<tr onclick="location.href='index.aspx?module=Users&action=ListLoginHistory&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			登录历史</td>
	</tr>
	

	
	<tr class="detail-heading" onmouseover="this.className='detail-heading-over';" onmouseout="this.className='detail-heading'" height="25px">
		<td nowrap="">&nbsp;&nbsp;系统定制</td>
	</tr>

	<!--	模块开发	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=CustomModuleList&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			模块开发</td>
	</tr>

	<!--	显示区域	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=CustomBlockList&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			显示区域</td>
	</tr>

	<!--	自定义字段	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=CustomFieldList&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			自定义字段</td>
	</tr>

	<!--	下拉框选项	 -->
						<tr onclick="location.href='index.aspx?module=Settings&action=PickList&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(50, 166, 54)">
			下拉框选项</td>
	</tr>

	<!--	页面布局	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=LayoutList&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			页面布局</td>
	</tr>

	<!--	主菜单	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=CustomTabList&parenttab=Settings' " runat="server">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			主菜单</td>
	</tr>

	<!--	全局字段	 -->
			<tr onclick="location.href='index.aspx?module=Users&action=DefaultFieldPermissions&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			全局字段</td>
	</tr>
	
	<!--	相关信息	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=RelatedList&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			相关信息</td>
	</tr>

	<!--	打印模板	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=PrintTemplate&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			打印模板</td>
	</tr>

	<!--	关联产品字段	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=ProductField&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			关联产品字段</td>
	</tr>

	<!--	审批流程	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=MultiApprove&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			审批流程</td>
	</tr>

	<!--	级联字段	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=CustomMultiFieldList&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			级联字段</td>
	</tr>


	<!--	字段规则	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=FieldRules&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			字段规则</td>
	</tr>

	<!--	自定义编号	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=CustomModEntityNo&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			自定义记录编号</td>
	</tr>

	<!--	字段修改日志	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=LogField&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			字段修改日志</td>
	</tr>

	<tr class="detail-heading" onmouseover="this.className='detail-heading-over';" onmouseout="this.className='detail-heading'" height="25px">
		<td nowrap="">
			&nbsp;&nbsp;其它设置
		</td>
	</tr>
	
	<!--	Email模板	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=db_backup&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			数据库备份</td>
	</tr>

	<!--	公司信息	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=OrganizationConfig&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			公司信息</td>
	</tr>

	<!--	SMTP服务器	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=EmailConfig&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			SMTP服务器</td>
	</tr>

	<!--	短信通道	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=MessageConfig&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			短信通道</td>
	</tr>

	<!--	货币币种	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=CurrencyListView&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			货币币种</td>
	</tr>


	<!--	授权许可	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=LicenseConfig&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			授权许可</td>
	</tr>


	<!--	多仓库管理	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=MultiWarehouseListView&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			多仓库管理</td>
	</tr>
	
	<!--	导入Shopex	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=ShopexConfig&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			导入Shopex</td>
	</tr>

	<!--	公司账户	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=CompanyAcct&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			公司账户</td>
	</tr>

	<!--	条件条款	 -->
			<tr onclick="location.href='index.aspx?module=Settings&action=ClauseListView&parenttab=Settings'">
		<td class="detail-list-div" onmouseover="this.className='detail-list-over';" onmouseout="this.className='detail-list-div'" style="color:rgb(102, 102, 102)">
			条件条款</td>
	</tr>
</tbody>
</table>
	</td>
    </tr>
    </tbody>
    </table>
</body>
</html>
