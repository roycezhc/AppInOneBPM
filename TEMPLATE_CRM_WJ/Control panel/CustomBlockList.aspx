<%@ Page Language="C#" MasterPageFile="Themes_CRM.master" AutoEventWireup="true"
    CodeFile="CustomBlockList.aspx.cs" Inherits="TEMPLATE_CRM_WJ_Controlpanel_CustomBlockList" %>

<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <input id="hidCond" type="hidden" runat="server" />
    <td class="detail-content-td">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td valign="top">
                        <div class="detail-panel-div">
                            <%-- <script language="JavaScript" type="text/javascript" src="include/js/customview.js"></script>--%>
                       
                            <script language="javascript">
                                function getCustomBlockList(customField, isfirst) {
                                    if (isfirst > 0) {

                                        var moduleid = customField.options[customField.options.selectedIndex].value;
                                        document.getElementById("savebutton").setAttribute("onclick", "getCreateCustomBlockForm('4','','','','');return false;");
                                    }
                                    else
                                  { var moduleid = 2; }
                                 
                                    new Ajax.Request(
		                            'index.aspx',
		                            { queue: { position: 'end', scope: 'command' },
		                                method: 'post',
		                                postBody: 'module=Settings&action=SettingsAjax&file=CustomBlockList&fld_module=' + moduleid + '&parenttab=Settings&ajax=true',
		                                onComplete: function (response) {
		                                    $("cfList").innerHTML = response.responseText;
		                                }
		                            }
	                            );
                                }
                                var editblock = "编辑显示区域";
                                var addblock = "新增显示区域";

                                function deleteCustomBlock(blockid, fld_module) {
                                    if (confirm(alert_arr.SURE_TO_DELETE)) {
                                        document.form.action = "index.aspx?module=Settings&action=DeleteCustomBlock&fld_module=" + fld_module + "&blockid=" + blockid;
                                        document.form.submit();
                                    }
                                }

                                function getCreateCustomBlockForm(customModule, blockid, tabid, label, order) {
                                    var modulename = Jquery("#pick_module").val();
                                    new Ajax.Request(
		                                    'index.aspx',
		                                    { queue: { position: 'end', scope: 'command' },
		                                        method: 'post',
		                                        postBody: 'module=Settings&action=SettingsAjax&file=CreateCustomBlock&fld_module=' + modulename + '&parenttab=Settings&ajax=true&blockid=' + blockid + '&tabid=' + tabid + '&label=' + label + '&order=' + order,
		                                        onComplete: function (response) {
		                                            $("createblockContent").innerHTML = response.responseText;
		                                            if (blockid > 0) {
		                                                Jquery("#block-title").html(" &nbsp;" + editblock);
		                                            } else {
		                                                Jquery("#block-title").html(" &nbsp;" + addblock);
		                                            }
		                                            ShowLockDiv('editdiv');
		                                            try {
		                                                var test = document.getElementById('editdiv');
		                                                test.style.cssText = 'left: 550px;top: 200px; z-index: 10001;';
		                                            }
		                                            catch (Error) {
		                                                alert(Error)
		                                            }
		                                        }
		                                    }
	                                    );
                                }

                                function makeFieldSelected(oField, fieldid) {
                                    if (gselected_fieldtype != '') {
                                        $(gselected_fieldtype).className = 'customMnu';
                                    }
                                    oField.className = 'customMnuSelected';
                                    gselected_fieldtype = oField.id;
                                    selFieldType(fieldid)
                                    document.getElementById('selectedfieldtype').value = fieldid;
                                }
                                var gselected_fieldtype = '';
                                function validate_block() {
                                    if (document.addtodb.label.value == "") {
                                        alert(alert_arr.BLOCK_LABEL_IS_NULL);
                                        document.addtodb.label.focus();
                                        return false;
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
                        
                                getCustomBlockList(Jquery("#pick_module"),0);
                            

                            </script>
                            <!-- <div id="createblock" style="display:block;position:absolute;width:500px;"></div> -->
                            <%--<div id="createblock" class="windLayerDiv" style="display: none; width: 300px; left: 550px;
                                top: 200px;">
                               
                                <table width="100%" border="0" cellpadding="3" cellspacing="0" class="windLayerHeadingULine">
                                    <tbody>
                                        <tr class="windLayerHeadingTr">
                                            <td class="windLayerHeading" align="left" width="80%" style="cursor: move" id="block-title">
                                                &nbsp;&nbsp;新增显示区域
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td align="right">
                                                <input class="windLayerBtclose" type="button" title="关闭" onclick="CloseLockDiv('createblock');">&nbsp;
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                               
                                <table border="0" cellspacing="0" cellpadding="5" width="95%" align="center">
                                    <tbody>
                                        <tr>
                                            <td class="small">
                                                <!-- popup specific content fill in starts -->
                                                <div id="createblockContent">
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                <script>
                                    WindLayerDrag("createblock", 'windLayerHeading');
                                </script>
                            </div>--%>
                            <br>
                            <!-- DISPLAY -->
                            <b><font color="red"></font></b>
                            <table class="settingsSelUITopLine" border="0" cellpadding="5" cellspacing="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td rowspan="2" valign="top" width="50">
                                            <img src="admin_files/blocklist.gif" alt="Users" title="Users" border="0" height="48"
                                                width="48">
                                        </td>
                                        <td class="heading2" valign="bottom">
                                            <b><a href="index.aspx?module=Settings&amp;action=index&amp;parenttab=Settings">控制面板</a>
                                                &gt; 显示区域</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="small" valign="top">
                                            模块的详细信息和编辑信息包括若干显示区域，显示区域的上下显示顺序由显示顺序决定。
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table border="0" cellpadding="10" cellspacing="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table class="tableHeading" border="0" cellpadding="5" cellspacing="0" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td class="small" align="left">
                                                            <b>选择模块:</b>
                                                            <select name="pick_module" id="pick_module" onchange="getCustomBlockList(this,1)">
                                                                <%=selected %>
                                                                <%--<option value="Accounts" selected="">客户</option>
                                                                <option value="Contacts">联系人</option>--%>
                                                            </select>
                                                            <strong>显示区域</strong>
                                                        </td>
                                                        <td align="right">
                                                            <button class="pure-button pure-button-success" title="新建显示区域" accesskey="S" name="savebutton"
                                                                id="savebutton" onclick="getCreateCustomBlockForm('2','','','','');return false;">
                                                                <i class="icon-plus"></i>新建显示区域
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div id="cfList">
                                                <%--  <form action="index.aspx" method="post" name="form">
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
                                                </form>--%>
                                            </div>
                                            <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td class="small" align="right" nowrap="nowrap">
                                                            <a href="#top">[上]</a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- End of Display -->
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </td>
</asp:Content>
