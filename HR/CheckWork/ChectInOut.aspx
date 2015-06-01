<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CheckWork_ChectInOut" CodeFile="ChectInOut.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="System.Data"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/seldate.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
        tblistReSize('tblist');
    });

    function tblistReSize(meclass) {
        var tds = $("." + meclass + " table thead tr td");
        if (tds == null || tds == undefined || tds.length < 1)
            return;
        var td = tds[tds.length - 1];
        var wid = 0;
        for (var i = 0; i < tds.length - 1; i++) {
            wid += tds[i].offsetWidth;
        }
        var lasttdwid = $("." + meclass)[0].offsetWidth - wid - 2;
        if (lasttdwid <= 0) {
            td.style.display = "none";
        }
        else {
            td.style.display = "";
            td.width = lasttdwid;
        }
    }

    function dateDuibi(a, b) {
        var arr = a.split("-");
        var starttime = new Date(arr[0], arr[1], arr[2]);
        var starttimes = starttime.getTime();

        var arrs = b.split("-");
        var lktime = new Date(arrs[0], arrs[1], arrs[2]);
        var lktimes = lktime.getTime();

        if (starttimes > lktimes) {

            alert('起始时间大于结束时间。');
            return false;
        }
        else if (lktime == NaN || lktimes == NaN) {
            return false;
        }
        else
            return true;
    }


    function checkFindTime(sid, eid) {
        var isOk = false;
        try {
            var stime = $("#cphBody_" + sid).val();
            var etime = $("#cphBody_" + eid).val();
            if (stime == undefined || stime == null || stime == "" || etime == undefined || etime == null || etime == "") {
                isOk = false;
            }
            else {
                return dateDuibi(stime, etime);
            }
        }
        catch (e) {
            isOk = false;
        }
        if (!isOk) {
            alert("请正确输入起止时间！");
        }
        return isOk;
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
    
    
    .worktimeview{text-align:center;width:20px; min-width:20px;max-width:20px; border:none 0px #000; position:relative}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<input id="hidStaffid" type="hidden" runat="server" />
<input id="hidSdate" type="hidden" runat="server" />
<input id="hidEdate" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfindl" style="display:none;"><!--需要隐去时，用 style="display:none;"-->        
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul style=" width:100%;">
            <li class="toolselascx"><selStaff:wucSelStaff ID="selStaff" LeftText="员工:" SWidth="55%" runat="server" /></li>
            <li class="toolselascx"><span><a>起始时间:</a><input class="selshowinput" id="txtStartTime" type="text" runat="server" onclick="setday(this);" /></span></li>
            <li class="toolselascx"><span><a>结束时间:</a><input class="selshowinput" id="txtEndTime" type="text" runat="server" onclick="setday(this);" /></span></li>
            <li style=" float:left; text-align:left; clear:right;"><span><asp:Button ID="btnFind" Text="查询" runat="server" OnClientClick="return checkFindTime('txtStartTime','txtEndTime');" onclick="btnFind_Click"/></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead id="theadRow">
                <tr>
                   <td class="first"><input type="checkbox" onclick="_selAll(this)" /></td>
                   <td>考勤用户编号</td>
                   <td>考勤姓名</td>
                   <td>员工编号</td>
                   <td>员工工号</td>
                   <td>员工姓名</td>
                   <td>签到/签退标志</td>
                   <td>签到/签退时间</td>
                </tr>
            </thead>
            <tbody id="tbodylist">
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((V_USERCHECKINOUT)Container.DataItem).USERID %>" /></td>                            
                    <td><%#((V_USERCHECKINOUT)Container.DataItem).USERID%></td>
                    <td><%#((V_USERCHECKINOUT)Container.DataItem).NAME%></td>
                    <td><%#((V_USERCHECKINOUT)Container.DataItem).STAFF_ID%></td>
                    <td><%#((V_USERCHECKINOUT)Container.DataItem).STAFF_NO%></td>
                    <td><%#((V_USERCHECKINOUT)Container.DataItem).STAFF_NAME%></td>
                    <td><%#((V_USERCHECKINOUT)Container.DataItem).CHECKTYPE == "I" ? "签到" : "签退"%></td>
                    <td><%#((V_USERCHECKINOUT)Container.DataItem).CHECKTIME.ToString("yyyy-MM-dd HH:mm:ss")%></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="pages">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" OnPageChanged="aspPager_PageChanged">
         </WebCtrl:AspNetPager>
    </div>
    <div class="path-url hide">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
</asp:Content>


