/*********************************************************************************

** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ********************************************************************************/
function set_return(account_id, account_name) {
        window.opener.document.EditView.parent_name.value = account_name;
        window.opener.document.EditView.parent_id.value = account_id;
		window.opener.document.EditView.parent_name.focus();
}
function set_return_specific(account_id, account_name) {
        
        //getOpenerObj used for DetailView 
	if(document.getElementById('from_link').value != '')
	{
		var fldName = window.opener.document.QcEditView.account_name;
		var fldId = window.opener.document.QcEditView.account_id;
	}else
	{	
		var fldName = window.opener.document.EditView.account_name;
		var fldId = window.opener.document.EditView.account_id;
	}
	fldName.value = account_name;
	fldId.value = account_id;
    
	if(window.opener.setAccountInfo != undefined) {
		window.opener.setAccountInfo(account_id);
	}
	///Field Rule
	if(window.opener.set_flsrules_module_info != undefined) {
		var relyonmod = window.opener.document.EditView.module.value;
		var controlmod = document.selectall.pmodule.value;
		window.opener.set_flsrules_module_info(relyonmod,controlmod,account_id);
	}
	if(window.opener.updateContactOpts) window.opener.updateContactOpts();
}
function add_data_to_relatedlist(entity_id,recordid) {

        opener.document.location.href="index.php?module=Emails&action=updateRelations&destination_module=Accounts&entityid="+entity_id+"&parid="+recordid;
}
function set_return_formname_specific(formname,product_id, product_name) {
	window.opener.document.EditView1.account_name.value = product_name;
	window.opener.document.EditView1.account_id.value = product_id;
		///Field Rule
	if(window.opener.set_flsrules_module_info != undefined) {
		var relyonmod = window.opener.document.EditView.module.value;
		var controlmod = document.selectall.pmodule.value;
		window.opener.set_flsrules_module_info(relyonmod,controlmod,product_id);
	}
	if(window.opener.updateContactOpts) window.opener.updateContactOpts();
}
function set_return_address(account_id, account_name, bill_street, ship_street, bill_city, ship_city, bill_state, ship_state, bill_code, ship_code, bill_country, ship_country,bill_pobox,ship_pobox) {
        window.opener.document.EditView.account_name.value = account_name;
        window.opener.document.EditView.account_id.value = account_id;
		//回调
		if(window.opener.setAccountInfo != undefined) {
			window.opener.setAccountInfo(account_id);
		}
		
		///Field Rule
		if(window.opener.set_flsrules_module_info != undefined) {
			var relyonmod = window.opener.document.EditView.module.value;
			var controlmod = document.selectall.pmodule.value;
			window.opener.set_flsrules_module_info(relyonmod,controlmod,account_id);
		}
		//联系人
		if(window.opener.updateContactOpts) window.opener.updateContactOpts();
		//changed by dingjianting on 2006-12-25 for related accounts not specific address
		/*
		if(window.opener.document.EditView.ship_street != undefined) {
			window.opener.document.EditView.ship_street.value = ship_street;
		}
		if(window.opener.document.EditView.ship_city != undefined) {
			window.opener.document.EditView.ship_city.value = ship_city;
		}
		if(window.opener.document.EditView.ship_state != undefined) {
			window.opener.document.EditView.ship_state.value = ship_state;
		}
		if(window.opener.document.EditView.ship_code != undefined) {
			window.opener.document.EditView.ship_code.value = ship_code;
		}
		if(window.opener.document.EditView.ship_country != undefined) {
			window.opener.document.EditView.ship_country.value = ship_country;
		}
		if(window.opener.document.EditView.ship_pobox != undefined) {
			window.opener.document.EditView.ship_pobox.value = ship_pobox;
		}

		if(window.opener.document.EditView.bill_street != undefined) {
			window.opener.document.EditView.bill_street.value = bill_street;
		}
		if(window.opener.document.EditView.bill_city != undefined) {
			window.opener.document.EditView.bill_city.value = bill_city;
		}
		if(window.opener.document.EditView.bill_state != undefined) {
			window.opener.document.EditView.bill_state.value = bill_state;
		}
		if(window.opener.document.EditView.bill_code != undefined) {
			window.opener.document.EditView.bill_code.value = bill_code;
		}
		if(window.opener.document.EditView.bill_country != undefined) {
			window.opener.document.EditView.bill_country.value = bill_country;
		}
		if(window.opener.document.EditView.bill_pobox != undefined) {
			window.opener.document.EditView.bill_pobox.value = bill_pobox;
		}
		*/
}
//added to populate address
function set_return_contact_address(account_id, account_name, bill_street, ship_street, bill_city, ship_city, bill_state, ship_state, bill_code, ship_code, bill_country, ship_country,bill_pobox,ship_pobox ) {
        window.opener.document.EditView.account_name.value = account_name;
        window.opener.document.EditView.account_id.value = account_id;
		
		//回调
		if(window.opener.setAccountInfo != undefined) {
			window.opener.setAccountInfo(account_id);
		}
		///Field Rule
		if(window.opener.set_flsrules_module_info != undefined) {
			var relyonmod = window.opener.document.EditView.module.value;
			var controlmod = document.selectall.pmodule.value;
			window.opener.set_flsrules_module_info(relyonmod,controlmod,account_id);
		}
		//联系人
		if(window.opener.updateContactOpts) window.opener.updateContactOpts();	
//		if(window.opener.document.EditView.mailingstreet != undefined) {
//			window.opener.document.EditView.mailingstreet.value = bill_street;
//		}
//		if(window.opener.document.EditView.otherstreet != undefined) {
//			window.opener.document.EditView.otherstreet.value = ship_street;
//		}
//		if(window.opener.document.EditView.mailingcity != undefined) {
//			window.opener.document.EditView.mailingcity.value = bill_city;
//		}
//		if(window.opener.document.EditView.othercity != undefined) {
//			window.opener.document.EditView.othercity.value = ship_city;
//		}
//		if(window.opener.document.EditView.mailingstate != undefined) {
//			window.opener.document.EditView.mailingstate.value = bill_state;
//		}
//		if(window.opener.document.EditView.otherstate != undefined) {
//			window.opener.document.EditView.otherstate.value = ship_state;
//		}
//		if(window.opener.document.EditView.mailingzip != undefined) {
//			window.opener.document.EditView.mailingzip.value = bill_code;
//		}
//		if(window.opener.document.EditView.otherzip != undefined) {
//			window.opener.document.EditView.otherzip.value = ship_code;
//		}
//		if(window.opener.document.EditView.mailingcountry != undefined) {
//			window.opener.document.EditView.mailingcountry.value = bill_country;
//		}
//		if(window.opener.document.EditView.othercountry != undefined) {
//			window.opener.document.EditView.othercountry.value = ship_country;
//		}
//		if(window.opener.document.EditView.mailingpobox != undefined) {
//			window.opener.document.EditView.mailingpobox.value = bill_pobox;
//		}
//		if(window.opener.document.EditView.otherpobox != undefined) {
//			window.opener.document.EditView.otherpobox.value = ship_pobox;
//		}
}

function set_return_forCall_address(account_id, account_name, bill_street, ship_street, bill_city, ship_city, bill_state, ship_state, bill_code, ship_code, bill_country, ship_country,bill_pobox,ship_pobox ) {
        window.opener.document.EditView.account_name.value = account_name;
        window.opener.document.EditView.account_id.value = account_id;
		window.opener.showDefaultAccountCall();
}

//added by rdhital/Raju for emails
function submitform(id){
		document.massdelete.entityid.value=id;
		document.massdelete.submit();
}	

function searchMapLocation(addressType)
{
        var mapParameter = '';
        if (addressType == 'Main')
        {
		if(fieldname.indexOf('bill_street') > -1)
                        mapParameter = document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('bill_street')]).innerHTML+' ';
                if(fieldname.indexOf('bill_pobox') > -1)
                        mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('bill_pobox')]).innerHTML+' ';
                if(fieldname.indexOf('bill_city') > -1)
                        mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('bill_city')]).innerHTML+' ';
		if(fieldname.indexOf('bill_state') > -1)
                        mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('bill_state')]).innerHTML+' ';
                if(fieldname.indexOf('bill_country') > -1)
                        mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('bill_country')]).innerHTML+' ';
                if(fieldname.indexOf('bill_code') > -1)
                        mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('bill_code')]).innerHTML+' ';
        }
        else if (addressType == 'Other')
        {
		if(fieldname.indexOf('ship_street') > -1)
                        mapParameter = document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('ship_street')]).innerHTML+' ';
                if(fieldname.indexOf('ship_pobox') > -1)
                        mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('ship_pobox')]).innerHTML+' ';
                if(fieldname.indexOf('ship_city') > -1)
                        mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('ship_city')]).innerHTML+' ';
                if(fieldname.indexOf('ship_state') > -1)
                        mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('ship_state')]).innerHTML+' ';
		if(fieldname.indexOf('ship_country') > -1)
                        mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('ship_country')]).innerHTML+' ';
                if(fieldname.indexOf('bill_code') > -1)                                                                                            mapParameter = mapParameter + document.getElementById("dtlview_"+fieldlabel[fieldname.indexOf('ship_code')]).innerHTML+' ';

        }
	 window.open('http://maps.google.com/maps?q='+mapParameter,'goolemap','height=450,width=700,resizable=no,titlebar,location,top=200,left=250');
}
//javascript function will open new window to display traffic details for particular url using alexa.com
function getRelatedLink()
{
	var param='';
	param = getObj("website").value;
	window.open('http://www.alexa.com/data/details/traffic_details?q=&url='+param,'relatedlink','height=400,width=700,resizable=no,titlebar,location,top=250,left=250');
}

/*
* javascript function to populate fieldvalue in account editview
* @param id1 :: div tag ID
* @param id2 :: div tag ID
*/
function populateData(id1,id2)
{
	document.EditView.description.value = document.getElementById('summary').innerHTML;
	document.EditView.employees.value = getObj('emp').value;
	document.EditView.website.value = getObj('site').value;
	document.EditView.phone.value = getObj('Phone').value;
	document.EditView.fax.value = getObj('Fax').value;
	document.EditView.bill_street.value = getObj('address').value;
	
	showhide(id1,id2);
}
/*
* javascript function to show/hide the div tag
* @param argg1 :: div tag ID
* @param argg2 :: div tag ID
*/
function showhide(argg1,argg2)
{
        var x=document.getElementById(argg1).style;
	var y=document.getElementById(argg2).style;
        if (y.display=="none")
        {
                y.display="block"
		x.display="none"

        }
}

// JavaScript Document

if (document.all) var browser_ie=true
else if (document.layers) var browser_nn4=true
else if (document.layers || (!document.all && document.getElementById)) var browser_nn6=true

function getObj(n,d) {
  var p,i,x;
  if(!d)d=document;
  if((p=n.indexOf("?"))>0&&parent.frames.length) {d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all)x=d.all[n];
  for(i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++)  x=getObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n);
  return x;
}


function findPosX(obj) {
        var curleft = 0;
        if (document.getElementById || document.all) {
                while (obj.offsetParent) { curleft += obj.offsetLeft; obj = obj.offsetParent;}
        }
        else if (document.layers) { curleft += obj.x; }
        return curleft;
}


function findPosY(obj) {
        var curtop = 0;
        if (document.getElementById || document.all) {
                while (obj.offsetParent) { curtop += obj.offsetTop; obj = obj.offsetParent; }
        }
        else if (document.layers) {curtop += obj.y;}
        return curtop;
}

ScrollEffect = function(){ };
ScrollEffect.lengthcount=202;
ScrollEffect.closelimit=0;
ScrollEffect.limit=0;


function just(){
        ig=getObj("company");
        if(ScrollEffect.lengthcount > ScrollEffect.closelimit ){closet();return;}
        ig.style.display="block";
        ig.style.height=ScrollEffect.lengthcount+'px';
        ScrollEffect.lengthcount=ScrollEffect.lengthcount+10;
        if(ScrollEffect.lengthcount < ScrollEffect.limit){setTimeout("just()",25);}
        else{ getObj("innerLayer").style.display="block";return;}
}

function closet(){
        ig=getObj("company");
        getObj("innerLayer").style.display="none";
        ScrollEffect.lengthcount=ScrollEffect.lengthcount-10;
        ig.style.height=ScrollEffect.lengthcount+'px';
        if(ScrollEffect.lengthcount<20){ig.style.display="none";return;}
        else{setTimeout("closet()", 25);}
}


function fnDown(obj){
        var tagName = document.getElementById(obj);
        document.EditView.description.value = document.getElementById('summary').innerHTML;
        document.EditView.employees.value = getObj('emp').value;
        document.EditView.website.value = getObj('site').value;
        document.EditView.phone.value = getObj('Phone').value;
        document.EditView.fax.value = getObj('Fax').value;
        document.EditView.bill_street.value = getObj('address').value;
        if(tagName.style.display == 'none')
                tagName.style.display = 'block';
        else
                tagName.style.display = 'none';
}

function set_return_todo(product_id, product_name) {
        window.opener.document.createTodo.task_parent_name.value = product_name;
        window.opener.document.createTodo.task_parent_id.value = product_id;
}
var flag = false;

function check_duplicate() {
	flag = formValidate();
	if(flag) {
		check_duplicate_ajax();
	}
}

function getFormQueryString()    //frmID是表单的ID号，请在表单form中先命名一个ID号
 {
   //  var frmID=document.getElementById(frmID);
  var frmID = window.document.EditView;
     var i,queryString = "", and = "";
     var item;
     var itemValue;
     for( i=0;i<frmID.length;i++ )
     {
		   item = frmID[i];
           if ( item.name!='' )
           {
                  if ( item.type == 'select-one' )
                  {
						if(item.options.length == 0){
							  continue;    
						}
						itemValue = item.options[item.selectedIndex].value;
                  }
                  else if ( item.type=='checkbox' || item.type=='radio')
                  {
                         if ( item.checked == false )
                         {
                                continue;    
                         }
                         itemValue = item.value;
                  }
                  else if ( item.type == 'button' || item.type == 'submit' || item.type == 'reset' || item.type == 'image')
                  {
                         continue;
                  }
                  else
                  {
                         itemValue = item.value;
                  }
				  if(itemValue == ''){
						continue;
				  }
                  //itemValue = escape(itemValue);
                  queryString += and + item.name + '=' + itemValue;
                  and="&";
           }
     }
     return queryString;
 }

function check_duplicate_ajax()
{
	var queryString = getFormQueryString();
	var accountname = window.document.EditView.accountname.value;
	var record = window.document.EditView.record.value;
	new Ajax.Request(
                'index.php',
                {queue: {position: 'end', scope: 'command'},
                        method: 'post',
                        postBody: queryString+'&file=Save&ajax=true&dup_check=true',
                        onComplete: function(response) {
		                    var result = trim(response.responseText);
							if(result.indexOf('SUCCESS') > -1) {
								    //disable save button
									var buttonsave = $$('.save');
									var count = buttonsave.length;
									for(var i=0;i<count;i++){
										buttonsave[i].disabled = "disabled";
									}
									document.EditView.submit();
							}
							else {
										alert(result);
							}
						}
                }
        );
}

function check_data_submit(){
	check_duplicate_ajax();
}

function callCreateAccountDiv()
{
	new Ajax.Request(
		'index.php',
		{queue: {position: 'end', scope: 'command'},
			method: 'post',
			postBody: 'module=Accounts&action=AccountsAjax&file=CreateAccount',
			onComplete: function(response) {
				$("createaccount_div").innerHTML=response.responseText;
				response.responseText.evalScripts();
				eval($("accountjs").innerHTML);
				
			}
		}
	);
}

function created(form)
{	    
			
			var accountname = form.accountname.value;
			var email = form.email.value;
			var phone = form.phone.value;
			if (accountname == "")
			{
				alert(alert_arr.ACCOUNTNAME_CANNOT_EMPTY);
				form.accountname.focus();
				return false;
			}
			if (email == "" && phone == "")
			{
				alert(alert_arr.PHONE_OR_EMAIL_IS_NULL);
				form.phone.focus();
				return false;
			}
			if(email != "") {
				if(!patternValidate("email","Email","email")) {
					form.email.focus();
					return false;
				}
			}
			$("status").style.display="inline";
			new Ajax.Request(
          	  	      'index.php',
			      	{queue: {position: 'end', scope: 'command'},
		                        method: 'post',
                		        postBody:"module=Accounts&action=AccountsAjax&file=SaveAccount&ajax=true&accountname="+ accountname + "&email1="+email+"&phone=" + phone,
		                        onComplete: function(response) {
				                        res = response.responseText;
										var result = eval('('+ res +')')?eval('('+ res +')'):JSON.parse(res);
	                        	        if(result.res == 'REPEAT') {
											$("status").style.display="none";											
											alert(result.value);										
										} else {
											$("status").style.display="none";
											hide('accountLay');
											if(window.opener.document.EditView.account_name != undefined) {
												window.opener.document.EditView.account_name.value=accountname;
												window.opener.document.EditView.account_id.value=result.value;											
											}
											window.close();
										}
		                        }
              			 }
       		);

}

function copyAddressRight(form) {
	if(form.ship_street != undefined && form.bill_street != undefined) {
		form.ship_street.value = form.bill_street.value;
	}
	if(form.ship_city != undefined && form.bill_city != undefined) {
		form.ship_city.value = form.bill_city.value;
	}
	if(form.ship_state != undefined && form.bill_state != undefined) {
		form.ship_state.value = form.bill_state.value;
	}
	if(form.ship_code != undefined && form.bill_code != undefined) {
		form.ship_code.value = form.bill_code.value;
	}
	if(form.ship_country != undefined && form.bill_country != undefined) {
		form.ship_country.value = form.bill_country.value;
	}
	if(form.ship_pobox != undefined && form.bill_pobox != undefined) {
		form.ship_pobox.value = form.bill_pobox.value;
	}
	return true;
}

function copyAddressLeft(form) {
	if(form.bill_street != undefined && form.ship_street != undefined) {
		form.bill_street.value = form.ship_street.value;
	}
	if(form.bill_city != undefined && form.ship_city != undefined) {
		form.bill_city.value = form.ship_city.value;
	}
	if(form.bill_state != undefined && form.ship_state != undefined) {
		form.bill_state.value = form.ship_state.value;
	}
	if(form.bill_code != undefined && form.ship_code != undefined) {
		form.bill_code.value = form.ship_code.value;
	}
	if(form.bill_country != undefined && form.ship_country != undefined) {
		form.bill_country.value = form.ship_country.value;
	}
	if(form.bill_pobox != undefined && form.ship_pobox != undefined) {
		form.bill_pobox.value = form.ship_pobox.value;
	}
	return true;

}

function readmsg(msgid,localname,folder) {
	location = 'index.php?module=Webmails&action=readmsg&sid=0bb71602556532a41037294b5ee6d62c&tid=1&lid=cn&retid=29465&folder='+encodeURIComponent(folder)+'&pag=1&localname='+localname+ '&msgid='+msgid; 
}


function ajaxCheckAccount(){
	window.document.EditView.action.value='Save';
    var queryString = getFormQueryString();
	var accountname = window.document.EditView.accountname.value;
	var record = window.document.EditView.record.value;
	new Ajax.Request(
		'index.php',
		{queue: {position: 'end', scope: 'command'},
				method: 'post',
				postBody: queryString+'&file=Save&ajax=true&dup_check=true',
				onComplete: function(response) {
					var result = trim(response.responseText);
					if(result.indexOf('SUCCESS') > -1) {
						alert('没有发现重复!');
					}else {
						alert(result);
					}
				}
		}
    );
}


function BatchfnDropDown(obj,Lay){
    var tagName = document.getElementById(Lay); 
	if(typeof tagName == 'undefined') {
		return;
	}
    var leftSide = findPosX(obj);
    var topSide = findPosY(obj);
    var maxW = tagName.style.width;
    var widthM = maxW.substring(0,maxW.length-2);
    var getVal = eval(leftSide) + eval(widthM);
    if(getVal  > document.body.clientWidth ){
        leftSide = eval(leftSide) - eval(widthM);
        tagName.style.left = leftSide - 10 + 'px';
    }
    else
        tagName.style.left= leftSide - 10 + 'px';
    tagName.style.top= '20px';
	tagName.style.display = 'block';
 }

function BatchfnShowDrop(obj){
	document.getElementById(obj).style.display = 'block';
}

function BatchfnHideDrop(obj){
	document.getElementById(obj).style.display = 'none';
}
function findPosX(obj) {
	var curleft = 0;
	if (document.getElementById || document.all) {
		while (obj.offsetParent) {
			curleft += obj.offsetLeft
			obj = obj.offsetParent;
		}
	} else if (document.layers) {
		curleft += obj.x;
	}
	return curleft;
}

function qunfa_sms(obj,divid,module) {
	var select_options  =  document.getElementsByName('selected_id');
	var x = select_options.length;
	idstring = "";xx = 0;
	for(i = 0; i < x ; i++){
		if(select_options[i].checked){
			idstring = select_options[i].value +";"+idstring
			xx++
		}
	}
	if (xx != 0){
		document.getElementById('idlist').value=idstring;
		location.href='index.php?module=Qunfas&action=ListView&idstring='+idstring+'&modulename='+module;
	}else{
		alert(alert_arr.SELECT);
		return false;
	}
}

function qunfa_mail(obj,divid,module) {
	var select_options  =  document.getElementsByName('selected_id');
	var x = select_options.length;
	idstring = "";xx = 0;
	for(i = 0; i < x ; i++){
		if(select_options[i].checked){
			idstring = select_options[i].value +";"+idstring
			xx++
		}
	}
	if (xx != 0){
		document.getElementById('idlist').value=idstring;
		location.href='index.php?module=Maillists&action=ListView&idstring='+idstring+'&modulename='+module;
	}else{
		alert(alert_arr.SELECT);
		return false;
	}
}

function ToggleGroupContent(id,imgId){
    
	var flag  = $(id).style.display;
	if (flag != "none"){ 
		$(id).hide(); 
		$(imgId).src="themes/images/expand.gif";  
	}else {
		$(id).show(); 
		$(imgId).src="themes/images/collapse.gif";
	}

}

function InAccountPool_click(){
	var select_options = document.getElementsByName('selected_id');
	var x = select_options.length;
	idstring = "";
	xx = 0;
	for (i = 0; i < x; i++) {
		if (select_options[i].checked) {
			if(idstring == ''){
				idstring = select_options[i].value;
			}else{
				idstring += ","+select_options[i].value;
			}
			xx++
		}
	}
	if (xx != 0) {
		if(!confirm("您确定要将这些客户放入客户池吗？")) return false;
		document.location.href = 'index.php?module=Accounts&action=AccountsAjax&file=setPoolAccount&accountid='+idstring+'';
	}
	else {
		alert(alert_arr.SELECT);
		return false;
	}
}
function editproducts_click(accountid,productid){
	var urlstring = 'index.php?module=Products&action=EditView';
	urlstring += '&return_module=Accounts';
	urlstring += '&return_action=DetailView';
	urlstring += '&return_id='+accountid+'';
	urlstring += '&record='+productid+'';
	Jquery("#relatedCreateList").attr("href",urlstring);
	Jquery("#relatedCreatespan").click();
}
function delproducts_click(accountid,productid){
	if(confirm(alert_arr.SURE_TO_DELETE)){
		var urlstring = "&crmid="+accountid+"";
		urlstring += "&module=Accounts";
		urlstring += "&relmodule=Products";
		urlstring += "&relcrmid="+productid+"";
		Jquery("#status").css("display","inline");
		Jquery.ajax({
			url: "index.php",
			data: "module=Accounts&action=AccountsAjax&file=deletelistRelated"+urlstring,
			success:function(rest){
				Jquery("#status").css("display","none");
				if(rest.indexOf('SUCCESS') > -1) {
					relatedload("Products");
				}else{
					alert(rest);
				}
			}
		});
	}
}
function editcampaigns_click(accountid,entityid){
	var urlstring = 'index.php?module=Campaigns&action=EditView';
	urlstring += '&return_module=Accounts';
	urlstring += '&return_action=DetailView';
	urlstring += '&return_id='+accountid+'';
	urlstring += '&record='+entityid+'';
	Jquery("#relatedCreateList").attr("href",urlstring);
	Jquery("#relatedCreatespan").click();
}
function delcampaigns_click(accountid,entityid){
	if(confirm(alert_arr.SURE_TO_DELETE)){
		var urlstring = "&crmid="+accountid+"";
		urlstring += "&module=Accounts";
		urlstring += "&relmodule=Campaigns";
		urlstring += "&relcrmid="+entityid+"";
		Jquery("#status").css("display","inline");
		Jquery.ajax({
			url: "index.php",
			data: "module=Accounts&action=AccountsAjax&file=deletelistRelated"+urlstring,
			success:function(rest){
				Jquery("#status").css("display","none");
				if(rest.indexOf('SUCCESS') > -1) {
					relatedload("Campaigns");
				}else{
					alert(rest);
				}
			}
		});
	}
}
function createMemdays_click(acountid){
	var urlstring = 'index.php?module=Memdays&action=EditView';
	urlstring += '&return_module=Accounts';
	urlstring += '&return_action=DetailView';
	urlstring += '&return_id='+acountid+'';
	urlstring += '&account_id='+acountid+'';
	Jquery("#relatedCreateList").attr("href",urlstring);
	Jquery("#relatedCreatespan").click();
}
function editmemdays_click(record,entityid){
	var urlstring = 'index.php?module=Memdays&action=EditView';
	urlstring += '&return_module=Accounts';
	urlstring += '&return_action=DetailView';
	urlstring += '&return_id='+record+'';
	urlstring += '&record='+entityid+'';
	Jquery("#relatedCreateList").attr("href",urlstring);
	Jquery("#relatedCreatespan").click();
}
function editcalendar_click(record,entityid){
	var urlstring = 'index.php?module=Calendar&action=EditView';
	urlstring += '&return_module=Accounts';
	urlstring += '&return_action=DetailView';
	urlstring += '&return_id='+record+'';
	urlstring += '&record='+entityid+'';
	Jquery("#relatedCreateList").attr("href",urlstring);
	Jquery("#relatedCreatespan").click();
}
function delcalendar_click(record,entityid){
	if(confirm(alert_arr.SURE_TO_DELETE)){
		var urlstring = "&crmid="+accountid+"";
		urlstring += "&module=Accounts";
		urlstring += "&relmodule=Calendar";
		urlstring += "&relcrmid="+entityid+"";
		Jquery("#status").css("display","inline");
		Jquery.ajax({
			url: "index.php",
			data: "module=Accounts&action=AccountsAjax&file=deletelistRelated"+urlstring,
			success:function(rest){
				Jquery("#status").css("display","none");
				if(rest.indexOf('SUCCESS') > -1) {
					relatedload("Activities");
				}else{
					alert(rest);
				}
			}
		});
	}
}