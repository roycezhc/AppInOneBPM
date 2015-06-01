<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="listgroups.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Control_panel_admin" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>

<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
<td class="detail-content-td">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
											
<%--<script language="JAVASCRIPT" type="text/javascript" src="include/js/smoothscroll.js"></script>--%>
<%--<script language="JAVASCRIPT" type="text/javascript" src="modules/Users/Users.js"></script><script type="text/javascript" src="include/js/Mail.js"></script><script type="text/javascript" src="include/js/dtree.js"></script>--%>
<style type="text/css">@import url("admin_files/Integradedreports.css");</style>
<link href="admin_files/dtree.css" type="text/css" rel="stylesheet">
                  
<br>

<form action="index.aspx" method="post" name="EditView" id="form">
<input type="hidden" name="module" value="Users">
<input type="hidden" name="action" value="EditView">
<input type="hidden" name="return_action" value="ListView">
<input type="hidden" name="return_module" value="Users">
<input type="hidden" name="parenttab" value="Settings">

	<!-- DISPLAY -->
	<table border="0" cellspacing="0" cellpadding="5" width="100%" class="">
		<tbody><tr>
			<td width="50" rowspan="2" valign="top"><img src="admin_files/ico-users.gif" alt="系统用户" width="48" height="48" border="0" title="系统用户"></td>
			<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&action=indexparenttab=Settings">控制面板</a> &gt; 系统用户</b></td>
		</tr>
		<tr>
			<td valign="top" class="small">管理系统用户</td>
		</tr>
	</tbody></table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tableHeading">
	  <tbody><tr class="detail-heading" height="25px">
		<td width="20%">
			&nbsp;&nbsp;部门机构【<span style="cursor:pointer;" onclick="settingGroup_click();">设置</span>】
		</td>
		<td>&nbsp;&nbsp;</td>
		<td style="padding-left:0px;">
			用户列表
		</td>
	  </tr>
	  <tr>
		<td valign="top">
			<div id="groupListdiv" style="display:block; padding-left:15px;padding-top:15px;padding-bottom:15px; "><div class="dtree">
<div class="dTreeNode">
       <img id="igroup_d0" src="admin_files/base.gif" alt="">
            <a id="sgroup_d0" class="node" href="javascript:setGroupToUser('grouplist_group','group','0','部门');" title="部门" target="_self" onclick="javascript: group_d.s(0);">部门</a>
            </div>
            <div id="dgroup_d0" class="clip" style="display:block;">
            <div class="dTreeNode">
               <img src="admin_files/join.gif" alt="">
               <img id="igroup_d1" src="admin_files/page.gif" alt="">
               <a id="sgroup_d1" class="node" href="javascript:setGroupToUser('grouplist_1','1','-1::1','销售部');" title="销售部" target="_self" onclick="javascript: group_d.s(1);">销售部</a>
            </div>
            <div class="dTreeNode">
               <img src="admin_files/join.gif" alt="">
               <img id="igroup_d2" src="admin_files/page.gif" alt="">
               <a id="sgroup_d2" class="node" href="javascript:setGroupToUser('grouplist_2','2','-1::2','市场部');" title="市场部" target="_self" onclick="javascript: group_d.s(2);">市场部</a>
            </div>
                <div class="dTreeNode">
                <img src="admin_files/join.gif" alt="">
                <img id="igroup_d3" src="admin_files/page.gif" alt="">
                <a id="sgroup_d3" class="node" href="javascript:setGroupToUser('grouplist_3','3','-1::3','售后服务部');" title="售后服务部" target="_self" onclick="javascript: group_d.s(3);">售后服务部</a>
            </div>
            <div class="dTreeNode">
               <img src="admin_files/join.gif" alt="">
               <img id="igroup_d4" src="admin_files/page.gif" alt="">
               <a id="sgroup_d4" class="node" href="javascript:setGroupToUser('grouplist_4','4','-1::4','采购部');" title="采购部" target="_self" onclick="javascript: group_d.s(4);">采购部</a>
           </div>
           <div class="dTreeNode">
               <img src="admin_files/join.gif" alt="">
               <img id="igroup_d5" src="admin_files/page.gif" alt="">
               <a id="sgroup_d5" class="node" href="javascript:setGroupToUser('grouplist_5','5','-1::5','仓储部');" title="仓储部" target="_self" onclick="javascript: group_d.s(5);">仓储部</a>
           </div>
           <div class="dTreeNode">
               <img src="admin_files/joinbottom.gif" alt="">
               <img id="igroup_d6" src="admin_files/page.gif" alt="">
               <a id="sgroup_d6" class="node" href="javascript:setGroupToUser('grouplist_6','6','-1::6','财务部');" title="财务部" target="_self" onclick="javascript: group_d.s(6);">财务部</a>
            </div>
          </div>
        </div>
     </div>
		</td>
		<td></td>
		<td valign="top">
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
<tbody>
<tr height="25px" class="windLayerHead"><td>#</td><td nowra="">
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

		<!-- <span class="icon-stack" style="font-size:14px;cursor:pointer;" title="修改密码" onclick="window.open('index.aspx?module=Users&action=UsersAjax&file=ChangeListViewPassword&return_id=30&return_module=Users&return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
				<i class="icon-edit"> </i>
		</span>&nbsp;&nbsp; -->
		



     <!-- <a href="index.aspx?action=EditView&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record=30"><img src="admin_files/linkedit.png" alt="编辑" title="编辑" border="0"></a>&nbsp;&nbsp; -->
	
	<!-- 	
	<img src="admin_files/linkdel.gif" onclick="deleteUser(this,'30','1')" border="0"  alt="刪除" title="刪除" style="cursor:pointer;"/></a>&nbsp;&nbsp;
	 -->

<!-- 	<a href="index.aspx?action=EditView&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record=30&isDuplicate=true"><img src="admin_files/settingsActBtnDuplicate.gif" alt="复制" title="复制" border="0"></a>&nbsp;
 -->

	<!-- <img src="admin_files/repeat.png" onclick="ChangeApproveId(this,'30','1')" border="0"  alt="刪除" title="转移用户审批权限" style="cursor:pointer;"/>&nbsp;&nbsp; -->


	<!-- <span class="icon-stack" style="font-size:14px;cursor:pointer;" title="转移数据" onclick="ChangeUserData(this,'30','1')">
			<i class="icon-reply"></i>
	</span> -->


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

		<!-- <span class="icon-stack" style="font-size:14px;cursor:pointer;" title="修改密码" onclick="window.open('index.aspx?module=Users&action=UsersAjax&file=ChangeListViewPassword&return_id=29&return_module=Users&return_action=index','test',
				'width=320,height=200,resizable=no,scrollbars=0, toolbar=no, titlebar=no, left=200, top=226, screenX=100, screenY=126');return false;">
				<i class="icon-edit"> </i>
		</span>&nbsp;&nbsp; -->
		



     <!-- <a href="index.aspx?action=EditView&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record=29"><img src="admin_files/linkedit.png" alt="编辑" title="编辑" border="0"></a>&nbsp;&nbsp; -->
	
	<!-- 	
	<img src="admin_files/linkdel.gif" onclick="deleteUser(this,'29','1')" border="0"  alt="刪除" title="刪除" style="cursor:pointer;"/></a>&nbsp;&nbsp;
	 -->

<!-- 	<a href="index.aspx?action=EditView&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record=29&isDuplicate=true"><img src="admin_files/settingsActBtnDuplicate.gif" alt="复制" title="复制" border="0"></a>&nbsp;
 -->

	<!-- <img src="admin_files/repeat.png" onclick="ChangeApproveId(this,'29','1')" border="0"  alt="刪除" title="转移用户审批权限" style="cursor:pointer;"/>&nbsp;&nbsp; -->


	<!-- <span class="icon-stack" style="font-size:14px;cursor:pointer;" title="转移数据" onclick="ChangeUserData(this,'29','1')">
			<i class="icon-reply"></i>
	</span> -->


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
		</td>
	  </tr>
	</tbody></table>

</form>

<!--	部门设置		-->
<div id="settinggroupDiv" class="windLayerDiv" style="display:none;width:800px; left:350px;top:150px;z-index:10;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">&nbsp;&nbsp;部门设置</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('settinggroupDiv');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tableHeading">
			  <tbody><tr class="tabHeader" style="background-color:#FFF;height:35px;padding-top:2px">
				<td width="25%">
					部门机构&nbsp;&nbsp;
					【<span id="settinggroupname_span"></span>】
					<input type="hidden" id="settinggroupid" value="">
					<input type="hidden" id="settingparentgroup" value="">
				</td>
				<td>&nbsp;&nbsp;</td>
				<td style="padding-left:0px; width:73%">
					<table border="0" cellspacing="0" cellpadding="0" class="toolbarTable">
					  <tbody><tr>
					    <td>
							<!-- <table border="0" cellspacing="0" cellpadding="0" class="toolbarButton"
								onmouseover="this.className='toolbarButton-over'" 
								onmouseout="this.className='toolbarButton'"
								onclick="this.className='toolbarButton-over-click';
											addGroupInfo_click();" style="padding-bottom:0px;">
							  <tr>
								<td><div class="toolbar-icon icon_enum_add">&nbsp;</div></td>
								<td class="toolbar-text">新增</td>
							  </tr>
							</table> -->
							<button class="pure-button pure-button-success" title="增加" onclick="addGroupInfo_click();return false;">
								<i class="icon-plus"></i>
									增加</button>&nbsp;
						</td>
						<td class="toolbar-line-left">&nbsp;</td>
						<td class="toolbar-line">&nbsp;</td>
						<td class="toolbar-line-right">&nbsp;</td>
						<td>
							<!-- <table border="0" cellspacing="0" cellpadding="0" class="toolbarButton"
								onmouseover="this.className='toolbarButton-over'" 
								onmouseout="this.className='toolbarButton'"
								onclick="this.className='toolbarButton-over-click';
											editGroupInfo_click();" style="padding-bottom:0px;">
							  <tr>
								<td><div class="toolbar-icon icon_enum_edit">&nbsp;</div></td>
								<td class="toolbar-text">编辑</td>
							  </tr>
							</table> -->
							<button class="pure-button pure-button-edit" title="编辑 [Alt+E]" onclick="editGroupInfo_click();return false;">
								<i class="icon-fixed-width icon-pencil"></i>
									编辑</button>&nbsp;
						</td>
						<td class="toolbar-line-left">&nbsp;</td>
						<td class="toolbar-line">&nbsp;</td>
						<td class="toolbar-line-right">&nbsp;</td>
						<td>
							<!-- <table border="0" cellspacing="0" cellpadding="0" class="toolbarButton"
								onmouseover="this.className='toolbarButton-over'" 
								onmouseout="this.className='toolbarButton'"
								onclick="this.className='toolbarButton-over-click';
											delGroupInfo_click();" style="padding-bottom:0px;">
							  <tr>
								<td><div class="toolbar-icon icon_enum_del">&nbsp;</div></td>
								<td class="toolbar-text">删除</td>
							  </tr>
							</table> -->
							<button class="pure-button pure-button-danger" title="增加" onclick="delGroupInfo_click();return false;">
								<i class="icon-trash"></i>
									删除</button>&nbsp;
						</td>
					  </tr>
					</tbody></table>
				</td>
			  </tr>
			  <tr>
				<td valign="top">
					<div id="settinggroupListdiv" style="display:block; padding-left:15px;padding-top:5px;padding-bottom:15px;">
						<img src="admin_files/vtbusy.gif" title="正在初始化，请稍后...">
					</div>
				</td>
				<td></td>
				<td valign="top">
					<div id="settinggroupContents" style="display:block;">
						
					</div>
				</td>
			  </tr>
			  <tr>
				<td colspan="3">
					&nbsp;
				</td>
			  </tr>
			</tbody></table>
		</td>
	</tr>
</tbody></table>
<br>
<div class="windLayerFoot">&nbsp;</div>
<div class="windLayerCorner">&nbsp;</div>
<script>
    WindLayerDrag("settinggroupDiv", 'windLayerHeading');
</script>
</div>

<!--	添加部门		-->
<div id="addgroupDiv" class="windLayerDiv" style="display:none;width:350px; left:500px;top:250px;z-index:100001;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">&nbsp;&nbsp;<span id="addgroupTitle">添加</span></td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="fninvsh('addgroupDiv');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<form name="addgroupform" id="addgroupform" method="POST" action="index.aspx">
				<input type="hidden" name="module" value="Users">
				<input type="hidden" name="action" value="grouplistSave">
				<input type="hidden" name="mode" value="create">
				<input type="hidden" name="grouplistid" value="">
				<input type="hidden" name="isSubmit" value="1">
				<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center">
					<tbody><tr>
						<td align="right">
							部门名称
						</td>
						<td>
							<input type="text" name="addgroupname" id="addgroupname" size="3" value="" class="detailedViewTextBox" style="padding-left:0px; width:205px;" maxlength="100">
						</td>
					</tr><tr>
						<td align="right">
							负&nbsp;&nbsp;责&nbsp;&nbsp;人
						</td>
						<td>
							<input type="text" name="addgroup_user_name" id="addgroup_user_name" class="small detailedViewTextBox" style="width:180px; padding-left:1px;" value="">
							<input type="hidden" name="addgroup_user" id="addgroup_user">
							<input type="hidden" id="addgroup_user_seltlen" value="1">
							&nbsp;
							<button class="pure-button pure-button-share pure-icon-bu" style="width:23px;height:21px;" onclick="SelectUser(&quot;addgroup_user&quot;);return false;">
								<i class="icon-share"></i>
							</button>&nbsp;
						</td>
					</tr>
					<tr>
						<td align="right">
							部门描述
						</td>
						<td>
							<input type="text" name="adddescri" id="adddescri" size="3" value="" class="detailedViewTextBox" style="padding-left:0px; width:205px;" maxlength="100">
						</td>
					</tr>
					<tr>
						<td align="right">
							上级部门
						</td>
						<td>
							<input type="text" name="grouplist_parentid_name" id="grouplist_parentid_name" class="small detailedViewTextBox" style="width:180px; padding-left:1px;" value="">
							<input type="hidden" name="grouplist_parentid" id="grouplist_parentid">

							&nbsp;
							<button class="pure-button pure-button-share pure-icon-bu" style="width:23px;height:21px;" onclick="SeltGroupPopup(&quot;grouplist_parentid&quot;,&quot;Adjust&quot;);return false;">
								<i class="icon-share"></i>
							</button>&nbsp;

							<input type="hidden" name="grouplist_parentid_parentgroup" id="grouplist_parentid_parentgroup" value="">
							<input type="hidden" name="currentparentgroupid" id="currentparentgroupid" value="">
							<!-- <input type="hidden" name="addparentgroup" value="" /> -->
						</td>
					</tr>
				</tbody></table>
			
		</form></td>
	</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="100%">
	<tbody><tr>
		<td align="center">
			<button class="pure-button pure-button-success" title="保存" accesskey="S" name="savebutton" onclick="addgroupSave();return false;">
				<i class="icon-ok"></i> 保存
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="pure-button pure-button-cancel" title="取消 [Alt+X]" accesskey="X" onclick="fninvsh('addgroupDiv');return false;" name="button">
				<i class="icon-off"></i> 关闭
			</button>&nbsp;
		</td>
	</tr>
</tbody></table>

<br>
<script>
    WindLayerDrag("addgroupDiv", 'windLayerHeading');
</script>
</div>

<!--	选择部门		-->
<div id="seltgroupdiv" class="windLayerDiv" style="display:none;width:350px; left:660px;top:220px;z-index:100002;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">&nbsp;&nbsp;选择部门</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="fninvsh('seltgroupdiv');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="seltgroupContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("seltgroupdiv", 'windLayerHeading');
</script>
</div>

<!--	删除部门时选择数据所转移部门机构		-->
<div id="delgroupdiv" class="windLayerDiv" style="display:none;width:350px; left:500px;top:250px;z-index:100001;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">
		&nbsp;&nbsp;删除部门 (<span id="delgroupTitle"></span>)
	</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="fninvsh('delgroupdiv');">&nbsp;
	</td>
</tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="5" width="97%" align="center" style="margin-top:5px;">
	<tbody><tr bgcolor="#ddd">
		<td align="center" id="delgroupNotes">
		</td>
	</tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small" align="center">
            <!-- popup specific content fill in starts -->

			<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center">
					<tbody><tr>
						<td align="right">
							归属部门
						</td>
						<td>
							<input type="text" name="delgroup_parentid_name" id="delgroup_parentid_name" class="small detailedViewTextBox" style="width:180px; padding-left:1px;" value="">
							<input type="hidden" name="delgroup_parentid" id="delgroup_parentid">

							&nbsp;
							<button class="pure-button pure-button-share pure-icon-bu" style="width:23px;height:21px;" onclick="SeltGroupPopup(&quot;delgroup_parentid&quot;,&quot;Delete&quot;);return false;">
								<i class="icon-share"></i>
							</button>&nbsp;

							<input type="hidden" name="delgroup_parentid_parentgroup" id="delgroup_parentid_parentgroup" value="">
							<input type="hidden" name="currentdelgroupid" id="currentdelgroupid" value="">
							<input type="hidden" name="delgroupid" id="delgroupid" value="">
						</td>
					</tr>
				</tbody></table>
		</td>
	</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="100%">
	<tbody><tr>
		<td align="center">
			<button class="pure-button pure-button-success" title="保存" accesskey="S" name="savebutton" onclick="delgroupSave();return false;">
				<i class="icon-ok"></i> 保存
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="pure-button pure-button-cancel" title="取消 [Alt+X]" accesskey="X" onclick="fninvsh('delgroupdiv');return false;" name="button">
				<i class="icon-off"></i> 关闭
			</button>&nbsp;
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("delgroupdiv", 'windLayerHeading');
</script>
</div>

<!--	删除用户		-->
<div id="tempdiv" class="windLayerDiv" style="display:none;width:400px;left:800px;top:200px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">
		&nbsp;&nbsp;
	</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('tempdiv');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="tempdivContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("tempdiv", 'windLayerHeading');
</script>
</div>


<!--	转义用户审批权限		-->
<div id="changeapproveiddiv" class="windLayerDiv" style="display:none;width:400px;left:800px;top:200px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">&nbsp;&nbsp;转移用户审批权限</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('changeapproveiddiv');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="changeapproveidContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("changeapproveiddiv", 'windLayerHeading');
</script>
</div>





<!--	转移用户数据		-->
<div id="changeuserdatadiv" class="windLayerDiv" style="display:none;width:400px;left:800px;top:200px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move">&nbsp;&nbsp;转移用户数据</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('changeuserdatadiv');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="changeuserdataContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("changeuserdatadiv", 'windLayerHeading');
</script>
</div>







<script>
    groupListBind("groupListdiv");

    window.onload = function () {
        var obj = document.EditView.last_name;
        textboxChange_blur(obj);
    }

    function getListViewEntries_js(module, url) {
        $("status").style.display = "inline";
        new Ajax.Request(
                'index.aspx',
                { queue: { position: 'end', scope: 'command' },
                    method: 'post',
                    postBody: 'module=Users&action=UsersAjax&file=ListView&ajax=true&' + url,
                    onComplete: function (response) {
                        $("status").style.display = "none";
                        $("ListViewContents").innerHTML = response.responseText;
                    }
                }
        );
    }

    function getListViewWithPageNo(module, pageElement) {
        /var pageno = document.getElementById('listviewpage').value;
        var pageno = pageElement.options[pageElement.options.selectedIndex].value;
        getListViewEntries_js(module, 'start=' + pageno);
    }

    function deleteUser(obj, userid, current_user_id) {
        var tagName = document.getElementById('tempdiv');
        if (typeof (tagName) == 'undefined') {
            return;
        }
        var leftSide = findPosX(obj);
        var topSide = findPosY(obj);
        /leftSide=leftSide-180;
        var maxW = tagName.style.width;
        var widthM = maxW.substring(0, maxW.length - 2);
        var getVal = eval(leftSide) + eval(widthM);
        if (getVal > document.body.clientWidth) {
            leftSide = eval(leftSide) - eval(widthM);
            tagName.style.left = leftSide + 34 + 'px';
        }
        else
            tagName.style.left = leftSide + 'px';
        tagName.style.top = topSide + 'px';
        $("status").style.display = "inline";
        new Ajax.Request(
                'index.aspx',
                { queue: { position: 'end', scope: 'command' },
                    method: 'post',
                    postBody: 'action=UsersAjax&file=UserDeleteStep1&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record=' + userid,
                    onComplete: function (response) {
                        $("status").style.display = "none";
                        $("tempdivContent").innerHTML = response.responseText;
                        setSmownerAllUserOpts("transfer_user_id", current_user_id);
                        ShowLockDiv("tempdiv");
                    }
                }
        );
    }
    function ChangeApproveId(obj, userid, current_user_id) {
        var tagName = document.getElementById('changeapproveiddiv');
        if (typeof (tagName) == 'undefined') {
            return;
        }
        var leftSide = findPosX(obj);
        var topSide = findPosY(obj);
        /leftSide=leftSide-180;
        var maxW = tagName.style.width;
        var widthM = maxW.substring(0, maxW.length - 2);
        var getVal = eval(leftSide) + eval(widthM);
        if (getVal > document.body.clientWidth) {
            leftSide = eval(leftSide) - eval(widthM);
            tagName.style.left = leftSide + 34 + 'px';
        }
        else
            tagName.style.left = leftSide + 'px';
        tagName.style.top = topSide + 'px';

        $("status").style.display = "inline";
        new Ajax.Request(
            'index.aspx',
            { queue: { position: 'end', scope: 'command' },
                method: 'post',
                postBody: 'action=UsersAjax&file=ChangeApproveId&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record=' + userid,
                onComplete: function (response) {
                    $("status").style.display = "none";
                    $("changeapproveidContent").innerHTML = response.responseText;
                    setSmownerAllUserOpts("transfer_user_id", current_user_id);
                    ShowLockDiv("changeapproveiddiv");
                }
            }
    );
    }

    function ChangeUserData(obj, userid, current_user_id) {

        var tagName = document.getElementById('changeuserdatadiv');
        if (typeof (tagName) == 'undefined') {
            return;
        }
        var leftSide = findPosX(obj);
        var topSide = findPosY(obj);
        leftSide = leftSide - 280;
        var maxW = tagName.style.width;
        var widthM = maxW.substring(0, maxW.length - 2);
        var getVal = eval(leftSide) + eval(widthM);
        if (getVal > document.body.clientWidth) {
            leftSide = eval(leftSide) - eval(widthM);
            tagName.style.left = leftSide + 34 + 'px';
        }
        else
            tagName.style.left = leftSide + 'px';
        tagName.style.top = topSide + 'px';

        $("status").style.display = "inline";
        new Ajax.Request(
                'index.aspx',
                { queue: { position: 'end', scope: 'command' },
                    method: 'post',
                    postBody: 'action=UsersAjax&file=ChangeUserData&return_action=ListView&return_module=Users&module=Users&parenttab=Settings&record=' + userid,
                    onComplete: function (response) {
                        $("status").style.display = "none";
                        $("changeuserdataContent").innerHTML = response.responseText;
                        setSmownerAllUserOpts("change_userdata_id", current_user_id);
                        ShowLockDiv("changeuserdatadiv");
                    }
                }
        );

    }



    function transferUser(del_userid) {
        $("status").style.display = "inline";
        $("DeleteLay").style.display = "none";
        / var trans_userid=$('transfer_user_id').options[$('transfer_user_id').options.selectedIndex].value;
        var trans_userid = $('transfer_user_id').value;
        new Ajax.Request(
                'index.aspx',
                { queue: { position: 'end', scope: 'command' },
                    method: 'post',
                    postBody: 'module=Users&action=UsersAjax&file=DeleteUser&ajax=true&delete_user_id=' + del_userid + '&transfer_user_id=' + trans_userid,
                    onComplete: function (response) {
                        $("status").style.display = "none";
                        $("ListViewContents").innerHTML = response.responseText;
                    }
                }
        );

    }

    function SaveChangeApproveId(old_userid) {
        $("status").style.display = "inline";
        fninvsh('changeapproveiddiv');
        /  var trans_userid=$('transfer_user_id').options[$('transfer_user_id').options.selectedIndex].value;
        var trans_userid = $('transfer_user_id').value;
        new Ajax.Request(
                'index.aspx',
                { queue: { position: 'end', scope: 'command' },
                    method: 'post',
                    postBody: 'module=Users&action=UsersAjax&file=SaveChangeApproveId&ajax=true&old_user_id=' + old_userid + '&transfer_user_id=' + trans_userid,
                    onComplete: function (response) {
                        $("status").style.display = "none";
                        result = response.responseText;
                        if (result.indexOf('SUCCESS') != -1) {
                            alert(alert_arr.CHANGE_APPROVE_USER_SUCCESS);
                        } else {
                            alert(alert_arr.CHANGE_APPROVE_USER_FAILED);
                        }
                        CloseLockDiv('changeapproveiddiv');
                    }
                }
        );

    }




    function SaveChangeUserData(old_userid) {
        $("status").style.display = "inline";
        fninvsh('changeuserdatadiv');
        /  var trans_userid=$('transfer_user_id').options[$('transfer_user_id').options.selectedIndex].value;
        var trans_userid = $('change_userdata_id').value;
        new Ajax.Request(
                'index.aspx',
                { queue: { position: 'end', scope: 'command' },
                    method: 'post',
                    postBody: 'module=Users&action=UsersAjax&file=SaveChangeUserData&ajax=true&old_user_id=' + old_userid + '&transfer_user_id=' + trans_userid,
                    onComplete: function (response) {
                        $("status").style.display = "none";
                        result = response.responseText;
                        if (result.indexOf('SUCCESS') != -1) {
                            alert(alert_arr.CHANGE_USER_DATA_SUCCESS);
                        } else {
                            alert(alert_arr.CHANGE_USER_DATA_FAILED);
                        }
                        CloseLockDiv('changeuserdatadiv');
                    }
                }
        );

    }




    function SearchUser_click(searchtype) {
        var inputels = $$('.searchelement');
        var searchobj = {}
        searchobj['search'] = 'true';
        for (var i = 0; i < inputels.length; i++) {
            var inputel = inputels[i];
            if (inputel.name == 'last_name' && $F(inputel) == '请输入用户基本信息') {
                searchobj[inputel.name] = '';
            } else {
                searchobj[inputel.name] = $F(inputel);
            }
        }
        var findstr = $H(searchobj).toQueryString();
        var urlstring = $("list_userseach").value;
        if (searchtype == 'Basic') {
            urlstring += '&searchtype=BasicSearch&' + findstr;
        }
        urlstring = urlstring + '&query=true&file=ListView&module=Users&action=UsersAjax&ajax=true';
        $("status").style.display = "inline";
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: urlstring,
		    onComplete: function (response) {
		        result = response.responseText.split('&#&#&#');
		        /alert(result);
		        $("status").style.display = "none";
		        $("ListViewContents").innerHTML = result;
		        result.evalScripts();
		    }
		}
	);
    }
    /**
    * 排序事件
    */
    function getOrderBy(orderby, sorder) {
        document.getElementById('orderby').value = orderby;
        document.getElementById('sorder').value = sorder;
        SearchUser_click('Basic');
    }
    /**
    * 搜索框右键事件
    */
    function searchsubmit_keydown(evt) {
        evt = (evt) ? evt : ((window.event) ? window.event : "")
        keyCode = evt.keyCode ? evt.keyCode : (evt.which ? evt.which : evt.charCode);
        if (keyCode == 13) { /13=enter
            SearchUser_click('Basic');
        }
    }

    function getListUsersPage(module) {
        var url = $("list_userseach").value;
        var listpage = document.getElementById("listpage").value;
        url += '&listpage=' + listpage;
        getListViewEntries_js(module, url);
    }


    function getListUsersByChangePage(page) {
        var url = $("list_userseach").value;
        url += '&current_page=' + page;
        var module = "Users";
        getListViewEntries_js(module, url);
    }

    function adduser_click() {
        window.location.href = 'index.aspx?module=Users&action=EditView&return_module=Users&return_action=ListView&parenttab=Settings';
    }
    function openPopup() {
        window.open("index.aspx?module=Users&action=UsersAjax&file=RolePopup&parenttab=Settings",
				"roles_popup_window", "height=425,width=640,toolbar=no,menubar=no,dependent=yes,resizable =no");
    }
    function ClearRole_click() {
        document.getElementById('role_name').value = '';
        document.getElementById('user_role').value = '';
    }
</script>



					&nbsp;
				</div>
			</td></tr>
		</tbody></table>
        </td>
</asp:Content>