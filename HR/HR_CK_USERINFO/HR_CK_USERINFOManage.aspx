<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CK_USERINFOManage" CodeFile="HR_CK_USERINFOManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Register src="../../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
    <link href="../CheckWork/Uploadify/jquery_loadmask.css" rel="stylesheet" type="text/css" />
    <script src="../CheckWork/Uploadify/jquery_loadmask.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });

    function selStaff(me) {
        var userid = $(me).parent().parent().parent().find(".first").find("input").val();
        var txts = $(me).parent().parent().find("a");
        var stfid = txts.text();
        var result = window.showModalDialog("../STAFF/STAFFSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result != undefined && result != "") {
            var obj = eval(result);
            if (stfid != obj.ID + "[" + obj.Name + "]") {
                stfid = obj.ID;
                doUpdateCKUSERINFOStff(userid, stfid, txts, obj.ID + "[" + obj.Name + "]");
            }
        }
        return false;
    }

    function delStaff(me) {
        var userid = $(me).parent().parent().parent().find(".first").find("input").val();
        var txts = $(me).parent().parent().find("a");
        var stfid = txts.text();
        if (stfid != "" && stfid != "-") {
            if (doUpdateCKUSERINFOStff(userid, "", txts, "-"))
                txts.text("-");
        }
        return false;
    }

    function doUpdateCKUSERINFOStff(userid, stfid, txts, str) {
        $(".main").mask("正在更新员工编号...");
        var doworkurl = "DoWork.aspx?dotype=doUpdateCKUSERINFOStff&userid=" + encodeURI(userid) + "&stfid=" + encodeURI(stfid) + "&r=" + Math.random();
        var recdata = "";
        $.ajax({
            type: "GET",
            url: doworkurl,
            data: "",
            dataType: "html",
            timeout: 180000,
            success: function (data) {
                $(".main").unmask();
                alert(data);
                if (data == "操作成功")
                    txts.text(str);
            },
            error: function (a, b, c) {
                $(".main").unmask();
                if (b == "timeout") {
                    alert("更新员工编号异常，timeout！");
                }
            },
            complete: function (xht, sta) {
                $(".main").unmask();
                if (sta == "error") {
                    alert("更新员工编号异常，error！");
                }
            }
        });
    }
    function clearfindinput(me) {
        $(me).parent().parent().parent().find(".toolselascx input").val("");
    }
</script>
<style type="text/css">
        .tool .toolselascx{margin:0px; padding:0px; float:left; width:160px; text-align:left; clear:right;}
        .tool .toolselascx span{ margin:0px; padding:0px; width:100%; height:20px; line-height:20px; border: 0px none #fff; }
        .tool .toolselascx span a{line-height:22px; float:left;}
        .tool .toolselascx span .selshowinput{background-color:#fff; height:18px; width:50%; float:left; line-height:18px; border:1px solid #aad;}
        .tool .toolselascx span input.sel{border:none;background:url(../../Themes/Default/img/find.gif) center center no-repeat;height:20px;width:25px; cursor:pointer;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
         <div class="clear"></div>
       <div class="topfind">
        <dl>
               <dt>考勤机<%=HR_CK_USERINFO.Attribute.USERID.ZhName%>：</dt>
               <dd><span>
                
                    <input id="txtUSERID" type="text" runat="server" />
               </span></dd>
        </dl>
        <dl>
               <dt>考勤机员工<%=HR_CK_USERINFO.Attribute.NAME.ZhName%>：</dt>
               <dd><span>
                
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SSN.ZhName%>：</dt>
               <dd><span>
                
                    <input id="txtSSN" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl>
               <dt><%=HR_CK_USERINFO.Attribute.BADGENUMBER.ZhName%>：</dt>
               <dd><span>
                
                    <input id="txtBADGENUMBER" type="text" runat="server" />
               </span></dd>
        </dl>
        <div class="clear"></div>
        <dl>
               <dt>AIO员工标识：</dt>
               <dd><span>
                
                    <input id="txtSTAFF_ID" type="text" runat="server" />
               </span></dd>
        </dl>
        <dl>
               <dt>AIO员工<%=HR_STAFF.Attribute.STAFF_NO.ZhName%>：</dt>
               <dd><span>
                
                    <input id="txtSTAFF_NO" type="text" runat="server" />
               </span></dd>
        </dl>
        <dl>
               <dt>AIO<%=HR_STAFF.Attribute.STAFF_NAME.ZhName%>：</dt>
               <dd><span>
                
                    <input id="txtSTAFF_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
       
    <dl class="btn"><dt>&nbsp;</dt>
            <dd>
            <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" /></span>
              <span><input id="Button1" type="button" value="清空" onclick="_topFindClear(this);"/></span>
            </dd>
    </dl>
    </div>
    <div class="clear"></div>
    <div class="tool" >
        <ul style="width:400px;">
 <%--           <li><span><input power="newHR_CK_USERINFO" id="btn_New" type="button" value="新建" onclick="manager.newRecord('HR_CK_USERINFOEdit.aspx');" /></span></li>
            <li><span><input power="editHR_CK_USERINFO" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('HR_CK_USERINFOEdit.aspx');" /></span></li>
            <li><span class="btn"><input power="newHR_CK_USERINFO" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('HR_CK_USERINFOBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px; " /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="USERID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>

                    <td  style=" width:80px;" >考勤机用户ID</td><!--USERID-->

                    <td>考勤机员工姓名</td><!--BADGENUMBER-->
                    
                    <td>AIO员工信息(标识[姓名])</td><!--STAFF_ID-->

                    <td><%=HR_CK_USERINFO.Attribute.SSN._ZhName %></td><!--SSN-->
                   
                    
                    <td><%=HR_CK_USERINFO.Attribute.GENDER._ZhName %></td><!--GENDER-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.TITLE._ZhName %></td><!--TITLE-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.PAGER._ZhName %></td><!--PAGER-->
                    

                    <td><%=HR_CK_USERINFO.Attribute.ATT._ZhName %></td><!--ATT-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_CK_USERINFO)Container.DataItem).USERID%>" /></td>

                    <td><%#((HR_CK_USERINFO)Container.DataItem).USERID %></td>
                     <td><%#((HR_CK_USERINFO)Container.DataItem).NAME %></td>
                    
                    <td><%#"<a style='float:left;'>" + (((HR_CK_USERINFO)Container.DataItem).STAFF_ID > 0 ? (((HR_CK_USERINFO)Container.DataItem).STAFF_ID.ToString() + "[" + ((HR_CK_USERINFO)Container.DataItem).GetValue(HR_STAFF.Attribute.STAFF_NAME) + "]") : "-") + "</a><div style='clear:both;float:right;'><img style='text-align:right;' title='选择员工ID' onclick='selStaff(this);' src='../CheckWork/Uploadify/stff.png'><img style='text-align:right;' title='取消对应关系' onclick='delStaff(this);' src='../CheckWork/Uploadify/delete.gif'></div>"%></td>
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).SSN %></td>
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).GENDER %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).PAGER %></td>

                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).ATT %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>

    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>