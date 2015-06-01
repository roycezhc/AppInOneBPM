<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SettingsAjax.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_SettingsAjax" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>


<%=mainvalue %>

<%--<%
    switch (Request["file"])
    {
        case "CreateCustomModule":
            %>
               <table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="createmoduleContent">
	<form action="../index.aspx" method="post" name="addtodb">
	  <input type="hidden" name="module" value="Settings">
      <input type="hidden" name="action" value="AddCustomModuleToDB">
	  <input type="hidden" name="id" value="">
	  <input type="hidden" name="mode" value=""><table width="100%" border="0" cellpadding="5" cellspacing="0" class="small">
			     <tbody><tr><td colspan="4" class="detail-heading"><b>基本信息</b></td></tr>
			     <tr>
					<td width="25%" class="dataLabel" nowrap="nowrap" align="right"><b>英文名称</b></td>
					<td width="25%" class="dvtCellInfo" align="left"><input type="text" size="20" name="enname" value=""></td>
				
					<td width="25%" class="dataLabel" nowrap="nowrap" align="right"><b>显示名称</b></td>
					<td width="25%" class="dvtCellInfo" align="left"><input type="text" size="20" name="cnname" value=""></td>
				</tr>				
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>主菜单</b></td>
					<td class="dvtCellInfo" align="left"><select name="parent_tab">
<option value="1">工作台</option>
<option value="2">营销</option>
<option value="3">客户</option>
<option value="4">产品</option>
<option value="5">销售</option>
<option value="6">采购</option>
<option value="7">售后</option>
<option value="8">库存</option>
<option value="9">财务</option>
<option value="10">报表</option>
<option value="11">控制面板</option>
<option value="12">销售自动化</option></select></td>
				
					<td class="dataLabel" nowrap="nowrap" align="right"><b>显示顺序</b></td>
					<td class="dvtCellInfo" align="left"><input type="text" size="20" name="order" value=""></td>
				</tr>

				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>审批功能</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" checked="" size="20" name="approve" value="1"></td>
					<td colspan="2"></td>
				</tr>
				<tr><td colspan="4" class="detail-heading"><b>关联模块信息</b></td></tr>
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>客户字段</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" checked="" size="20" name="is_accountid" value="1"></td>
				
					<td class="dataLabel" nowrap="nowrap" align="right"><b>联系人字段</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" checked="" size="20" name="is_contactid" value="1"></td>
				</tr>
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>销售机会字段</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" size="20" name="is_potentialid" value="1"></td>
				
					<td class="dataLabel" nowrap="nowrap" align="right"><b>合同订单字段</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" size="20" name="is_salesorderid" value="1"></td>
				</tr>
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>供应商字段</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" size="20" name="is_vendorid" value="1"></td>				
					<td class="dataLabel" nowrap="nowrap" align="right"><b>进货单字段</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" size="20" name="is_purchaseorderid" value="1"></td>
				</tr>
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>关联附件</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" checked="" size="20" name="attachment" value="1"></td>	
				    <input type="hidden" name="status" value="新增">
					<td class="dataLabel" nowrap="nowrap" align="right"><b>其它模块字段1</b></td>
					<td class="dvtCellInfo" align="left"><select onchange="javascript:checkRelatedmodule()" name="relatedmodule1" id="relatedmodule1"><option value="">-- 无 --</option>
<option value="gathers">应收款</option>
<option value="charges">应付款</option>
<option value="expenses">费用报销</option>
<option value="documents">文档中心</option>
<option value="cares">客户关怀</option>
<option value="checks">盘点</option>
<option value="deliverys">出库单</option>
<option value="warehouses">入库单</option>
<option value="vcontacts">供应商联系人</option>
<option value="tuihuos">销售退货单</option>
<option value="vnotes">供应商联系记录</option>
<option value="billings">发票管理</option>
<option value="duishous">竞争对手</option>
<option value="warehousetransfers">库间调拨</option>
<option value="complaints">客户投诉</option>
<option value="accountrecordss">客户服务</option>
<option value="chargesrecords">付款单</option>
<option value="gathersrecords">收款单</option>
<option value="openingbalancess">期初余额</option>
<option value="memdays">纪念日</option>
<option value="packorders">装配出入库单</option>
<option value="qqqqqqqqs">1</option>
<option value="bbbbbs">测试</option></select></td>
				</tr>
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>其它模块字段2</b></td>
					<td class="dvtCellInfo" align="left"><select onchange="javascript:checkRelatedmodule()" name="relatedmodule2" id="relatedmodule2"><option value="">-- 无 --</option>
<option value="gathers">应收款</option>
<option value="charges">应付款</option>
<option value="expenses">费用报销</option>
<option value="documents">文档中心</option>
<option value="cares">客户关怀</option>
<option value="checks">盘点</option>
<option value="deliverys">出库单</option>
<option value="warehouses">入库单</option>
<option value="vcontacts">供应商联系人</option>
<option value="tuihuos">销售退货单</option>
<option value="vnotes">供应商联系记录</option>
<option value="billings">发票管理</option>
<option value="duishous">竞争对手</option>
<option value="warehousetransfers">库间调拨</option>
<option value="complaints">客户投诉</option>
<option value="accountrecordss">客户服务</option>
<option value="chargesrecords">付款单</option>
<option value="gathersrecords">收款单</option>
<option value="openingbalancess">期初余额</option>
<option value="memdays">纪念日</option>
<option value="packorders">装配出入库单</option>
<option value="qqqqqqqqs">1</option>
<option value="bbbbbs">测试</option></select></td>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>其它模块字段3</b></td>
					<td class="dvtCellInfo" align="left"><select onchange="javascript:checkRelatedmodule()" name="relatedmodule3" id="relatedmodule3"><option value="">-- 无 --</option>
<option value="gathers">应收款</option>
<option value="charges">应付款</option>
<option value="expenses">费用报销</option>
<option value="documents">文档中心</option>
<option value="cares">客户关怀</option>
<option value="checks">盘点</option>
<option value="deliverys">出库单</option>
<option value="warehouses">入库单</option>
<option value="vcontacts">供应商联系人</option>
<option value="tuihuos">销售退货单</option>
<option value="vnotes">供应商联系记录</option>
<option value="billings">发票管理</option>
<option value="duishous">竞争对手</option>
<option value="warehousetransfers">库间调拨</option>
<option value="complaints">客户投诉</option>
<option value="accountrecordss">客户服务</option>
<option value="chargesrecords">付款单</option>
<option value="gathersrecords">收款单</option>
<option value="openingbalancess">期初余额</option>
<option value="memdays">纪念日</option>
<option value="packorders">装配出入库单</option>
<option value="qqqqqqqqs">1</option>
<option value="bbbbbs">测试</option></select></td>
				</tr>
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>产品列表信息</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" checked="" size="20" name="product" id="product" value="1" onclick="javascript:checkImportExport(this.form)"></td>
				
					<td class="dataLabel" nowrap="nowrap" align="right"><b>导入导出功能</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" disabled="true" size="20" name="importexport" id="importexport" value="1"></td>
				</tr>
				<tr>
					<td class="dataLabel" nowrap="nowrap" align="right"><b>允许产品入库</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" size="20" name="warehouse" id="warehouse" value="1" onclick="javascript:checkInventory(this.form)"></td>
				
					<td class="dataLabel" nowrap="nowrap" align="right"><b>允许产品出库</b></td>
					<td class="dvtCellInfo" align="left"><input type="checkbox" size="20" name="delivery" id="delivery" value="1" onclick="javascript:checkInventory(this.form)"></td>
				</tr>
				<tr><td colspan="4" class="detail-heading">提示:关联模块表示字段的值是从其它模块选择而来的。以上新模块的字段选择后将不能修改，请根据需求谨慎选择所需字段。</td></tr>
					
					</tbody></table>
	<table border="0" cellspacing="0" cellpadding="5" width="100%" class="">
			<tbody><tr>
				<td align="center">
					<button class="pure-button pure-button-success" title="保存" onclick="validate_module();return false;">
						<i class="icon-ok"></i> 保存
					</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="pure-button pure-button-cancel" title="关闭" onclick="CloseLockDiv('createmodule');return false;">
						<i class="icon-off"></i> 关闭
					</button>&nbsp;
				</td>
			</tr>
	</tbody></table>
	</form></div>
		</td>
	</tr>
</tbody></table>
            <%
            break;
        case "CustomModuleList":


            if ("prodviewuli1" == Request["prodview"])
            {
%>
<div id="Div3">
    <div style="width: 100%;">
        <form method="post" name="DetailForm">
        <input type="hidden" name="module" value="Settings">
        <input type="hidden" id="prodview" name="prodview" value="prodviewuli1">
        <input type="hidden" name="mode" value="">
        <input type="hidden" name="action" value="CustomModuleList">
        <table border="0" cellpadding="5" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <td class="small">
                        &nbsp;
                    </td>
                    <td class="small" align="right">
                        &nbsp;&nbsp;
                        <button class="pure-button pure-button-success" title="新增模块" onclick="getCreateCustomModuleForm('');return false;">
                            <i class="icon-plus"></i>新增模块
                        </button>
                        &nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
        <table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
            <tbody>
                <tr height="28px" class="windLayerHead">
                    <td width="3%" align="center" nowra="">
                        #
                    </td>
                    <td>
                        英文名称
                    </td>
                    <td>
                        显示名称
                    </td>
                    <td>
                        主菜单
                    </td>
                    <td>
                        客户字段
                    </td>
                    <td>
                        联系人字段
                    </td>
                    <td>
                        显示顺序
                    </td>
                    <td>
                        模块状态
                    </td>
                    <td>
                        工具
                    </td>
                </tr>
                <tr id="row_">
                    <td nowrap="" align="center">
                        1&nbsp;
                    </td>
                    <td nowrap="">
                        qqqqqqqq&nbsp;
                    </td>
                    <td nowrap="">
                        1&nbsp;
                    </td>
                    <td nowrap="">
                        工作台&nbsp;
                    </td>
                    <td nowrap="">
                        是&nbsp;
                    </td>
                    <td nowrap="">
                        是&nbsp;
                    </td>
                    <td nowrap="">
                        123&nbsp;
                    </td>
                    <td nowrap="">
                        新增&nbsp;
                    </td>
                    <td nowrap="">
                        <a href="#" onclick="deleteCustomModule(8)">删除</a>&nbsp;|&nbsp;<a href="#" onclick="installCustomModule(8)">安装</a>&nbsp;|&nbsp;卸载&nbsp;|&nbsp;导出&nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
        <table border="0" cellpadding="5" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <td align="center">
                        <img src="./admin_files/builder_flow.jpg" border="0">
                    </td>
                </tr>
                <tr>
                    <td class="small" align="right" nowrap="nowrap">
                        <a href="#top">[上]</a>
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>
</div>
<%}
            else
            { %>
<div id="cfList">
    <div style="width: 75%;">
        <form action="../index.aspx" method="post" name="DetailForm">
        <input type="hidden" name="module" value="Settings">
        <input type="hidden" id="prodview" name="prodview">
        <input type="hidden" name="mode" value="">
        <input type="hidden" name="action" value="CustomModuleList">
        <table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
            <tbody>
                <tr class="windLayerHead">
                    <td width="3%" align="center">
                        #
                    </td>
                    <td nowrap="">
                        英文名称&nbsp;
                    </td>
                    <td nowrap="">
                        中文名称&nbsp;
                    </td>
                    <td nowrap="">
                        工具&nbsp;
                    </td>
                </tr>
                <tr id="Tr1">
                    <td width="3%" align="center">
                        1
                    </td>
                    <td nowrap="">
                        Potentials&nbsp;
                    </td>
                    <td nowrap="">
                        销售机会&nbsp;
                    </td>
                    <td nowrap="">
                        <a href="javascript:;" id="img_2" style="cursor: pointer;" onclick="callShowModelEdit('2','Potentials','销售机会');"
                            alt="编辑" title="编辑">
                            <img src="../admin_files/editfield.gif" border="0" 
                            style="height: 1px;">
                           
                        </a>&nbsp;
                    </td>
                </tr>
                <tr id="Tr2" class="crm-table-plural">
                    <td width="3%" align="center">
                        2
                    </td>
                    <td nowrap="">
                        Contacts&nbsp;
                    </td>
                    <td nowrap="">
                        联系人&nbsp;
                    </td>
                    <td nowrap="">
                        <a href="javascript:;" id="img_4" style="cursor: pointer;" onclick="callShowModelEdit('4','Contacts','联系人');"
                            alt="编辑" title="编辑">
                            <img src="/site/TEMPLATE_CRM_WJ/Controlpanel/admin_files/editfield.gif" border="0"><img
                                src="../admin_files/editfield.gif" />
                        </a>&nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>
</div>
<%}
            break;
        case "CustomBlockList":

            switch (Request["fld_module"])
            {
                case "Accounts":%>
<div id="cfList">
    <form action="../index.aspx" method="post" name="form">
    <input type="hidden" name="fld_module" value="Accounts">
    <input type="hidden" name="module" value="Settings">
    <input type="hidden" name="parenttab" value="Settings">
    <input type="hidden" name="mode">
    <table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
        <tbody>
            <tr height="28px" class="windLayerHead">
                <td width="5%">
                    #
                </td>
                <td width="20%">
                    显示区域
                </td>
                <td width="20%">
                    显示顺序
                </td>
                <td width="20%">
                    工具
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    基本信息&nbsp;
                </td>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','9','6','基本信息','1')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(9,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    自定义信息&nbsp;
                </td>
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','10','6','自定义信息','2')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(10,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    联系信息&nbsp;
                </td>
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','145','6','联系信息','2')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(145,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    4&nbsp;
                </td>
                <td nowrap="">
                    地址信息&nbsp;
                </td>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','11','6','地址信息','3')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(11,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    5&nbsp;
                </td>
                <td nowrap="">
                    银行财务信息&nbsp;
                </td>
                <td nowrap="">
                    4&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','84','6','银行财务信息','4')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(84,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    6&nbsp;
                </td>
                <td nowrap="">
                    描述信息&nbsp;
                </td>
                <td nowrap="">
                    5&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','12','6','描述信息','5')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(12,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</div>
<%
    break;
                case "Contacts":
%>
<div id="Div1">
    <form action="../index.aspx" method="post" name="form">
    <input type="hidden" name="fld_module" value="Contacts">
    <input type="hidden" name="module" value="Settings">
    <input type="hidden" name="parenttab" value="Settings">
    <input type="hidden" name="mode">
    <table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
        <tbody>
            <tr height="28px" class="windLayerHead">
                <td width="5%">
                    #
                </td>
                <td width="20%">
                    显示区域
                </td>
                <td width="20%">
                    显示顺序
                </td>
                <td width="20%">
                    工具
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    联系人信息&nbsp;
                </td>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','4','4','联系人信息','1')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(4,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    自定义信息&nbsp;
                </td>
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','5','4','自定义信息','2')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(5,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    *住址信息&nbsp;
                </td>
                <td nowrap="">
                    4&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','7','4','*住址信息','4')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(7,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    4&nbsp;
                </td>
                <td nowrap="">
                    联系人照片信息:&nbsp;
                </td>
                <td nowrap="">
                    5&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','75','4','联系人照片信息:','5')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(75,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    5&nbsp;
                </td>
                <td nowrap="">
                    描述信息&nbsp;
                </td>
                <td nowrap="">
                    6&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','8','4','描述信息','6')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(8,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</div>
<%
    break;
            case "Potentials":
%>
<div id="Div2">
    <form action="../index.aspx" method="post" name="form">
    <input type="hidden" name="fld_module" value="Potentials">
    <input type="hidden" name="module" value="Settings">
    <input type="hidden" name="parenttab" value="Settings">
    <input type="hidden" name="mode">
    <table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
        <tbody>
            <tr height="28px" class="windLayerHead">
                <td width="5%">
                    #
                </td>
                <td width="20%">
                    显示区域
                </td>
                <td width="20%">
                    显示顺序
                </td>
                <td width="20%">
                    工具
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    销售机会信息&nbsp;
                </td>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Potentials','1','2','销售机会信息','1')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(1,'Potentials', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    自定义信息&nbsp;
                </td>
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Potentials','2','2','自定义信息','2')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(2,'Potentials', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    描述信息&nbsp;
                </td>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Potentials','3','2','描述信息','3')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(3,'Potentials', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</div>
<%
    break;
            }
%>
<%
    break;
        case "CustomFieldList":
            switch (Request["fld_module"])
            {
                case "Accounts":%>
<div id="cfList">
    <form action="../index.aspx" method="post" name="form">
    <input type="hidden" name="fld_module" value="Accounts">
    <input type="hidden" name="module" value="Settings">
    <input type="hidden" name="parenttab" value="Settings">
    <input type="hidden" name="mode">
    <table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
		<tbody><tr>
			<td class="small" align="left">
				<b>选择模块:</b>
				<select name="pick_module" onchange="getCustomFieldList(this)">
																														<option value="Accounts">客户</option>
																													<option value="Contacts" selected="">联系人</option>
																														<option value="Potentials">销售机会</option>
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
				<strong>自定义字段</strong>
			</td>
			<td align="right">
				<button class="pure-button pure-button-success" title="新建字段" accesskey="S" name="savebutton" onclick="getCreateCustomFieldForm('Contacts','','','');return false;">
					<i class="icon-plus"></i> 新建字段
				</button>
			</td>
		</tr></tbody>
		</table>
    <table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
        <tbody>
            <tr height="28px" class="windLayerHead">
                <td width="5%">
                    #
                </td>
                <td width="20%">
                    显示区域
                </td>
                <td width="20%">
                    显示顺序
                </td>
                <td width="20%">
                    工具
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    基本信息&nbsp;
                </td>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','9','6','基本信息','1')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(9,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    自定义信息&nbsp;
                </td>
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','10','6','自定义信息','2')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(10,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    联系信息&nbsp;
                </td>
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','145','6','联系信息','2')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(145,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    4&nbsp;
                </td>
                <td nowrap="">
                    地址信息&nbsp;
                </td>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','11','6','地址信息','3')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(11,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    5&nbsp;
                </td>
                <td nowrap="">
                    银行财务信息&nbsp;
                </td>
                <td nowrap="">
                    4&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','84','6','银行财务信息','4')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(84,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    6&nbsp;
                </td>
                <td nowrap="">
                    描述信息&nbsp;
                </td>
                <td nowrap="">
                    5&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Accounts','12','6','描述信息','5')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(12,'Accounts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</div>
<%
    break;
                case "Contacts":
%>
<div id="Div1">
    <form action="../index.aspx" method="post" name="form">
    <input type="hidden" name="fld_module" value="Contacts">
    <input type="hidden" name="module" value="Settings">
    <input type="hidden" name="parenttab" value="Settings">
    <input type="hidden" name="mode">
    <table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
		<tbody><tr>
			<td class="small" align="left">
				<b>选择模块:</b>
				<select name="pick_module" onchange="getCustomFieldList(this)">
																														<option value="Accounts">客户</option>
																													<option value="Contacts" selected="">联系人</option>
																														<option value="Potentials">销售机会</option>
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
				<strong>自定义字段</strong>
			</td>
			<td align="right">
				<button class="pure-button pure-button-success" title="新建字段" accesskey="S" name="savebutton" onclick="getCreateCustomFieldForm('Contacts','','','');return false;">
					<i class="icon-plus"></i> 新建字段
				</button>
			</td>
		</tr></tbody>
		</table>
    <table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
        <tbody>
            <tr height="28px" class="windLayerHead">
                <td width="5%">
                    #
                </td>
                <td width="20%">
                    显示区域
                </td>
                <td width="20%">
                    显示顺序
                </td>
                <td width="20%">
                    工具
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    联系人信息&nbsp;
                </td>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','4','4','联系人信息','1')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(4,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    自定义信息&nbsp;
                </td>
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','5','4','自定义信息','2')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(5,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    *住址信息&nbsp;
                </td>
                <td nowrap="">
                    4&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','7','4','*住址信息','4')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(7,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    4&nbsp;
                </td>
                <td nowrap="">
                    联系人照片信息:&nbsp;
                </td>
                <td nowrap="">
                    5&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','75','4','联系人照片信息:','5')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(75,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    5&nbsp;
                </td>
                <td nowrap="">
                    描述信息&nbsp;
                </td>
                <td nowrap="">
                    6&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Contacts','8','4','描述信息','6')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(8,'Contacts', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</div>
<%
    break;
            case "Potentials":
%>
<div id="Div2">
    <form action="../index.aspx" method="post" name="form">
    <input type="hidden" name="fld_module" value="Potentials">
    <input type="hidden" name="module" value="Settings">
    <input type="hidden" name="parenttab" value="Settings">
    <input type="hidden" name="mode">
    <table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
		<tbody><tr>
			<td class="small" align="left">
				<b>选择模块:</b>
				<select name="pick_module" onchange="getCustomFieldList(this)">
																														<option value="Accounts">客户</option>
																													<option value="Contacts" selected="">联系人</option>
																														<option value="Potentials">销售机会</option>
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
				<strong>自定义字段</strong>
			</td>
			<td align="right">
				<button class="pure-button pure-button-success" title="新建字段" accesskey="S" name="savebutton" onclick="getCreateCustomFieldForm('Contacts','','','');return false;">
					<i class="icon-plus"></i> 新建字段
				</button>
			</td>
		</tr></tbody>
		</table>
    <table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
        <tbody>
            <tr height="28px" class="windLayerHead">
                <td width="5%">
                    #
                </td>
                <td width="20%">
                    显示区域
                </td>
                <td width="20%">
                    显示顺序
                </td>
                <td width="20%">
                    工具
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    销售机会信息&nbsp;
                </td>
                <td nowrap="">
                    1&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Potentials','1','2','销售机会信息','1')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(1,'Potentials', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr class="crm-table-plural">
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    自定义信息&nbsp;
                </td>
                <td nowrap="">
                    2&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Potentials','2','2','自定义信息','2')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(2,'Potentials', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
            <tr>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    描述信息&nbsp;
                </td>
                <td nowrap="">
                    3&nbsp;
                </td>
                <td nowrap="">
                    <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('Potentials','3','2','描述信息','3')">
                    </i><i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                        cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(3,'Potentials', '', '');">
                    </i>&nbsp;
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</div>
<%
    break;
            } 
    break;
    } %>--%>
