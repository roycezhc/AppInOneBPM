/*********************************************************************************

** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ********************************************************************************/
function change(obj,divid)
{
	var modname = document.basicSearch.module.value;
	$("status").style.display="inline";
	new Ajax.Request(
		'index.php',
		{queue: {position: 'end', scope: 'command'},
			method: 'post',
			postBody:"module=Users&action=UsersAjax&file=CheckUpSmowner&modname="+modname+"",
			onComplete: function(response) {
				$("status").style.display="none";
				var rest = response.responseText;
				if(rest == "No"){
					alert(alert_arr.CHECK_UPDATE_SMOWNER);return false;
				}else{
					var select_options  =  document.getElementsByName('selected_id');
					var x = select_options.length;
					var viewid =getviewId();		
					idstring = "";

					xx = 0;
					for(i = 0; i < x ; i++)
					{
						if(select_options[i].checked)
						{
							idstring = select_options[i].value +";"+idstring
								xx++
						}
					}
					if (xx != 0)
					{
						document.getElementById('idlist').value=idstring;
					}
					else
					{
						alert(alert_arr.SELECT);
						return false;
					}
					ShowLockDiv(divid);
				}
			}
		 }
	);
}
function getviewId()
{
	var viewid ='';
	if(typeof(document.getElementById("viewname")) != 'undefined')
	{
		//var viewid = oViewname.options[oViewname.selectedIndex].value;
		viewid = document.getElementById("viewname").value;
	}
	else
	{
		viewid ='';		
	}
	return viewid;	
}
function massDelete(module)
{
		var select_options  =  document.getElementsByName('selected_id');
		var x = select_options.length;
		var viewid =getviewId();		
		idstring = "";

        xx = 0;
        for(i = 0; i < x ; i++)
        {
        	if(select_options[i].checked)
            {
            	idstring = select_options[i].value +";"+idstring
                xx++
            }
        }
        if (xx != 0)
        {
            document.getElementById('idlist').value=idstring;
        }
        else
        {
            alert(alert_arr.SELECT);
            return false;
        }
		if(confirm(alert_arr.DELETE))
		{
			
			$("status").style.display="inline";
			new Ajax.Request(
          	  	      'index.php',
			      	{queue: {position: 'end', scope: 'command'},
		                        method: 'post',
                		        postBody:"module=Users&action=massdelete&return_module="+module+"&viewname="+viewid+"&idlist="+idstring,
		                        onComplete: function(response) {
        	        	                $("status").style.display="none";
                	        	        result = response.responseText.split('&#&#&#');
                        	        	$("ListViewContents").innerHTML= result[2];
	                        	        if(result[1] != '')
                                        		alert(result[1]);
		                        }
              			 }
       			);
		}
		else
		{
			return false;
		}

}

function massExport(module)
{
		var select_options  =  document.getElementsByName('selected_id');
		var x = select_options.length;
		var viewid =getviewId();		
		idstring = "";

        xx = 0;
        for(i = 0; i < x ; i++)
        {
        	if(select_options[i].checked)
            {
            	idstring = select_options[i].value +";"+idstring
                xx++
            }
        }
        if (xx != 0)
        {
            document.getElementById('idlist').value=idstring;
        }
        else
        {
            alert(alert_arr.SELECT);
            return false;
        }
		document.massdelete.module.value = module;
		document.massdelete.action.value = "massExport";
		document.massdelete.allids.value = idstring;
		document.massdelete.submit();

		

}

function showNewCustomView(selectView,module) 
{
	$("status").style.display="inline";
	var oldSelectView = document.massdelete.viewname.value;
	switchClass("view_" + oldSelectView,"off");
	document.massdelete.viewname.value = selectView;
	switchClass("view_" + selectView,"on");
	showDefaultCustomView(selectView,module);
}

function showDefaultCustomView(selectView,module)
{
	
	//var viewName = selectView.options[selectView.options.selectedIndex].value;
	new Ajax.Request(
               	'index.php',
                {queue: {position: 'end', scope: 'command'},
                       	method: 'post',
                        postBody:"module="+module+"&action="+module+"Ajax&file=ListView&ajax=true&start=1&viewname="+selectView,
                        onComplete: function(response) {
                        $("status").style.display="none";
                        result = response.responseText.split('&#&#&#');
                        $("ListViewContents").innerHTML= result[2];
                        if(result[1] != '')
                               	alert(result[1]);
			$('basicsearchcolumns_real').innerHTML = $('basicsearchcolumns').innerHTML
			$('basicsearchcolumns').innerHTML = '';
			document.basicSearch.search_text.value = '';
                        }
                }
	);
}
function showDefaultViewScopeNew(viewscope,module)
{
	$("status").style.display="inline";
	var viewscopeValue = viewscope.options[viewscope.options.selectedIndex].value;
	var viewName =$('viewname').value;
	new Ajax.Request(
		'index.php',
		{queue: {position: 'end', scope: 'command'},
			method: 'post',
			postBody:"module="+module+"&action="+module+"Ajax&file=ListView&ajax=true&start=1&viewname="+viewName+"&viewscope="+viewscopeValue,
			onComplete: function(response) {
			$("status").style.display="none";
			result = response.responseText.split('&#&#&#');
			$("ListViewContents").innerHTML= result;
			result[2].evalScripts();
			if(result[1] != '')
				alert(result[1]);
				//$('basicsearchcolumns_real').innerHTML = $('basicsearchcolumns').innerHTML
				//$('basicsearchcolumns').innerHTML = '';
				//document.basicSearch.search_text.value = '';
			}
		}
	);
} 
function showDefaultViewScope(viewscope,module)
{
	$("status").style.display="inline";
	var viewscopeValue = viewscope.options[viewscope.options.selectedIndex].value;
	var viewName =$('viewname').value;
	new Ajax.Request(
               	'index.php',
                {queue: {position: 'end', scope: 'command'},
                       	method: 'post',
                        postBody:"module="+module+"&action="+module+"Ajax&file=ListView&ajax=true&start=1&viewname="+viewName+"&viewscope="+viewscopeValue,
                        onComplete: function(response) {
                        $("status").style.display="none";
                        result = response.responseText.split('&#&#&#');
                        $("ListViewContents").innerHTML= result[2];
                        result[2].evalScripts();
                        if(result[1] != '')
                               	alert(result[1]);
								//$('basicsearchcolumns_real').innerHTML = $('basicsearchcolumns').innerHTML
								//$('basicsearchcolumns').innerHTML = '';
								//document.basicSearch.search_text.value = '';
                        }
                }
	);
}


function showCalendarViewScope(viewscope,module)
{
	var viewscopeValue = viewscope.options[viewscope.options.selectedIndex].value;
	document.location.href = document.location.href + "&viewscope="+viewscopeValue;
}


function getListViewEntries_js(module,url)
{
	$("status").style.display="inline";
	if($('search_url').value!='')
                urlstring = $('search_url').value;
	else
		urlstring = '';
        new Ajax.Request(
        	'index.php',
                {queue: {position: 'end', scope: 'command'},
                	method: 'post',
                        postBody:"module="+module+"&action="+module+"Ajax&file=ListView&ajax=true&"+url+urlstring,
			onComplete: function(response) {
                        	$("status").style.display="none";
                                result = response.responseText.split('&#&#&#');
                                $("ListViewContents").innerHTML= result[2];
                                if(result[1] != '')
                                        alert(result[1]);
                                result[2].evalScripts();
                  	}
                }
        );
}

function getListViewWithPageNo(module,pageElement)
{
	//var pageno = document.getElementById('listviewpage').value;
	var pageno = pageElement.options[pageElement.options.selectedIndex].value;
	getListViewEntries_js(module,'start='+pageno);
}

function getListViewWithPageSize(module,pageElement)
{
	var pagesize = pageElement.options[pageElement.options.selectedIndex].value;
	getListViewEntries_js(module,'pagesize='+pagesize);
}

function openListViewReport(openurl,params)
{
    window.open(openurl+params,"test","width=800,height=600,resizable=1,scrollbars=1");

}

function getColumnCollectInf(module,url)
{
     new Ajax.Request(
        	'index.php',
                {queue: {position: 'end', scope: 'command'},
               method: 'post',
               postBody:"module=Home&action=HomeAjax&file=UpdateCollectTotalInf&ajax=true&relatedmodule="+module+"&"+url,
			  onComplete: function(response) {
                        	$("status").style.display="none";
                                result = response.responseText;
                                $("collectcolumntable").innerHTML= result;
                                result.evalScripts();
                  	}
                }
        );
}
// QuickEdit Feature
function quick_edit(obj,divid,module) {
	var select_options  =  document.getElementsByName('selected_id');
	var x = select_options.length;
	idstring = "";

	xx = 0;
	for(i = 0; i < x ; i++)
	{
		if(select_options[i].checked)
		{
			idstring = select_options[i].value +";"+idstring
			xx++
		}
	}
	if (xx != 0)
	{
		document.getElementById('idlist').value=idstring;
		
		quick_edit_formload(idstring,module);
		//fnvshobj(obj, divid);
		ShowLockDiv(divid);
	}
	else
	{
		alert(alert_arr.SELECT);
		return false;
	}
	
}
function quick_edit_formload(idstring, module) {
    //alert(22);
	$("status").style.display="inline";
	new Ajax.Request(
		'index.php',
		{queue: {position: 'end', scope: 'command'},
	    	method: 'post',
			postBody:"module="+encodeURIComponent(module)+"&action="+encodeURIComponent(module+'Ajax')+"&file=QuickEdit&mode=ajax",
				onComplete: function(response) {
                	$("status").style.display="none";
               	    var result = response.responseText;
                    $("quickedit_form_div").innerHTML= result;
					//$("quickedit_form")["quickedit_recordids"].value = idstring;
					//$("quickedit_form")["quickedit_module"].value = module;
					document.quickedit_form.quickedit_recordids.value = idstring;
					document.quickedit_form.quickedit_module.value = module;
					var jscripts = $('quickedit_javascript');
					if(jscripts) {
						eval(jscripts.innerHTML); 
						// Updating global variables
						/*
						fieldname = quick_fieldname;
						for(var i=0;i<fieldname.length;i++){
							//alert(fieldname[i]);
							var calendar_jscript_id = 'quickedit_calendar_'+fieldname[i];
							//calendar_jscript = document.getElementById(calendar_jscript_id);
							calendar_jscript = $(calendar_jscript_id);			
							if(calendar_jscript){
								eval(calendar_jscript.innerHTML);
							}
						}
						*/
					}
				}
		}
	);
}
function quick_edit_fieldchange(selectBox) {
    //alert(11);
	var oldSelectedIndex = selectBox.oldSelectedIndex;
	var selectedIndex = selectBox.selectedIndex;

	if($('quickedit_field'+oldSelectedIndex)) $('quickedit_field'+oldSelectedIndex).style.display='none';
	if($('quickedit_field'+selectedIndex)) $('quickedit_field'+selectedIndex).style.display='block';

	var quickeditfield = document.quickedit_form.quickedit_field.value;
	var calendar_jscript_id = 'quickedit_calendar_' + quickeditfield;
	calendar_jscript = $(calendar_jscript_id);
	if(calendar_jscript){
		eval(calendar_jscript.innerHTML);
	}
	
	selectBox.oldSelectedIndex = selectedIndex;
}
function ajax_quick_edit() {
    //alert(1);
	$("status").style.display = "inline";

	//var quickeditform = $("quickedit_form");
	var module = document.quickedit_form.quickedit_module.value;
	var idstring = document.quickedit_form.quickedit_recordids.value;

	var viewid = getviewId();
	var searchurl = document.getElementById("search_url").value; 
	//var tplstart = "&"; 
	//if (gstart != "") { tplstart = tplstart + gstart; }

	//var quickeditfield = quickeditform['quickedit_field'].value;
	//var quickeditvalue = quickeditform['quickedit_value_'+quickeditfield].value;

	var quickeditfield = document.quickedit_form.quickedit_field.value;
	var quickeditvalue = "";
	
	if($('quickedit_value_'+quickeditfield) != null && $('quickedit_value_'+quickeditfield) != "undefined" && $('quickedit_value_'+quickeditfield).name.toString().indexOf("[]") > -1) {
		var sel = document.quickedit_form.elements['quickedit_value_'+quickeditfield+'[]'];
		for(var i=0;i<sel.options.length;i++){
			if(sel.options[i].selected) {
				if(i == 0) {
					quickeditvalue = sel.options[i].value;
				} else {
					quickeditvalue = quickeditvalue + " |##| " + sel.options[i].value;
				}
			}
		}		
	} else {
		quickeditvalue = document.quickedit_form.elements['quickedit_value_'+quickeditfield].value;		
	}
	var jscripts = $('quickedit_javascript');
	//alert(quick_fieldname[0]);
	if(jscripts) {
		eval(jscripts.innerHTML);
	}
	if(!quickEditFormValidate(quickeditfield,quick_fieldname,quick_fieldlabel,quick_fielddatatype)) {
		$("status").style.display = "none";
		return false;
	}
	quickeditvalue = removeHTMLTag(quickeditvalue);
	var urlstring = 
		"module="+encodeURIComponent(module)+"&action="+encodeURIComponent(module+'Ajax')+
		"&return_module="+encodeURIComponent(module)+
		"&mode=ajax&file=QuickEditSave&viewname=" + viewid + 
		"&quickedit_field=" + encodeURIComponent(quickeditfield) +
		"&quickedit_value=" + encodeURIComponent(quickeditvalue) +
	   	"&idlist=" + idstring + searchurl;

	CloseLockDiv("quickedit");

	new Ajax.Request(
		"index.php", 
		{queue:{position:"end", scope:"command"}, 
			method:"post", 
			postBody:urlstring, 
			onComplete:function (response) {
				$("status").style.display = "none";
				var result = response.responseText.split("&#&#&#");
				$("ListViewContents").innerHTML = result[2];
				if (result[1] != "") {
					alert(result[1]);
				}
				$("basicsearchcolumns").innerHTML = "";
			}
		}
	); 
}
	
// END

///Search Update Field Bind
function updatefOptions(obj) {
    //alert(2);
	var modulename = document.basicSearch.module.value;
	var fldvalue = document.basicSearch.searchvalhid.value;
	var urlstring = "&modulename="+modulename+"&field="+obj.value+"&fldvalue="+fldvalue+"";
	new Ajax.Request(
		'index.php',
		{ queue: { position: 'end', scope: 'command' },
		    method: 'post',
		    postBody: 'module=Home&action=HomeAjax&file=getFieldInput&ajax=true' + urlstring,
		    onComplete: function (response) {
		        var result = trim(response.responseText); 
		        var fcoolhid = document.getElementById("fcoolhid");
		        var fvalhtml = '';
		        if (result.indexOf('\r\n\r\n\r\n\r') != -1) {
		            result = result.split('\r\n\r\n\r\n\r');
		            result = result[1];
		        }
		        if (result != '') {
		            var fieldobj = eval('(' + result + ')') ? eval('(' + result + ')') : JSON.parse(result);
		            if (fieldobj.uitype == "opts") {
		                var opts = '<select name="search_text" id="search_text">';
		                if (fieldobj.field && fieldobj.field != "") {
		                    for (var k in fieldobj.field) {
		                        opts += '<option value="' + fieldobj.field[k].colkey.value + '" ' +
											'' + fieldobj.field[k].selected.value + '>' +
											'' + fieldobj.field[k].colvalue.value + '</option>';
		                    }
		                }
		                opts += '</select>';
		                fvalhtml = opts;
		            } else if (fieldobj.uitype == "date") {//opts
		                var datehtml = '<input name="basicfirstdate" id="jscal_field_basicfirstdate" type="text" ' +
									'style="border:1px solid #bababa;" size="11" maxlength="15" value="' + fieldobj.firstdate.value + '">&nbsp;' +
									'<i class="icon-calendar pure-icon-bu crm-bu-style" ' +
										'onclick="displayCalendar(\'jscal_field_basicfirstdate\',this);" ' +
											'style="width:50px;height:50px;cursor:pointer;font-size:14px">' +
									'</i>';
		                datehtml += '&nbsp; -- &nbsp;';
		                datehtml += '<input name="basiclastdate" id="jscal_field_basiclastdate" type="text" ' +
									'style="border:1px solid #bababa;" size="11" maxlength="15" value="' + fieldobj.lastdate.value + '">&nbsp;' +
									'<i class="icon-calendar pure-icon-bu crm-bu-style" ' +
										'onclick="displayCalendar(\'jscal_field_basiclastdate\',this);" ' +
											'style="width:50px;height:50px;cursor:pointer;font-size:14px">' +
									'</i>&nbsp;';
		                fvalhtml = datehtml;
		                fvalhtml += '<input type="hidden" name="basicsrchuitype" value="' + fieldobj.uitype + '">';
		            } else if (fieldobj.uitype == "time") {//opts
		                var datehtml = '<input name="basicfirsttime" id="jscal_field_basicfirsttime" type="text" ' +
									'style="border:1px solid #bababa;" size="21" maxlength="19" value="' + fieldobj.firsttime.value + '">&nbsp;' +
									'<i class="icon-calendar pure-icon-bu crm-bu-style" ' +
										'onclick="displayCalendar(\'jscal_field_basicfirsttime\',this,true);" ' +
											'style="width:50px;height:50px;cursor:pointer;font-size:14px">' +
									'</i>';
		                datehtml += '&nbsp; -- &nbsp;';
		                datehtml += '<input name="basiclasttime" id="jscal_field_basiclasttime" type="text" ' +
									'style="border:1px solid #bababa;" size="21" maxlength="19" value="' + fieldobj.lasttime.value + '">&nbsp;' +
									'<i class="icon-calendar pure-icon-bu crm-bu-style" ' +
										'onclick="displayCalendar(\'jscal_field_basiclasttime\',this,true);" ' +
											'style="width:50px;height:50px;cursor:pointer;font-size:14px">' +
									'</i>&nbsp;';
		                fvalhtml = datehtml;
		                fvalhtml += '<input type="hidden" name="basicsrchuitype" value="' + fieldobj.uitype + '">';
		            } else if (fieldobj.uitype == "userid") {//userid
		                //						var opts = '<select name="search_text" id="search_text">';
		                //						if(fieldobj.user && fieldobj.user != ""){
		                //							for(var k in fieldobj.user){
		                //								if(fieldobj.currentid.value == k){
		                //									var userselected = "selected";
		                //								}else{
		                //									var userselected = "";
		                //								}
		                //								opts += '<option value="'+k+'" '+userselected+'>'+
		                //											''+fieldobj.user[k]+'</option>';
		                //							}
		                //						}
		                //						opts += '</select>';
		                var seltuserfld = 'search_text';
		                var opts = '<div class="chzn-select-div">' +
										'<a href="javascript:ShowSeltUser_click(\'' + seltuserfld + '\');" class="chzn-single" tabindex="-1">' +
											'<span id="' + seltuserfld + '_name">' + fieldobj.currentname.value + '</span>' +
											'<input type="hidden" name="' + seltuserfld + '" id="' + seltuserfld + '" value="' + fieldobj.currentid.value + '" />' +
											'<div>' +
												'<b/>' +
											'</div>' +
										'</a>' +
										'<div class="chzn-userlist-div" id="' + seltuserfld + '_div">' +
											'<input type="text" name="' + seltuserfld + '_text" id="' + seltuserfld + '_text" ' +
												'onkeydown="javascript:if(event.keyCode==13) return false;" ' +
												'class="chzn-search" onKeyUp="SearchSmownerUser(\'' + seltuserfld + '\',\'' + fieldobj.currentid.value + '\',this)">' +
											'<div id="' + seltuserfld + '_info_div" style="overflow-y:auto;max-height:300px;height:300px;">' +
											'</div>' +
										'</div>' +
										'<div id="' + seltuserfld + '_bind_div" style="display: none;"></div>' +
									'</div>';
		                setSmownerUserOpts(seltuserfld, fieldobj.currentid.value);
		                fvalhtml = opts;
		            }
		        }
		        if (fvalhtml == '') {
		            if (fcoolhid.value == "2") {
		                fldvalue = '';
		            } else {
		                fcoolhid.value = "2";
		            }
		            fvalhtml = '<input name="search_text" id="search_text" type="text" class="txtBox" ' +
								'style="width:120px" value="' + fldvalue + '" ' +
								'onkeydown="javascript:if(event.keyCode==13) callSearch(\'Basic\')">';
		        }
		        alert(fvalhtml);
		        document.getElementById("searchtextdiv").innerHTML = fvalhtml;
		    }
		}
	);
}
function FieldsUpopts(obj,fvaldiv){
	if(obj.value.indexOf("\'") > 0){
		var fieldobj = obj.value.split("\\'");
		var field = fieldobj[1].split(".");
	}else{
		var field = obj.value.split(".");
	}
	var fldvalue = document.getElementById("srchvalhid"+fvaldiv+"").value;
	var urlstring = "&tables="+field[0]+"&field="+field[1]+"&fldvalue="+fldvalue+"";
	new Ajax.Request(
		'index.php',
		{queue: {position: 'end', scope: 'command'},
			method: 'post',
			postBody: 'module=Home&action=HomeAjax&file=getFieldInput&ajax=true'+urlstring,
			onComplete: function(response) {
				var result = trim(response.responseText);
				var fcoolhid = document.getElementById("fcoolhid");
				var fvalhtml = '';
				if(result.indexOf('\r\n\r\n\r\n\r') != -1){
					result = result.split('\r\n\r\n\r\n\r');
					result = result[1];
				}
				if(result != ''){
					var fieldobj = eval('('+ result +')')?eval('('+ result +')'):JSON.parse(result);
					if(fieldobj.uitype == "opts"){//opts
						var opts = '';
						if(fieldobj.field && fieldobj.field != ""){
							opts += '<input type="checkbox" onclick="toggleSelect(this.checked,\'Srch_value'+fvaldiv+'[]\')">'+alert_arr.ALL_SELECTED;
							for(var k in fieldobj.field){
								if(fieldobj.field[k].selected.value == 'selected'){
									var checkedstr = "checked";
								}else{
									var checkedstr = "";
								}
								opts += '<input type="checkbox" name="Srch_value'+fvaldiv+'[]" '+
											'id="Srch_value'+fvaldiv+'[]" value="'+fieldobj.field[k].colkey.value+'" '+
											''+checkedstr+'>'+fieldobj.field[k].colvalue.value+''+
											'&nbsp;&nbsp;';
							}
						}
						fvalhtml = opts;
						fvalhtml += '<input type="hidden" name="srchuitype'+fvaldiv+'" value="'+fieldobj.uitype+'">';
					}else if(fieldobj.uitype == "date"){//date
						var datehtml = '<input name="firstdate'+fvaldiv+'" id="jscal_field_firstdate'+fvaldiv+'" type="text" '+
									'style="border:1px solid #bababa;" size="11" maxlength="15" value="'+fieldobj.firstdate.value+'">&nbsp;'+
									'<i class="icon-calendar pure-icon-bu crm-bu-style" '+
										'onclick="displayCalendar(\'jscal_field_firstdate'+fvaldiv+'\',this);" '+
											'style="width:50px;height:50px;cursor:pointer;font-size:14px">'+
									'</i>';
						datehtml += '&nbsp; -- &nbsp;';
						datehtml += '<input name="lastdate'+fvaldiv+'" id="jscal_field_lastdate'+fvaldiv+'" type="text" '+
									'style="border:1px solid #bababa;" size="11" maxlength="15" value="'+fieldobj.lastdate.value+'">&nbsp;'+
									'<i class="icon-calendar pure-icon-bu crm-bu-style" '+
										'onclick="displayCalendar(\'jscal_field_lastdate'+fvaldiv+'\',this);" '+
											'style="width:50px;height:50px;cursor:pointer;font-size:14px">'+
									'</i>&nbsp;';
						fvalhtml = datehtml;
						fvalhtml += '<input type="hidden" name="srchuitype'+fvaldiv+'" value="'+fieldobj.uitype+'">';
					}else if(fieldobj.uitype == "time"){//time
						var datehtml = '<input name="firsttime'+fvaldiv+'" id="jscal_field_firsttime'+fvaldiv+'" type="text" '+
									'style="border:1px solid #bababa;" size="21" maxlength="19" value="'+fieldobj.firsttime.value+'">&nbsp;'+
									'<i class="icon-calendar pure-icon-bu crm-bu-style" '+
										'onclick="displayCalendar(\'jscal_field_firsttime'+fvaldiv+'\',this,true);" '+
											'style="width:50px;height:50px;cursor:pointer;font-size:14px">'+
									'</i>';
						datehtml += '&nbsp; -- &nbsp;';
						datehtml += '<input name="lasttime'+fvaldiv+'" id="jscal_field_lasttime'+fvaldiv+'" type="text" '+
									'style="border:1px solid #bababa;" size="21" maxlength="19" value="'+fieldobj.lasttime.value+'">&nbsp;'+
									'<i class="icon-calendar pure-icon-bu crm-bu-style" '+
										'onclick="displayCalendar(\'jscal_field_lasttime'+fvaldiv+'\',this,true);" '+
											'style="width:50px;height:50px;cursor:pointer;font-size:14px">'+
									'</i>&nbsp;';
						fvalhtml = datehtml;
						fvalhtml += '<input type="hidden" name="srchuitype'+fvaldiv+'" value="'+fieldobj.uitype+'">';
					}else if(fieldobj.uitype == "userid"){//userid
						var useridhtml = '<input id="searchuser'+fvaldiv+'_name" class="detailedViewTextBox" type="text" '+
											'style="padding-left:1px;" readonly="readonly" value="'+fieldobj.currentname.value+'" '+
											'name="searchuser'+fvaldiv+'_name"><input tabindex="3" '+
											'name="searchuser'+fvaldiv+'" id="searchuser'+fvaldiv+'" '+
											'value="'+fieldobj.currentid.value+'" type="hidden">';
						//useridhtml += '&nbsp;&nbsp;<input type="image" onclick="SelectUser(\'searchuser'+fvaldiv+'\');return false;" src="themes/softed/images/select.gif">';
						useridhtml += '&nbsp;&nbsp;<button class="pure-button pure-button-share pure-icon-bu" '+
										'style="width:23px;height:21px;" '+
											'onclick="SelectUser(\'searchuser'+fvaldiv+'\');return false;">'+
										'<i class="icon-share"></i></button>&nbsp;';
						fvalhtml = useridhtml;
						fvalhtml += '<input type="hidden" name="srchuitype'+fvaldiv+'" value="'+fieldobj.uitype+'">';
					}
				}
				var condition = getObj("Condition"+fvaldiv);
				if(fvalhtml == ''){
					if(fcoolhid.value == "2"){
						fldvalue = '';
					}else{
						fcoolhid.value = "2";
					}
					fvalhtml = '<input type="text" name="Srch_value'+fvaldiv+'" '+
								'value="'+fldvalue+'" class="detailedViewTextBox">';
					condition.style.display = '';
				}else{
					condition.style.display = 'none';
				}
				document.getElementById("srchvaldiv"+fvaldiv+"").innerHTML = fvalhtml;
			}
		}
	);
}

function SelectUser(field){
	var fldvalue = getObj(field).value;
	window.open('index.php?module=Users&action=PopupSelectUser&field='+field+'&fldvalue='+fldvalue,'test3123123','width=600,height=400,resizable=1,scrollbars=1');
}

/**
 * Batch Reset Share
 */
function BatchReShare(modulename){
	var idstring = '';var xx = 0;
	Jquery("[name=selected_id]").each(function(key,obj){
		if(Jquery(obj).prop("checked")){
			if(idstring && idstring != ""){
				idstring += ","+Jquery(obj).val();
			}else{
				idstring = Jquery(obj).val();
			}
			xx ++;
		}
	});
	if(idstring == ""){
		alert(alert_arr.SELECT);return false;
	}
	if(xx > 10){
		//alert(xx);return false;
	}
	var urlstring = "&modulename="+modulename+"&idstring="+idstring+"";
	Jquery.ajax({
		url: "index.php",
		data: "module=Users&action=UsersAjax&file=BatchReShare"+urlstring,
		success:function(rest){
			if(rest != ""){
				Jquery("#batchreshareContent").html(rest);
				ShowLockDiv("batchresharediv");
			}
		},error:function(){
			alert('Null');
		}
	});
}
function resetshareall_click(obj){
	Jquery("[name=resetshare_id]").each(function(key,chec){
		Jquery(chec).prop("checked",Jquery(obj).prop("checked"));
	});
}
function ResetShareSave(modulename){
	var idstring = '';
	Jquery("[name=resetshare_id]").each(function(key,chec){
		if(Jquery(chec).prop("checked") == true){
			if(idstring && idstring != ""){
				idstring += ","+Jquery(chec).val();
			}else{
				idstring = Jquery(chec).val();
			}
		}
	});
	if(idstring == ""){
		alert(alert_arr.SELECT);return false;
	}
	var urlstring = "&modulename="+modulename+"&idstring="+idstring+"";
	urlstring += "&setype=resetshare";
	Jquery("#status").css("display","inline");
	Jquery.ajax({
		url: "index.php",
		data: "module=Users&action=UsersAjax&file=BatchReShare"+urlstring,
		success:function(rest){
			Jquery("#status").css("display","none");
			CloseLockDiv("batchresharediv");
			if(rest > 0){
				getListViewEntries_js(modulename,'start='+rest+'');
			}
		},error:function(){
			alert('Null');
		}
	});
}