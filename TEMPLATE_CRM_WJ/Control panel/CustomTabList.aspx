<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="CustomTabList.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Control_panel_CustomTabList" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
    <td class="detail-content-td">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td valign="top">
     <div class="detail-panel-div">
											<script language="JavaScript" type="text/javascript" src="include/js/customview.js"></script>
<script language="javascript">

    function deleteTab(id) {
        if (confirm(alert_arr.SURE_TO_DELETE)) {
            document.form.action = "index.aspx?module=Settings&action=DeleteTab&id=" + id;
            document.form.submit();
        }
    }

    function getCreateTabForm(id) {
        /*
        new Ajax.Request(
        'index.aspx',
        {queue: {position: 'end', scope: 'command'},
        method: 'post',
        postBody: 'module=Settings&action=SettingsAjax&file=CreateTab&id='+id+'&parenttab=Settings&ajax=true',
        onComplete: function(response) {
        $("createtab").innerHTML=response.responseText;
        execJS($('tabLayer'));
        execJS($('tabchooser'));
				
        }
        }
        );
        */
        var url = 'index.aspx?module=Settings&action=CreateTab&id=' + id + '&parenttab=Settings';
        document.location.href = url;

    }
    function validate_module() {
        if (document.addtodb.enname.value == "") {
            alert(alert_arr.TAB_KEY_IS_NULL);
            document.addtodb.enname.focus();
            return false;
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
        return true;
    }

</script>
<div id="createtab" style="display:block;position:absolute;width:400px;"></div>
<br>
	<!-- DISPLAY -->
		<b><font color="red"> </font></b>
		
		<table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
		<tbody><tr>
			<td rowspan="2" valign="top" width="50"><img src="admin_files/mainmenu.gif" alt="Users" title="Users" border="0" height="48" width="48"></td>
			<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 主菜单</b></td>
		</tr>

		<tr>
			<td class="small" valign="top">管理主菜单及包括的子模块</td>
		</tr>
		</tbody></table>
		
		<table border="0" cellpadding="10" cellspacing="0" width="100%">
		<tbody><tr>
		<td>
		<form action="index.aspx" method="post" name="form">
		<input type="hidden" name="module" value="Settings">
		<input type="hidden" name="mode">
		<table border="0" cellpadding="5" cellspacing="0" width="100%">
		<tbody><tr>
			<td class="small">&nbsp;</td>
			<td class="small" align="right">&nbsp;&nbsp;
				<button class="pure-button pure-button-edit" title="编辑 [Alt+E]" onclick="getCreateTabForm('');return false;">
					<i class="icon-plus"></i> 新增主菜单
				</button>&nbsp;
		</td></tr>
		</tbody></table>

		<table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
			<tbody><tr height="28px" class="windLayerHead">
				<td width="5%">#</td>
				<td width="20%">主菜单</td>
				<td width="20%">显示顺序</td>
				<td width="20%">工具</td>
			</tr>
			
												<tr>
													<td nowrap="">1&nbsp;</td>
									<td nowrap="">工作台&nbsp;</td>
									<td nowrap="">1&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=1&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(1);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr class="crm-table-plural">
													<td nowrap="">2&nbsp;</td>
									<td nowrap="">营销&nbsp;</td>
									<td nowrap="">2&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=2&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(2);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr>
													<td nowrap="">3&nbsp;</td>
									<td nowrap="">销售自动化&nbsp;</td>
									<td nowrap="">3&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=12&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(12);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr class="crm-table-plural">
													<td nowrap="">4&nbsp;</td>
									<td nowrap="">客户&nbsp;</td>
									<td nowrap="">3&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=3&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(3);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr>
													<td nowrap="">5&nbsp;</td>
									<td nowrap="">产品&nbsp;</td>
									<td nowrap="">4&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=4&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(4);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr class="crm-table-plural">
													<td nowrap="">6&nbsp;</td>
									<td nowrap="">销售&nbsp;</td>
									<td nowrap="">5&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=5&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(5);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr>
													<td nowrap="">7&nbsp;</td>
									<td nowrap="">采购&nbsp;</td>
									<td nowrap="">6&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=6&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(6);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr class="crm-table-plural">
													<td nowrap="">8&nbsp;</td>
									<td nowrap="">售后&nbsp;</td>
									<td nowrap="">7&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=7&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(7);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr>
													<td nowrap="">9&nbsp;</td>
									<td nowrap="">库存&nbsp;</td>
									<td nowrap="">8&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=8&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(8);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr class="crm-table-plural">
													<td nowrap="">10&nbsp;</td>
									<td nowrap="">财务&nbsp;</td>
									<td nowrap="">9&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=9&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(9);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr>
													<td nowrap="">11&nbsp;</td>
									<td nowrap="">报表&nbsp;</td>
									<td nowrap="">10&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=10&amp;parenttab=Settings'">
							</i><i class="icon-trash pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="deleteTab(10);return false;">
							</i>&nbsp;</td>
							</tr>
												<tr class="crm-table-plural">
													<td nowrap="">12&nbsp;</td>
									<td nowrap="">控制面板&nbsp;</td>
									<td nowrap="">11&nbsp;</td>
									<td nowrap=""><i class="icon-edit pure-icon-bu crm-bu-style" style="width:50px;height:50px;cursor:pointer;font-size:14px;" onclick="location.href='index.aspx?module=Settings&amp;action=CreateTab&amp;id=11&amp;parenttab=Settings'">
							</i>&nbsp;</td>
							</tr>
					</tbody></table>
		</form>	
	<table border="0" cellpadding="5" cellspacing="0" width="100%">
	<tbody><tr>
	<td class="small" align="right" nowrap="nowrap"><a href="#top">[上]</a></td>
	</tr>
	</tbody></table>
	</td>
	</tr>
	</tbody></table>
<!-- End of Display -->

</div>
 </td>
                </tr>
            </tbody>
        </table>
    </td>
</asp:Content>
