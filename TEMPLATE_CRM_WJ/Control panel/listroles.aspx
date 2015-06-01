<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="listroles.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_listroles" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>

<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
<td class="detail-content-td">
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: -45px;">
			<tbody><tr><td valign="top">
    <div class="detail-panel-div">											
    <script language="JAVASCRIPT" type="text/javascript" src="admin_files/smoothscroll.js"></script>
    <style type="text/css">
    a.x {
		    color:black;
		    text-align:center;
		    text-decoration:none;
		    padding:5px;
		    font-weight:bold;
    }
	
    a.x:hover {
		    color:#333333;
		    text-decoration:underline;
		    font-weight:bold;
    }

    ul {color:black;}	 
	
    .drag_Element{
	    position:relative;
	    left:0px;
	    top:0px;
	    padding-left:5px;
	    padding-right:5px;
	    border:0px dashed #CCCCCC;
	    visibility:hidden;
    }

    #Drag_content{
	    position:absolute;
	    left:0px;
	    top:0px;
	    padding-left:5px;
	    padding-right:5px;
	    background-color:#000066;
	    color:#FFFFFF;
	    border:1px solid #CCCCCC;
	    font-weight:bold;
	    display:none;
    }
    </style>
    <script>

        function displayCoords(event) {
            var move_Element = document.getElementById('Drag_content').style;
            if (!event) {
                move_Element.left = e.pageX + 'px';
                move_Element.top = e.pageY + 10 + 'px';
            }
            else {
                move_Element.left = event.clientX + 'px';
                move_Element.top = event.clientY + 10 + 'px';
            }
        }

        function fnRevert(e) {
            if (e.button == 2) {
                document.getElementById('Drag_content').style.display = 'none';
                hideAll = false;
                parentId = "Head";
                parentName = "DEPARTMENTS";
                childId = "NULL";
                childName = "NULL";
            }
        }

    </script>
    <script>

        function callCreateRoleInfoDiv(roleid) {
            new Ajax.Request(
		    'index.aspx',
		    { queue: { position: 'end', scope: 'command' },
		        method: 'post',
		        postBody: 'module=Users&action=UsersAjax&file=ShowRoleInfo&roleid=' + roleid,
		        onComplete: function (response) {
		            $("createroleinfoContent").innerHTML = response.responseText;
		            show("createroleinfodiv");
		        }
		    }
	    );
        }

    </script>
    <!--	关联用户		-->
    <div id="createroleinfodiv" class="windLayerDiv" style="display:none;width:350px; left:660px;top:220px;z-index:100002;">
    <table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
    <tbody><tr class="windLayerHeadingTr">
	    <td class="windLayerHeading" align="left" width="80%" style="cursor:move">&nbsp;&nbsp;关联用户 :</td>
	    <td>&nbsp;</td>
	    <td align="right">
		    <input class="windLayerBtclose" type="button" title="关闭" onclick="fninvsh('createroleinfodiv');">&nbsp;
	    </td>
    </tr>
    </tbody></table>
    <table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	    <tbody><tr>
		    <td class="small">
                <!-- popup specific content fill in starts -->
			    <div id="createroleinfoContent"></div>
		    </td>
	    </tr>
    </tbody></table>
    <br>
    <script>
        WindLayerDrag("createroleinfodiv", 'windLayerHeading');
    </script>
    </div>

				    <!-- DISPLAY --><br>
				    <table border="0" cellspacing="0" cellpadding="5" width="100%" class="settingsSelUITopLine">
				    <tbody><tr>
					    <td width="50" rowspan="2" valign="top"><img src="admin_files/ico-roles.gif" alt="Roles" width="48" height="48" border="0" title="Roles"></td>
					    <td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 角色权限</b></td>
				    </tr>
				    <tr>
					    <td valign="top" class="small">管理角色的上下级关系和角色对模块的权限</td>
				    </tr>
				    </tbody></table>
				    <table border="0" cellspacing="0" cellpadding="10" width="100%">
				    <tbody><tr><td>使用帮助：用鼠标点击角色，可以弹出角色对模块的具体操作权限。把鼠标放在某个角色上，旁边会出现添加下级角色、编辑角色基本信息、编辑角色权限/复制角色权限、查看关联用户和删除角色的图标，点击相应图标可以维护角色权限。
				    </td></tr></tbody></table>
				
				    <br>
				    <table border="0" cellspacing="0" cellpadding="10" width="100%">
				    <tbody><tr>
				    <td>
				
					    <table border="0" cellspacing="0" cellpadding="2" width="100%" class="tableHeading">
					    <tbody><tr>
						    <td class="big"><strong>角色和继承关系</strong></td>
						    <td class="small" align="right">&nbsp;</td>
					    </tr>
					    </tbody></table>

					    <div id="RoleTreeFull" onmousemove="displayCoords(event)" style="padding-left: 10px;"> 
                			            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="small">
    <tbody><tr>
    <td style="padding:10px;" valign="top"><ul class="uil" id="H1" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H1')" onmouseout="fnInVisible('layer_H1')"><tbody><tr><td nowrap=""><img src="admin_files/menu_root.gif" id="img_H1" border="0" alt="顶层" title="顶层" align="absmiddle"><b class="genHeaderGray">总公司</b></td><td nowrap=""><div id="layer_H1" class="drag_Element"><a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H1"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a></div></td></tr></tbody></table></li><ul class="uil" id="H2" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H2')" onmouseout="fnInVisible('layer_H2')"><tbody><tr><td nowrap=""><b style="font-weight:bold;margin:0;padding:0;cursor:pointer;"><img src="admin_files/minus.gif" id="img_H2" border="0" alt="展开/收缩" title="展开/收缩" align="absmiddle" onclick="showhide('H3,H20,H15','img_H2')" style="cursor:pointer;">&nbsp;&nbsp;<img src="admin_files/folderopen.gif" id="img_H2_dir" border="0" align="absmiddle"><a href="javascript:put_child_ID('user_H2');" class="x" id="user_H2">总经理</a></b></td><td nowrap=""><div id="layer_H2" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H2"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H2&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H2&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H2"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H2')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;</div></td></tr></tbody></table></li><ul class="uil" id="H15" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H15')" onmouseout="fnInVisible('layer_H15')"><tbody><tr><td nowrap=""><b style="font-weight:bold;margin:0;padding:0;cursor:pointer;"><img src="admin_files/minus.gif" id="img_H15" border="0" alt="展开/收缩" title="展开/收缩" align="absmiddle" onclick="showhide('H16','img_H15')" style="cursor:pointer;">&nbsp;&nbsp;<img src="admin_files/folderopen.gif" id="img_H15_dir" border="0" align="absmiddle"><a href="javascript:put_child_ID('user_H15');" class="x" id="user_H15">财务总监</a></b></td><td nowrap=""><div id="layer_H15" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H15"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H15&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H15&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H15"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H15')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H15&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li><ul class="uil" id="H16" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H16')" onmouseout="fnInVisible('layer_H16')"><tbody><tr><td nowrap=""><img src="admin_files/vtigerDevDocs.gif" id="img_H16" border="0" align="absmiddle" style="margin-right:-2px;">&nbsp;&nbsp;<a href="javascript:put_child_ID('user_H16');" class="x" id="user_H16">财务助理</a></td><td nowrap=""><div id="layer_H16" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H16"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H16&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H16&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H16"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H16')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H16&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li></ul></ul><ul class="uil" id="H20" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H20')" onmouseout="fnInVisible('layer_H20')"><tbody><tr><td nowrap=""><img src="admin_files/vtigerDevDocs.gif" id="img_H20" border="0" align="absmiddle" style="margin-right:-2px;">&nbsp;&nbsp;<a href="javascript:put_child_ID('user_H20');" class="x" id="user_H20">售后</a></td><td nowrap=""><div id="layer_H20" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H20"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H20&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H20&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H20"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H20')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H20&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li></ul><ul class="uil" id="H3" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H3')" onmouseout="fnInVisible('layer_H3')"><tbody><tr><td nowrap=""><b style="font-weight:bold;margin:0;padding:0;cursor:pointer;"><img src="admin_files/minus.gif" id="img_H3" border="0" alt="展开/收缩" title="展开/收缩" align="absmiddle" onclick="showhide('H4,H6,H19,H17,H21','img_H3')" style="cursor:pointer;">&nbsp;&nbsp;<img src="admin_files/folderopen.gif" id="img_H3_dir" border="0" align="absmiddle"><a href="javascript:put_child_ID('user_H3');" class="x" id="user_H3">副总经理</a></b></td><td nowrap=""><div id="layer_H3" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H3"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H3&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H3&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H3"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H3')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H3&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li><ul class="uil" id="H17" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H17')" onmouseout="fnInVisible('layer_H17')"><tbody><tr><td nowrap=""><img src="admin_files/vtigerDevDocs.gif" id="img_H17" border="0" align="absmiddle" style="margin-right:-2px;">&nbsp;&nbsp;<a href="javascript:put_child_ID('user_H17');" class="x" id="user_H17">技术支持</a></td><td nowrap=""><div id="layer_H17" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H17"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H17&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H17&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H17"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H17')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H17&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li></ul><ul class="uil" id="H19" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H19')" onmouseout="fnInVisible('layer_H19')"><tbody><tr><td nowrap=""><img src="admin_files/vtigerDevDocs.gif" id="img_H19" border="0" align="absmiddle" style="margin-right:-2px;">&nbsp;&nbsp;<a href="javascript:put_child_ID('user_H19');" class="x" id="user_H19">仓管人员</a></td><td nowrap=""><div id="layer_H19" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H19"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H19&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H19&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H19"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H19')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H19&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li></ul><ul class="uil" id="H21" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H21')" onmouseout="fnInVisible('layer_H21')"><tbody><tr><td nowrap=""><img src="admin_files/vtigerDevDocs.gif" id="img_H21" border="0" align="absmiddle" style="margin-right:-2px;">&nbsp;&nbsp;<a href="javascript:put_child_ID('user_H21');" class="x" id="user_H21">市场营销</a></td><td nowrap=""><div id="layer_H21" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H21"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H21&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H21&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H21"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H21')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H21&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li></ul><ul class="uil" id="H4" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H4')" onmouseout="fnInVisible('layer_H4')"><tbody><tr><td nowrap=""><b style="font-weight:bold;margin:0;padding:0;cursor:pointer;"><img src="admin_files/minus.gif" id="img_H4" border="0" alt="展开/收缩" title="展开/收缩" align="absmiddle" onclick="showhide('H8','img_H4')" style="cursor:pointer;">&nbsp;&nbsp;<img src="admin_files/folderopen.gif" id="img_H4_dir" border="0" align="absmiddle"><a href="javascript:put_child_ID('user_H4');" class="x" id="user_H4">销售经理</a></b></td><td nowrap=""><div id="layer_H4" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H4"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H4&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H4&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H4"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H4')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H4&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li><ul class="uil" id="H8" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H8')" onmouseout="fnInVisible('layer_H8')"><tbody><tr><td nowrap=""><img src="admin_files/vtigerDevDocs.gif" id="img_H8" border="0" align="absmiddle" style="margin-right:-2px;">&nbsp;&nbsp;<a href="javascript:put_child_ID('user_H8');" class="x" id="user_H8">销售人员</a></td><td nowrap=""><div id="layer_H8" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H8"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H8&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H8&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H8"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H8')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H8&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li></ul></ul><ul class="uil" id="H6" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H6')" onmouseout="fnInVisible('layer_H6')"><tbody><tr><td nowrap=""><b style="font-weight:bold;margin:0;padding:0;cursor:pointer;"><img src="admin_files/minus.gif" id="img_H6" border="0" alt="展开/收缩" title="展开/收缩" align="absmiddle" onclick="showhide('H18','img_H6')" style="cursor:pointer;">&nbsp;&nbsp;<img src="admin_files/folderopen.gif" id="img_H6_dir" border="0" align="absmiddle"><a href="javascript:put_child_ID('user_H6');" class="x" id="user_H6">采购经理</a></b></td><td nowrap=""><div id="layer_H6" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H6"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H6&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H6&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H6"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H6')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H6&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li><ul class="uil" id="H18" style="display:block;list-style-type:none;"><li style="margin-top:-3px;"><table border="0" cellpadding="0" cellspacing="0" onmouseover="fnVisible('layer_H18')" onmouseout="fnInVisible('layer_H18')"><tbody><tr><td nowrap=""><img src="admin_files/vtigerDevDocs.gif" id="img_H18" border="0" align="absmiddle" style="margin-right:-2px;">&nbsp;&nbsp;<a href="javascript:put_child_ID('user_H18');" class="x" id="user_H18">采购助理</a></td><td nowrap=""><div id="layer_H18" class="drag_Element">
													    <a href="index.aspx?module=Users&amp;action=CreateProfile&amp;parenttab=Settings&amp;parent=H18"><img src="admin_files/Rolesadd.gif" align="absmiddle" border="0" alt="新增角色" title="新增角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=createroleInfo&amp;roleid=H18&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色基本信息" title="编辑角色基本信息"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=profilePrivileges&amp;roleid=H18&amp;parenttab=Settings&amp;mode=edit"><img src="admin_files/RolesEdit.gif" align="absmiddle" border="0" alt="编辑角色权限" title="编辑角色权限"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=CopyProfile&amp;parenttab=Settings&amp;parent=H18"><img src="admin_files/settingsActBtnDuplicate.gif" align="absmiddle" border="0" alt="复制角色" title="复制角色"></a>&nbsp;<a href="javascript:callCreateRoleInfoDiv('H18')"><img src="admin_files/view.gif" align="absmiddle" border="0" alt="查看角色" title="查看角色"></a>&nbsp;<a href="index.aspx?module=Users&amp;action=RoleDelStep1&amp;roleid=H18&amp;parenttab=Settings"><img src="admin_files/RolesDelete.gif" align="absmiddle" border="0" alt="删除角色" title="删除角色"></a></div></td></tr></tbody></table></li></ul></ul></ul></ul></ul></td>
    </tr>
    </tbody></table>		                	</div>
					    <table cellspacing="0" cellpadding="5" width="100%" class="crmTable small" style="border-top: 2px dotted rgb(204, 204, 204);">
					    <tbody><tr>
						    <td valign="top" nowrap="">
						    提示：
						    <ul class="small">
						    <li>角色定义：角色是授权可以对系统内哪些模块具备操作权限，定位在系统中上下位置的级别名称。</li>
						    <li>角色与角色的不同主要体现在对模块的操作权限上，即对系统内多少模块具备什么操作权限</li>
						    <li>上级可以查看和编辑下级的记录，下级不能查看和编辑上级的记录，同级之间不能互相查看。</li>
						    <li>实际工作中不同部门同一岗位应该设置不同角色，以确定上下级关系。</li>
						    <li>上级不能查看自己同级别的下级角色的记录。</li>
						    <li>一个用户对应一个角色，一个角色可以对应多个用户。</li>
						    <li>通过角色可以控制全局权限，可以查看和编辑所选模块的所有记录。</li>
						    <li>通过角色可以控制模块权限，可以新增、编辑、查看和删除模块的记录。</li>
						    <li>通过角色可以控制字段权限，可以只读和编辑模块字段的值。</li>						
						    </ul>
						    </td>
					    </tr>
					    </tbody></table>

				    </td>
				    </tr>
				    </tbody></table>
			    </div>
 </td>
 </tr>
 </tbody>
 </table>
 </td>
</asp:Content>



