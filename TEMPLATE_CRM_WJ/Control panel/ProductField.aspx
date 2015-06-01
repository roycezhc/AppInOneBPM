<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="ProductField.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_ProductField" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<td class="detail-content-td">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
											<script language="JAVASCRIPT" type="text/javascript" src="include/js/smoothscroll.js"></script>
<script language="JavaScript" type="text/javascript" src="include/js/menu.js"></script>
<script language="JavaScript" type="text/javascript" src="include/js/customview.js"></script>
<script language="javascript" type="text/javascript" src="include/ajaxtabs/ajaxtabs.js"></script>
<link rel="stylesheet" type="text/css" href="include/ajaxtabs/ajaxtabs.css">
<script>



    function previewProductTable(nowmodule) {
        /alert('0000000');

        nowmodule = $("fld_module").value;
        /alert('1111111111');
        new Ajax.Request(
			'index.aspx',
                          { queue: { position: 'end', scope: 'command' },
                              method: 'post',
                              postBody: 'module=Settings&action=SettingsAjax&file=createProductTable&nowmodule=' + nowmodule,
                              onComplete: function (response) {
                                  $("createviewtableContent").innerHTML = response.responseText;
                                  ShowLockDiv("createviewtablediv");

                              }
                          }
		);
        / return false;

    }



</script>
<script>
    var def_field = 'Quotes_fields';
    var def_module = "Quotes";
</script>
<script>


    function changemodules(obj) {
        var selectmodule = obj.value;
        var fld_module = document.getElementById("fld_module"); /document.ProdFldform.fld_module
        var prodview = document.getElementById("prodview").value;
        if (prodview == "prodfield") {
            var def_field = fld_module.value + "_fields";
            hide(def_field);
            def_field = selectmodule + "_fields";
            show(def_field);
        } else if (prodview == "prodcomment") {
            var def_field = fld_module.value + "_comment";
            hide(def_field);
            def_field = selectmodule + "_comment";
            show(def_field);
        }
        fld_module.value = selectmodule;
    }

    function checkInt() {
        /alert("123");
        for (var i = 0; i < document.ProdFldform.elements.length; i++) {
            if (document.ProdFldform.elements[i].type == 'text') {
                if (isNaN(document.ProdFldform.elements[i].value)) {
                    alert('请输入数字');
                    document.ProdFldform.elements[i].focus();
                    return false;
                }
            }
        }
    }

</script>

<div id="createviewtablediv" class="windLayerDiv" style="display:none;width:600px; left:550px;top:200px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move" id="block-title">&nbsp;&nbsp;产品详细信息</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('createviewtablediv');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="createviewtableContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("createviewtablediv", 'windLayerHeading');
</script>
</div>

<br>
		<!-- DISPLAY -->
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="settingsSelUITopLine">
		<form action="index.aspx" method="post" name="ProdFldform" id="ProdFldform"></form>
		<input type="hidden" name="module" value="Settings">
		<input type="hidden" name="parenttab" value="Settings">
		<input type="hidden" name="mode" value="view">
		<input type="hidden" name="fld_module" id="fld_module" value="Quotes">
		<input type="hidden" name="action" value="ProductField">
		<!-- 			<input type="hidden" name="action" value="EditProductField">
			 -->
		<tbody><tr>
			<td width="50" rowspan="2" valign="top"><img src="admin_files/productfield.gif" alt="Users" width="48" height="48" border="0" title="Users"></td>
			<td colspan="2" class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 关联产品字段 </b></td>
			<td rowspan="2" class="small" align="right">&nbsp;</td>
		</tr>
		<tr>
			<td valign="top" class="small">定制各模块中的产品字段</td>
		</tr>
		</tbody></table>
		<br>
		
		<table border="0" cellpadding="10" cellspacing="0" width="100%">
			<tbody><tr><td>
				<div><!--	View	-->
					<!-- <ul id="countrytabs" class="shadetabs">
										<input type="hidden" id="prodview" name="prodview" value="prodfield">
																														<li ><a href="javascript:;" onclick="setProdFieldView('prodfield',this);"  style="font-family: 宋体;font-size: 14px;" class="tablink selected">产品模块字段</a></li>
																														<li ><a href="javascript:;" onclick="setProdFieldView('prodcomment',this);"  style="font-family: 宋体;font-size: 14px;" class="tablink ">产品标签字段</a></li>
										</ul> -->

                    <input type="hidden" id="prodview" name="prodview" value="prodfield">
					<table border="0" cellpadding="10" cellspacing="0" width="100%">
				
					<tbody><tr>

						 <td align="center" class="tab-chan-link tab-chan-link-on" onclick="setProdFieldView('prodfield',this);" style="width:font-family: 宋体;font-size: 14px;width:95px;height:28px;">
						 	产品模块字段 
						 </td>
						 <td class="dvtTabCache" style="width:1px" nowrap=""> &nbsp;</td>
						 <td align="center" class="tab-chan-link  " onclick="setProdFieldView('prodcomment',this);" style="font-family: 宋体;font-size: 14px;width:95px;height:28px;">
						 	产品标签字段 
						 </td>
						 <td class="dvtTabCache" style="" nowrap="">&nbsp; </td>
						</tr>

					</tbody></table>

				</div>
				<div><!--	Select Module	-->
					<table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
						<tbody><tr>
							<td class="small" align="left">
								<b>选择模块:</b>
								<select id="pick_module" name="pick_module" class="detailedViewTextBox" style="width:150px;" onchange="changemodules(this)">
																											<option selected="" value="Quotes">报价单</option>
																												
										<option value="PurchaseOrder">进货单</option>
																												
										<option value="SalesOrder">合同订单</option>
																												
										<option value="Invoice">发货单</option>
																												
										<option value="Deliverys">出库单</option>
																												
										<option value="Warehouses">入库单</option>
																												
										<option value="Warehousetransfers">库间调拨</option>
																									</select>
							</td>
							<td class="small" align="right">
																	<button class="pure-button pure-button-edit" title="编辑" onclick="editprodfield_click();return false;">
										<i class="icon-pencil"></i> 编辑
									</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="pure-button pure-button-success" title="预览" onclick="previewProductTable('Quotes');return false;">
										<i class="icon-ok"></i> 预览
									</button>&nbsp;
															</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="cfList"><!--	Product Field	-->
					<!--	产品字段	-->
<div class="detail-panel-div">
						<div id="Quotes_fields" style="display:block">	
			 	<table cellspacing="0" cellpadding="5" width="100%" class="small">
       		
		<tbody><tr>
                	<td valign="top" width="25%">
		     	<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
                                <tbody><tr class="windLayerHead" height="25px">
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>

                                </tr>
                                <tr>
                                </tr>
				                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_1_1" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">产品名称</td>
                                        <td width="5%" id="1_1_1_2">15%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_2').className='prvPrfHoverOff'">产品编码</td>
                                        <td width="5%" id="1_1_2_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_1_3" class="prvPrfHoverOff"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">产品类别</td>
                                        <td width="5%" id="1_1_3_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_1_4').className='prvPrfHoverOff'">型号</td>
                                        <td width="5%" id="1_1_4_2">10%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_2_1" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">单位</td>
                                        <td width="5%" id="1_2_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_2_2" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_2').className='prvPrfHoverOff'" class="prvPrfHoverOff">安全库存量</td>
                                        <td width="5%" id="1_2_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_2_3" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">供应商名称</td>
                                        <td width="5%" id="1_2_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_2_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_2_4').className='prvPrfHoverOff'">重量</td>
                                        <td width="5%" id="1_2_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_3_1" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">总库存数量</td>
                                        <td width="5%" id="1_3_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_3_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_2').className='prvPrfHoverOff'">创建人</td>
                                        <td width="5%" id="1_3_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_3_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_3').className='prvPrfHoverOff'">单价</td>
                                        <td width="5%" id="1_3_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_3_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_3_4').className='prvPrfHoverOff'">建议成交价</td>
                                        <td width="5%" id="1_3_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_4_1" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">成本价</td>
                                        <td width="5%" id="1_4_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_4_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_2').className='prvPrfHoverOff'">是否启用产品序列号</td>
                                        <td width="5%" id="1_4_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_4_3" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_3').className='prvPrfHoverOff'" class="prvPrfHoverOff">销量</td>
                                        <td width="5%" id="1_4_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_4_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_4_4').className='prvPrfHoverOff'">负责人</td>
                                        <td width="5%" id="1_4_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="1_5_1" class="prvPrfHoverOff"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('1_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('1_5_1').className='prvPrfHoverOff'" class="prvPrfHoverOff">是否启用产品规格</td>
                                        <td width="5%" id="1_5_1_2">0%</td>
                                                                 	</tr>
                         	                     	</tbody></table>
			</td>
                </tr>
                </tbody></table>
		</div>
							<div id="PurchaseOrder_fields" style="display:none">	
			 	<table cellspacing="0" cellpadding="5" width="100%" class="small">
       		
		<tbody><tr>
                	<td valign="top" width="25%">
		     	<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
                                <tbody><tr class="windLayerHead" height="25px">
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>

                                </tr>
                                <tr>
                                </tr>
				                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_1').className='prvPrfHoverOff'">产品名称</td>
                                        <td width="5%" id="2_1_1_2">15%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_2').className='prvPrfHoverOff'">产品编码</td>
                                        <td width="5%" id="2_1_2_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_3').className='prvPrfHoverOff'">产品类别</td>
                                        <td width="5%" id="2_1_3_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_1_4').className='prvPrfHoverOff'">型号</td>
                                        <td width="5%" id="2_1_4_2">10%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_2_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_1').className='prvPrfHoverOff'">单位</td>
                                        <td width="5%" id="2_2_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_2_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_2').className='prvPrfHoverOff'">安全库存量</td>
                                        <td width="5%" id="2_2_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_2_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_3').className='prvPrfHoverOff'">供应商名称</td>
                                        <td width="5%" id="2_2_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_2_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_2_4').className='prvPrfHoverOff'">重量</td>
                                        <td width="5%" id="2_2_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_3_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_1').className='prvPrfHoverOff'">总库存数量</td>
                                        <td width="5%" id="2_3_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_3_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_2').className='prvPrfHoverOff'">创建人</td>
                                        <td width="5%" id="2_3_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_3_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_3').className='prvPrfHoverOff'">单价</td>
                                        <td width="5%" id="2_3_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_3_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_3_4').className='prvPrfHoverOff'">建议成交价</td>
                                        <td width="5%" id="2_3_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_4_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_1').className='prvPrfHoverOff'">成本价</td>
                                        <td width="5%" id="2_4_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_4_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_2').className='prvPrfHoverOff'">是否启用产品序列号</td>
                                        <td width="5%" id="2_4_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_4_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_3').className='prvPrfHoverOff'">销量</td>
                                        <td width="5%" id="2_4_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_4_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_4_4').className='prvPrfHoverOff'">负责人</td>
                                        <td width="5%" id="2_4_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="2_5_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('2_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('2_5_1').className='prvPrfHoverOff'">是否启用产品规格</td>
                                        <td width="5%" id="2_5_1_2">0%</td>
                                                                 	</tr>
                         	                     	</tbody></table>
			</td>
                </tr>
                </tbody></table>
		</div>
							<div id="SalesOrder_fields" style="display:none">	
			 	<table cellspacing="0" cellpadding="5" width="100%" class="small">
       		
		<tbody><tr>
                	<td valign="top" width="25%">
		     	<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
                                <tbody><tr class="windLayerHead" height="25px">
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>

                                </tr>
                                <tr>
                                </tr>
				                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_1').className='prvPrfHoverOff'">产品名称</td>
                                        <td width="5%" id="3_1_1_2">15%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_2').className='prvPrfHoverOff'">产品编码</td>
                                        <td width="5%" id="3_1_2_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_3').className='prvPrfHoverOff'">产品类别</td>
                                        <td width="5%" id="3_1_3_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_1_4').className='prvPrfHoverOff'">型号</td>
                                        <td width="5%" id="3_1_4_2">10%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_2_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_1').className='prvPrfHoverOff'">单位</td>
                                        <td width="5%" id="3_2_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_2_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_2').className='prvPrfHoverOff'">安全库存量</td>
                                        <td width="5%" id="3_2_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_2_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_3').className='prvPrfHoverOff'">供应商名称</td>
                                        <td width="5%" id="3_2_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_2_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_2_4').className='prvPrfHoverOff'">重量</td>
                                        <td width="5%" id="3_2_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_3_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_1').className='prvPrfHoverOff'">总库存数量</td>
                                        <td width="5%" id="3_3_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_3_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_2').className='prvPrfHoverOff'">创建人</td>
                                        <td width="5%" id="3_3_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_3_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_3').className='prvPrfHoverOff'">单价</td>
                                        <td width="5%" id="3_3_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_3_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_3_4').className='prvPrfHoverOff'">建议成交价</td>
                                        <td width="5%" id="3_3_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_4_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_4_1').className='prvPrfHoverOff'">成本价</td>
                                        <td width="5%" id="3_4_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_4_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_4_2').className='prvPrfHoverOff'">是否启用产品序列号</td>
                                        <td width="5%" id="3_4_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_4_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_4_3').className='prvPrfHoverOff'">销量</td>
                                        <td width="5%" id="3_4_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_4_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_4_4').className='prvPrfHoverOff'">负责人</td>
                                        <td width="5%" id="3_4_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="3_5_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('3_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('3_5_1').className='prvPrfHoverOff'">是否启用产品规格</td>
                                        <td width="5%" id="3_5_1_2">0%</td>
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
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>

                                </tr>
                                <tr>
                                </tr>
				                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_1').className='prvPrfHoverOff'">产品名称</td>
                                        <td width="5%" id="4_1_1_2">15%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_2').className='prvPrfHoverOff'">产品编码</td>
                                        <td width="5%" id="4_1_2_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_1_3"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_3').className='prvPrfHoverOff'">产品类别</td>
                                        <td width="5%" id="4_1_3_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_1_4').className='prvPrfHoverOff'">型号</td>
                                        <td width="5%" id="4_1_4_2">10%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_2_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_1').className='prvPrfHoverOff'">单位</td>
                                        <td width="5%" id="4_2_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_2_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_2').className='prvPrfHoverOff'">安全库存量</td>
                                        <td width="5%" id="4_2_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_2_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_3').className='prvPrfHoverOff'">供应商名称</td>
                                        <td width="5%" id="4_2_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_2_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_2_4').className='prvPrfHoverOff'">重量</td>
                                        <td width="5%" id="4_2_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_3_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_1').className='prvPrfHoverOff'">总库存数量</td>
                                        <td width="5%" id="4_3_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_3_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_2').className='prvPrfHoverOff'">创建人</td>
                                        <td width="5%" id="4_3_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_3_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_3').className='prvPrfHoverOff'">单价</td>
                                        <td width="5%" id="4_3_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_3_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_3_4').className='prvPrfHoverOff'">建议成交价</td>
                                        <td width="5%" id="4_3_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_4_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_1').className='prvPrfHoverOff'">成本价</td>
                                        <td width="5%" id="4_4_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_4_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_2').className='prvPrfHoverOff'">是否启用产品序列号</td>
                                        <td width="5%" id="4_4_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_4_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_3').className='prvPrfHoverOff'">销量</td>
                                        <td width="5%" id="4_4_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_4_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_4_4').className='prvPrfHoverOff'">负责人</td>
                                        <td width="5%" id="4_4_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="4_5_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('4_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('4_5_1').className='prvPrfHoverOff'">是否启用产品规格</td>
                                        <td width="5%" id="4_5_1_2">0%</td>
                                                                 	</tr>
                         	                     	</tbody></table>
			</td>
                </tr>
                </tbody></table>
		</div>
							<div id="Deliverys_fields" style="display:none">	
			 	<table cellspacing="0" cellpadding="5" width="100%" class="small">
       		
		<tbody><tr>
                	<td valign="top" width="25%">
		     	<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
                                <tbody><tr class="windLayerHead" height="25px">
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>

                                </tr>
                                <tr>
                                </tr>
				                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_1').className='prvPrfHoverOff'">产品名称</td>
                                        <td width="5%" id="5_1_1_2">15%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_2').className='prvPrfHoverOff'">产品编码</td>
                                        <td width="5%" id="5_1_2_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_1_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_3').className='prvPrfHoverOff'">产品类别</td>
                                        <td width="5%" id="5_1_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_1_4').className='prvPrfHoverOff'">型号</td>
                                        <td width="5%" id="5_1_4_2">10%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_2_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_1').className='prvPrfHoverOff'">单位</td>
                                        <td width="5%" id="5_2_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_2_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_2').className='prvPrfHoverOff'">安全库存量</td>
                                        <td width="5%" id="5_2_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_2_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_3').className='prvPrfHoverOff'">供应商名称</td>
                                        <td width="5%" id="5_2_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_2_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_2_4').className='prvPrfHoverOff'">重量</td>
                                        <td width="5%" id="5_2_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_3_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_1').className='prvPrfHoverOff'">总库存数量</td>
                                        <td width="5%" id="5_3_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_3_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_2').className='prvPrfHoverOff'">创建人</td>
                                        <td width="5%" id="5_3_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_3_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_3').className='prvPrfHoverOff'">单价</td>
                                        <td width="5%" id="5_3_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_3_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_3_4').className='prvPrfHoverOff'">建议成交价</td>
                                        <td width="5%" id="5_3_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_4_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_1').className='prvPrfHoverOff'">成本价</td>
                                        <td width="5%" id="5_4_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_4_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_2').className='prvPrfHoverOff'">是否启用产品序列号</td>
                                        <td width="5%" id="5_4_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_4_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_3').className='prvPrfHoverOff'">销量</td>
                                        <td width="5%" id="5_4_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_4_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_4_4').className='prvPrfHoverOff'">负责人</td>
                                        <td width="5%" id="5_4_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="5_5_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('5_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('5_5_1').className='prvPrfHoverOff'">是否启用产品规格</td>
                                        <td width="5%" id="5_5_1_2">0%</td>
                                                                 	</tr>
                         	                     	</tbody></table>
			</td>
                </tr>
                </tbody></table>
		</div>
							<div id="Warehouses_fields" style="display:none">	
			 	<table cellspacing="0" cellpadding="5" width="100%" class="small">
       		
		<tbody><tr>
                	<td valign="top" width="25%">
		     	<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
                                <tbody><tr class="windLayerHead" height="25px">
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>

                                </tr>
                                <tr>
                                </tr>
				                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_1').className='prvPrfHoverOff'">产品名称</td>
                                        <td width="5%" id="6_1_1_2">15%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_2').className='prvPrfHoverOff'">产品编码</td>
                                        <td width="5%" id="6_1_2_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_1_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_3').className='prvPrfHoverOff'">产品类别</td>
                                        <td width="5%" id="6_1_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_1_4').className='prvPrfHoverOff'">型号</td>
                                        <td width="5%" id="6_1_4_2">10%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_2_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_1').className='prvPrfHoverOff'">单位</td>
                                        <td width="5%" id="6_2_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_2_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_2').className='prvPrfHoverOff'">安全库存量</td>
                                        <td width="5%" id="6_2_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_2_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_3').className='prvPrfHoverOff'">供应商名称</td>
                                        <td width="5%" id="6_2_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_2_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_2_4').className='prvPrfHoverOff'">重量</td>
                                        <td width="5%" id="6_2_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_3_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_1').className='prvPrfHoverOff'">总库存数量</td>
                                        <td width="5%" id="6_3_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_3_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_2').className='prvPrfHoverOff'">创建人</td>
                                        <td width="5%" id="6_3_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_3_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_3').className='prvPrfHoverOff'">单价</td>
                                        <td width="5%" id="6_3_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_3_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_3_4').className='prvPrfHoverOff'">建议成交价</td>
                                        <td width="5%" id="6_3_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_4_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_4_1').className='prvPrfHoverOff'">成本价</td>
                                        <td width="5%" id="6_4_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_4_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_4_2').className='prvPrfHoverOff'">是否启用产品序列号</td>
                                        <td width="5%" id="6_4_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_4_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_4_3').className='prvPrfHoverOff'">销量</td>
                                        <td width="5%" id="6_4_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_4_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_4_4').className='prvPrfHoverOff'">负责人</td>
                                        <td width="5%" id="6_4_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="6_5_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('6_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('6_5_1').className='prvPrfHoverOff'">是否启用产品规格</td>
                                        <td width="5%" id="6_5_1_2">0%</td>
                                                                 	</tr>
                         	                     	</tbody></table>
			</td>
                </tr>
                </tbody></table>
		</div>
							<div id="Warehousetransfers_fields" style="display:none">	
			 	<table cellspacing="0" cellpadding="5" width="100%" class="small">
       		
		<tbody><tr>
                	<td valign="top" width="25%">
		     	<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small">
                                <tbody><tr class="windLayerHead" height="25px">
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>
                                    <td width="1%"></td>
                                    <td width="5%"></td>
                                    <td width="10%"><strong>字段名</strong></td>
                                    <td width="9%"><strong>字段宽度</strong></td>

                                </tr>
                                <tr>
                                </tr>
				                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_1_1"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_1').className='prvPrfHoverOff'">产品名称</td>
                                        <td width="5%" id="7_1_1_2">15%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_1_2"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_2').className='prvPrfHoverOff'">产品编码</td>
                                        <td width="5%" id="7_1_2_2">10%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_1_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_3').className='prvPrfHoverOff'">产品类别</td>
                                        <td width="5%" id="7_1_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_1_4"><img src="admin_files/prvPrfSelectedTick.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_1_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_1_4').className='prvPrfHoverOff'">型号</td>
                                        <td width="5%" id="7_1_4_2">10%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_2_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_1').className='prvPrfHoverOff'">单位</td>
                                        <td width="5%" id="7_2_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_2_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_2').className='prvPrfHoverOff'">安全库存量</td>
                                        <td width="5%" id="7_2_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_2_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_3').className='prvPrfHoverOff'">供应商名称</td>
                                        <td width="5%" id="7_2_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_2_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_2_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_2_4').className='prvPrfHoverOff'">重量</td>
                                        <td width="5%" id="7_2_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_3_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_1').className='prvPrfHoverOff'">总库存数量</td>
                                        <td width="5%" id="7_3_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_3_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_2').className='prvPrfHoverOff'">创建人</td>
                                        <td width="5%" id="7_3_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_3_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_3').className='prvPrfHoverOff'">单价</td>
                                        <td width="5%" id="7_3_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_3_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_3_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_3_4').className='prvPrfHoverOff'">建议成交价</td>
                                        <td width="5%" id="7_3_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_4_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_4_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_4_1').className='prvPrfHoverOff'">成本价</td>
                                        <td width="5%" id="7_4_1_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_4_2"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_4_2').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_4_2').className='prvPrfHoverOff'">是否启用产品序列号</td>
                                        <td width="5%" id="7_4_2_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_4_3"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_4_3').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_4_3').className='prvPrfHoverOff'">销量</td>
                                        <td width="5%" id="7_4_3_2">0%</td>
                                                                   		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_4_4"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_4_4').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_4_4').className='prvPrfHoverOff'">负责人</td>
                                        <td width="5%" id="7_4_4_2">0%</td>
                                                                 	</tr>
                         	                        	<tr>
					                           		<td style="width:20px">&nbsp;</td>
                           		<td width="5%" id="7_5_1"><img src="admin_files/no.gif"></td>
                           		<td width="10%" nowrap="" onmouseover="this.className='prvPrfHoverOn',$('7_5_1').className='prvPrfHoverOn'" onmouseout="this.className='prvPrfHoverOff',$('7_5_1').className='prvPrfHoverOff'">是否启用产品规格</td>
                                        <td width="5%" id="7_5_1_2">0%</td>
                                                                 	</tr>
                         	                     	</tbody></table>
			</td>
                </tr>
                </tbody></table>
		</div>
		</div>
                </div>
			</td></tr>
		</tbody></table>
		
	</div></td>
	</tr>
        </tbody></table>
        </td>
</asp:Content>
