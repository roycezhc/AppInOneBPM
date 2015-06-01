<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="CustomModuleList.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_CustumModuleList" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
<td class="detail-content-td">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
                    <script language="JavaScript" src="admin_files/general.js" type="text/javascript"></script>
					<script language="JavaScript" type="text/javascript" src="admin_files/customview.js"></script>
<link rel="stylesheet" type="text/css" href="admin_files/ajaxtabs.css">
<script language="javascript">

    function deleteCustomModule(id) {
        if (confirm(alert_arr.SURE_TO_DELETE)) {
            /* document.form.action="index.aspx?module=Settings&action=DeleteCustomModule&id="+id;
            document.form.submit();*/
            window.location.href = "index.aspx?module=Settings&action=DeleteCustomModule&id=" + id;
        }
    }
    function exportCustomModule(id) {
        if (confirm(alert_arr.SURE_TO_EXPORT)) {
            /*  document.form.action="index.aspx?module=Settings&action=SettingsAjax&file=exportCustomModule&id="+id;
            document.form.submit();*/
            window.location.href = "index.aspx?module=Settings&action=SettingsAjax&file=exportCustomModule&id=" + id;
        }
    }
    function installCustomModule(id) {
        if (confirm(alert_arr.SURE_TO_INSTALL)) {
            window.location.href = "index.aspx?module=Settings&action=installCustomModule&id=" + id;
        }
    }
    function uninstallCustomModule(id) {
        if (confirm(alert_arr.SURE_TO_UNINSTALL)) {
            window.location.href = "index.aspx?module=Settings&action=uninstallCustomModule&id=" + id;
        }
    }

    function getCreateCustomModuleForm(id) {
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=CreateCustomModule&id=' + id + '&parenttab=Settings&ajax=true',
		    onComplete: function (response) {
		       
		        $("createmoduleContent").innerHTML = response.responseText;
		       
		        ShowLockDiv("createmodule");
		        
		        //execJS($('moduleLayer'));
		    }
		}
	);

    }
    function checkIsCreateModule() {
        var enname = document.addtodb.enname.value;
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=isCreateModule&parenttab=Settings&ajax=true&enname=' + enname,
		    onComplete: function (response) {
		        if (response.responseText == "true") {
		            document.addtodb.submit();
		        } else if (response.responseText == "false") {
		            alert(alert_arr.MODULES_FOLDER_NOT_WRITABLE);
		        } else {
		            alert(alert_arr.MODULES_EXISTED);
		        }
		    }
		}
	);

    }
    function validate_module() {
        if (document.addtodb.enname.value == "") {
            alert(alert_arr.TAB_KEY_IS_NULL);
            document.addtodb.enname.focus();
            return false;
        } else {
            var str = document.addtodb.enname.value;
            var re = /^[a-zA-Z]+$/i;
            if (!re.test(str)) {
                alert(alert_arr.INPUT_VALID_CHARACTER);
                document.addtodb.enname.focus();
                return false;
            } else if (str.length < 5) {
                alert(alert_arr.INPUT_VALID_CHARACTER_LENGTH);
                document.addtodb.enname.focus();
                return false;
            }
        }
        if (document.addtodb.cnname.value == "") {
            alert(alert_arr.TAB_LABEL_IS_NULL);
            document.addtodb.cnname.focus();
            return false;
        } else {
            if (isNaN(trim(document.addtodb.order.value))) {
                alert(alert_arr.LBL_ENTER_VALID_NO);
                document.addtodb.order.focus();
                return false;
            }
        }
        if (document.addtodb.order.value == "") {
            alert(alert_arr.DISPLAY_ORDER_IS_NULL);
            document.addtodb.order.focus();
            return false;
        } else {
            if (isNaN(trim(document.addtodb.order.value))) {
                alert(alert_arr.LBL_ENTER_VALID_NO);
                document.addtodb.order.focus();
                return false;
            }
        }
        Jquery.ajax({
            url: "index.aspx",
            data: "module=Settings&action=SettingsAjax&file=CheckEnname&enname=" + document.addtodb.enname.value,
            success: function (rest) {
                if (rest == 'SUCCESS') {
                    alert(alert_arr.INPUT_VALID_CHARACTER_MODULE);
                    document.addtodb.enname.focus();
                    return false;
                } else {
                    if (checkRelatedmodule()) {
                        checkIsCreateModule();
                    }
                }
            }
        })

    }
    function checkRelatedmodule() {
        var relatedmodule1 = document.addtodb.relatedmodule1.value;
        var relatedmodule2 = document.addtodb.relatedmodule2.value;
        var relatedmodule3 = document.addtodb.relatedmodule3.value;
        if (relatedmodule1 != "") {
            if (relatedmodule2 != "") {
                if (relatedmodule1 == relatedmodule2) {
                    alert(alert_arr.RELATEDMODULE_REPEATED);
                    return false;
                }
            }
            if (relatedmodule3 != "") {
                if (relatedmodule1 == relatedmodule3) {
                    alert(alert_arr.RELATEDMODULE_REPEATED);
                    return false;
                }
            }

        }
        if (relatedmodule2 != "") {
            if (relatedmodule1 == "") {
                alert(alert_arr.RELATEDMODULE1_ISNULL);
                return false;
            }
            if (relatedmodule3 != "") {
                if (relatedmodule2 == relatedmodule3) {
                    alert(alert_arr.RELATEDMODULE_REPEATED);
                    return false;
                }
            }

        }
        if (relatedmodule3 != "") {
            if (relatedmodule2 == "") {
                alert(alert_arr.RELATEDMODULE1_ISNULL);
                return false;
            }
        }
        return true;
    }
    function checkImportExport(form) {
        if (form.product.checked == true) {
            form.importexport.disabled = true;
            form.warehouse.disabled = false;
            form.delivery.disabled = false;
        } else {
            form.importexport.disabled = false;
            form.warehouse.disabled = true;
            form.delivery.disabled = true;
        }
    }
    function checkInventory(form) {
        if (form.warehouse.checked == true) {
            form.delivery.disabled = true;
        } else {
            form.delivery.disabled = false;
        }

        if (form.delivery.checked == true) {
            form.warehouse.disabled = true;
        } else {
            form.warehouse.disabled = false;
        }
    }

    function setProdFieldView(setype, theelement) {
        
        Jquery("#status").css('display', 'block'); //进度条
       
        var classmethods = $$('.tab-chan-link');///获取 class=tab-chan-link的值放在一个枚举量里面
     
        for (var i = 0; i < classmethods.length; i++) {
            classmethods[i].className = 'tab-chan-link';
        }
        
        Jquery(theelement).attr('class', 'tab-chan-link tab-chan-link-on');//所选的枚举量改变class的属性
        document.getElementById("prodview").value = setype;
        var mode = document.DetailForm.mode.value
  
        new Ajax.Request(
		'index.aspx',
		{ queue: { lposition: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=CustomModuleList&prodview=' + setype + '&ajax=true',
		    onComplete: function (response) {
		        Jquery("#status").css('display', 'none');
		        var rest = response.responseText;
		        $("cfList").innerHTML = rest;
		    }
		}
	);
    }

    function callShowModelEdit(tabid, module, tablelabel) {
        var tagName = document.getElementById('crmModellistdiv');
        document.EditForm.tabid.value = tabid;
        document.EditForm.newModelName.value = tablelabel;
        document.EditForm.tableModule.value = module;

        var obj = document.getElementById("img_" + tabid);

        if (typeof (tagName) == 'undefined') {
            return;
        }
        var leftSide = findPosX(obj);
        var topSide = findPosY(obj);
        leftSide = leftSide - 360;
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

        ShowLockDiv('crmModellistdiv');

    }

    function CallSaveModuleNameForm() {
        var newName = removeHTMLTag(document.EditForm.newModelName.value);
        document.EditForm.newModelName.value = newName;
        if (!emptyCheck('newModelName', '中文名称', 'text')) return;
        document.EditForm.submit();
    }


</script>
<br>
			<!-- DISPLAY -->
						<b><font color="red"> </font></b>
						
				<table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
				<tbody><tr>
					<td rowspan="2" valign="top" width="50"><img src="admin_files/modulelist.gif" alt="Users" title="Users" border="0" height="48" width="48"></td>
					<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 模块开发</b></td>
				</tr>

				<tr>
					<td class="small" valign="top">管理员根据自身需求开发新模块。如需共享自己开发的模块，可导出完成的模块共享。</td>
				</tr>
				</tbody></table>
				<table border="0" cellpadding="10" cellspacing="0" width="100%">
				<tbody>
					<tr height="1"><td colspan="4"> </td> </tr>
					<tr>
				
						 <td align="center" class="tab-chan-link tab-chan-link-on" onclick="setProdFieldView('prodviewuli1',this);" style="font-family: 宋体;font-size: 14px;width:60px;height:28px;">
						 	新增模块 
						 </td>
						 <td class="dvtTabCache" style="width:1px" nowrap=""> &nbsp;</td>
						 <td align="center" class="tab-chan-link" onclick="setProdFieldView('prodviewuli2',this);" style="font-family: 宋体;font-size: 14px;width:60px;height:28px;">
						 	模块列表
						 </td>
						 <td class="dvtTabCache" style="" nowrap="">&nbsp; </td>
					</tr>

			    <tr>
				<td colspan="4">
						
				    <div id="cfList">
	<form action="index.aspx" method="post" name="DetailForm">
		<input type="hidden" name="module" value="Settings">
		<input type="hidden" id="prodview" name="prodview" value="prodviewuli1">
		<input type="hidden" name="mode" value="">
		<input type="hidden" name="action" value="CustomModuleList">
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

						</tbody></table>

			<table border="0" cellpadding="5" cellspacing="0" width="100%">
			<tbody><tr><td align="center"><img src="admin_files/builder_flow.jpg" border="0"></td></tr>
			<tr>

			<td class="small" align="right" nowrap="nowrap"><a href="#top">[上]</a></td>
			</tr>
			</tbody></table>
	</form>
	

</div>

			    </td>
			</tr>
			</tbody></table>
		<!-- End of Display -->
		
		</div></td>
        </tr>
        </tbody></table>
 </td>
 
</asp:Content>
