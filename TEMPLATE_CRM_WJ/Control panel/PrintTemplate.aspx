<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true" CodeFile="PrintTemplate.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_PrintTemplate" %>

<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>  	
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCond" type="hidden" runat="server" />
<td class="detail-content-td">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody><tr><td valign="top">
				<div class="detail-panel-div">
											<script language="JAVASCRIPT" type="text/javascript" src="include/js/smoothscroll.js"></script>
<script language="JavaScript" type="text/javascript" src="include/js/menu.js"></script>

<script language="JavaScript" type="text/javascript">
    var allOptions = null;

    function setAllOptions(inputOptions) {
        allOptions = inputOptions;
    }

    function modifyMergeFieldSelect(cause, effect) {
        var selected = cause.options[cause.selectedIndex].value; id = "mergeFieldValue"
        var s = allOptions[cause.selectedIndex];

        effect.length = s;
        for (var i = 0; i < s; i++) {
            effect.options[i] = s[i];
        }
        document.getElementById('mergeFieldValue').value = '';
    }


    /   function typeSave()
    /   {
    /	var value1 = $F("TemplateType");
    /	if(value1 == 0 || value1 == "") {
    /             alert("请先选择模块和模板");
    /	     return ;
    /        }
    /	var value2 = KE.html("body");
    /	/oEditor=FCKeditorAPI.GetInstance('body');
    /	/var value2= oEditor.GetXHTML(true);
    /     new Ajax.Request(
    /		  'index.aspx',
    /		  {queue: {position: 'end', scope: 'command'},
    /					method: 'post',
    /					postBody:"module=Settings&action=SettingsAjax&file=savePrintTemplate&type="+encodeURIComponent(value1)+"&content="+encodeURIComponent(value2),
    /					onComplete: function(response) {
    /							var result = response.responseText;
    /							alert(result);
    /							
    /							
    /					}
    /			 }
    /    );
    /       
    /   }

    function typeChoose(value) {
        if (value == 0 || value == "") {
            KE.html("body", '');
            /oEditor=FCKeditorAPI.GetInstance('body');							
            /oEditor.SetHTML("") ;
            return;
        }
        new Ajax.Request(
		  'index.aspx',
		  { queue: { position: 'end', scope: 'command' },
		      method: 'post',
		      postBody: "module=Settings&action=SettingsAjax&file=getPrintTemplate&type=" + encodeURIComponent(value),
		      onComplete: function (response) {
		          var result = response.responseText;
		          KE.html("body", result);
		          /alert(result);
		          /oEditor=FCKeditorAPI.GetInstance('body');							
		          /oEditor.SetHTML(result) ;
		          /oEditor=FCKeditorAPI.GetInstance('body');
		          / var value3= oFCKeditor.GetXHTML(true);
		          / alert(value3);
		          if (value != 0) {
		              templatepath = "模板的路径：cache/modules/" + value + ".html";
		              $("templatepatch").update(templatepath);
		          }
		          else {
		              $("templatepatch").update("");
		          }

		      }
		  }
    );

    }

    function DefTemplate() {
        var moduleType = $F('ModuleType');
        var value = $F("TemplateType");
        if (value == 0 || value == "") {
            alert("请先选择模块和模板");
            return;
        }
        var relObj = $("TemplateType");
        relObj.options.selectedIndex = 1;
        var relval = relObj.options[relObj.options.selectedIndex].value;

        typeChoose(relval);

        /* new Ajax.Request('index.aspx',
        {queue: {position: 'end', scope: 'command'},
        method: 'post',
        postBody:"module=Settings&action=SettingsAjax&file=DefPrintTemplate&fld_module="+moduleType+"&type="+encodeURIComponent(value),
        onComplete: function(response)
        {
        var result = response.responseText;
        KE.html("body",result);
        alert(result);
        /oFCKeditor.SetHTML(result) ;
							
        }
        }
        );*/
    }

    function updateTemplateOptions() {
        var moduleType = $F('ModuleType');
        if (moduleType == 0 || moduleType == "") {
            if ($('TemplateType')) $('TemplateType').update("<option value=0 selected> -- 无 -- </option>");
        }
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'action=SettingsAjax&module=Settings&file=updateTemplateOptions&moduleType=' + moduleType,
		    onComplete: function (response) {
		        var optionval = response.responseText;
		        if ($('TemplateType')) $('TemplateType').update(optionval);
		        typeChoose("");
		    }
		}
	);
    }

    function CreateTemplate() {
        var moduleType = $F('ModuleType');
        if (moduleType == 0 || moduleType == "") {
            alert("请先选择模块");
            return;
        }
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Settings&action=SettingsAjax&file=CreateTemplate&fld_module=' + moduleType + '&parenttab=Settings&ajax=true',
		    onComplete: function (response) {
		        $("createtemplateContent").innerHTML = response.responseText;
		        ShowLockDiv("createtemplate");
		    }
		}
	);

    }

    function DeleteTemplate() {
        var templateType = $F('TemplateType');
        var moduleType = $F('ModuleType');
        if (templateType == 0 || templateType == "") {
            alert("请先选择模块和模板");
            return;
        }
        if (confirm(alert_arr.ARE_YOU_SURE)) {
            new Ajax.Request(
			'index.aspx',
			{ queue: { position: 'end', scope: 'command' },
			    method: 'post',
			    postBody: 'module=Settings&action=SettingsAjax&file=DeleteTemplate&fld_module=' + moduleType + '&templateType=' + templateType + '&parenttab=Settings&ajax=true',
			    onComplete: function (response) {
			        var rest = response.responseText;
			        if (rest == 'SUCCESS') {
			            alert("删除成功");
			            document.location.href = "index.aspx?module=Settings&action=PrintTemplate&fld_module=" + moduleType + "&parenttab=Settings";
			        } else if (rest == 'Not Delete') {
			            alert('当前模块只有一个打印模板，不能删除。');
			        }
			    }
			}
		);
        }

    }

    function updateVarOptions() {
        var ModuleVar = $F('ModuleVar');
        if (ModuleVar == 0 || ModuleVar == "") {
            if ($('FieldVar')) $('FieldVar').update("<option value=0 selected> -- 无 -- </option>");
        }
        new Ajax.Request(
		'index.aspx',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'action=SettingsAjax&module=Settings&file=updateVarOptions&ModuleVar=' + ModuleVar,
		    onComplete: function (response) {
		        var optionval = response.responseText;
		        if ($('FieldVar')) $('FieldVar').update(optionval);
		        fieldChoose("");
		    }
		}
	);
    }

    function fieldChoose(value) {
        if (value != 0) {
            /value = "打印变量：" + value;
            $("varfieldinfo").value = value;
        }
        else {
            /$("varfieldinfo").update("");
            $("varfieldinfo").value = "";
        }
    }

    function ImportTemplate() {
        var templateType = $F('TemplateType');
        var moduleType = $F('ModuleType');
        if (templateType == 0 || templateType == "") {
            alert("请先选择模块和模板!");
            return;
        }
        var urlstring = "&fld_module=" + moduleType + "&templatetype=" + templateType + "";
        window.open('index.aspx?module=Settings&action=SettingsAjax&file=ImportHtmlTpl' + urlstring,
					'ImportHtmlTpl', 'width=500,height=300,resizable=1,scrollbars=1');
    }
    function ExportTemplate() {
        var templateType = $F('TemplateType');
        var moduleType = $F('ModuleType');
        if (templateType == 0 || templateType == "") {
            alert("请先选择模块和模板!");
            return;
        }
        var urlstring = "&fld_module=" + moduleType + "&tplname=" + templateType + "";
        location.href = 'index.aspx?module=Settings&action=SettingsAjax&file=ExportExcelTpl' + urlstring;
    }
    function DownloadTemplate() {
        var templateType = $F('TemplateType');
        var moduleType = $F('ModuleType');
        if (templateType == 0 || templateType == "") {
            alert("请先选择模块和模板!");
            return;
        }
        var urlstring = "&fld_module=" + moduleType + "&tplname=" + templateType + "";
        location.href = 'index.aspx?module=Settings&action=SettingsAjax&file=DownloadHtmlTpl' + urlstring;
    }
    function ImportZipTemplate() {
        var templateType = $F('TemplateType');
        var moduleType = $F('ModuleType');
        if (templateType == 0 || templateType == "") {
            alert("请先选择模块和模板!");
            return;
        }
        var urlstring = "&fld_module=" + moduleType + "&templatetype=" + templateType + "";
        window.open('index.aspx?module=Settings&action=SettingsAjax&file=ImportZipTpl' + urlstring,
					'ImportZipTpl', 'width=500,height=300,resizable=1,scrollbars=1');
    }

    function typeSave() {
        var types = Jquery("#TemplateType").val();
        if (types == 0 || types == "") {
            alert("请先选择模块和模板");
            return false;
        }
        var contents = KE.html('body');
        var urlstring = "&type=" + encodeURIComponent(types) + "";
        contents = encodeURIComponent(contents);
        urlstring += "&content=" + contents + "";
        Jquery("#status").css("display", "inline");
        Jquery.ajax({
            url: "index.aspx",
            type: "post",
            data: "module=Settings&action=SettingsAjax&file=savePrintTemplate" + urlstring,
            success: function (rest) {
                Jquery("#status").css("display", "none");
                alert(rest);
            }
        });
    }

</script>

<div id="createtemplate" class="windLayerDiv" style="display:none;width:300px; left:550px;top:200px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td class="windLayerHeading" align="left" width="80%" style="cursor:move" id="block-title">&nbsp;&nbsp;新增模板</td>
	<td>&nbsp;</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('createtemplate');">&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
            <!-- popup specific content fill in starts -->
			<div id="createtemplateContent"></div>
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("createtemplate", 'windLayerHeading');
</script>
</div>
  
<!-- <div id="createtemplate" style="display:block;position:absolute;width:300px;"></div> -->
<br>
				<!-- DISPLAY -->
				<table border="0" cellspacing="0" cellpadding="5" width="100%" class="settingsSelUITopLine">
				<form action="index.aspx" method="post" name="templatecreate" onsubmit="return check4null();"></form>  
				<input type="hidden" name="action">
				<input type="hidden" name="mode" value="">
				<input type="hidden" name="module" value="Settings">
				<input type="hidden" name="templateid" value="">
				<input type="hidden" name="parenttab" value="PARENTTAB}">
				<tbody><tr>
					<td width="50" rowspan="2" valign="top"><img src="admin_files/printtemplate.gif" alt="Users" width="45" height="60" border="0" title="Users"></td>
					<td class="heading2" valign="bottom"><b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a> &gt; 打印模板定制 </b></td>
				</tr>
				<tr>
					<td valign="top" class="small">    </td>
				</tr>
				</tbody></table>
				
				<table border="0" cellspacing="0" cellpadding="10" width="100%">
				<tbody><tr>
				<td>
				
					<table border="0" cellspacing="0" cellpadding="5" width="100%" class="tableHeading">
					<tbody><tr>
						<td class="small" align="left">
							<button class="pure-button pure-button-success" title="保存" onclick="typeSave();return false;">
									<i class="icon-mail-forward"></i>
								保存
							</button>&nbsp;
							
							<button class="pure-button pure-button-share" title="恢复默认模板" onclick="DefTemplate();return false;">
									<i class="icon-mail-forward"></i>
								恢复默认模板
							</button>&nbsp;

							<button class="pure-button pure-button-edit" title="新增模板" onclick="CreateTemplate();return false;">
									<i class="icon-plus"></i>
								新增模板
							</button>&nbsp;

							<button class="pure-button pure-button-danger" title="删除模板" onclick="DeleteTemplate();return false;">
									<i class="icon-fixed-width icon-trash"></i>
								删除模板
							</button>&nbsp;
							&nbsp;
						</td>
						<td class="small" align="right">
							<!-- <input type="button" value=" 导入Excel " class="crmButton small save" onclick="ImportTemplate();" >
							<input type="button" value=" 导出Excel " class="crmButton small save" onclick="ExportTemplate();" > -->
							
							<button class="pure-button pure-button-approve" title="导入zip" onclick="ImportZipTemplate();return false;">
								<i class="icon-circle-arrow-up"></i> 导入zip
							</button>&nbsp;

							<button class="pure-button pure-button-share" title="下载" onclick="DownloadTemplate();return false;" name="Share">
								<i class="icon-circle-arrow-down"></i> 下载
							</button>&nbsp;
						</td>
					</tr>
					</tbody></table>
					
					<table border="0" cellspacing="0" cellpadding="2" width="100%">
					<tbody><tr>
					  <td colspan="2" valign="top" class="small"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="">
                        <tbody><tr>
                          <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="5">
                              <tbody><tr>
                                <td colspan="3" valign="top" class="detail-heading"><strong>打印模板定制</strong></td>
                                </tr>

			    <tr>
			        <td style="width:10%;" class="detail-content-label">模板选择</td>
                                <td colspan="3" valign="top" class="cellText small">
				<table width="100%" border="0" cellspacing="0" cellpadding="5">

				<tbody><tr><td><select id="ModuleType" name="ModuleType" onchange="javascript:updateTemplateOptions();">
                                             <option value="0" selected=""> -- 无 -- </option>
					     
<option value="Notes">联系记录</option>
<option value="Quotes">报价单</option>
<option value="PurchaseOrder">进货单</option>
<option value="SalesOrder">合同订单</option>
<option value="Invoice">发货单</option>
<option value="Gathers">应收款</option>
<option value="Charges">应付款</option>
<option value="Expenses">费用报销</option>
<option value="Deliverys">出库单</option>
<option value="Warehouses">入库单</option>
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
<option value="Memdays">纪念日</option>
<option value="Maillisttmps">邮件模板</option>
<option value="Packorders">装配出入库单</option>
                                        </select>
					<select id="TemplateType" name="TemplateType" onchange="typeChoose(this.value)"><option value="0" selected=""> -- 无 -- </option></select>					
				     </td>
				     <td><div id="templatepatch"></div></td>
                                  </tr>




                            
                                </tbody></table>
                                </td>
                              </tr>


			    
                              <tr>
                                <td valign="top" class="detail-content-label">信息</td>
                                 <td valign="top" class="cellText small"><p><table cellpadding="0" cellspacing="0" border="0" class="ke-container" style="width: 920px; height: 600px;"><tbody><tr><td class="ke-toolbar-outer"><table cellpadding="0" cellspacing="0" border="0" class="ke-toolbar" style="height: 48px;"><tbody><tr><td><table cellpadding="0" cellspacing="0" border="0" class="ke-toolbar-table"><tbody><tr><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="HTML代码"><span class="ke-common-icon ke-common-icon-url ke-icon-source"></span></a></td><td><div class="ke-toolbar-separator"></div></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="后退(Ctrl+Z)"><span class="ke-common-icon ke-common-icon-url ke-icon-undo"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="前进(Ctrl+Y)"><span class="ke-common-icon ke-common-icon-url ke-icon-redo"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="打印"><span class="ke-common-icon ke-common-icon-url ke-icon-print"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="剪切(Ctrl+X)"><span class="ke-common-icon ke-common-icon-url ke-icon-cut"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="复制(Ctrl+C)"><span class="ke-common-icon ke-common-icon-url ke-icon-copy"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="粘贴(Ctrl+V)"><span class="ke-common-icon ke-common-icon-url ke-icon-paste"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="粘贴为无格式文本"><span class="ke-common-icon ke-common-icon-url ke-icon-plainpaste"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="从Word粘贴"><span class="ke-common-icon ke-common-icon-url ke-icon-wordpaste"></span></a></td><td><div class="ke-toolbar-separator"></div></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="左对齐"><span class="ke-common-icon ke-common-icon-url ke-icon-justifyleft"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="居中"><span class="ke-common-icon ke-common-icon-url ke-icon-justifycenter"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="右对齐"><span class="ke-common-icon ke-common-icon-url ke-icon-justifyright"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="两端对齐"><span class="ke-common-icon ke-common-icon-url ke-icon-justifyfull"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="编号"><span class="ke-common-icon ke-common-icon-url ke-icon-insertorderedlist"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="项目符号"><span class="ke-common-icon ke-common-icon-url ke-icon-insertunorderedlist"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="增加缩进"><span class="ke-common-icon ke-common-icon-url ke-icon-indent"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="减少缩进"><span class="ke-common-icon ke-common-icon-url ke-icon-outdent"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="下标"><span class="ke-common-icon ke-common-icon-url ke-icon-subscript"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="上标"><span class="ke-common-icon ke-common-icon-url ke-icon-superscript"></span></a></td><td><div class="ke-toolbar-separator"></div></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="全选"><span class="ke-common-icon ke-common-icon-url ke-icon-selectall"></span></a></td></tr></tbody></table><table cellpadding="0" cellspacing="0" border="0" class="ke-toolbar-table"><tbody><tr><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="标题"><span class="ke-common-icon ke-common-icon-url ke-icon-title"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="字体"><span class="ke-common-icon ke-common-icon-url ke-icon-fontname"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="文字大小"><span class="ke-common-icon ke-common-icon-url ke-icon-fontsize"></span></a></td><td><div class="ke-toolbar-separator"></div></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="文字颜色"><span class="ke-common-icon ke-common-icon-url ke-icon-textcolor"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="文字背景"><span class="ke-common-icon ke-common-icon-url ke-icon-bgcolor"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="粗体(Ctrl+B)"><span class="ke-common-icon ke-common-icon-url ke-icon-bold"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="斜体(Ctrl+I)"><span class="ke-common-icon ke-common-icon-url ke-icon-italic"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="下划线(Ctrl+U)"><span class="ke-common-icon ke-common-icon-url ke-icon-underline"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="删除线"><span class="ke-common-icon ke-common-icon-url ke-icon-strikethrough"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="删除格式"><span class="ke-common-icon ke-common-icon-url ke-icon-removeformat"></span></a></td><td><div class="ke-toolbar-separator"></div></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="插入Flash"><span class="ke-common-icon ke-common-icon-url ke-icon-flash"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="插入多媒体"><span class="ke-common-icon ke-common-icon-url ke-icon-media"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="表格"><span class="ke-common-icon ke-common-icon-url ke-icon-advtable"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="插入横线"><span class="ke-common-icon ke-common-icon-url ke-icon-hr"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="插入表情"><span class="ke-common-icon ke-common-icon-url ke-icon-emoticons"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="超级链接"><span class="ke-common-icon ke-common-icon-url ke-icon-link"></span></a></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="取消超级链接"><span class="ke-common-icon ke-common-icon-url ke-icon-unlink"></span></a></td><td><div class="ke-toolbar-separator"></div></td><td><a tabindex="-1" class="ke-icon" href="javascript:;" title="关于"><span class="ke-common-icon ke-common-icon-url ke-icon-about"></span></a></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td class="ke-textarea-outer"><table cellpadding="0" cellspacing="0" border="0" class="ke-textarea-table"><tbody><tr><td><iframe tabindex="5" class="ke-iframe" frameborder="0" style="height: 541px;"></iframe><textarea tabindex="5" class="ke-textarea" style="display: none; height: 541px;"></textarea></td></tr></tbody></table></td></tr><tr><td class="ke-bottom-outer"><table class="ke-bottom" cellpadding="0" cellspacing="0" border="0" style="height: 11px;"><tbody><tr><td class="ke-bottom-left"><span class="ke-bottom-left-img"></span></td><td class="ke-bottom-right"><span class="ke-bottom-right-img"></span></td></tr></tbody></table></td></tr></tbody></table><textarea id="body" name="body" style="width: 920px; height: 600px; display: none;" class="small" tabindex="5"></textarea></p>
                                    </td>
                              </tr>

                          </tbody></table></td>
                          
                        </tr>
                      </tbody></table></td>
					  </tr>
					</tbody></table>


                                        <table border="0" cellspacing="0" cellpadding="5" width="100%">
					<tbody><tr>
					  <td colspan="2" valign="top" class="small"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="">
                        <tbody><tr>
                          <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="5">
                              <tbody><tr>
                                <td colspan="6" valign="top" class="detail-heading"><strong>模板变量信息</strong></td>
                                </tr>

			    <tr>
			        <td width="10%" valign="top" class="detail-content-label">基本信息变量</td>
                                <td colspan="3" valign="top" class="small">
									<table width="100%" border="0" cellspacing="0" cellpadding="5">
                                     <tbody><tr>
                                        <td width="13%">日期</td>
                                        <td width="20%">[var.DATE]</td>
                                        <td width="13%">编号</td>
                                        <td width="20%">[var.NO]</td>
                                        <td width="13%">付款条件信息</td>
                                        <td width="20%">[var.TERMS]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">备注信息</td>
                                        <td width="20%">[var.DESCRIPTION]</td>
                                        <td width="13%">税的信息</td>
                                        <td width="20%">[var.TAX]</td>
                                        <td width="13%">税率的信息</td>
                                        <td width="20%">[var.TAXRATE]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">调整的信息</td>
                                        <td width="20%">[var.ADJUSTMENT]</td>
                                        <td width="13%">总计</td>
                                        <td width="20%">[var.TOTAL]</td>
                                      </tr>
									</tbody></table>
                                </td>
				</tr>

                               <tr>
			        <td width="10%" valign="top" class="detail-content-label">公司信息变量</td>
                                <td colspan="3" valign="top" class="small">
				<table width="100%" border="0" cellspacing="0" cellpadding="5">


                                     <tbody><tr>
                                        <td width="13%">公司名称</td>
                                        <td width="20%">[var.COMPANY_NAME]</td>
                                        <td width="13%">公司地址</td>
                                        <td width="20%">[var.COMPANY_ADDRESS]</td>
                                        <td width="13%">公司所在城市</td>
                                        <td width="20%">[var.COMPANY_CITY]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">公司所在省份</td>
                                        <td width="20%">[var.COMPANY_STATE]</td>
                                        <td width="13%">公司所在国家</td>
                                        <td width="20%">[var.COMPANY_COUNTRY]</td>
                                        <td width="13%">公司邮编</td>
                                        <td width="20%">[var.COMPANY_CODE]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">公司电话</td>
                                        <td width="20%">[var.COMPANY_PHONE]</td>
                                        <td width="13%">公司传真</td>
                                        <td width="20%">[var.COMPANY_FAX]</td>
                                        <td width="13%">公司网站</td>
                                        <td width="20%">[var.COMPANY_WEBSITE]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">公司logo路径</td>
                                        <td width="20%">[var.COMPANY_LOGO]</td>
                                        <td width="13%">公司法定代表人</td>
                                        <td width="20%">[var.COMPANY_PERSON]</td>
                                        <td width="13%">公司开户银行</td>
                                        <td width="20%">[var.COMPANY_BANKNAME]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">公司税号信息</td>
                                        <td width="20%">[var.COMPANY_TAXNO]</td>
                                        <td width="13%">公司银行帐号</td>
                                        <td width="20%">[var.COMPANY_<br>BANKACCOUNT]</td>
                                        <td width="13%"></td>
                                        <td width="20%"></td>
                                      </tr>
                                </tbody></table>
                                </td>
                              </tr>

			    <tr>
			        <td width="10%" valign="top" class="detail-content-label">负责人信息变量</td>
                                <td colspan="3" valign="top" class="small">
				<table width="100%" border="0" cellspacing="0" cellpadding="5">
                                     <tbody><tr>
                                        <td>负责人手机</td>
                                        <td>[var.USER_MOBILE]</td>
										<td>负责人电话</td>
                                        <td>[var.USER_PHONE]</td>
                                        <td>负责人姓名</td>
                                        <td>[var.USER_NAME]</td>
                                        <td>负责人Email</td>
                                        <td>[var.USER_EMAIL]</td>
                                      </tr>
                                </tbody></table>
                                </td>
                            </tr>

			       <tr>
			        <td width="10%" valign="top" class="detail-content-label">客户和供应商<br>信息变量</td>
                                <td colspan="3" valign="top" class="small">
				<table width="100%" border="0" cellspacing="0" cellpadding="5">
                                     <tbody><tr>
                                        <td width="13%">客户/供应商名称</td>
                                        <td width="20%">[var.ACCOUNT_NAME]</td>
                                        <td width="13%">客户/供应商电话</td>
                                        <td width="20%">[var.ACCOUNT_PHONE]</td>
                                        <td width="13%">客户/供应商传真</td>
                                        <td width="20%">[var.ACCOUNT_FAX]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">客户/供应商地址</td>
                                        <td width="20%">[var.ACCOUNT_STREET]</td>
                                        <td width="13%">客户/供应商所在城市</td>
                                        <td width="20%">[var.ACCOUNT_CITY]</td>
                                        <td width="13%">客户/供应商所在省份</td>
                                        <td width="20%">[var.ACCOUNT_STATE]</td>
                                      </tr>
                                       <tr>
                                        <td width="13%">客户/供应商邮编</td>
                                        <td width="20%">[var.ACCOUNT_CODE]</td>
                                        <td width="13%">客户/供应商Email</td>
                                        <td width="20%">[var.ACCOUNT_EMAIL]</td>

                                      </tr>
                                </tbody></table>
                                </td>
                               </tr>

                               <tr>
			        <td width="10%" valign="top" class="detail-content-label">联系人和供应商<br>联系人信息变量</td>
                                <td colspan="3" valign="top" class="small">
				<table width="100%" border="0" cellspacing="0" cellpadding="5">
                                     <tbody><tr>
                                        <td width="13%">联系人/供应商联系人名称</td>
                                        <td width="20%">[var.CONTACT_NAME]</td>
                                        <td width="13%">联系人/供应商联系人手机</td>
                                        <td width="20%">[var.CONTACT_MOBILE]</td>
                                        <td width="13%">联系人/供应商联系人电话</td>
                                        <td width="20%">[var.CONTACT_PHONE]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">联系人/供应商联系人Email</td>
                                        <td width="20%">[var.CONTACT_EMAIL]</td>
                                      </tr>
                                </tbody></table>
                                </td>
                               </tr>

                               <tr>
			        <td width="10%" valign="top" class="detail-content-label">产品信息变量</td>
                                <td colspan="3" valign="top" class="small">
				<table width="100%" border="0" cellspacing="0" cellpadding="5">
                                     <tbody><tr>
                                        <td width="13%">产品序号</td>
                                        <td width="20%">[product.#]</td>
                                        <td width="13%">产品名称</td>
                                        <td width="20%">[product.name]</td>
                                        <td width="13%">产品型号</td>
                                        <td width="20%">[product.spec]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">产品编号</td>
                                        <td width="20%">[product.code]</td>
                                        <td width="13%">产品图片的路径</td>
                                        <td width="20%">[product.imagename]</td>
                                        <td width="13%">产品数量和单位</td>
                                        <td width="20%">[product.qty]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">产品数量</td>
                                        <td width="20%">[product.num]</td>
                                        <td width="13%">产品单位</td>
                                        <td width="20%">[product.unit]</td>
                                        <td width="13%">产品价格</td>
                                        <td width="20%">[product.price]</td>
                                      </tr>
                                      <tr>
                                        <td width="13%">产品小计</td>
                                        <td width="20%">[product.total]</td>
					<td width="13%">产品分类</td>
                                        <td width="20%">[product.catalogname]</td>
                                        <td width="13%">产品备注</td>
                                        <td width="20%">[product.description]</td>
                                      </tr>
									  <tr>
                                        <td width="13%">产品库位</td>
                                        <td width="20%">[product.prodlocat]</td>

										<td width="13%">字段标签 1</td>
                                        <td width="20%">[product.descrione]</td>
                                        <td width="13%">字段标签 2</td>
                                        <td width="20%">[product.descritwo]</td>
                                      </tr>
									  <tr>
                                        <td width="13%">字段标签 3</td>
                                        <td width="20%">[product.descrithree]</td>
										<td width="13%">字段标签 4</td>
                                        <td width="20%">[product.descrifour]</td>
                                        <td width="13%">字段标签 5</td>
                                        <td width="20%">[product.descrifive]</td>
                                      </tr>
                                </tbody></table>
                                </td>
                               </tr>

                               <tr>
			        <td width="10%" valign="top" class="detail-content-label">备注</td>
                                <td colspan="3" valign="top" class="small">
				<table width="100%" border="0" cellspacing="0" cellpadding="5">
                                     <tbody><tr>
                                        <td><a href="http:/www.crmone.cn/bbs/viewthread.php?tid=455&amp;extra=page%3D1" target="_black">查询如何定制打印模板</a></td>
                                     </tr>				     
                                     <tr>
                                        <td>如果您想调用更多的信息变量，请通过下面的选项选择查看，复制文本框里的打印变量放在打印模板里，打印时将自动替换相应的值。</td>
                                     </tr>
				     <tr>
				     <td nowrap="">
				       模块：
				       <select id="ModuleVar" name="ModuleVar" onchange="javascript:updateVarOptions();">
                                             <option value="0" selected=""> -- 无 -- </option>
					     <option value="Accounts"> 客户 </option>
					     <option value="Contacts"> 联系人 </option>
					     <option value="Vendors"> 供应商 </option>
					     <option value="Vcontacts"> 供应商联系人 </option>
					     <option value="Products"> 产品 </option>
					     
<option value="Notes">联系记录</option>
<option value="Quotes">报价单</option>
<option value="PurchaseOrder">进货单</option>
<option value="SalesOrder">合同订单</option>
<option value="Invoice">发货单</option>
<option value="Gathers">应收款</option>
<option value="Charges">应付款</option>
<option value="Expenses">费用报销</option>
<option value="Deliverys">出库单</option>
<option value="Warehouses">入库单</option>
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
<option value="Memdays">纪念日</option>
<option value="Maillisttmps">邮件模板</option>
<option value="Packorders">装配出入库单</option>
                                        </select>
					<select id="FieldVar" name="FieldVar" onchange="fieldChoose(this.value)">
                                            <option value="0" selected=""> -- 无 -- </option>					    
                                        </select>
					<input type="text" name="varfieldinfo" id="varfieldinfo" value="" size="50">
				     </td>
				     
                                  </tr>
                                </tbody></table>
                                </td>
                               </tr>

                          </tbody></table></td>

                        </tr>
                      </tbody></table></td>
					  </tr>
					</tbody></table>

					<br>
					<table border="0" cellspacing="0" cellpadding="5" width="100%">
					<tbody><tr>
					  <td class="small" nowrap="" align="right"><a href="#top">[上]</a></td>
					</tr>
					</tbody></table>
				</td>
				</tr>
				</tbody></table>
			
			
			
			</div></td>
			</tr>
			</tbody></table>
            </td>
</asp:Content>
