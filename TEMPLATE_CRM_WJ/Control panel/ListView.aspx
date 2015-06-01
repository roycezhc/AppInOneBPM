<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListView.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Control_panel_ListView" %>
<html>
<link rel="stylesheet" href="http:/10.5.13.57/themes/softed/font-awesome/buttons-min.css">
	<link rel="stylesheet" href="http:/10.5.13.57/themes/softed/font-awesome/font-awesome.min.css">
	<style type="text/css">@import url("admin_files/Integradedreports.css");</style>
<link href="admin_files/dtree.css" type="text/css" rel="stylesheet">
	<div id="ListViewContents" style="display:block;">
				<!--`	seasrch		-->
<input type="hidden" name="orderby" id="orderby" value="last_name" class="txtBox searchelement">
<input type="hidden" name="sorder" id="sorder" value="ASC" class="txtBox searchelement">



<input type="hidden" name="record" id="userid" value="" style="margin:0px">
<input type="hidden" name="isDuplicate" value="false" style="margin:0px">
<input type="hidden" name="changepassword" style="margin:0px">
<input type="hidden" name="old_password" style="margin:0px">
<input type="hidden" name="new_password" style="margin:0px">
<input type="hidden" name="return_id" style="margin:0px">
<input type="hidden" name="forumDisplay" style="margin:0px">




<table border="0" cellspacing="0" cellpadding="5" width="100%" class="">
    <tbody><tr>
        <td nowrap="" align="center" valign="middle">
        	<b>查找</b>
        </td>
        <td nowrap="">
			&nbsp;<input type="text" name="last_name" id="last_name" class="searchelement" onfocus="textboxChange_focus(this);" onblur="textboxChange_blur(this);" value="" style="width: 160px; color: rgb(153, 153, 153);" onkeydown="searchsubmit_keydown(event);" title="请输入用户的用户名、姓名、电话、Email信息搜索">
        </td>
        <td align="center">
        	角色:&nbsp;
            <input name="role_name" id="role_name" readonly="readonly" class="searchelement" style="width:100px" type="text" value="">&nbsp;

            <button type="button" class="pure-button pure-button-share pure-icon-bu" style="width:23px;height:21px;" onclick="javascript:openPopup();return false;">
            	<i class="icon-share"></i>
            </button>
            <button class="pure-button pure-button-approve pure-icon-bu" style="width:23px;height:21px;" onclick="ClearRole_click();return false;">
            	<i class="icon-arrow-left"></i>
            </button>


		<!-- 	<a href="javascript:openPopup();"><img src="admin_files/select.gif" align="absmiddle" border="0"></a>
            <input src="admin_files/clear_field.gif" alt="清除" title="清除" language="javascript" 
            onclick="ClearRole_click();return false;" style="cursor: pointer;" align="absmiddle" type="image"> -->

            <input name="user_role" id="user_role" value="" type="hidden" class="searchelement">
		</td>
        <td align="center">
        	状态:&nbsp;
        	<select name="status" id="status" class="searchelement small">
            	<option value="">请选择</option>
            	<option value="Active" title="Active">激活</option><option value="Inactive" title="Inactive">禁止</option>
            </select>
        </td>
        <!-- <td align=center >
        	电话:&nbsp;
            <input type="text" name="phone" id="phone" class="searchelement" value=""
				style="width:110px;" onKeyDown="searchsubmit_keydown(event);"/>
		</td> -->
        <td nowrap="" align="left">
			<button class="pure-button pure-button-edit" title="保存" onclick="SearchUser_click('Basic');return false;">
				<i class="icon-search"></i> 查找
			</button>
        </td>
        <td nowrap="" align="right">
			<button class="pure-button pure-button-success" title="增加" onclick="adduser_click();return false;">
				<i class="icon-plus"></i> 增加
			</button>
		</td>
    </tr>
</tbody></table>
<!--	-->
<table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
<tbody><tr height="25px" class="windLayerHead"><td>#</td><td nowra="">
              <a href="javascript:getOrderBy('last_name','asc');" class="listFormHeaderLinks" onclick="">姓名<img border="0" src="admin_files/arrow_up.gif"></a></td><td nowra="">
              <a href="javascript:getOrderBy('user_name','asc');" class="listFormHeaderLinks" onclick="">用户名</a></td><td nowra="">
              <a href="javascript:getOrderBy('roleid','asc');" class="listFormHeaderLinks" onclick="">角色</a></td><td nowra="">
              <a href="javascript:getOrderBy('groupid','asc');" class="listFormHeaderLinks" onclick="">部门</a></td><td nowra="">
              <a href="javascript:getOrderBy('status','asc');" class="listFormHeaderLinks" onclick="">状态</a></td><td nowra="">
              <a href="javascript:getOrderBy('is_admin','asc');" class="listFormHeaderLinks" onclick="">管理员</a></td><td nowra="">
              <a href="javascript:getOrderBy('phone_work','asc');" class="listFormHeaderLinks" onclick="">电话</a></td><td nowra="">
              <a href="javascript:getOrderBy('email1','asc');" class="listFormHeaderLinks" onclick="">Email</a></td><td nowrap="">工具</td></tr>
<!-- <tr class="windLayerHead">
	<td class=" small" valign=top>#</td>
	<td class=" small" valign=top></td>
	<td class=" small" valign=top></td>
	<td class=" small" valign=top></td>
	<td class=" small" valign=top></td>
	<td class=" small" valign=top></td>
	<td class=" small" valign=top></td>
	<td class=" small" valign=top></td>
	<td class=" small" valign=top></td>
	<td class=" small" valign=top></td>
</tr> -->
						<tr>
			<td>1</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=30"> 刘岚 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=30"> cherry </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H17"> 技术支持 </a></td>	
	<td>售后服务部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898 &nbsp;</td>
	<td>cherry@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=30&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=30'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'30','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'30','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'30','1');return false;">
		</i>


	</td>

</tr>
						<tr class="crm-table-plural">
			<td>2</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=29"> 刘素 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=29"> fiona </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H19"> 仓管人员 </a></td>	
	<td>仓储部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898&nbsp;</td>
	<td>fiona@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=29&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=29'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'29','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'29','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'29','1');return false;">
		</i>

	</td>

</tr>
						<tr>
			<td>3</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=31"> 吴薇 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=31"> vivi </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H8"> 销售人员 </a></td>	
	<td>销售部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898&nbsp;</td>
	<td>vivi@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=31&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=31'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'31','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'31','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'31','1');return false;">
		</i>

	</td>

</tr>
						<tr class="crm-table-plural">
			<td>4</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=34"> 张妮 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=34"> helen </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H15"> 财务总监 </a></td>	
	<td>财务部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898&nbsp;</td>
	<td>helen@c3crm.com&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=34&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=34'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'34','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'34','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'34','1');return false;">
		</i>


	</td>

</tr>
						<tr>
			<td>5</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=24"> 张建华 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=24"> john </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H8"> 销售人员 </a></td>	
	<td>销售部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898 &nbsp;</td>
	<td>john@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=24&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=24'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'24','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'24','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'24','1');return false;">
		</i>

	</td>

</tr>
						<tr class="crm-table-plural">
			<td>6</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=32"> 李剑锋 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=32"> alan </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H8"> 销售人员 </a></td>	
	<td>销售部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898&nbsp;</td>
	<td>alan@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=32&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=32'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'32','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'32','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'32','1');return false;">
		</i>

	</td>

</tr>
						<tr>
			<td>7</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=28"> 江辉 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=28"> kevin </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H3"> 副总经理 </a></td>	
	<td>售后服务部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898 &nbsp;</td>
	<td>kevin@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=28&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=28'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'28','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'28','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'28','1');return false;">
		</i>

	</td>

</tr>
						<tr class="crm-table-plural">
			<td>8</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=25"> 王丽婷 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=25"> lily </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H6"> 采购经理 </a></td>	
	<td>采购部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898 &nbsp;</td>
	<td>lily@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=25&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=25'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'25','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'25','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'25','1');return false;">
		</i>


	</td>

</tr>
						<tr>
			<td>9</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=1"> 管理员 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=1"> admin </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H2"> 总经理 </a></td>	
	<td>销售部&nbsp;</td>
		<td>激活</td>
		<td>激活&nbsp;</td>
	<td>802&nbsp;</td>
	<td>admin@uyuy.com&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=1&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=1'">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'1','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'1','1');return false;">
		</i>


	</td>

</tr>
						<tr class="crm-table-plural">
			<td>10</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=37"> 老板 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=37"> boss </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H2"> 总经理 </a></td>	
	<td>销售部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>021-8888888&nbsp;</td>
	<td>boss@boss.com&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=37&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=37'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'37','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'37','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'37','1');return false;">
		</i>


	</td>

</tr>
						<tr>
			<td>11</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=27"> 薛少军 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=27"> andy </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H8"> 销售人员 </a></td>	
	<td>销售部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898 &nbsp;</td>
	<td>andy@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=27&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=27'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'27','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'27','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'27','1');return false;">
		</i>



	</td>

</tr>
						<tr class="crm-table-plural">
			<td>12</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=36"> 陆西 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=36"> lucy </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H21"> 市场营销 </a></td>	
	<td>市场部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>02188888888&nbsp;</td>
	<td>lucy@lucy.com&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=36&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=36'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'36','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'36','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'36','1');return false;">
		</i>



	</td>

</tr>
						<tr>
			<td>13</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=26"> 陈雅丽 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=26"> melissa </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H18"> 采购助理 </a></td>	
	<td>采购部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898&nbsp;</td>
	<td>melissa@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=26&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=26'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'26','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'26','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'26','1');return false;">
		</i>


	</td>

</tr>
						<tr class="crm-table-plural">
			<td>14</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=23"> 顾文斌 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=23"> mike </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H4"> 销售经理 </a></td>	
	<td>销售部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>4006805898 &nbsp;</td>
	<td>mike@c3crm.cn&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=23&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=23'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'23','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'23','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'23','1');return false;">
		</i>


	</td>

</tr>
						<tr>
			<td>15</td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=35"> 马良 </a></td>
	<td><a href="index.aspx?module=Users&amp;action=UserDetailView&amp;parenttab=Settings&amp;record=35"> Robin </a></td>
	<td><a href="index.aspx?action=RoleDetailView&amp;module=Users&amp;parenttab=Settings&amp;roleid=H20"> 售后 </a></td>	
	<td>售后服务部&nbsp;</td>
		<td>激活</td>
		<td>禁止&nbsp;</td>
	<td>400&nbsp;</td>
	<td>robin@163.com&nbsp;</td>
	

	<td nowrap="">
		<i class="icon-user pure-icon-bu crm-bu-style" title="修改密码" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="window.open('index.aspx?module=Users&amp;action=UsersAjax&amp;file=ChangeListViewPassword&amp;return_id=35&amp;return_module=Users&amp;return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
		</i>
		<i class="icon-edit pure-icon-bu crm-bu-style" title="编辑" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?action=EditView&amp;return_action=ListView&amp;return_module=Users&amp;module=Users&amp;parenttab=Settings&amp;record=35'">
		</i>
				<i class="icon-trash pure-icon-bu crm-bu-style" title="刪除" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteUser(this,'35','1');return false;">
		</i>
				<i class="icon-external-link pure-icon-bu crm-bu-style" title="转移用户审批权限" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeApproveId(this,'35','1');return false;">
		</i>
		<i class="icon-mail-forward pure-icon-bu crm-bu-style" title="转移数据" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="ChangeUserData(this,'35','1');return false;">
		</i>


	</td>

</tr>
	</tbody></table>
<table width="100%" cellpadding="5" cellspacing="0" class=" small " align="center" border="0">
	<tbody><tr height="25">
		<td width="20%"> &nbsp;<input type="hidden" id="list_userseach" name="list_userseach" value="&amp;listpage=20&amp;current_page=1"></td>
		<td width="80%" nowrap="" align="right"> 
			显示 1 - 15 之 15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			每页显示:
			<select id="listpage" name="listpage" onchange="getListUsersPage('');" style="width:80px;">
			<option value="10">10</option><option value="15">15</option><option value="20" selected="">20</option><option value="30">30 </option><option value="40">40 </option><option value="50">50 </option><option value="100">100</option><option value="200">200</option>
		   </select>
		</td>
	</tr>

</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="100%">
	<tbody><tr><td class="small" nowrap="" align="right"><a href="#top">[上]</a></td></tr>
</tbody></table>
			</div>
    <script>
groupListBind("groupListdiv");

window.onload = function(){
	var obj = document.EditView.last_name;
	textboxChange_blur(obj);
}

function getListViewEntries_js(module,url)
{
        $("status").style.display="inline";
        new Ajax.Request(
                'index.aspx',
                {queue: {position: 'end', scope: 'command'},
                        method: 'post',
                        postBody: 'module=Users&action=UsersAjax&file=ListView&ajax=true&'+url,
                        onComplete: function(response) {
                                $("status").style.display="none";
                                $("ListViewContents").innerHTML= response.responseText;
                        }
                }
        );
}

function getListViewWithPageNo(module,pageElement)
{
	/var pageno = document.getElementById('listviewpage').value;
	var pageno = pageElement.options[pageElement.options.selectedIndex].value;
	getListViewEntries_js(module,'start='+pageno);
}

function deleteUser(obj,userid,current_user_id)
{
	var tagName=document.getElementById('tempdiv');
	if(typeof(tagName) == 'undefined') {
		return;
	}
    var leftSide = findPosX(obj);
    var topSide = findPosY(obj);
    /leftSide=leftSide-180;
    var maxW = tagName.style.width;
    var widthM = maxW.substring(0,maxW.length-2);
    var getVal = eval(leftSide) + eval(widthM);
    if(getVal  > document.body.clientWidth ){
        leftSide = eval(leftSide) - eval(widthM);
        tagName.style.left = leftSide + 34 + 'px';
    }
    else
        tagName.style.left= leftSide + 'px';
    tagName.style.top= topSide + 'px';
        $("status").style.display="inline";
        new Ajax.Request(
                'index.aspx',
                {queue: {position: 'end', scope: 'command'},
                        method: 'post',
                        postBody: 'action=UsersAjax&file=UserDeleteStep1&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record='+userid,
                        onComplete: function(response) {
                                $("status").style.display="none";
                                $("tempdivContent").innerHTML= response.responseText;
                                 setSmownerAllUserOpts("transfer_user_id",current_user_id);
				                ShowLockDiv("tempdiv");
                        }
                }
        );
}
function ChangeApproveId(obj,userid,current_user_id)
{
	var tagName=document.getElementById('changeapproveiddiv');
	if(typeof(tagName) == 'undefined') {
		return;
	}
    var leftSide = findPosX(obj);
    var topSide = findPosY(obj);
    /leftSide=leftSide-180;
    var maxW = tagName.style.width;
    var widthM = maxW.substring(0,maxW.length-2);
    var getVal = eval(leftSide) + eval(widthM);
    if(getVal  > document.body.clientWidth ){
        leftSide = eval(leftSide) - eval(widthM);
        tagName.style.left = leftSide + 34 + 'px';
    }
    else
        tagName.style.left= leftSide + 'px';
    tagName.style.top= topSide + 'px';

    $("status").style.display="inline";
    new Ajax.Request(
            'index.aspx',
            {queue: {position: 'end', scope: 'command'},
                    method: 'post',
                    postBody: 'action=UsersAjax&file=ChangeApproveId&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record='+userid,
                    onComplete: function(response) {
                            $("status").style.display="none";
                            $("changeapproveidContent").innerHTML= response.responseText;
                             setSmownerAllUserOpts("transfer_user_id",current_user_id);
                            ShowLockDiv("changeapproveiddiv");
                    }
            }
    );
}

function ChangeUserData(obj,userid,current_user_id){

	var tagName=document.getElementById('changeuserdatadiv');
	if(typeof(tagName) == 'undefined') {
		return;
	}
    var leftSide = findPosX(obj);
    var topSide = findPosY(obj);
    leftSide=leftSide-280;
    var maxW = tagName.style.width;
    var widthM = maxW.substring(0,maxW.length-2);
    var getVal = eval(leftSide) + eval(widthM);
    if(getVal  > document.body.clientWidth ){
        leftSide = eval(leftSide) - eval(widthM);
        tagName.style.left = leftSide + 34 + 'px';
    }
    else
        tagName.style.left= leftSide + 'px';
    tagName.style.top= topSide + 'px';

	$("status").style.display="inline";
        new Ajax.Request(
                'index.aspx',
                {queue: {position: 'end', scope: 'command'},
                        method: 'post',
                        postBody: 'action=UsersAjax&file=ChangeUserData&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record='+userid,
                        onComplete: function(response) {
                                $("status").style.display="none";
                                $("changeuserdataContent").innerHTML= response.responseText;
                                setSmownerAllUserOpts("change_userdata_id",current_user_id);
                                ShowLockDiv("changeuserdatadiv");
                        }
                }
        );

}



function transferUser(del_userid)
{
        $("status").style.display="inline";
        $("DeleteLay").style.display="none";
       / var trans_userid=$('transfer_user_id').options[$('transfer_user_id').options.selectedIndex].value;
        var trans_userid=$('transfer_user_id').value;
        new Ajax.Request(
                'index.aspx',
                {queue: {position: 'end', scope: 'command'},
                        method: 'post',
                        postBody: 'module=Users&action=UsersAjax&file=DeleteUser&ajax=true&delete_user_id='+del_userid+'&transfer_user_id='+trans_userid,
                        onComplete: function(response) {
                                $("status").style.display="none";
                                $("ListViewContents").innerHTML= response.responseText;
                        }
                }
        );

}

function SaveChangeApproveId(old_userid)
{
        $("status").style.display="inline";
        fninvsh('changeapproveiddiv');
      /  var trans_userid=$('transfer_user_id').options[$('transfer_user_id').options.selectedIndex].value;
        var trans_userid=$('transfer_user_id').value;
        new Ajax.Request(
                'index.aspx',
                {queue: {position: 'end', scope: 'command'},
                        method: 'post',
                        postBody: 'module=Users&action=UsersAjax&file=SaveChangeApproveId&ajax=true&old_user_id='+old_userid+'&transfer_user_id='+trans_userid,
                        onComplete: function(response) {
                                $("status").style.display="none";
                                result = response.responseText; 
                                if(result.indexOf('SUCCESS') != -1){
                                    alert(alert_arr.CHANGE_APPROVE_USER_SUCCESS);
                                }else{
                                    alert(alert_arr.CHANGE_APPROVE_USER_FAILED);
                                }
								CloseLockDiv('changeapproveiddiv');
                        }
                }
        );

}




function SaveChangeUserData(old_userid)
{
        $("status").style.display="inline";
        fninvsh('changeuserdatadiv');
      /  var trans_userid=$('transfer_user_id').options[$('transfer_user_id').options.selectedIndex].value;
        var trans_userid=$('change_userdata_id').value;
        new Ajax.Request(
                'index.aspx',
                {queue: {position: 'end', scope: 'command'},
                        method: 'post',
                        postBody: 'module=Users&action=UsersAjax&file=SaveChangeUserData&ajax=true&old_user_id='+old_userid+'&transfer_user_id='+trans_userid,
                        onComplete: function(response) {
                                $("status").style.display="none";
                                result = response.responseText; 
                                if(result.indexOf('SUCCESS') != -1){
                                    alert(alert_arr.CHANGE_USER_DATA_SUCCESS);
                                }else{
                                    alert(alert_arr.CHANGE_USER_DATA_FAILED);
                                }
								CloseLockDiv('changeuserdatadiv');
                        }
                }
        );

}




function SearchUser_click(searchtype){
    var inputels=$$('.searchelement');
    var searchobj={}
    searchobj['search']='true';
    for(var i=0;i<inputels.length;i++){
        var inputel=inputels[i];
		if(inputel.name == 'last_name' && $F(inputel) == '请输入用户基本信息'){
			searchobj[inputel.name] = '';
		}else{
			searchobj[inputel.name]=$F(inputel);
		}
    }
    var findstr=$H(searchobj).toQueryString();
	var urlstring = $("list_userseach").value;
    if(searchtype == 'Basic'){
		urlstring += '&searchtype=BasicSearch&'+findstr;
    } 
	urlstring = urlstring +'&query=true&file=ListView&module=Users&action=UsersAjax&ajax=true';
	$("status").style.display="inline";
	new Ajax.Request(
		'index.aspx',
		{queue: {position: 'end', scope: 'command'},
			method: 'post',
			postBody: urlstring,
			onComplete: function(response) {
				result = response.responseText.split('&#&#&#');
				/alert(result);
				$("status").style.display="none";
				$("ListViewContents").innerHTML=  result;
				result.evalScripts();
			}
		}
	);
}
/**
 * 排序事件
 */
function getOrderBy(orderby,sorder){
	document.getElementById('orderby').value = orderby;
	document.getElementById('sorder').value = sorder;
	SearchUser_click('Basic');
}
/**
 * 搜索框右键事件
 */
function searchsubmit_keydown(evt){
	evt = (evt) ? evt : ((window.event) ? window.event : "")  
	keyCode = evt.keyCode ? evt.keyCode : (evt.which ? evt.which : evt.charCode);           
	if (keyCode == 13){ /13=enter
		SearchUser_click('Basic');
	}  
}

function getListUsersPage(module){
	var url=$("l…</script>
    </html>