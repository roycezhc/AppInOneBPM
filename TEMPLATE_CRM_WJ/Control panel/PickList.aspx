<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="PickList.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Control_panel_PickList" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
<td class="detail-content-td">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
<script language="JAVASCRIPT" type="text/javascript" src="./admin_files/smoothscroll.js"></script>
<script language="JavaScript" type="text/javascript" src="./admin_files/menu.js"></script>
<script src="./admin_files/prototype.js" type="text/javascript"></script>
<script src="./admin_files/scriptaculous.js" type="text/javascript"></script><script type="text/javascript" src="./admin_files/builder.js"></script><script type="text/javascript" src="./admin_files/effects.js"></script><script type="text/javascript" src="./admin_files/dragdrop.js"></script><script type="text/javascript" src="./admin_files/controls.js"></script><script type="text/javascript" src="./admin_files/slider.js"></script>
<script>
    //下拉框列表值，
    function splitvalues() {
        var picklistobj = getobj("listarea")
        var picklistcontent = picklistobj.value
        var picklistary = new array()
        var i = 0;

        //splitting up of values
        if (picklistcontent.indexof("\n") != -1) {
            while (picklistcontent.indexof("\n") != -1) {
                if (picklistcontent.replace(/^\s+/g, '').replace(/\s+$/g, '').length > 0) {
                    picklistary[i] = picklistcontent.substr(0, picklistcontent.indexof("\n")).replace(/^\s+/g, '').replace(/\s+$/g, '')
                    picklistcontent = picklistcontent.substr(picklistcontent.indexof("\n") + 1, picklistcontent.length)
                    i++
                } else break;
            }
        } else if (picklistcontent.replace(/^\s+/g, '').replace(/\s+$/g, '').length > 0) {
            picklistary[0] = picklistcontent.replace(/^\s+/g, '').replace(/\s+$/g, '')
        }

        return picklistary;
    }
    function setdefaultlist() {
        var picklistary = new array()
        picklistary = splitvalues()

        getobj("defaultlist").innerhtml = ""

        for (i = 0; i < picklistary.length; i++) {
            var objoption = document.createelement("option")
            if (browser_ie) {
                objoption.innertext = picklistary[i]
                objoption.value = picklistary[i]
            } else if (browser_nn4 || browser_nn6) {
                objoption.text = picklistary[i]
                objoption.setattribute("value", picklistary[i])
            }

            getobj("defaultlist").appendchild(objoption)
        }
    }
    function validate() {
        if (emptycheck("listarea", "下拉框列表值")) {
            var picklistary = new array()
            picklistary = splitvalues()
            //empty check validation
            for (i = 0; i < picklistary.length; i++) {
                if (picklistary[i] == "") {
                    alert("下拉框列表值不能为空")
                    picklistobj.focus()
                    return false
                }
            }

            //duplicate values' validation
            for (i = 0; i < picklistary.length; i++) {
                for (j = i + 1; j < picklistary.length; j++) {
                    if (picklistary[i] == picklistary[j]) {
                        alert("下拉框列表值重复")
                        picklistobj.focus()
                        return false
                    }
                }
            }

            return true;
        }
    }


</script>
<br>
				<!-- DISPLAY -->
				<table border="0" cellspacing="0" cellpadding="5" width="100%" class="settingsSelUITopLine">
				<tbody><tr>
					<td width="50" rowspan="2" valign="top"><img src="./admin_files/picklist.gif" width="48" height="48" border="0"></td>
					<td class="heading2" valign="bottom"><b><a href="http:/10.5.13.57/index.aspx?module=Settings&action=index&parenttab=Settings">控制面板</a> &gt; 下拉框选项</b></td>
				</tr>
				<tr>
					<td valign="top" class="small">定制每个模块的下拉框选项</td>
				</tr>
				</tbody></table>
				<table border="0" cellspacing="0" cellpadding="10" width="100%">
				<tbody><tr>
				<td valign="top">
				
					<table border="0" cellspacing="0" cellpadding="5" width="100%" class="tableHeading">
					<tbody><tr>
						<td class="big"><strong>1. 选择模块</strong></td>
						<td class="small" align="right">&nbsp;</td>
					</tr>
					</tbody></table>
					<table width="100%" border="0" cellpadding="5" cellspacing="0" class="small">
						<tbody><tr class="small">
                        	<td width="15%" class="detail-content-label" style="text-align:right;"><strong>选择CRM模块</strong></td>
	                        <td width="85%" class="cellText">
					<select name="pickmodule" onchange="changeModule(this);" >
							<option selected="" value="Accounts">客户</option>
							<option value="Contacts">联系人</option>
							<option value="Packorders">装配出入库单</option>
					</select>
				</td>
				</tr>
					</tbody></table>
					<br>
				<table border="0" cellspacing="0" cellpadding="5" width="100%" class="tableHeading">
				<tbody><tr>
				    <td class="big" rowspan="2">

              
					<div id="picklist_datas"><!--33这里被替换，changeModule 替换地址：-->
						
	<table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%"><tbody><tr><td><strong>2. 下拉框- 客户 </strong></td>
		<td class="small" align="right">&nbsp;</td>
		</tr>
	</tbody></table>
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tbody><tr>
		<td valign="top" width="50%">
			<table width="100%" class="listTable" cellpadding="5" cellspacing="0">
						<tbody><tr>
													<td class="detail-content-heading" align="left">
							
							员工人数
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','employees', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
																	<td class="detail-content-heading" align="left">
							
							客户来源
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','leadsource', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
																	<td class="detail-content-heading" align="left">
							
							客户级别
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','grade', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
											</tr>
			<tr>
													<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>5 - 10 人</li>
																												<li>11 - 50 人</li>
																												<li>51 - 100 人</li>
																												<li>101 - 200 人</li>
																												<li>201 - 300 人</li>
																												<li>301 - 500 人</li>
																												<li>501 - 1000 人</li>
																												<li>1000 人以上</li>
																		</ul>	
					</td>
																<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>电话来访</li>
																												<li>老客户</li>
																												<li>客户介绍</li>
																												<li>独立开发</li>
																												<li>媒体宣传</li>
																												<li>促销活动</li>
																												<li>代理商</li>
																												<li>合作伙伴</li>
																												<li>公开招标</li>
																												<li>直邮</li>
																												<li>Email群发</li>
																												<li>网站</li>
																												<li>会议</li>
																												<li>展会</li>
																												<li>口碑</li>
																												<li>其它</li>
																		</ul>	
					</td>
																<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>1星</li>
																												<li>2星</li>
																												<li>3星</li>
																												<li>4星</li>
																												<li>5星</li>
																		</ul>	
					</td>
										</tr>
					<tr>
													<td class="detail-content-heading" align="left">
							
							客户状态
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','rating', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
																	<td class="detail-content-heading" align="left">
							
							行业
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','industry', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
																	<td class="detail-content-heading" align="left">
							
							公司性质
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','ownership', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
											</tr>
			<tr>
													<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>潜在</li>
																												<li>有意向</li>
																												<li>失败</li>
																												<li>已成交</li>
																		</ul>	
					</td>
																<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>农业</li>
																												<li>食品、饮料</li>
																												<li>服装</li>
																												<li>纺织、皮革</li>
																												<li>电工电气</li>
																												<li>家用电器</li>
																												<li>电脑、软件</li>
																												<li>化工</li>
																												<li>冶金矿产</li>
																												<li>能源</li>
																												<li>环保</li>
																												<li>交通运输</li>
																												<li>建筑、建材</li>
																												<li>机械及行业设备</li>
																												<li>家居用品</li>
																												<li>医药、保养</li>
																												<li>礼品、工艺品、饰品</li>
																												<li>运动、休闲</li>
																												<li>办公、文教</li>
																												<li>包装</li>
																												<li>商务服务</li>
																												<li>安全、防护</li>
																												<li>库存积压</li>
																												<li>汽摩及配件</li>
																												<li>印刷</li>
																												<li>代理</li>
																												<li>纸业</li>
																												<li>传媒</li>
																												<li>服饰</li>
																												<li>橡塑</li>
																												<li>精细化学品</li>
																												<li>电子元器件</li>
																												<li>照明工业</li>
																												<li>五金、工具</li>
																												<li>通讯产品</li>
																												<li>玩具</li>
																												<li>加工</li>
																												<li>二手设备转让</li>
																												<li>项目合作</li>
																												<li>仪器仪表</li>
																												<li>其它</li>
																		</ul>	
					</td>
																<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>国有企业</li>
																												<li>外资企业</li>
																												<li>民营企业</li>
																												<li>集体企业</li>
																												<li>股份制企业</li>
																												<li>合资企业</li>
																												<li>独资企业</li>
																												<li>其他</li>
																		</ul>	
					</td>
										</tr>
					<tr>
													<td class="detail-content-heading" align="left">
							
							类型
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','accounttype', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
																	<td class="detail-content-heading" align="left">
							
							营业额
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','annualrevenue', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
																	<td class="detail-content-heading" align="left">
							
							支付方式
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','paymenttype', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
											</tr>
			<tr>
													<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>分析者</li>
																												<li>竞争者</li>
																												<li>客户</li>
																												<li>集成商</li>
																												<li>投资商</li>
																												<li>合作伙伴</li>
																												<li>出版商</li>
																												<li>目标</li>
																												<li>供应商</li>
																												<li>其它</li>
																		</ul>	
					</td>
																<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>人民币 10 万元/年以下</li>
																												<li>人民币 10 万元/年 - 30 万元</li>
																												<li>人民币 30 万元/年 - 50 万元/年</li>
																												<li>人民币 50 万元/年 - 100 万元/年</li>
																												<li>人民币 100 万元/年以下</li>
																												<li>人民币 200 万元/年 - 300 万元/年</li>
																												<li>人民币 100 万元/年 - 200 万元/年</li>
																												<li>人民币 300 万元/年 - 500 万元/年</li>
																												<li>人民币 500 万元/年 - 700 万元/年</li>
																												<li>人民币 700 万元/年 - 1000 万元/年</li>
																												<li>人民币 1000 万元/年 - 2000 万元/年</li>
																												<li>人民币 2000 万元/年 - 3000 万元/年</li>
																												<li>人民币 3000 万元/年 - 5000 万元/年</li>
																												<li>人民币 5000 万元/年 - 1 亿元/年</li>
																												<li>人民币 1 亿元/年以上</li>
																		</ul>	
					</td>
																<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>现金</li>
																												<li>支票</li>
																												<li>支付宝</li>
																												<li>paypal</li>
																		</ul>	
					</td>
										</tr>
					<tr>
													<td class="detail-content-heading" align="left">
													热点客户
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','cf_498', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
																	<td class="detail-content-heading" align="left">
													热度
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','cf_500', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
																	<td class="detail-content-heading" align="left">
													热点分类
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','cf_502', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
											</tr>
			<tr>
													<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>是</li>
																												<li>否</li>
																		</ul>	
					</td>
																<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>低热</li>
																												<li>中热</li>
																												<li>高热</li>
																		</ul>	
					</td>
																<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>无</li>
																												<li>老客户</li>
																												<li>新客户</li>
																												<li>新合作</li>
																		</ul>	
					</td>
										</tr>
					<tr>
													<td class="detail-content-heading" align="left">
													客户产品
											</td>
					<td class="detail-content-heading">&nbsp;
						<button class="pure-button pure-button-success" title="编辑" onclick="fetchEditPickList('Accounts','cf_535', 15);return false;">
							<i class="icon-fixed-width icon-pencil"></i> 编辑
						</button>
					</td>
																	<td class="detail-content-heading small" colspan="2">&nbsp;</td>
																	<td class="detail-content-heading small" colspan="2">&nbsp;</td>
											</tr>
			<tr>
													<td colspan="2" valign="top" align="left">
					<ul style="list-style-type: none;">
																					<li>键盘</li>
																												<li>鼠标</li>
																												<li>光驱</li>
																		</ul>	
					</td>
																<td colspan="2">&nbsp;</td>
															<td colspan="2">&nbsp;</td>
									</tr>
				</tbody></table> 
		</td></tr>
		</tbody></table>
					</div>                    

				    </td>	
				
				</tr>
			    	</tbody></table>
				<table border="0" cellspacing="0" cellpadding="5" width="100%">
					<tbody><tr><td class="small" nowrap="" align="right"><a href="http:/10.5.13.57/index.aspx?module=Settings&action=PickList&parenttab=Settings#top">[上]</a></td></tr>
				</tbody></table>
				
				</td>
				</tr>
				</tbody></table>
			
			
			
			</div></td>
			</tr>
			</tbody></table>
            </td>
</asp:Content>
