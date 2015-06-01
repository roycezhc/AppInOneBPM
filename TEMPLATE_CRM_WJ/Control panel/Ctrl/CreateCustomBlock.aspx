<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateCustomBlock.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Control_panel_Ctrl_CreateCustomBlock" %>



      <%--<table width="100%" border="0" cellpadding="5" cellspacing="0" class="small">
      <tbody><tr>
					<td width="50%" class="dataLabel" nowrap="nowrap" align="right"><b>显示区域标题</b></td><td width="50%" align="left"><input type="text" size="20" name="label" value="" class="txtBox"></td></tr>
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>显示顺序</b></td>
					<td align="left"><input type="text" size="20" name="order" value="" class="txtBox"></td>
				</tr>	
					</tbody>
                    </table>
	<table border="0" cellspacing="0" cellpadding="5" width="100%">
			<tbody><tr>
				<td align="center">
					<button class="pure-button pure-button-success" title="保存">
						<i class="icon-ok"></i> 保存
					</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="pure-button pure-button-cancel" title="关闭" onclick="CloseLockDiv('createblock');return false;">
						<i class="icon-off"></i> 关闭
					</button>&nbsp;
				</td>
			</tr>
	</tbody></table>
--%>

<form action="Ctrl\CreatBlock.aspx" method="post" name="addtodb" onsubmit="return validate_block()">
	  <input type="hidden" name="module" value="Settings">
	  <input type="hidden" name="fld_module" value="Accounts">
	  <input type="hidden" name="parenttab" value="Settings">
      <input type="hidden" name="action" value="AddCustomBlockToDB">
	  <input type="hidden" name="blockid" value="">
	  <input type="hidden" name="mode" value=""><table width="100%" border="0" cellpadding="5" cellspacing="0" class="small"><tbody><tr>
					<td width="50%" class="dataLabel" nowrap="nowrap" align="right"><b>显示区域标题</b></td><td width="50%" align="left"><input type="text" size="20" name="label" value="" class="txtBox"></td></tr>
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>显示顺序</b></td>
					<td align="left"><input type="text" size="20" name="order" value="" class="txtBox"></td>
				</tr>	
					</tbody></table>
	<table border="0" cellspacing="0" cellpadding="5" width="100%">
			<tbody><tr>
				<td align="center">
					<button class="pure-button pure-button-success" title="保存">
						<i class="icon-ok"></i> 保存
					</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="pure-button pure-button-cancel" title="关闭" onclick="CloseLockDiv('createblock');return false;">
						<i class="icon-off"></i> 关闭
					</button>&nbsp;
				</td>
			</tr>
	</tbody></table>
	</form>