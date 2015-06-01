<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="cmd123wj_ROLEManage_crm_wj" CodeFile="ROLEManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">

<style type="text/css">
   #tbList{width:100%;border-top: 1px solid #D0DDE3;border-right: 1px solid #D0DDE3;}
   .data{width:100%}
  .data td { width: auto;color: #333;line-height: 20px;font-size: 12px;text-indent: 5px; border-left: 1px solid #D0DDE3; border-bottom: 1px solid #D0DDE3;/*border-left: solid 1px #aaa;border-bottom: solid 1px #bbc;*/white-space: nowrap;}
   .wind{border-top: 1px solid #fff;border-left: 1px solid #ddd;border-right: 0px solid #fff;border-bottom: 0px solid #fff;}
     .clear{ clear: both;}
     #STOR_ID td { font-weight:bold;}
     
</style>

	
			<style type="text/css">@import url("./CRM_files/style.black.css");</style>
		
	<link rel="stylesheet" href="./CRM_files/buttons-min.css">
	<link rel="stylesheet" href="./CRM_files/font-awesome.min.css">
	

	
	<style type="text/css">
	#ActivityRemindercallback{position:fixed;right:0px;bottom:2px;display:block;padding:0px;z-index:10;font-weight:normal;width:205px;}
        </style>

	<script language="javascript" type="text/javascript" src="./CRM_files/jquery-1.10.1.min.js"></script>
	<script language="javascript" type="text/javascript" src="./CRM_files/jquery-ui-1.10.2.min.js"></script>
	<script type="text/javascript">
	    var Jquery = $;
	</script>
	<script language="javascript" type="text/javascript" src="./CRM_files/prototype.min.js"></script>
	<script language="javascript" type="text/javascript" src="./CRM_files/dom-drag.js"></script>
	<script language="JavaScript" type="text/javascript" src="./CRM_files/zh_cn.lang.js"></script>
	<script language="JavaScript" type="text/javascript" src="./CRM_files/general.js"></script>
	<script language="JavaScript" type="text/javascript" src="./CRM_files/json.js"></script>
	
	<script language="javascript">
	    javaCalendarFirstDayOfWeek = 1;
	    var userDateFormat = "yyyy-mm-dd";
        </script>

        <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initPageSizeEvt("txtPageNum");

        bindWinResize(40);
    });

    function setRolePower(me) {
        var roleid = manager.getSelectedID();
        if (roleid == "") {
            alert("请单击某行选择一个角色！");
            return;
        }
        var result = window.showModalDialog("../Power/PowerSet.aspx?ROLE_ID=" + roleid + "&r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;"); if (!result) { result = window.returnValue; } //jin-shenjian chrome刷新父画面
        return false;
    }
</script>


<div id="status" style="position: absolute; display: none; left: 930px; top: 95px; height: 27px; white-space: nowrap;"><img src="./CRM_files/status.gif"></div>
<!-- ActivityReminder Customization for callback -->

<div id="SelCustomer_popview" class="windLayerDiv" style="position:absolute;z-index:60;display:none;">
</div>
<script language="JavaScript" type="text/javascript" src="./CRM_files/ListView.js"></script>
<script language="JavaScript" type="text/javascript" src="./CRM_files/search.js"></script>
<script language="JavaScript" type="text/javascript" src="./CRM_files/Account.js"></script>
		<table border="0" cellspacing="0" cellpadding="0" width="100%" class="small">
<tbody><tr><td style="height:2px"></td></tr>
<tr>
	<td style="padding-left:10px;padding-right:50px" class="moduleName" nowrap="" id ="faname"><%= title%> &gt; <a class="hdrLink" id="sonname" href="#"><%= title%></a>
        </td>
	<td width="100%" nowrap="">
	
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tbody><tr>
		<td class="sep1" style="width:1px;"></td>
		<td class="small" align="left">
			<!-- Add and Search -->
			<table border="0" cellspacing="0" cellpadding="0">
			<tbody><tr>
			<td>
				<table border="0" cellspacing="0" cellpadding="2">
				<tbody><tr>
											<td style="padding-right:0px;padding-left:10px;">
							<span style="cursor:pointer;" title="创建 客户..." onclick="location.href=&#39;index.php?module=Accounts&amp;action=EditView&amp;return_action=DetailView&amp;parenttab=Customer&#39;;return false;">
							  <i class="icon-plus icon-2x pull-left icon-border crm-bu-style"></i>
							</span>							
						</td>
														
										    						    <td style="padding-right:0px;padding-left:10px;">						
								<span style="cursor:pointer;" title="查找 客户..." onclick="moveMe(&#39;searchAcc&#39;);searchshowhide(&#39;searchAcc&#39;,&#39;advSearch&#39;);return false;">
								  <i class="icon-search icon-2x pull-left icon-border crm-bu-style"></i>
								</span>
							</td>
																

												
							<td style="padding-right:0px;padding-left:10px;">								
								<span style="cursor:pointer;" title="*导入 客户" onclick="location.href=&quot;index.php?module=Accounts&amp;action=Import&amp;step=1&amp;return_module=Accounts&amp;return_action=index&amp;parenttab=Customer&quot;;return false;">
								  <i class="icon-upload-alt icon-2x pull-left icon-border crm-bu-style"></i>
								</span>
							</td>	
							
							
						<td style="padding-right:0px;padding-left:10px;">
							<span style="cursor:pointer;" title="*导出 客户" onclick="selectedRecords(&#39;Accounts&#39;,&#39;Customer&#39;);return false;">
							  <i class="icon-download-alt icon-2x pull-left icon-border crm-bu-style"></i>
							</span>
						</td>
											
				</tr>
				</tbody></table>
			</td>
			</tr>
			</tbody></table>
		<!--	Tool	-->
		</td><td class="small" align="right">
			<table border="0" cellspacing="0" cellpadding="0">
	<tbody><tr>
		<td style="padding-left:10px" onclick="ShowMoreActionsList(this,&#39;addfirsrtabdiv&#39;);return false;">
			<span style="cursor:pointer;" title="快速创建">
			  <i class="icon-plus-sign icon-2x pull-left icon-border crm-bu-style"></i>&nbsp;
			</span>			
			<div id="addfirsrtabdiv" class="list-bulk-div" style="width:110px;" onmouseout="ListBulkHideDrop(&#39;addfirsrtabdiv&#39;)" onmouseover="ListBulkShowDrop(&#39;addfirsrtabdiv&#39;)">
				<div class="" onclick="window.location.href=&#39;index.php?module=Accounts&amp;action=EditView&#39;;">
					新增客户
				</div>
				<div class="" onclick="window.location.href=&#39;index.php?module=Contacts&amp;action=EditView&#39;;">
					新增联系人
				</div>
				<div class="list-bulk-link" onclick="window.location.href=&#39;index.php?module=Notes&amp;action=EditView&#39;;">
					新增联系记录
				</div>
				<div class="" onclick="window.location.href=&#39;index.php?module=Potentials&amp;action=EditView&#39;;">
					新增销售机会
				</div>
				<div class="list-bulk-link" onclick="window.location.href=&#39;index.php?module=Quotes&amp;action=EditView&#39;;">
					新增报价单
				</div>
				<div class="" onclick="window.location.href=&#39;index.php?module=SalesOrder&amp;action=EditView&#39;;">
					新增合同订单
				</div>
				<div class="list-bulk-link" onclick="window.location.href=&#39;index.php?module=PurchaseOrder&amp;action=EditView&#39;;">
					新增进货单
				</div>

				<!-- <div class="list-bulk-link" onClick="window.location.href='index.php?module=Performances&action=index';">
					员工绩效
				</div> -->
			</div>
		</td>

		<td style="padding-left:10px">
			<span style="cursor:pointer;" title="短消息..." onclick="window.open(&quot;index.php?module=Home&amp;action=PopupPM&quot;,&quot;Chat&quot;,&quot;width=600,height=450,resizable=1,scrollbars=1&quot;);return false;">
			  <i class="icon-comment icon-2x pull-left icon-border crm-bu-style"></i>
			</span>
		</td>
		<td style="padding-left:10px">
			<span style="cursor:pointer;" title="手机短信" onclick="window.open(&quot;index.php?module=Home&amp;action=PopupSms&quot;,&quot;test&quot;,
				&quot;width=700,height=602,resizable=1,scrollbars=1&quot;);return false;">
			  <i class="icon-envelope-alt icon-2x pull-left icon-border crm-bu-style"></i>
			</span>
		</td>
		
		<td style="padding-left:10px">&nbsp;</td>
	</tr>
</tbody></table>		</td>
		<!--	Tool	-->

		
		</tr>
		</tbody></table>
	</td>
</tr>
<!-- <tr><td style="height:2px"></td></tr> -->
</tbody></table>
<table class="list_table" style="margin-top:2px;" border="0" cellpadding="3" cellspacing="1" width="100%">
        <tbody><tr>
        
          <td>
	  <table border="0" cellpadding="0" cellspacing="0" style="padding-right:5px;padding-top:2px;z-index:10;padding-bottom:2px;position:relative;">

	  <tbody><tr>
	  <td>
		<!-- <img src="themes/images/filter.png" border=0> -->
		<i class="icon-filter pure-icon-bu"></i>
	  </td>
	  <td>视图:

			<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markbai tablink" href="javascript:;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=12&#39;,this,12);">所有</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=31&#39;,this,31);">意向客户</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=32&#39;,this,32);">成交客户</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=33&#39;,this,33);">本周新客户</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=34&#39;,this,34);">7天未联系</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=35&#39;,this,35);">15天未联系</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=36&#39;,this,36);">30天未联系</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=37&#39;,this,37);">本周需要联系</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=38&#39;,this,38);">潜在客户</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=39&#39;,this,39);">热点客户</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=40&#39;,this,40);">7天未更新</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=41&#39;,this,41);">15天未更新</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=42&#39;,this,42);">30天未更新</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=43&#39;,this,43);">7天未报价</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=44&#39;,this,44);">15天未报价</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=45&#39;,this,45);">30天未报价</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=46&#39;,this,46);">7天未下单</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=47&#39;,this,47);">15天未下单</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=48&#39;,this,48);">30天未下单</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=49&#39;,this,49);">5星客户</a>&nbsp;&nbsp;
			</span>
					
			
	  
						<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;">
			&nbsp;&nbsp;<a class="cus_markhui tablink" href="javascript:;" style="font-size:12px;" onclick="javascript:getTabView(&#39;Accounts&#39;,&#39;viewname=64&#39;,this,64);">100天未下单</a>&nbsp;&nbsp;
			</span>
					
			
	  	  
				<span style="padding-right:5px;padding-top:5px;padding-bottom:5px;"> &nbsp;</span>
			
			</td>
		</tr>
            </tbody></table>
	</td>
        </tr>
	<tr>
          <td colspan="3" bgcolor="#ffffff" valign="top">


<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
	<tbody><tr><td>
		<script language="javascript">
		    function callSearch(searchtype) {
		        $("status").style.display = "inline";
		        for (i = 1; i <= 26; i++) {
		            var data_td_id = 'alpha_' + eval(i);
		            getObj(data_td_id).className = 'searchAlph';
		        }
		        gPopupAlphaSearchUrl = '';
		        search_fld_val = $('bas_searchfield').options[$('bas_searchfield').selectedIndex].value;
		        var urlstring = '';
		        if (searchtype == 'Basic') {
		            var searchtext = '';
		            if (getObj("basicsrchuitype")) {
		                if (getObj("basicsrchuitype").value == "date") {
		                    var firstdate = getObj("basicfirstdate").value;
		                    var lastdate = getObj("basiclastdate").value;
		                    var datestring = firstdate + "," + lastdate;
		                    searchtext = 'search_text=' + datestring;
		                } else if (getObj("basicsrchuitype").value == "time") {
		                    var firsttime = getObj("basicfirsttime").value;
		                    var lasttime = getObj("basiclasttime").value;
		                    var timestring = firsttime + "," + lasttime;
		                    searchtext = 'search_text=' + timestring;
		                }
		            } else {
		                var search_txt_val = document.basicSearch.search_text.value;
		                searchtext = 'search_text=' + search_txt_val;
		            }
		            urlstring = 'search_field=' + search_fld_val + '&searchtype=BasicSearch&' + searchtext + '&';
		        }
		        else if (searchtype == 'Advanced') {
		            var no_rows = document.basicSearch.search_cnt.value;
		            for (jj = 0; jj < no_rows; jj++) {
		                var sfld_name = getObj("Fields" + jj);
		                var scndn_name = getObj("Condition" + jj);
		                if (getObj("srchuitype" + jj)) {
		                    if (getObj("srchuitype" + jj).value == "opts") {
		                        var srchvalue_name = getObj("Srch_value" + jj + "[]");
		                        var searchopts = '';
		                        if (srchvalue_name.value && srchvalue_name.value != undefined) {
		                            searchopts = srchvalue_name.value;
		                        } else {
		                            var srchlen = srchvalue_name.length;
		                            srchlen = parseInt(srchlen);
		                            for (var k = 0; k < srchlen; k++) {
		                                if (srchvalue_name[k].checked == true && srchvalue_name[k].value) {
		                                    if (searchopts && searchopts != '') {
		                                        searchopts += "," + srchvalue_name[k].value;
		                                    } else {
		                                        searchopts = srchvalue_name[k].value;
		                                    }
		                                }
		                            }
		                        }
		                        urlstring = urlstring + 'Srch_value' + jj + '=' + searchopts + '&';
		                    } else if (getObj("srchuitype" + jj).value == "date") {
		                        var firstdate = getObj("firstdate" + jj).value;
		                        var lastdate = getObj("lastdate" + jj).value;
		                        var datestring = firstdate + "," + lastdate;
		                        urlstring = urlstring + 'Srch_value' + jj + '=' + datestring + '&';
		                    } else if (getObj("srchuitype" + jj).value == "time") {
		                        var firsttime = getObj("firsttime" + jj).value;
		                        var lasttime = getObj("lasttime" + jj).value;
		                        var timestring = firsttime + "," + lasttime;
		                        urlstring = urlstring + 'Srch_value' + jj + '=' + timestring + '&';
		                    } else if (getObj("srchuitype" + jj).value == "userid") {
		                        var searchuser = getObj("searchuser" + jj).value;
		                        urlstring = urlstring + 'Srch_value' + jj + '=' + searchuser + '&';
		                    }
		                } else {
		                    var srchvalue_name = getObj("Srch_value" + jj);
		                    urlstring = urlstring + 'Srch_value' + jj + '=' + srchvalue_name.value + '&';
		                }
		                var srchvalue_name = getObj("Srch_value" + jj);
		                urlstring = urlstring + 'Fields' + jj + '=' + sfld_name[sfld_name.selectedIndex].value + '&';
		                urlstring = urlstring + 'Condition' + jj + '=' + scndn_name[scndn_name.selectedIndex].value + '&';
		            }
		            for (i = 0; i < getObj("matchtype").length; i++) {
		                if (getObj("matchtype")[i].checked == true)
		                    urlstring += 'matchtype=' + getObj("matchtype")[i].value + '&';
		            }
		            urlstring += 'search_cnt=' + no_rows + '&';
		            urlstring += 'searchtype=advance&'
		        }
		        new Ajax.Request(
		'index.php',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: urlstring + 'query=true&file=index&module=Accounts&action=AccountsAjax&ajax=true',
		    onComplete: function (response) {
		        $("status").style.display = "none";
		        result = response.responseText.split('&#&#&#');
		        $("ListViewContents").innerHTML = result[2];
		        result[2].evalScripts();
		        if (result[1] != '')
		            alert(result[1]);
		    }
		}
        );

		    }
		    function alphabetic(module, url, dataid) {
		        for (i = 1; i <= 26; i++) {
		            var data_td_id = 'alpha_' + eval(i);
		            getObj(data_td_id).className = 'searchAlph';

		        }
		        getObj(dataid).className = 'searchAlphselected';
		        $("status").style.display = "inline";
		        new Ajax.Request(
		'index.php',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=' + module + '&action=' + module + 'Ajax&file=index&ajax=true&' + url,
		    onComplete: function (response) {
		        $("status").style.display = "none";
		        result = response.responseText.split('&#&#&#');
		        $("ListViewContents").innerHTML = result[2];
		        result[2].evalScripts();
		        if (result[1] != '')
		            alert(result[1]);
		    }
		}
	);
		    }

</script>
		<form name="basicSearch" action="http://demo.crm123.cn/index.php" onsubmit="return false;">
<div id="searchAcc" style="z-index:1;display:none;position:relative;">
<table width="80%" cellpadding="5" cellspacing="0" class="searchUIBasic small" align="center" border="0">
	<tbody><tr>
		<td nowrap="" align="left">
		<!-- <span class="moduleName">查找</span><br><span class="small"><a href="#" onClick="fnhide('searchAcc');fnshow('advSearch');document.basicSearch.searchtype.value='advance';"> 高级查找</a></span> -->
		<!-- <img src="themes/softed/images/basicSearchLens.gif" align="absmiddle" alt="基本查找" title="基本查找" border=0> -->&nbsp;&nbsp;
		</td>
		<td class="small" nowrap="" align="right"><b>查找</b></td>		
		
		<td class="small" nowrap="">
			<div id="basicsearchcolumns_real">
			<select name="search_field" id="bas_searchfield" style="width:150px" onchange="updatefOptions(this);">
			 <option label="客户名称" value="accountname">客户名称</option>
                <option label="电话" value="phone">电话</option>
                <option label="城市" value="bill_city">城市</option>
                <option label="客户来源" value="leadsource">客户来源</option>
                <option label="客户级别" value="grade">客户级别</option>
                <option label="客户状态" value="rating">客户状态</option>
                <option label="行业" value="industry">行业</option>
                <option label="创建时间" value="createdtime">创建时间</option>
                <option label="负责人" value="assigned_user_id">负责人</option>
                <option label="联系次数" value="contacttimes">联系次数</option>

			</select>
			</div>
                        <input type="hidden" name="searchtype" value="BasicSearch">
                        <input type="hidden" name="module" value="Accounts">
                        <input type="hidden" name="parenttab" value="Customer">
			<input type="hidden" name="action" value="index">
                        <input type="hidden" name="query" value="true">
			<input type="hidden" name="search_cnt">
		</td>
		<td class="small">
			<span id="searchtextdiv"><input name="search_text" id="search_text" type="text" class="txtBox" style="width:120px" value="" onkeydown="javascript:if(event.keyCode==13) callSearch(&#39;Basic&#39;)"></span>
			<input type="hidden" id="searchvalhid" name="searchvalhid" value="">
		</td>
		<td class="small" nowrap="">
			<button class="pure-button pure-button-edit" title="查找" onclick="callSearch(&#39;Basic&#39;);return false;">
			<i class="icon-search"></i> 查找
			</button>&nbsp;
			<button class="pure-button pure-button-cancel" title="取消" onclick="clearSearchResult(&#39;Accounts&#39;);return false;">
			<i class="icon-reply"></i> 取消
			</button>
			&nbsp;&nbsp;
			
		</td>
		<td class="small" nowrap="">
			<a href="http://demo.crm123.cn/index.php?module=Accounts&action=index&parenttab=Customer#" class="searchtype" onclick="fnhide(&#39;searchAcc&#39;);fnshow(&#39;advSearch&#39;);document.basicSearch.searchtype.value=&#39;advance&#39;;"> 高级查找</a>
		</td>
		<td class="small" valign="top">
			<input class="windLayerBtclose" type="button" title="" onclick="moveMe(&#39;searchAcc&#39;);searchshowhide(&#39;searchAcc&#39;,&#39;advSearch&#39;)">
		</td>
	</tr>
	<tr>
		<td colspan="7" align="center" class="small">
			<table border="0" cellspacing="0" cellpadding="0" width="100%" style="font-size:12px;">
				<tbody><tr>
                                                <td class="searchAlph" id="alpha_1" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=A&quot;,&quot;alpha_1&quot;)">A</td><td class="searchAlph" id="alpha_2" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=B&quot;,&quot;alpha_2&quot;)">B</td><td class="searchAlph" id="alpha_3" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=C&quot;,&quot;alpha_3&quot;)">C</td><td class="searchAlph" id="alpha_4" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=D&quot;,&quot;alpha_4&quot;)">D</td><td class="searchAlph" id="alpha_5" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=E&quot;,&quot;alpha_5&quot;)">E</td><td class="searchAlph" id="alpha_6" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=F&quot;,&quot;alpha_6&quot;)">F</td><td class="searchAlph" id="alpha_7" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=G&quot;,&quot;alpha_7&quot;)">G</td><td class="searchAlph" id="alpha_8" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=H&quot;,&quot;alpha_8&quot;)">H</td><td class="searchAlph" id="alpha_9" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=I&quot;,&quot;alpha_9&quot;)">I</td><td class="searchAlph" id="alpha_10" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=J&quot;,&quot;alpha_10&quot;)">J</td><td class="searchAlph" id="alpha_11" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=K&quot;,&quot;alpha_11&quot;)">K</td><td class="searchAlph" id="alpha_12" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=L&quot;,&quot;alpha_12&quot;)">L</td><td class="searchAlph" id="alpha_13" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=M&quot;,&quot;alpha_13&quot;)">M</td><td class="searchAlph" id="alpha_14" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=N&quot;,&quot;alpha_14&quot;)">N</td><td class="searchAlph" id="alpha_15" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=O&quot;,&quot;alpha_15&quot;)">O</td><td class="searchAlph" id="alpha_16" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=P&quot;,&quot;alpha_16&quot;)">P</td><td class="searchAlph" id="alpha_17" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=Q&quot;,&quot;alpha_17&quot;)">Q</td><td class="searchAlph" id="alpha_18" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=R&quot;,&quot;alpha_18&quot;)">R</td><td class="searchAlph" id="alpha_19" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=S&quot;,&quot;alpha_19&quot;)">S</td><td class="searchAlph" id="alpha_20" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=T&quot;,&quot;alpha_20&quot;)">T</td><td class="searchAlph" id="alpha_21" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=U&quot;,&quot;alpha_21&quot;)">U</td><td class="searchAlph" id="alpha_22" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=V&quot;,&quot;alpha_22&quot;)">V</td><td class="searchAlph" id="alpha_23" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=W&quot;,&quot;alpha_23&quot;)">W</td><td class="searchAlph" id="alpha_24" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=X&quot;,&quot;alpha_24&quot;)">X</td><td class="searchAlph" id="alpha_25" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=Y&quot;,&quot;alpha_25&quot;)">Y</td><td class="searchAlph" id="alpha_26" align="center" onclick="alphabetic(&quot;Accounts&quot;,&quot;gname=&amp;query=true&amp;search_field=ec_account.prefix&amp;searchtype=BasicSearch&amp;type=alpbt&amp;search_text=Z&quot;,&quot;alpha_26&quot;)">Z</td>
                                </tr>
                        </tbody></table>
		</td>
	</tr>
</tbody></table>
</div>
<!-- ADVANCED SEARCH -->
<div id="advSearch" style="display:none;">
<table width="80%" cellpadding="5" cellspacing="0" class="searchUIBasic small" align="center" border="0">
	<tbody><tr><td nowrap="">
		<!--	�߼�����		-->
		<table cellspacing="0" cellpadding="0" width="100%" class="small" align="center" border="0">
			<tbody><tr>
					<td nowrap="" align="left" style="height:25px;width:125px;">
						<!-- <img src="themes/softed/images/basicSearchLens.gif" align="absmiddle" alt="基本查找" title="基本查找" border=0> -->&nbsp;&nbsp;
					</td>
											<td nowrap="" class="small">
							<b><input name="matchtype" type="radio" value="all" checked="">&nbsp;匹配以下所有条件</b>
						</td>
						<td nowrap="" width="47%" class="small">
							<b><input name="matchtype" type="radio" value="any">&nbsp;匹配以下任意条件</b>
						</td>
										<td class="small" nowrap="">
						<a href="http://demo.crm123.cn/index.php?module=Accounts&action=index&parenttab=Customer#" class="searchtype" onclick="fnhide(&#39;advSearch&#39;);fnshow(&#39;searchAcc&#39;);document.basicSearch.searchtype.value=&#39;basic&#39;;">基本查找</a>
					</td>
					<td class="small" valign="top">
						<input class="windLayerBtclose" type="button" title="" onclick="moveMe(&#39;searchAcc&#39;);searchshowhide(&#39;searchAcc&#39;,&#39;advSearch&#39;)">
					</td>
			</tr>
		</tbody></table>
		<table cellpadding="2" cellspacing="0" width="100%" align="center" class="small" border="0">
			<tbody><tr>
				<td align="center" class="small" width="90%">
				<div id="fixed" style="position:relative;width:95%;padding:0px; overflow:auto;border:1px solid #CCCCCC;" class="small lvt">
					<table border="0" width="95%">
					<tbody><tr>
					<td align="left">
						<table width="100%" border="0" cellpadding="2" cellspacing="0" id="adSrc" align="left">
														     <tbody><tr>
									<td style="border-bottom: 1px dotted #808080;">
									<select name="Fields0" onchange="FieldsUpopts(this,0)" style="width:150px">
									<option value="\&#39;ec_account.accountname\&#39;">客户名称</option><option value="\&#39;ec_account.customernum\&#39;">客户编号</option><option value="\&#39;ec_account.website\&#39;">网站</option><option value="\&#39;ec_account.parentid\&#39;">上级单位</option><option value="\&#39;ec_account.ispools\&#39;">公用客户</option><option value="\&#39;ec_account.employees\&#39;">员工人数</option><option value="\&#39;ec_account.leadsource\&#39;">客户来源</option><option value="\&#39;ec_account.grade\&#39;">客户级别</option><option value="\&#39;ec_account.rating\&#39;">客户状态</option><option value="\&#39;ec_account.industry\&#39;">行业</option><option value="\&#39;ec_account.ownership\&#39;">公司性质</option><option value="\&#39;ec_account.account_type\&#39;">类型</option><option value="\&#39;ec_account.smownerid\&#39;">负责人</option><option value="\&#39;ec_account.createdtime\&#39;">创建时间</option><option value="\&#39;ec_account.modifiedtime\&#39;">修改时间</option><option value="\&#39;ec_account.smcreatorid\&#39;">创建人</option><option value="\&#39;ec_account.lastcontacttime\&#39;">最新联系时间</option><option value="\&#39;ec_account.invoicedate\&#39;">最新发货日期</option><option value="\&#39;ec_account.orderdate\&#39;">最新订单日期</option><option value="\&#39;ec_account.quotedate\&#39;">最新报价日期</option><option value="\&#39;ec_account.contacttimes\&#39;">联系次数</option><option value="\&#39;ec_account.assignstatus\&#39;">分配状态</option><option value="\&#39;ec_account.startdate\&#39;">保护开始日期</option><option value="\&#39;ec_account.enddate\&#39;">保护结束日期</option><option value="\&#39;ec_account.latestnote\&#39;">最新进展</option><option value="\&#39;ec_account.cf_498\&#39;">热点客户</option><option value="\&#39;ec_account.cf_500\&#39;">热度</option><option value="\&#39;ec_account.cf_502\&#39;">热点分类</option><option value="\&#39;ec_account.cf_504\&#39;">热点说明</option><option value="\&#39;ec_account.cf_686\&#39;">旺旺</option><option value="\&#39;ec_account.bill_country\&#39;">国家</option><option value="\&#39;ec_account.bill_state\&#39;">省份</option><option value="\&#39;ec_account.bill_city\&#39;">城市</option><option value="\&#39;ec_account.bill_street\&#39;">地址</option><option value="\&#39;ec_account.bill_pobox\&#39;">邮箱地址</option><option value="\&#39;ec_account.description\&#39;">备注</option><option value="\&#39;ec_account.payment_type\&#39;">支付方式</option><option value="\&#39;ec_account.ordernum\&#39;">订单数量</option><option value="\&#39;ec_account.ordertotal\&#39;">订单金额</option><option value="\&#39;ec_account.keycontact\&#39;">首要联系人</option><option value="\&#39;ec_account.keymobile\&#39;">手机</option><option value="\&#39;ec_account.phone\&#39;">电话</option><option value="\&#39;ec_account.keyqq\&#39;">QQ</option><option value="\&#39;ec_account.fax\&#39;">传真</option><option value="\&#39;ec_account.otherphone\&#39;">其它电话</option><option value="\&#39;ec_account.email1\&#39;">Email</option>
									</select>&nbsp;&nbsp;
									</td>
									<td style="border-bottom: 1px dotted #808080;">
									<select name="Condition0" style="width:150px">
										<option value="\&#39;cts\&#39;">包含</option><option value="\&#39;dcts\&#39;">不包含</option><option value="\&#39;is\&#39;">等于</option><option value="\&#39;isn\&#39;">不等于</option><option value="\&#39;bwt\&#39;">开始为</option><option value="\&#39;grt\&#39;">大于</option><option value="\&#39;lst\&#39;">小于</option><option value="\&#39;grteq\&#39;">大于等于</option><option value="\&#39;lsteq\&#39;">小于等于</option>
									</select>&nbsp;&nbsp;
									</td>
									<td style="border-bottom: 1px dotted #808080;">
										<span id="srchvaldiv0">
											<input type="text" name="Srch_value0" value="" class="detailedViewTextBox">
										</span>
										<input type="hidden" id="srchvalhid0" value="">
									</td>
							     </tr>
													
						</tbody></table>
					</td>
					</tr>
				</tbody></table>
				</div>	
				</td>
			</tr>
		</tbody></table>
			
		<table border="0" cellspacing="0" cellpadding="5" width="100%" class="small" align="center">
		<tbody><tr>
			<td align="left" width="40%">
						<!-- <input type="button" name="more" value=" 增加条件 " onClick="fnAddSrch('<option value=\'ec_account.accountname\'>客户名称</option><option value=\'ec_account.customernum\'>客户编号</option><option value=\'ec_account.website\'>网站</option><option value=\'ec_account.parentid\'>上级单位</option><option value=\'ec_account.ispools\'>公用客户</option><option value=\'ec_account.employees\'>员工人数</option><option value=\'ec_account.leadsource\'>客户来源</option><option value=\'ec_account.grade\'>客户级别</option><option value=\'ec_account.rating\'>客户状态</option><option value=\'ec_account.industry\'>行业</option><option value=\'ec_account.ownership\'>公司性质</option><option value=\'ec_account.account_type\'>类型</option><option value=\'ec_account.smownerid\'>负责人</option><option value=\'ec_account.createdtime\'>创建时间</option><option value=\'ec_account.modifiedtime\'>修改时间</option><option value=\'ec_account.smcreatorid\'>创建人</option><option value=\'ec_account.lastcontacttime\'>最新联系时间</option><option value=\'ec_account.invoicedate\'>最新发货日期</option><option value=\'ec_account.orderdate\'>最新订单日期</option><option value=\'ec_account.quotedate\'>最新报价日期</option><option value=\'ec_account.contacttimes\'>联系次数</option><option value=\'ec_account.assignstatus\'>分配状态</option><option value=\'ec_account.startdate\'>保护开始日期</option><option value=\'ec_account.enddate\'>保护结束日期</option><option value=\'ec_account.latestnote\'>最新进展</option><option value=\'ec_account.cf_498\'>热点客户</option><option value=\'ec_account.cf_500\'>热度</option><option value=\'ec_account.cf_502\'>热点分类</option><option value=\'ec_account.cf_504\'>热点说明</option><option value=\'ec_account.cf_686\'>旺旺</option><option value=\'ec_account.bill_country\'>国家</option><option value=\'ec_account.bill_state\'>省份</option><option value=\'ec_account.bill_city\'>城市</option><option value=\'ec_account.bill_street\'>地址</option><option value=\'ec_account.bill_pobox\'>邮箱地址</option><option value=\'ec_account.description\'>备注</option><option value=\'ec_account.payment_type\'>支付方式</option><option value=\'ec_account.ordernum\'>订单数量</option><option value=\'ec_account.ordertotal\'>订单金额</option><option value=\'ec_account.keycontact\'>首要联系人</option><option value=\'ec_account.keymobile\'>手机</option><option value=\'ec_account.phone\'>电话</option><option value=\'ec_account.keyqq\'>QQ</option><option value=\'ec_account.fax\'>传真</option><option value=\'ec_account.otherphone\'>其它电话</option><option value=\'ec_account.email1\'>Email</option>','<option value=\'cts\'>包含</option><option value=\'dcts\'>不包含</option><option value=\'is\'>等于</option><option value=\'isn\'>不等于</option><option value=\'bwt\'>开始为</option><option value=\'grt\'>大于</option><option value=\'lst\'>小于</option><option value=\'grteq\'>大于等于</option><option value=\'lsteq\'>小于等于</option>')" class="crmbuttom small edit" >
						<input name="button" type="button" value=" 删除条件 " onclick="delRow()" class="crmbuttom small edit" > -->
				<button class="pure-button pure-button-success" title="增加条件" onclick="fnAddSrch(&#39;&lt;option value=\&#39;ec_account.accountname\&#39;&gt;客户名称&lt;/option&gt;&lt;option value=\&#39;ec_account.customernum\&#39;&gt;客户编号&lt;/option&gt;&lt;option value=\&#39;ec_account.website\&#39;&gt;网站&lt;/option&gt;&lt;option value=\&#39;ec_account.parentid\&#39;&gt;上级单位&lt;/option&gt;&lt;option value=\&#39;ec_account.ispools\&#39;&gt;公用客户&lt;/option&gt;&lt;option value=\&#39;ec_account.employees\&#39;&gt;员工人数&lt;/option&gt;&lt;option value=\&#39;ec_account.leadsource\&#39;&gt;客户来源&lt;/option&gt;&lt;option value=\&#39;ec_account.grade\&#39;&gt;客户级别&lt;/option&gt;&lt;option value=\&#39;ec_account.rating\&#39;&gt;客户状态&lt;/option&gt;&lt;option value=\&#39;ec_account.industry\&#39;&gt;行业&lt;/option&gt;&lt;option value=\&#39;ec_account.ownership\&#39;&gt;公司性质&lt;/option&gt;&lt;option value=\&#39;ec_account.account_type\&#39;&gt;类型&lt;/option&gt;&lt;option value=\&#39;ec_account.smownerid\&#39;&gt;负责人&lt;/option&gt;&lt;option value=\&#39;ec_account.createdtime\&#39;&gt;创建时间&lt;/option&gt;&lt;option value=\&#39;ec_account.modifiedtime\&#39;&gt;修改时间&lt;/option&gt;&lt;option value=\&#39;ec_account.smcreatorid\&#39;&gt;创建人&lt;/option&gt;&lt;option value=\&#39;ec_account.lastcontacttime\&#39;&gt;最新联系时间&lt;/option&gt;&lt;option value=\&#39;ec_account.invoicedate\&#39;&gt;最新发货日期&lt;/option&gt;&lt;option value=\&#39;ec_account.orderdate\&#39;&gt;最新订单日期&lt;/option&gt;&lt;option value=\&#39;ec_account.quotedate\&#39;&gt;最新报价日期&lt;/option&gt;&lt;option value=\&#39;ec_account.contacttimes\&#39;&gt;联系次数&lt;/option&gt;&lt;option value=\&#39;ec_account.assignstatus\&#39;&gt;分配状态&lt;/option&gt;&lt;option value=\&#39;ec_account.startdate\&#39;&gt;保护开始日期&lt;/option&gt;&lt;option value=\&#39;ec_account.enddate\&#39;&gt;保护结束日期&lt;/option&gt;&lt;option value=\&#39;ec_account.latestnote\&#39;&gt;最新进展&lt;/option&gt;&lt;option value=\&#39;ec_account.cf_498\&#39;&gt;热点客户&lt;/option&gt;&lt;option value=\&#39;ec_account.cf_500\&#39;&gt;热度&lt;/option&gt;&lt;option value=\&#39;ec_account.cf_502\&#39;&gt;热点分类&lt;/option&gt;&lt;option value=\&#39;ec_account.cf_504\&#39;&gt;热点说明&lt;/option&gt;&lt;option value=\&#39;ec_account.cf_686\&#39;&gt;旺旺&lt;/option&gt;&lt;option value=\&#39;ec_account.bill_country\&#39;&gt;国家&lt;/option&gt;&lt;option value=\&#39;ec_account.bill_state\&#39;&gt;省份&lt;/option&gt;&lt;option value=\&#39;ec_account.bill_city\&#39;&gt;城市&lt;/option&gt;&lt;option value=\&#39;ec_account.bill_street\&#39;&gt;地址&lt;/option&gt;&lt;option value=\&#39;ec_account.bill_pobox\&#39;&gt;邮箱地址&lt;/option&gt;&lt;option value=\&#39;ec_account.description\&#39;&gt;备注&lt;/option&gt;&lt;option value=\&#39;ec_account.payment_type\&#39;&gt;支付方式&lt;/option&gt;&lt;option value=\&#39;ec_account.ordernum\&#39;&gt;订单数量&lt;/option&gt;&lt;option value=\&#39;ec_account.ordertotal\&#39;&gt;订单金额&lt;/option&gt;&lt;option value=\&#39;ec_account.keycontact\&#39;&gt;首要联系人&lt;/option&gt;&lt;option value=\&#39;ec_account.keymobile\&#39;&gt;手机&lt;/option&gt;&lt;option value=\&#39;ec_account.phone\&#39;&gt;电话&lt;/option&gt;&lt;option value=\&#39;ec_account.keyqq\&#39;&gt;QQ&lt;/option&gt;&lt;option value=\&#39;ec_account.fax\&#39;&gt;传真&lt;/option&gt;&lt;option value=\&#39;ec_account.otherphone\&#39;&gt;其它电话&lt;/option&gt;&lt;option value=\&#39;ec_account.email1\&#39;&gt;Email&lt;/option&gt;&#39;,&#39;&lt;option value=\&#39;cts\&#39;&gt;包含&lt;/option&gt;&lt;option value=\&#39;dcts\&#39;&gt;不包含&lt;/option&gt;&lt;option value=\&#39;is\&#39;&gt;等于&lt;/option&gt;&lt;option value=\&#39;isn\&#39;&gt;不等于&lt;/option&gt;&lt;option value=\&#39;bwt\&#39;&gt;开始为&lt;/option&gt;&lt;option value=\&#39;grt\&#39;&gt;大于&lt;/option&gt;&lt;option value=\&#39;lst\&#39;&gt;小于&lt;/option&gt;&lt;option value=\&#39;grteq\&#39;&gt;大于等于&lt;/option&gt;&lt;option value=\&#39;lsteq\&#39;&gt;小于等于&lt;/option&gt;&#39;);return false;">
					<i class="icon-plus"></i>
				</button>&nbsp;

				<button class="pure-button pure-button-danger" title="删除条件" onclick="delRow();return false;">
					<i class="icon-trash"></i>
				</button>
			</td>
			<td align="left" class="small">
				<button class="pure-button pure-button-edit" title="查找" onclick="totalnoofrows();callSearch(&#39;Advanced&#39;);return false;">
					<i class="icon-search"></i> 查找
				</button>&nbsp;

				<button class="pure-button pure-button-cancel" title="取消" onclick="clearSearchResult(&#39;Accounts&#39;);return false;">
					<i class="icon-reply"></i> 取消
				</button>
			</td>
		</tr>
	</tbody></table>
	<!--	�߼�����	 -->
</td></tr></tbody></table>
</div>		
</form>	</td></tr>
	<tr>
		<td class="lvt" valign="top" width="100%" style="padding:2px;">
			<div id="ListViewContents" class="small" style="width:100%;position:relative;">
				
<form name="massdelete" method="POST" action="http://demo.crm123.cn/index.php">
	<input name="search_url" id="search_url" type="hidden" value="">
	<input name="idlist" id="idlist" type="hidden">
	<input name="action" id="action" type="hidden">
	<input name="module" id="module" type="hidden">
	<input id="viewname" name="viewname" type="hidden" value="12">
	<input name="change_owner" type="hidden">
	<input name="change_status" type="hidden">
	<input name="allids" type="hidden" value="">
				<!-- List View Master Holder starts -->
	<table border="0" cellspacing="1" cellpadding="0" width="100%" class="lvtBg">
		<tbody><tr>
			<td>
				<!-- List View's Buttons and Filters starts -->
				<table border="0" cellspacing="0" cellpadding="2" width="100%" class="small">
				<tbody><tr>
					<!-- Buttons -->
					<td style="padding-right:20px" align="left" nowrap="">				
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tbody><tr>
	<td>查看范围: &nbsp;</td>
    <td>
				<div class="chzn-select-div">
			<a href="javascript:ShowSeltUser_click('listviewscope');" class="chzn-single" tabindex="-1">
				<span id="listviewscope_name">所有选项</span>
				<input type="hidden" name="listviewscope_id" id="listviewscope_id" value="all_to_me">
				<div>
					<b style=" background: url('CRM_files/chosen-sprite.png') 0px -2px no-repeat transparent;display: block;height: 100%;width: 100%;">
				</b></div><b>
			</b></a><b>
			<!--	 User List start	 -->
			<div class="chzn-userlist-div" id="listviewscope_div">
				<input type="text" name="listviewscope_text" id="listviewscope_text" onkeydown="javascript:if(event.keyCode==13) return false;" class="chzn-search" onkeyup="SearchViewScope(&#39;Accounts&#39;,&#39;listviewscope&#39;,&#39;all_to_me&#39;,this)" style="background: url('CRM_files/chosen-sprite.png') 100% -22px no-repeat transparent;
display: block;">
<div id="boxs"> 
				<div  id="listviewscope_info_div1" style="overflow-y:auto;max-height:300px;height:300px;">
                      <%=listHtml%>
                 
        
                  </div>
				</div>
                <script>
				    setViewScopeOpts("Accounts", "listviewscope", 'all_to_me');
				</script>
			</div>
		</b></div><b>
	</b></td>
	<td>&nbsp;&nbsp;</td>
	<td>
								<button class="pure-button pure-button-share" onclick="change(this,&#39;changeowner&#39;);return false;">
				转移
			</button>&nbsp;
						<button class="pure-button pure-button-cancel" onclick="ListBulkDownDrop(this,&#39;listbulkdiv&#39;);return false;">
				更多操作
			</button>&nbsp;
			<div id="listbulkdiv" class="list-bulk-div" onmouseout="ListBulkHideDrop(&#39;listbulkdiv&#39;)" onmouseover="ListBulkShowDrop(&#39;listbulkdiv&#39;)">
														<div onclick="quick_edit(this, &#39;quickedit&#39;, &#39;Accounts&#39;);">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tbody><tr>
						<td style="width:20px"><i class="icon-edit"></i></td>
						<td>批量修改</td>
					  </tr>
					</tbody></table>
				</div>
					<div class="list-bulk-link" onclick="merge_fields(&#39;selected_id&#39;, &#39;Accounts&#39;,&#39;Customer&#39;);">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tbody><tr>
						<td style="width:20px">&nbsp;</td>
						<td>合并客户</td>
					  </tr>
					</tbody></table>
				</div>
															<div onclick="change(this,&#39;sharerecorddiv&#39;);">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tbody><tr>
						<td style="width:20px"><i class="icon-share"></i></td>
						<td>共享</td>
					  </tr>
					</tbody></table>
				</div>
				<div class="list-bulk-link" onclick="BatchReShare(&#39;Accounts&#39;);">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tbody><tr>
						<td style="width:20px">&nbsp;</td>
						<td>取消共享</td>
					  </tr>
					</tbody></table>
				</div>
								<div onclick="qunfa_sms(this, &#39;qunfasms&#39;, &#39;Accounts&#39;);">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
					  <tbody><tr>
						<td style="width:20px">&nbsp;<i class="icon-mobile-phone"></i></td>
						<td>批量发短信</td>
					  </tr>
					</tbody></table>
				</div>
				<div onclick="qunfa_mail(this, &#39;qunfamail&#39;, &#39;Accounts&#39;);">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tbody><tr>
						<td style="width:20px"><i class="icon-envelope-alt"> </i></td>
						<td>批量发邮件</td>
					  </tr>
					</tbody></table>
				</div>
								<div class="list-bulk-link" onclick="InAccountPool_click();">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tbody><tr>
						<td style="width:20px"><i class="icon-mail-reply"> </i></td>
						<td>放入客户池</td>
					  </tr>
					</tbody></table>
				</div>
							</div>
			</td>
  </tr>
</tbody></table>					</td>
					<!-- Page Navigation -->
					<td nowrap="" width="100%" align="right" valign="middle">
						<table border="0" cellspacing="0" cellpadding="0" class="small">
							 <tbody><tr><td style="padding-right:5px">显示 1 - 20 之 62&nbsp;&nbsp;&nbsp;&nbsp;<img src="./CRM_files/start_disabled.gif" border="0" align="absmiddle" title="首页">&nbsp;<img src="./CRM_files/previous_disabled.gif" border="0" align="absmiddle" title="上一页">&nbsp;<b>1</b>&nbsp;<a href="javascript:;" onclick="getListViewEntries_js(&#39;Accounts&#39;,&#39;start=2&#39;);">2</a>&nbsp;<a href="javascript:;" onclick="getListViewEntries_js(&#39;Accounts&#39;,&#39;start=3&#39;);">3</a>&nbsp;<a href="javascript:;" onclick="getListViewEntries_js(&#39;Accounts&#39;,&#39;start=4&#39;);">4</a>&nbsp;<a href="javascript:;" onclick="getListViewEntries_js(&#39;Accounts&#39;,&#39;start=2&#39;);" title="下一页"><img src="./CRM_files/next.gif" border="0" align="absmiddle"></a>&nbsp;<a href="javascript:;" onclick="getListViewEntries_js(&#39;Accounts&#39;,&#39;start=4&#39;);" title="末页"><img src="./CRM_files/end.gif" border="0" align="absmiddle"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每页条数:&nbsp;<select name="listpagesize" id="listpagesize" class="small" onchange="getListViewWithPageSize(&#39;Accounts&#39;,this)"><option value="10">10</option><option value="15">15</option><option selected="" value="20">20</option><option value="30">30</option><option value="40">40</option><option value="50">50</option><option value="100">100</option><option value="200">200</option><option value="500">500</option><option value="1000">1000</option><option value="2000">2000</option><option value="5000">5000</option></select></td></tr>
						</tbody></table>
					</td>
				</tr>
				</tbody></table>
                <div class="data">
          <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
              <%--  <tr id="STOR_ID">
                    <td class="first"><input type="checkbox" onclick="selAll(this);" /></td>
                    <td >工具</td>
                    <td >练习次数</td>
                    <td >负责人</td>
                    <td >创建时间</td>
                    <td >行业</td>
                    <td >客户级别</td>
                    <td >客户来源</td>
                    <td >城市</td>
                    <td >电话</td>
                   <td >城市</td>
                   
                </tr>--%>
                 <tr keyname="ROLE_ID" style=" font-weight:bold">
                    <td class="first">   <input type="checkbox" name="selectall" onclick="toggleSelect(this.checked,&quot;selected_id&quot;)"> <%-- <input type="checkbox" onclick="_selAll(this);" />--%></td>
                    <td><a href="ROLEManage.aspx" id="a_top" runat="server"><b></b></a></td>

                    <td colname="ROLE_ID"><%=AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE.Attribute.ROLE_ID._ZhName %></td><!--角色ID-->
                    <td colname="ROLE_NAME"><%=AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE.Attribute.ROLE_NAME._ZhName %></td><!--角色名-->
                    <td colname="CREATER"><%=AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE.Attribute.CREATER._ZhName %></td><!--CREATER-->
                    <td colname="CREATIME"><%=AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE.Attribute.CREATIME._ZhName %></td><!--创建时间-->
                    <td colname="PNAME"><%=AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE.Attribute.PNAME._ZhName %></td>
                </tr>
            </thead>
            <tbody class="rightline">
                <asp:Repeater ID="cdcatalog" runat="server">
                <ItemTemplate>
                <tr class="wind">
                     
                    <td class="first"><input type="checkbox" name="selected_id" value="1755" onclick="toggleSelectAll(this.name,&quot;selectall&quot;)"> <%--<input type="checkbox" value="<%#((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).ROLE_ID%>" /><input value="<%#((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).PATH%>" type="hidden" />--%></td>
                    <td><%#showLeftLinks(((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).PATH, ((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).PNAME, Container.ItemIndex)%></td>
                    <td><%#((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).ROLE_ID %></td>
                    <td><a href="RoleUsers.aspx?ROLE_ID=<%#((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).ROLE_ID %>&preUrl=<%=curUrl %>"><%#((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).ROLE_NAME %></a></td>
                    <td><%#((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).CREATER %></td>
                    <td><%#(((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).CREATIME == DateTime.MinValue) ? "" : ((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).CREATIME.ToString("yyyy-MM-dd")%></td>
                     <td><%#((AgileFrame.Orm.PersistenceLayer.Model.SYS_ROLE)Container.DataItem).PNAME%></td>
                </tr>
                    <%--<td class="first"><input type="checkbox" /></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "castummane")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "tel")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "city")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "com")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "culevel")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "cutype")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "company")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "buildtime")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "po")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "num")%></td>
                   
                </tr>--%>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
           </td>
		   </tr>
	    </tbody></table>
                                   <div id="collectcolumntable"> <table border="0" cellspacing="0" cellpadding="0" width="100%" class="lvt small">
     <tbody><tr>
	 <td colspan="3" valign="middle" width="100%">
	 <table>
	     <tbody><tr>
	     <td valign="middle">
			<!--<img src="themes/images/count.gif" width="30" border=0>-->
			<i class="icon-book pure-icon-bu" style="font-size:15px;color:#444"></i>
		</td>
         <td valign="middle"><b>本次查询汇总结果</b></td>
		 </tr>
	 </tbody></table>
     </td></tr>
   <%-- <tr bgcolor="white">
        <td align="right" width="30%">【联系次数】&nbsp;&nbsp;</td>
        <td align="center">本页汇总: ∑ 40.00</td>
        <td align="left" width="45%">所有汇总: ∑ 104.00</td>
    </tr>--%>
    
</tbody></table>
<table cellspacing="0" cellpadding="0" border="0" class="lvt small" style="margin-top: 0px;" width="100%">
    <tbody><tr>
	  <td valign="middle">
	  <table>
	     <tbody><tr>
	     <td valign="middle">
			<!--<img src="themes/images/chart.gif" width="30" border=0>-->
			<i class="icon-bar-chart pure-icon-bu" style="font-size:15px;color:#444"></i>
		</td>
         <td valign="middle"><b>本次查询统计报表</b></td>
		 </tr>
	 </tbody></table>
	 </td>
    </tr>
   <tr bgcolor="white">
      <td valign="top" style="line-height: 26px;">
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=cf_498&pickfieldtable=ec_account&pickfieldcolname=cf_498','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">热点客户分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=cf_500&pickfieldtable=ec_account&pickfieldcolname=cf_500','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">热度分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=cf_502&pickfieldtable=ec_account&pickfieldcolname=cf_502','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">热点分类分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=employees&pickfieldtable=ec_account&pickfieldcolname=employees','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">员工人数分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=leadsource&pickfieldtable=ec_account&pickfieldcolname=leadsource','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">客户来源分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=grade&pickfieldtable=ec_account&pickfieldcolname=grade','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">客户级别分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=rating&pickfieldtable=ec_account&pickfieldcolname=rating','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">客户状态分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=industry&pickfieldtable=ec_account&pickfieldcolname=industry','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">行业分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=ownership&pickfieldtable=ec_account&pickfieldcolname=ownership','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">公司性质分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=accounttype&pickfieldtable=ec_account&pickfieldcolname=account_type','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">类型分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=paymenttype&pickfieldtable=ec_account&pickfieldcolname=payment_type','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">支付方式分布统计</a>　      
●<a style="color: rgb(153, 102, 51);" href="javascript:openListViewReport('index.php?module=ListViewReport&action=Popup_ListView&grouptype=count&pickfieldname=assign_user_id&pickfieldtable=ec_users&pickfieldcolname=user_name','&relatedmodule=Accounts&PHPSESSID=946843652722b8f29316b992f4784206');">负责人分布统计</a>
      </td>       
    </tr>
    
  </tbody></table>
</div>
            			 </form></div>
   	
<div id="basicsearchcolumns" style="display:none;"><select name="search_field" id="bas_searchfield" style="width:150px"><option label="客户名称" value="accountname">客户名称</option>
<option label="电话" value="phone">电话</option>
<option label="城市" value="bill_city">城市</option>
<option label="客户来源" value="leadsource">客户来源</option>
<option label="客户级别" value="grade">客户级别</option>
<option label="客户状态" value="rating">客户状态</option>
<option label="行业" value="industry">行业</option>
<option label="创建时间" value="createdtime">创建时间</option>
<option label="负责人" value="assigned_user_id">负责人</option>
<option label="联系次数" value="contacttimes">联系次数</option>
</select></div>
			
		</td>
   </tr>
</tbody></table>
<!-- New List -->
</td></tr></tbody></table>

<!-- 视图调整顺序 start-->
<div id="sortViewdiv" class="windLayerDiv" style="display:none;width:700px;left:450px;top:250px;z-index:10;visibility: visible;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td id="moveSortView" class="windLayerHeading" align="left" width="80%" style="cursor:move">调整顺序</td>
	<td>&nbsp;</td>
	<td align="right" width="50%">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv(&#39;sortViewdiv&#39;);window.location.reload();">&nbsp;&nbsp;
	</td>
</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center">
	<tbody><tr>
		<td class="small">
		<!-- popup specific content fill in starts -->
			<div id="listViewdiv">
			</div>
		</td>
	</tr>
</tbody></table>
<br>
<div class="windLayerFoot">&nbsp;</div>
<div class="windLayerCorner">&nbsp;</div>
<script>
    WindLayerDrag("sortViewdiv", 'windLayerHeading');
</script>
</div>
<!-- end -->

<!-- 批量编辑 start-->
<div id="quickedit" class="windLayerDiv" style="display:none;width:600px;left:320px;top:220px;">
<form name="quickedit_form" id="quickedit_form" action="javascript:void(0);">
<!-- Hidden Fields -->
<input type="hidden" name="quickedit_recordids">
<input type="hidden" name="quickedit_module">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td width="80%" style="cursor:move;" class="windLayerHeading" align="left">&nbsp;&nbsp;批量修改</td>
	<td align="right">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv(&#39;quickedit&#39;);">&nbsp;&nbsp;
	</td>
</tr>
</tbody></table><br>
<div id="quickedit_form_div"></div>
<table border="0" cellspacing="0" cellpadding="5" width="100%">
	<tbody><tr>
		<td align="center">
			<button class="pure-button pure-button-success" title="保存" accesskey="S" name="savebutton" onclick="ajax_quick_edit();return false;">
				<i class="icon-ok"></i> 保存
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="pure-button pure-button-cancel" title="取消 [Alt+X]" accesskey="X" onclick="CloseLockDiv(&#39;quickedit&#39;);return false;" name="button">
				<i class="icon-off"></i> 关闭
			</button>&nbsp;
				<!-- <input type="button" name="button" class="crmbutton small edit" value="保存" onClick="ajax_quick_edit()">
				<input type="button" name="button" class="crmbutton small cancel" value="关闭" onClick="CloseLockDiv('quickedit')"> -->
		</td>
	</tr>
</tbody></table>
</form>
<br>
<div class="windLayerFoot">&nbsp;</div>
<div class="windLayerCorner">&nbsp;</div>
<script>
    WindLayerDrag("quickedit", 'windLayerHeading');
</script>
</div>
<!-- END -->

<!-- 批量转移（修改负责人） start-->
<div id="changeowner" class="windLayerDiv" style="display:none;width:325px;left:320px;top:220px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td width="80%" style="cursor:move;" id="sharerecord_div_title" class="windLayerHeading" align="left">&nbsp;&nbsp;修改负责人</td>
	<td align="right" width="40%">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv(&#39;changeowner&#39;);">&nbsp;&nbsp;
	</td>
</tr>
</tbody></table><br>
<table border="0" cellspacing="0" cellpadding="5" width="95%" align="center"> 
	<tbody><tr>
		<td class="small">
		
			<!-- popup specific content fill in starts -->
			<form name="change_ownerform_name">
			<table border="0" celspacing="0" cellpadding="5" width="100%" align="center" bgcolor="white">
				<tbody><tr>
					<td width="35%" align="right" nowrap=""><b>转移拥有关系:</b></td>
					<td>
						<!--	Selt User	-->
												<div class="chzn-select-div" style="text-align: left;">
							<a href="javascript:ShowSeltUser_click('lead_owner');" class="chzn-single" tabindex="-1">
								<span id="lead_owner_name"></span>
								<input type="hidden" name="lead_owner" id="lead_owner" value="">
								<div>
									<b>
								</b></div><b>
							</b></a><b>
							<!--	 User List start	 -->
							<div class="chzn-userlist-div" id="lead_owner_div">
								<input type="text" name="lead_owner_text" id="lead_owner_text" onkeydown="javascript:if(event.keyCode==13) return false;" class="chzn-search" onkeyup="SearchSmownerUser(&#39;lead_owner&#39;,&#39;&#39;,this)">
								<div id="lead_owner_info_div" style="overflow-y:auto;max-height:300px;height:300px;"><div class="smowner-group-div" onclick="displaysmowner_click(1)">销售部</div><div class="smowner-user-div smowner-group-1" onmouseover="this.className=&#39;smowner-user-over smowner-group-1&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-1&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;1&#39;,&#39;管理员&#39;,&#39;admin&#39;);" style="color:">管理员</div><div class="smowner-user-div smowner-group-1" onmouseover="this.className=&#39;smowner-user-over smowner-group-1&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-1&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;23&#39;,&#39;顾文斌&#39;,&#39;mike&#39;);" style="color:">顾文斌</div><div class="smowner-user-div smowner-group-1" onmouseover="this.className=&#39;smowner-user-over smowner-group-1&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-1&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;24&#39;,&#39;张建华&#39;,&#39;john&#39;);" style="color:">张建华</div><div class="smowner-user-div smowner-group-1" onmouseover="this.className=&#39;smowner-user-over smowner-group-1&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-1&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;27&#39;,&#39;薛少军&#39;,&#39;andy&#39;);" style="color:">薛少军</div><div class="smowner-user-div smowner-group-1" onmouseover="this.className=&#39;smowner-user-over smowner-group-1&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-1&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;31&#39;,&#39;吴薇&#39;,&#39;vivi&#39;);" style="color:">吴薇</div><div class="smowner-user-div smowner-group-1" onmouseover="this.className=&#39;smowner-user-over smowner-group-1&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-1&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;32&#39;,&#39;李剑锋&#39;,&#39;alan&#39;);" style="color:">李剑锋</div><div class="smowner-user-div smowner-group-1" onmouseover="this.className=&#39;smowner-user-over smowner-group-1&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-1&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;37&#39;,&#39;老板&#39;,&#39;boss&#39;);" style="color:">老板</div><div class="smowner-group-div" onclick="displaysmowner_click(2)">市场部</div><div class="smowner-user-div smowner-group-2" onmouseover="this.className=&#39;smowner-user-over smowner-group-2&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-2&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;36&#39;,&#39;陆西&#39;,&#39;lucy&#39;);" style="color:">陆西</div><div class="smowner-group-div" onclick="displaysmowner_click(3)">售后服务部</div><div class="smowner-user-div smowner-group-3" onmouseover="this.className=&#39;smowner-user-over smowner-group-3&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-3&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;28&#39;,&#39;江辉&#39;,&#39;kevin&#39;);" style="color:">江辉</div><div class="smowner-user-div smowner-group-3" onmouseover="this.className=&#39;smowner-user-over smowner-group-3&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-3&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;30&#39;,&#39;刘岚&#39;,&#39;cherry&#39;);" style="color:">刘岚</div><div class="smowner-user-div smowner-group-3" onmouseover="this.className=&#39;smowner-user-over smowner-group-3&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-3&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;35&#39;,&#39;马良&#39;,&#39;Robin&#39;);" style="color:">马良</div><div class="smowner-group-div" onclick="displaysmowner_click(4)">采购部</div><div class="smowner-user-div smowner-group-4" onmouseover="this.className=&#39;smowner-user-over smowner-group-4&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-4&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;25&#39;,&#39;王丽婷&#39;,&#39;lily&#39;);" style="color:">王丽婷</div><div class="smowner-user-div smowner-group-4" onmouseover="this.className=&#39;smowner-user-over smowner-group-4&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-4&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;26&#39;,&#39;陈雅丽&#39;,&#39;melissa&#39;);" style="color:">陈雅丽</div><div class="smowner-group-div" onclick="displaysmowner_click(5)">仓储部</div><div class="smowner-user-div smowner-group-5" onmouseover="this.className=&#39;smowner-user-over smowner-group-5&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-5&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;29&#39;,&#39;刘素&#39;,&#39;fiona&#39;);" style="color:">刘素</div><div class="smowner-group-div" onclick="displaysmowner_click(6)">财务部</div><div class="smowner-user-div smowner-group-6" onmouseover="this.className=&#39;smowner-user-over smowner-group-6&#39;;" onmouseout="this.className=&#39;smowner-user-div smowner-group-6&#39;" onclick="setsmownerid_click(&#39;lead_owner&#39;,&#39;34&#39;,&#39;张妮&#39;,&#39;helen&#39;);" style="color:">张妮</div></div>
								<script>
								    setSmownerAllUserOpts("lead_owner", "");
								</script>
							</div>
							<div id="lead_owner_bind_div" style="display: none;">{"1":{"groupname":{"value":"\u9500\u552e\u90e8"},"user":{"1":{"username":{"value":"admin"},"lastname":{"value":"\u7ba1\u7406\u5458"},"prefix":{"value":"ADMIN"}},"23":{"username":{"value":"mike"},"lastname":{"value":"\u987e\u6587\u658c"},"prefix":{"value":"MIKE"}},"24":{"username":{"value":"john"},"lastname":{"value":"\u5f20\u5efa\u534e"},"prefix":{"value":"JOHN"}},"27":{"username":{"value":"andy"},"lastname":{"value":"\u859b\u5c11\u519b"},"prefix":{"value":"ANDY"}},"31":{"username":{"value":"vivi"},"lastname":{"value":"\u5434\u8587"},"prefix":{"value":"VIVI"}},"32":{"username":{"value":"alan"},"lastname":{"value":"\u674e\u5251\u950b"},"prefix":{"value":"ALAN"}},"37":{"username":{"value":"boss"},"lastname":{"value":"\u8001\u677f"},"prefix":{"value":"BOSS"}}}},"2":{"groupname":{"value":"\u5e02\u573a\u90e8"},"user":{"36":{"username":{"value":"lucy"},"lastname":{"value":"\u9646\u897f"},"prefix":{"value":"LUCY"}}}},"3":{"groupname":{"value":"\u552e\u540e\u670d\u52a1\u90e8"},"user":{"28":{"username":{"value":"kevin"},"lastname":{"value":"\u6c5f\u8f89"},"prefix":{"value":"KEVIN"}},"30":{"username":{"value":"cherry"},"lastname":{"value":"\u5218\u5c9a"},"prefix":{"value":"CHERRY"}},"35":{"username":{"value":"Robin"},"lastname":{"value":"\u9a6c\u826f"},"prefix":{"value":"ROBIN"}}}},"4":{"groupname":{"value":"\u91c7\u8d2d\u90e8"},"user":{"25":{"username":{"value":"lily"},"lastname":{"value":"\u738b\u4e3d\u5a77"},"prefix":{"value":"LILY"}},"26":{"username":{"value":"melissa"},"lastname":{"value":"\u9648\u96c5\u4e3d"},"prefix":{"value":"MELISSA"}}}},"5":{"groupname":{"value":"\u4ed3\u50a8\u90e8"},"user":{"29":{"username":{"value":"fiona"},"lastname":{"value":"\u5218\u7d20"},"prefix":{"value":"FIONA"}}}},"6":{"groupname":{"value":"\u8d22\u52a1\u90e8"},"user":{"34":{"username":{"value":"helen"},"lastname":{"value":"\u5f20\u59ae"},"prefix":{"value":"HELEN"}}}}}</div>
							<!--	User List End		-->
						</b></div><b>
					</b></td>
				</tr>
			</tbody></table>
			</form>
		</td>
	</tr>
</tbody></table>
<table border="0" cellspacing="0" cellpadding="5" width="100%">
	<tbody><tr>
		<td align="center">
			<button class="pure-button pure-button-success" title="更新负责人" accesskey="S" name="savebutton" onclick="ajaxChangeStatus(&#39;owner&#39;);return false;">
				<i class="icon-ok"></i> 更新负责人
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="pure-button pure-button-cancel" title="取消 [Alt+X]" accesskey="X" onclick="CloseLockDiv(&#39;changeowner&#39;);return false;" name="button">
				<i class="icon-off"></i> 关闭
			</button>&nbsp;

				<!-- <input type="button" name="button" class="crmbutton small edit" value="更新负责人" onClick="ajaxChangeStatus('owner')">
				<input type="button" name="button" class="crmbutton small cancel" value="关闭" onClick="CloseLockDiv('changeowner')"> -->
		</td>
	</tr>
</tbody></table>
<br>
<div class="windLayerFoot">&nbsp;</div>
<div class="windLayerCorner">&nbsp;</div>
<script>
    WindLayerDrag("changeowner", 'windLayerHeading');
</script>
</div>
<!-- END -->

<!-- 共享 start-->
<div id="sharerecorddiv" class="windLayerDiv" style="display:none;width:700px;left:320px;top:220px;">
<form name="sharerecord_form">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td width="99%" style="cursor:move;" id="sharerecord_div_title" class="windLayerHeading" align="left">&nbsp;&nbsp;共享</td>
	<td align="right" width="40%">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv(&#39;sharerecorddiv&#39;);">&nbsp;&nbsp;
	</td>
</tr>
</tbody></table>

	 		<table width="100%">
			<tbody><tr class="windLayerHead" height="20px">
				<td onclick="showhide_dept(&#39;dept_销售部&#39;,&#39;img_销售部&#39;)" style="cursor: pointer;">
					&nbsp;
					<img src="./CRM_files/minus.gif" id="img_销售部" style="cursor: pointer;" align="absmiddle" border="0">
					&nbsp;&nbsp;<b>销售部</b>
				</td>
				<td align="center" width="4%">
					<input type="checkbox" onclick="toggleSelect(this.checked,&quot;DetailView_销售部&quot;)" name="shareselectall" class="detailedViewTextBox" style="width:12px;height:12px;">&nbsp;&nbsp;
				</td>
			</tr>
		</tbody></table>
		<table style="background-color: rgb(234, 234, 234);" class="small" width="100%" border="0" cellpadding="3" cellspacing="1" id="dept_销售部">
			<tbody><tr class="lvtColData" onmouseover="this.className=&#39;lvtColDataHover&#39;" onmouseout="this.className=&#39;lvtColData&#39;" id="row_2" height="25px">
																		<td>
						<input type="checkbox" name="DetailView_销售部" value="23" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;mike&nbsp;&nbsp;(销售经理)
					</td>
					
																			<td>
						<input type="checkbox" name="DetailView_销售部" value="32" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;alan&nbsp;&nbsp;(销售人员)
					</td>
					
																			<td>
						<input type="checkbox" name="DetailView_销售部" value="27" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;andy&nbsp;&nbsp;(销售人员)
					</td>
					
																			<td>
						<input type="checkbox" name="DetailView_销售部" value="24" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;john&nbsp;&nbsp;(销售人员)
					</td>
					
																										</tr><tr class="lvtColData" onmouseover="this.className=&#39;lvtColDataHover&#39;" onmouseout="this.className=&#39;lvtColData&#39;" id="row_2" height="25px" bgcolor="#fff">
										<td>
						<input type="checkbox" name="DetailView_销售部" value="31" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;vivi&nbsp;&nbsp;(销售人员)
					</td>
					
																		<td colspan="4-1">&nbsp;</td>
							</tr>
		</tbody></table>
			<table width="100%">
			<tbody><tr class="windLayerHead" height="20px">
				<td onclick="showhide_dept(&#39;dept_市场部&#39;,&#39;img_市场部&#39;)" style="cursor: pointer;">
					&nbsp;
					<img src="./CRM_files/minus.gif" id="img_市场部" style="cursor: pointer;" align="absmiddle" border="0">
					&nbsp;&nbsp;<b>市场部</b>
				</td>
				<td align="center" width="4%">
					<input type="checkbox" onclick="toggleSelect(this.checked,&quot;DetailView_市场部&quot;)" name="shareselectall" class="detailedViewTextBox" style="width:12px;height:12px;">&nbsp;&nbsp;
				</td>
			</tr>
		</tbody></table>
		<table style="background-color: rgb(234, 234, 234);" class="small" width="100%" border="0" cellpadding="3" cellspacing="1" id="dept_市场部">
			<tbody><tr class="lvtColData" onmouseover="this.className=&#39;lvtColDataHover&#39;" onmouseout="this.className=&#39;lvtColData&#39;" id="row_2" height="25px">
																		<td>
						<input type="checkbox" name="DetailView_市场部" value="36" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;lucy&nbsp;&nbsp;(市场营销)
					</td>
					
																		<td colspan="4-1">&nbsp;</td>
							</tr>
		</tbody></table>
			<table width="100%">
			<tbody><tr class="windLayerHead" height="20px">
				<td onclick="showhide_dept(&#39;dept_售后服务部&#39;,&#39;img_售后服务部&#39;)" style="cursor: pointer;">
					&nbsp;
					<img src="./CRM_files/minus.gif" id="img_售后服务部" style="cursor: pointer;" align="absmiddle" border="0">
					&nbsp;&nbsp;<b>售后服务部</b>
				</td>
				<td align="center" width="4%">
					<input type="checkbox" onclick="toggleSelect(this.checked,&quot;DetailView_售后服务部&quot;)" name="shareselectall" class="detailedViewTextBox" style="width:12px;height:12px;">&nbsp;&nbsp;
				</td>
			</tr>
		</tbody></table>
		<table style="background-color: rgb(234, 234, 234);" class="small" width="100%" border="0" cellpadding="3" cellspacing="1" id="dept_售后服务部">
			<tbody><tr class="lvtColData" onmouseover="this.className=&#39;lvtColDataHover&#39;" onmouseout="this.className=&#39;lvtColData&#39;" id="row_2" height="25px">
																		<td>
						<input type="checkbox" name="DetailView_售后服务部" value="28" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;kevin&nbsp;&nbsp;(副总经理)
					</td>
					
																			<td>
						<input type="checkbox" name="DetailView_售后服务部" value="35" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;Robin&nbsp;&nbsp;(售后)
					</td>
					
																			<td>
						<input type="checkbox" name="DetailView_售后服务部" value="30" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;cherry&nbsp;&nbsp;(技术支持)
					</td>
					
																		<td colspan="4-3">&nbsp;</td>
							</tr>
		</tbody></table>
			<table width="100%">
			<tbody><tr class="windLayerHead" height="20px">
				<td onclick="showhide_dept(&#39;dept_采购部&#39;,&#39;img_采购部&#39;)" style="cursor: pointer;">
					&nbsp;
					<img src="./CRM_files/minus.gif" id="img_采购部" style="cursor: pointer;" align="absmiddle" border="0">
					&nbsp;&nbsp;<b>采购部</b>
				</td>
				<td align="center" width="4%">
					<input type="checkbox" onclick="toggleSelect(this.checked,&quot;DetailView_采购部&quot;)" name="shareselectall" class="detailedViewTextBox" style="width:12px;height:12px;">&nbsp;&nbsp;
				</td>
			</tr>
		</tbody></table>
		<table style="background-color: rgb(234, 234, 234);" class="small" width="100%" border="0" cellpadding="3" cellspacing="1" id="dept_采购部">
			<tbody><tr class="lvtColData" onmouseover="this.className=&#39;lvtColDataHover&#39;" onmouseout="this.className=&#39;lvtColData&#39;" id="row_2" height="25px">
																		<td>
						<input type="checkbox" name="DetailView_采购部" value="25" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;lily&nbsp;&nbsp;(采购经理)
					</td>
					
																			<td>
						<input type="checkbox" name="DetailView_采购部" value="26" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;melissa&nbsp;&nbsp;(采购助理)
					</td>
					
																		<td colspan="4-2">&nbsp;</td>
							</tr>
		</tbody></table>
			<table width="100%">
			<tbody><tr class="windLayerHead" height="20px">
				<td onclick="showhide_dept(&#39;dept_仓储部&#39;,&#39;img_仓储部&#39;)" style="cursor: pointer;">
					&nbsp;
					<img src="./CRM_files/minus.gif" id="img_仓储部" style="cursor: pointer;" align="absmiddle" border="0">
					&nbsp;&nbsp;<b>仓储部</b>
				</td>
				<td align="center" width="4%">
					<input type="checkbox" onclick="toggleSelect(this.checked,&quot;DetailView_仓储部&quot;)" name="shareselectall" class="detailedViewTextBox" style="width:12px;height:12px;">&nbsp;&nbsp;
				</td>
			</tr>
		</tbody></table>
		<table style="background-color: rgb(234, 234, 234);" class="small" width="100%" border="0" cellpadding="3" cellspacing="1" id="dept_仓储部">
			<tbody><tr class="lvtColData" onmouseover="this.className=&#39;lvtColDataHover&#39;" onmouseout="this.className=&#39;lvtColData&#39;" id="row_2" height="25px">
																		<td>
						<input type="checkbox" name="DetailView_仓储部" value="29" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;fiona&nbsp;&nbsp;(仓管人员)
					</td>
					
																		<td colspan="4-1">&nbsp;</td>
							</tr>
		</tbody></table>
			<table width="100%">
			<tbody><tr class="windLayerHead" height="20px">
				<td onclick="showhide_dept(&#39;dept_财务部&#39;,&#39;img_财务部&#39;)" style="cursor: pointer;">
					&nbsp;
					<img src="./CRM_files/minus.gif" id="img_财务部" style="cursor: pointer;" align="absmiddle" border="0">
					&nbsp;&nbsp;<b>财务部</b>
				</td>
				<td align="center" width="4%">
					<input type="checkbox" onclick="toggleSelect(this.checked,&quot;DetailView_财务部&quot;)" name="shareselectall" class="detailedViewTextBox" style="width:12px;height:12px;">&nbsp;&nbsp;
				</td>
			</tr>
		</tbody></table>
		<table style="background-color: rgb(234, 234, 234);" class="small" width="100%" border="0" cellpadding="3" cellspacing="1" id="dept_财务部">
			<tbody><tr class="lvtColData" onmouseover="this.className=&#39;lvtColDataHover&#39;" onmouseout="this.className=&#39;lvtColData&#39;" id="row_2" height="25px">
																		<td>
						<input type="checkbox" name="DetailView_财务部" value="34" class="detailedViewTextBox" style="width:12px;height:12px;">
						&nbsp;&nbsp;helen&nbsp;&nbsp;(财务总监)
					</td>
					
																		<td colspan="4-1">&nbsp;</td>
							</tr>
		</tbody></table>
	&nbsp;
<table border="0" cellspacing="0" cellpadding="5" width="100%" class="">
	<tbody><tr>
		<td align="center">
			<button class="pure-button pure-button-success" title="保存" accesskey="S" name="savebutton" onclick="ajaxShareRecord(&#39;Accounts&#39;);return false;">
				<i class="icon-ok"></i> 保存
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="pure-button pure-button-cancel" title="取消 [Alt+X]" accesskey="X" onclick="CloseLockDiv(&#39;sharerecorddiv&#39;);return false;" name="button">
				<i class="icon-off"></i> 关闭
			</button>&nbsp;
			<!-- <input type="button" name="button" class="crmbutton save small" value="保存" onClick="ajaxShareRecord('Accounts')">
			<input type="button" name="button" class="crmbutton small cancel" value="关闭" onClick="CloseLockDiv('sharerecorddiv')"> -->
		</td>
	</tr>
</tbody></table>
</form>
<br>
<script>
    WindLayerDrag("sharerecorddiv", 'windLayerHeading');
</script>
</div>
<!-- END -->


<!-- reset share start-->
<div id="batchresharediv" class="windLayerDiv" style="display:none;width:700px;left:320px;top:220px;">
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
<tbody><tr class="windLayerHeadingTr">
	<td width="99%" style="cursor:move;" id="sharerecord_div_title" class="windLayerHeading" align="left">&nbsp;&nbsp;取消共享</td>
	<td align="right" width="40%">
		<input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv(&#39;batchresharediv&#39;);">&nbsp;&nbsp;
	</td>
</tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="5" width="100%" class="">
	<tbody><tr>
		<td align="center">
			<div id="batchreshareContent"></div>
		</td>
	</tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="5" width="97%" align="center" style="background-color: #FFFFEA;">
	<tbody><tr>
		<td align="left">
			1、您所选择的共享资料中，只有负责人是自己的才可以取消共享<br>
			2、想要取消那条资料的共享，可以单个选择<br>
			3、每次最多只能显示20条可取消共享的记录
		</td>
	</tr>
</tbody></table>
	 
<table border="0" cellspacing="0" cellpadding="5" width="100%" class="">
	<tbody><tr>
		<td align="center">
			<button class="pure-button pure-button-success" title="保存" onclick="ResetShareSave(&#39;Accounts&#39;);return false;">
				<i class="icon-ok"></i> 保存
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="pure-button pure-button-cancel" title="关闭" onclick="CloseLockDiv(&#39;batchresharediv&#39;);return false;">
				<i class="icon-off"></i> 关闭
			</button>&nbsp;
		</td>
	</tr>
</tbody></table>
<br>
<script>
    WindLayerDrag("batchresharediv", 'windLayerHeading');
</script>
</div>
<!-- END -->
<!--	change opts		-->
<input type="hidden" id="fcoolhid" value="2">
<script>
    function showhide_dept(deptId, imgId) {
        var x = document.getElementById(deptId).style;
        if (x.display == "none") {
            x.display = "";
            document.getElementById(imgId).src = "themes/softed/images/minus.gif";
        }
        else {
            x.display = "none";
            document.getElementById(imgId).src = "themes/softed/images/plus.gif";
        }
    }


    //Drag.init(document.getElementById("sharerecord_div_title"), document.getElementById("sharerecorddiv"));
    function ajaxChangeStatus(statusname) {
        Jquery("#status").css("display", "inline");
        var viewid = Jquery('#viewname').val();
        var idstring = Jquery('#idlist').val();
        if (statusname == "status") {
            CloseLockDiv('changestatus');
            var url = '&leadval=' + Jquery('#lead_status').val();
            var urlstring = "module=Users&action=updateLeadDBStatus&return_module=Leads" + url + "&viewname=" + viewid + "&idlist=" + idstring;
        } else if (statusname == 'owner') {
            CloseLockDiv('changeowner');
            var url = '&user_id=' + Jquery('#lead_owner').val();

            var urlstring = "module=Users&action=updateLeadDBStatus&return_module=Accounts" + url + "&viewname=" + viewid + "&idlist=" + idstring;

        }
        Jquery.ajax({
            url: "index.php",
            data: urlstring,
            success: function (rest) {
                Jquery("#status").css("display", "none");
                result = rest.split('&#&#&#');
                Jquery("#ListViewContents").html(result[2]);
                result[2].evalScripts();
                if (result[1] != '')
                    alert(result[1]);
            }
        });
    }
    function ajaxShareRecord(module) {
        $("status").style.display = "inline";
        var idstring = document.getElementById('idlist').value;
        CloseLockDiv('sharerecorddiv');
        var shareuserids = "";
        for (var i = 0; i < document.sharerecord_form.elements.length; i++) {
            if (document.sharerecord_form.elements[i].type == 'checkbox' && document.sharerecord_form.elements[i].checked) {
                shareuserids = shareuserids + document.sharerecord_form.elements[i].value + ",";
            }
        }

        var urlstring = "module=" + module + "&action=SaveShares&shareuserids=" + shareuserids + "&idlist=" + idstring;

        new Ajax.Request(
                'index.php',
                { queue: { position: 'end', scope: 'command' },
                    method: 'post',
                    postBody: urlstring,
                    onComplete: function (response) {
                        $("status").style.display = "none";
                        result = response.responseText;
                    }
                }
        );


    }

    function clearSearchResult(module) {
        $("status").style.display = "inline";
        new Ajax.Request(
		'index.php',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'clearquery=true&file=index&module=' + module + '&action=' + module + 'Ajax&ajax=true',
		    onComplete: function (response) {
		        moveMe('searchAcc');
		        searchshowhide('searchAcc', 'advSearch');
		        for (i = 1; i <= 26; i++) {
		            var data_td_id = 'alpha_' + eval(i);
		            getObj(data_td_id).className = 'searchAlph';
		        }
		        $("status").style.display = "none";
		        result = response.responseText.split('&#&#&#');
		        $("ListViewContents").innerHTML = result[2];
		        result[2].evalScripts();
		        if (result[1] != '')
		            alert(result[1]);
		    }
		}
        );

    }

    //
    var advsearch = "";
    var fool = "-1";

    window.onload = function () {
        if (advsearch) {
            var fieldarray = new Array();
            var inputs = document.basicSearch;
            for (var i = 0; i <= fool; i++) {
                FieldsUpopts(inputs["Fields" + i], i);
            }
        } else {
            var search_field = document.basicSearch.search_field;
            updatefOptions(search_field);
        }
    }
</script>




<script language="JavaScript" type="text/javascript" src="./CRM_files/popup.js"></script><br><br><br><table border="0" cellspacing="0" cellpadding="5" width="100%" class="settingsSelectedUI" style=" display:none;"><tbody><tr><td class="small" align="left"><a href="http://www.c3crm.com/" target="_blank">E-CRM7.0.28</a> </td><td class="small" align="right">
				Powered by <a href="http://www.c3crm.com/" target="_blank">&nbsp;<img src="./CRM_files/crm-logo-red.png" width="60" border="0"></a>
					&nbsp;&nbsp;
					咨询热线: 400 680 5898 &nbsp;&nbsp; 
				
				<a href="http://www.c3crm.com/cpjs/298.html" target="_blank">
					<i class="icon-mobile-phone icon-large"></i> 手机登陆
				</a>
			</td></tr></tbody></table><script type="text/javascript">			                              if (typeof (ActivityReminderCallback) != 'undefined') ActivityReminderCallback();</script><!--end body panes-->


             <div class="path-url" style=" display:none;">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
      <div class="pages"style=" display:none;">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" ></WebCtrl:AspNetPager>
      </div>

</asp:Content>