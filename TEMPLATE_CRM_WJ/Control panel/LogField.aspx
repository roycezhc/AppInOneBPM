<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true"   CodeFile="LogField.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_LogField" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<td class="detail-content-td">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
											<script language="JAVASCRIPT" type="text/javascript" src="include/js/smoothscroll.js"></script>
<script language="JavaScript" type="text/javascript" src="include/js/menu.js"></script>
<script>
    var def_field = 'Accounts_fields';
</script>
<script>


    function changemodules(selectmodule) {
        hide(def_field);
        module = selectmodule;
        document.getElementById('fld_module').value = module;
        def_field = module + "_fields";
        show(def_field);
    }

    function checkInt() {
        /alert("123");
        for (var i = 0; i < document.new1.elements.length; i++) {
            if (document.new1.elements[i].type == 'text') {
                if (isNaN(document.new1.elements[i].value)) {
                    alert('请输入数字');
                    document.new1.elements[i].focus();
                    return false;
                }
            }
        }
    }

</script>

<br>
<!-- DISPLAY -->
<table border="0" cellspacing="0" cellpadding="5" width="100%" class="settingsSelUITopLine">
<form action="index.aspx" method="post" name="new1" id="form" onsubmit="return checkInt();"></form>
<input type="hidden" name="module" value="Settings">
<input type="hidden" name="parenttab" value="Settings">
<input type="hidden" name="fld_module" id="fld_module" value="Accounts">
	<input type="hidden" name="action" value="EditLogField">
	
<tbody><tr>
	<td width="50" rowspan="2" valign="top"><img src="admin_files/productfield.gif" alt="Users" width="48" height="48" border="0" title="Users"></td>
	<td colspan="2" class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 字段修改日志 </b></td>
	<td rowspan="2" class="small" align="right">&nbsp;</td>
</tr>
<tr>
	<td valign="top" class="small">记录模块里所设定字段的修改日志</td>
</tr>
</tbody></table>
<table width="100%" border="0" cellpadding="5" cellspacing="0">
		<tbody><tr>
		<td style="padding-left:5px;" class="big">选择模块&nbsp;
	<select name="Screen" style="width:30%;" onchange="changemodules(value)">
					
			<option value="Contacts">联系人</option>
								<option selected="" value="Accounts">客户</option>
							
			<option value="Notes">联系记录</option>
							
			<option value="Products">产品</option>
							
			<option value="Vendors">供应商</option>
							
			<option value="Invoice">发货单</option>
							
			<option value="Gathers">应收款</option>
							
			<option value="Charges">应付款</option>
							
			<option value="Vcontacts">供应商联系人</option>
							
			<option value="Vnotes">供应商联系记录</option>
							
			<option value="Complaints">客户投诉</option>
							
			<option value="Accountrecordss">客户服务</option>
							
			<option value="Openingbalancess">期初余额</option>
				</select>
		</td>
			<td class="small" align="right">
			<button class="pure-button pure-button-edit" title="编辑">
			<i class="icon-fixed-width icon-pencil"></i>编辑</button>&nbsp;
						
		</td>
		</tr>
</tbody></table>
<div class="detail-panel-div" style="margin:5px;">
	<div id="Contacts_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_1').className='prvPrfHoverOff'">姓名</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_2').className='prvPrfHoverOff'">称呼</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_3').className='prvPrfHoverOff'">英文名</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_4').className='prvPrfHoverOff'">职位</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_1').className='prvPrfHoverOff'">客户名称</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_2').className='prvPrfHoverOff'">办公电话</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_3').className='prvPrfHoverOff'">手机</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_2_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_4').className='prvPrfHoverOff'">传真</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_1').className='prvPrfHoverOff'">Email</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_2').className='prvPrfHoverOff'">首要联系人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_3').className='prvPrfHoverOff'">客户来源</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_4').className='prvPrfHoverOff'">负责人</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_1').className='prvPrfHoverOff'">家庭电话</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_2').className='prvPrfHoverOff'">部门</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_4_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_3').className='prvPrfHoverOff'">经理</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="1_4_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_4').className='prvPrfHoverOff'">QQ</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Accounts_fields" style="display:block">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_1').className='prvPrfHoverOff'">客户名称</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_1_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_2').className='prvPrfHoverOff'">客户编号</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_1_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_3').className='prvPrfHoverOff'">网站</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_1_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_4').className='prvPrfHoverOff'">员工人数</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_2_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_1').className='prvPrfHoverOff'">行业</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_2_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_2').className='prvPrfHoverOff'">上级单位</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_3').className='prvPrfHoverOff'">下次联系时间</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_2_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_4').className='prvPrfHoverOff'">公司性质</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_1').className='prvPrfHoverOff'">负责人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_2').className='prvPrfHoverOff'">客户状态</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_3_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_3').className='prvPrfHoverOff'">类型</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_3_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_4').className='prvPrfHoverOff'">公用客户</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_4_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_1').className='prvPrfHoverOff'">客户级别</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_4_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_2').className='prvPrfHoverOff'">最新发货日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_4_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_3').className='prvPrfHoverOff'">最新订单日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_4_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_4').className='prvPrfHoverOff'">最新报价日期</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_5_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_5_1').className='prvPrfHoverOff'">联系次数</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_5_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_5_2').className='prvPrfHoverOff'">分配状态</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_5_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_5_3').className='prvPrfHoverOff'">客户来源</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_5_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_5_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_5_4').className='prvPrfHoverOff'">保护开始日期</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_6_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_6_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_6_1').className='prvPrfHoverOff'">保护结束日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_6_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_6_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_6_2').className='prvPrfHoverOff'">QQ</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_6_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_6_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_6_3').className='prvPrfHoverOff'">最新进展</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_6_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_6_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_6_4').className='prvPrfHoverOff'">热点客户</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_7_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_7_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_7_1').className='prvPrfHoverOff'">热度</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_7_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_7_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_7_2').className='prvPrfHoverOff'">热点分类</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_7_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_7_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_7_3').className='prvPrfHoverOff'">热点说明</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_7_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_7_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_7_4').className='prvPrfHoverOff'">对对对</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_8_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_8_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_8_1').className='prvPrfHoverOff'">首要联系人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_8_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_8_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_8_2').className='prvPrfHoverOff'">手机</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_8_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_8_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_8_3').className='prvPrfHoverOff'">电话</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_8_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_8_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_8_4').className='prvPrfHoverOff'">传真</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_9_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_9_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_9_1').className='prvPrfHoverOff'">其它电话</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_9_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_9_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_9_2').className='prvPrfHoverOff'">Email</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_9_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_9_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_9_3').className='prvPrfHoverOff'">国家</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_9_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_9_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_9_4').className='prvPrfHoverOff'">省份</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_10_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_10_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_10_1').className='prvPrfHoverOff'">城市</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_10_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_10_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_10_2').className='prvPrfHoverOff'">地址</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_10_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_10_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_10_3').className='prvPrfHoverOff'">支付方式</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_10_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_10_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_10_4').className='prvPrfHoverOff'">订单数量</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="2_11_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_11_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_11_1').className='prvPrfHoverOff'">订单金额</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Notes_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_1').className='prvPrfHoverOff'">客户</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_2').className='prvPrfHoverOff'">联系人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_3').className='prvPrfHoverOff'">主题</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_4').className='prvPrfHoverOff'">联系类型</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_1').className='prvPrfHoverOff'">联系时间</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_2').className='prvPrfHoverOff'">负责人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_2_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_3').className='prvPrfHoverOff'">销售阶段</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_2_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_4').className='prvPrfHoverOff'">最新评论时间</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_1').className='prvPrfHoverOff'">下次回访日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="3_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_2').className='prvPrfHoverOff'">客户状态</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Products_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_1').className='prvPrfHoverOff'">产品名称</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_2').className='prvPrfHoverOff'">单价</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_1_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_3').className='prvPrfHoverOff'">产品图片</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_4').className='prvPrfHoverOff'">建议成交价</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_2_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_1').className='prvPrfHoverOff'">产品编码</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_2').className='prvPrfHoverOff'">成本价</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_2_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_3').className='prvPrfHoverOff'">型号</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_2_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_4').className='prvPrfHoverOff'">单位</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_3_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_1').className='prvPrfHoverOff'">安全库存量</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_3_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_2').className='prvPrfHoverOff'">是否启用产品序列号</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_3_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_3').className='prvPrfHoverOff'">是否启用产品规格</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_4').className='prvPrfHoverOff'">供应商名称</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_4_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_1').className='prvPrfHoverOff'">网址</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_4_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_2').className='prvPrfHoverOff'">重量</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_4_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_3').className='prvPrfHoverOff'">总库存数量</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_4_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_4').className='prvPrfHoverOff'">销量</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="4_5_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_5_1').className='prvPrfHoverOff'">负责人</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Vendors_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_1').className='prvPrfHoverOff'">供应商名称</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_1_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_2').className='prvPrfHoverOff'">国家</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_1_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_3').className='prvPrfHoverOff'">编号</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_4').className='prvPrfHoverOff'">负责人</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_1').className='prvPrfHoverOff'">省份</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_2').className='prvPrfHoverOff'">电话</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_3').className='prvPrfHoverOff'">城市</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_4').className='prvPrfHoverOff'">街道</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_3_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_1').className='prvPrfHoverOff'">传真</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_2').className='prvPrfHoverOff'">Email</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_3_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_3').className='prvPrfHoverOff'">邮编</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_3_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_4').className='prvPrfHoverOff'">网站</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_4_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_1').className='prvPrfHoverOff'">员工人数</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_4_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_2').className='prvPrfHoverOff'">供应商级别</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_4_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_3').className='prvPrfHoverOff'">供应商状态</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_4_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_4').className='prvPrfHoverOff'">行业</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_5_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_5_1').className='prvPrfHoverOff'">公司性质</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="5_5_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_5_2').className='prvPrfHoverOff'">营业额</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Invoice_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_1_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_1').className='prvPrfHoverOff'">发货单编号</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_2').className='prvPrfHoverOff'">客户名称</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_3').className='prvPrfHoverOff'">联系人名称</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_4').className='prvPrfHoverOff'">开单日期</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_1').className='prvPrfHoverOff'">出库状态</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_2').className='prvPrfHoverOff'">收款状态</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_3').className='prvPrfHoverOff'">发货日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_4').className='prvPrfHoverOff'">总计</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_1').className='prvPrfHoverOff'">负责人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_3_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_2').className='prvPrfHoverOff'">货币</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_3_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_3').className='prvPrfHoverOff'">汇率</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_4').className='prvPrfHoverOff'">快递单号</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="6_4_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_4_1').className='prvPrfHoverOff'">审批人</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Gathers_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_1_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_1').className='prvPrfHoverOff'">应收款编号</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_2').className='prvPrfHoverOff'">外币备注</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_3').className='prvPrfHoverOff'">客户</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_4').className='prvPrfHoverOff'">应收金额</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_1').className='prvPrfHoverOff'">应收日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_2').className='prvPrfHoverOff'">实收金额</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_3').className='prvPrfHoverOff'">收款日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_4').className='prvPrfHoverOff'">是否收款</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_1').className='prvPrfHoverOff'">是否开发票</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_2').className='prvPrfHoverOff'">期次</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_3').className='prvPrfHoverOff'">负责人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_3_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_4').className='prvPrfHoverOff'">货币</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="7_4_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_4_1').className='prvPrfHoverOff'">汇率</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Charges_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_1_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_1_1').className='prvPrfHoverOff'">应付款编号</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_1_2').className='prvPrfHoverOff'">外币备注</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_1_3').className='prvPrfHoverOff'">供应商</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_1_4').className='prvPrfHoverOff'">付款类别</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_2_1').className='prvPrfHoverOff'">应付金额</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_2_2').className='prvPrfHoverOff'">应付日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_2_3').className='prvPrfHoverOff'">实付金额</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_2_4').className='prvPrfHoverOff'">客户</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_3_1').className='prvPrfHoverOff'">付款日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_3_2').className='prvPrfHoverOff'">是否付款</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_3_3').className='prvPrfHoverOff'">是否开发票</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_3_4').className='prvPrfHoverOff'">期次</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_4_1').className='prvPrfHoverOff'">负责人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_4_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_4_2').className='prvPrfHoverOff'">货币</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="8_4_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('8_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('8_4_3').className='prvPrfHoverOff'">汇率</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Vcontacts_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_1_1').className='prvPrfHoverOff'">姓名</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_1_2').className='prvPrfHoverOff'">供应商</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_1_3').className='prvPrfHoverOff'">称呼</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_1_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_1_4').className='prvPrfHoverOff'">英文名</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_2_1').className='prvPrfHoverOff'">职位</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_2_2').className='prvPrfHoverOff'">公司电话</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_2_3').className='prvPrfHoverOff'">手机</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_2_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_2_4').className='prvPrfHoverOff'">小灵通</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_3_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_3_1').className='prvPrfHoverOff'">传真</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_3_2').className='prvPrfHoverOff'">Email</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_3_3').className='prvPrfHoverOff'">家庭电话</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_3_4').className='prvPrfHoverOff'">其他电话</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_4_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_4_1').className='prvPrfHoverOff'">助手</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_4_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_4_2').className='prvPrfHoverOff'">助手电话</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_4_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_4_3').className='prvPrfHoverOff'">部门</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_4_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_4_4').className='prvPrfHoverOff'">生日</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_5_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_5_1').className='prvPrfHoverOff'">MSN</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_5_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_5_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_5_2').className='prvPrfHoverOff'">QQ</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="9_5_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('9_5_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('9_5_3').className='prvPrfHoverOff'">负责人</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Vnotes_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="10_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_1_1').className='prvPrfHoverOff'">主题</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="10_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_1_2').className='prvPrfHoverOff'">负责人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="10_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_1_3').className='prvPrfHoverOff'">供应商</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="10_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_1_4').className='prvPrfHoverOff'">供应商联系人</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="10_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_2_1').className='prvPrfHoverOff'">联系日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="10_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('10_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('10_2_2').className='prvPrfHoverOff'">联系类型</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Complaints_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_1_1').className='prvPrfHoverOff'">主题</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_1_2').className='prvPrfHoverOff'">负责人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_1_3').className='prvPrfHoverOff'">客户</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_1_4').className='prvPrfHoverOff'">联系人</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_2_1').className='prvPrfHoverOff'">投诉分类</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_2_2').className='prvPrfHoverOff'">投诉日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_2_3').className='prvPrfHoverOff'">投诉时间</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_2_4').className='prvPrfHoverOff'">紧急程度</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_3_1').className='prvPrfHoverOff'">处理结果</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_3_2').className='prvPrfHoverOff'">花费时间</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_3_3').className='prvPrfHoverOff'">处理过程</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_3_4').className='prvPrfHoverOff'">客户反馈</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_4_1').className='prvPrfHoverOff'">回访确认</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="11_4_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('11_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('11_4_2').className='prvPrfHoverOff'">描述</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Accountrecordss_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_1_1').className='prvPrfHoverOff'">主题</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_1_2').className='prvPrfHoverOff'">负责人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_1_3').className='prvPrfHoverOff'">客户</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_1_4').className='prvPrfHoverOff'">联系人</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_2_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_2_1').className='prvPrfHoverOff'">服务类型</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_2_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_2_2').className='prvPrfHoverOff'">服务方式</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_2_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_2_3').className='prvPrfHoverOff'">开始日期</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_2_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_2_4').className='prvPrfHoverOff'">开始时间</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_3_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_3_1').className='prvPrfHoverOff'">花费时间</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_3_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_3_2').className='prvPrfHoverOff'">记录单状态</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_3_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_3_3').className='prvPrfHoverOff'">服务内容</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_3_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_3_4').className='prvPrfHoverOff'">客户反馈</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="12_4_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('12_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('12_4_1').className='prvPrfHoverOff'">备注</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
	<div id="Openingbalancess_fields" style="display:none">
<table cellspacing="0" cellpadding="5" width="100%" class="small">
	
<tbody><tr>
			<td valign="top" width="25%">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
						<tbody><tr class="windLayerHead" height="25px">
			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

							<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>

			<td width="10%"></td> 
							<td width="5%"></td>                                  
							<td width="10%"><strong>字段名</strong></td>
						</tr>
							<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="13_1_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_1_1').className='prvPrfHoverOff'">主题</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="13_1_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_1_2').className='prvPrfHoverOff'">负责人</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="13_1_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_1_3').className='prvPrfHoverOff'">客户</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="13_1_4"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_1_4').className='prvPrfHoverOff'">供应商</td>
								
													</tr>
										<tr>
									<td style="width:10%">&nbsp;</td>
						<td width="5%" id="13_2_1"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_2_1').className='prvPrfHoverOff'">期初金额</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="13_2_2"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_2_2').className='prvPrfHoverOff'">类型</td>
								
														<td style="width:10%">&nbsp;</td>
						<td width="5%" id="13_2_3"><img src="admin_files/no.gif"></td>
						<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('13_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('13_2_3').className='prvPrfHoverOff'">摘要</td>
								
													</tr>
									</tbody></table>
	</td>
		</tr>
		</tbody></table>
</div>
</div>
</div></td>
</tr>
</tbody></table>
</td>
</asp:Content>
