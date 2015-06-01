<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKWORKDEVICEManage2" CodeFile="HR_CHECKWORKDEVICEManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <link href="../../CheckWork/Uploadify/jquery_loadmask.css" rel="stylesheet"  type="text/css"/>
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
 <script src="../../CheckWork/Uploadify/jquery_loadmask.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    _recordWindowWidth = 340;
    _recordWindowHeight = 220;
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });

    function selORG(me) {

        var result = window.showModalDialog("../../ORG/ORGSel.aspx?r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result == undefined || result == "") return;
        var obj = eval(result);

        var puts = $(me).parent().find("input");
        puts[1].value = obj.name;
        puts[0].value = obj.id;
    }
    function selNames(me) {
        var txt1 = $("input[id$='txtSNAME']");
        var txt2 = $("input[id$='txtRNAME']");
        if (txt1.val() == "") {
            txt1.val(me.value);
        }
        if (txt2.val() == "") {
            txt2.val(me.value);
        }
    }
    function getDivice() {
        var bodyObj = $("#tbList").find("tbody:last");
        var cks = bodyObj.find("input[type='checkbox']");

        _delByKeyIDS_Begin(bodyObj);

        var arr = new Array();
        var arrTR = new Array();
        for (var i = 0; i < cks.length; i++) {
            if (cks[i].checked == true) {
                arr.push(cks[i].value);
                arrTR.push($(cks[i]).parent().parent());
            }
        }
        if (arr.length == 0) {
            alert("请至少勾选一个设备！"); return false;
        }
        if (!confirm("您确定要获取所选设备的组织结构吗？\r\n\r\n获取后将显示在对应组织的树结构中。")) {
            return false;
        }
        $("input[id$='hidCondition']").val(arr.toString());
        $(".main").mask("<a id='maskmsg' style='display:block;width:150px; text-align:left;'>正在获取，请耐心等待......</a><script type='text/javascript'>setMaskMsg('maskmsg', '正在获取，请耐心等待');<\/script>");
        return true;
    }

    function setMaskMsg(id, str) {
        var msg = $("#" + id).text();
        if (msg.indexOf("......") != -1) {
            $("#" + id).text(str + ".");
        }
        else if (msg.indexOf(".....") != -1) {
            $("#" + id).text(str + "......");
        }
        else if (msg.indexOf("....") != -1) {
            $("#" + id).text(str + ".....");
        }
        else if (msg.indexOf("...") != -1) {
            $("#" + id).text(str + "....");
        }
        else if (msg.indexOf("..") != -1) {
            $("#" + id).text(str + "...");
        }
        else if (msg.indexOf(".") != -1) {
            $("#" + id).text(str + "..");
        }
        else {
            $("#" + id).text(str + ".");
        }

        setTimeout("setMaskMsg('" + id + "', '" + str + "')", 1000);
    }

    function showMsgMask(msg) {
        var showMsg = function () {
            $(".main").mask(msg);
            var msgdiv = $(".loadmask-msg div");
            msgdiv[0].style.background = "#fff";
            msgdiv[0].style.padding = "0px 0px 0px 0px;"
            msgdiv[0].style.cursor = "default";
        }
        setTimeout(showMsg, 100);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="HR_CHECKWORKDEVICE.DeviceID">
               <dt><%=HR_CHECKWORKDEVICE.Attribute.DeviceID.ZhName %>：</dt><!--设备ID-->
               <dd><span>
                
                    <input id="txtDeviceID" type="text" runat="server" />
               </span></dd>
               
        </dl>

            <dl colname="HR_CHECKWORKDEVICE.DeviceName">
               <dt><%=HR_CHECKWORKDEVICE.Attribute.DeviceName.ZhName %>：</dt><!--设备名称-->
               <dd><span>
                
                    <input id="txtDeviceName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <div class="clear"></div>
            <dl colname="HR_CHECKWORKDEVICE.ORG_ID">
               <dt>所属分支机构：</dt>
               <dd><span>
                <selorg:wucselorg ID="wucSelORG1" runat="server" /></span>
               </dd>
        </dl>
         
            <dl colname="HR_CHECKWORKDEVICE.USE_FLAG">
               <dt><%=HR_CHECKWORKDEVICE.Attribute.USE_FLAG.ZhName %>：</dt><!--是否启用-->
               <dd><span>
               
                    <select id="txtUSE_FLAG" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newHR_CHECKWORKDEVICE" id="btn_New" type="button" value="新建设备" onclick="manager.newRecord('HR_CHECKWORKDEVICEEdit.aspx');" /></span></li>
            <li><span><input power="editHR_CHECKWORKDEVICE" id="btn_Edit" type="button" value="编辑设备" onclick="manager.editRecord('HR_CHECKWORKDEVICEEdit.aspx');" /></span></li>
            <li><span><asp:Button power="getHR_CHECKWORKDEVICE" ID="btn_GetDivice" runat="server" Text="获取设备组织结构" OnClientClick="return getDivice();" OnClick="btn_GetDivice_Click" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('HR_CHECKWORKDEVICEBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="DeviceID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="HR_CHECKWORKDEVICEManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=HR_CHECKWORKDEVICE.Attribute.DeviceID.LongName%>',show:1}"><%=HR_CHECKWORKDEVICE.Attribute.DeviceID._ZhName %></td><!--设备ID-->

                    <td data="{colname:'<%=HR_CHECKWORKDEVICE.Attribute.DeviceName.LongName%>',show:1}"><%=HR_CHECKWORKDEVICE.Attribute.DeviceName._ZhName %></td><!--设备名称-->
                    
                    
                    <td data="{colname:'<%=HR_CHECKWORKDEVICE.Attribute.ORG_ID.LongName%>',show:1}"><%=HR_CHECKWORKDEVICE.Attribute.ORG_ID._ZhName %></td><!--分支机构标识-->

                    <td data="{colname:'<%=HR_ORG.Attribute.ORG_NAME.LongName%>',show:1}"><%=HR_ORG.Attribute.ORG_NAME._ZhName %></td><!--分支机构名称-->
                    
                    <td data="{colname:'<%=HR_CHECKWORKDEVICE.Attribute.USE_FLAG.LongName%>',show:1}"><%=HR_CHECKWORKDEVICE.Attribute.USE_FLAG._ZhName %></td><!--是否启用-->

                    <td data="{colname:'<%=HR_CHECKWORKDEVICE.Attribute.DeptTable.LongName%>',show:1}"><%=HR_CHECKWORKDEVICE.Attribute.DeptTable._ZhName %></td><!--部门表方案-->

                    <td data="{colname:'<%=HR_CHECKWORKDEVICE.Attribute.StaffTable.LongName%>',show:1}"><%=HR_CHECKWORKDEVICE.Attribute.StaffTable._ZhName %></td><!--员工表方案-->

                    <td data="{colname:'<%=HR_CHECKWORKDEVICE.Attribute.DeviceRemark.LongName%>',show:1}"><%=HR_CHECKWORKDEVICE.Attribute.DeviceRemark._ZhName %></td><!--设备备注-->
                </tr>
            </thead>
            <%-- <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            
            <td>{DeviceID}</td>
            <td>{DeviceName}</td>
            <td>{ORG_ID}</td>
            <td>{ORG_NAME}</td>
            <td>{USE_FLAG}</td>
            <td>{DeptTable}</td>
            <td>{StaffTable}</td>
            
            </tr>
            </tbody>--%>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_CHECKWORKDEVICE)Container.DataItem).DeviceID%>" /></td>
                   <%-- <td><%#showLeftLinks(((HR_CHECKWORKDEVICE)Container.DataItem).PATH, ((HR_CHECKWORKDEVICE)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).DeviceID %></td>

                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).DeviceName %></td>
                    
                    
                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).ORG_ID %></td>


                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).GetValue(HR_ORG.Attribute.ORG_NAME) %></td>
                    
                    
                    <td><%#FormHelper.GetText(HR_CHECKWORKDEVICE.Attribute.USE_FLAG, ((HR_CHECKWORKDEVICE)Container.DataItem).USE_FLAG)%></td>

                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).DeptTable %></td>

                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).StaffTable %></td>
                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).DeviceRemark %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="path-url hide">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>