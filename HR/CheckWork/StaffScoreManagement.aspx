<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CheckWork_StaffScoreManagement" CodeFile="StaffScoreManagement.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="System.Data"%>
<%@ Register src="../../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="Uploadify/jquery-1_4_2_min.js" type="text/javascript"></script>
    <link href="Uploadify/jquery_loadmask.css" rel="stylesheet" type="text/css" />
    <script src="Uploadify/jquery_loadmask.js" type="text/javascript"></script>
    <script src="../../Lib/MyDP/seldate.js" type="text/javascript"></script>
      <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager();
        $(function () {
            manager.initBodyRows();
            manager.initFindDL();
            //manager.initPageSizeEvt("txtPageNum");
            bindWinResize(40);
        });
        Date.prototype.getWeekName = function () {
            var d = this.getDay();
            var arr = ["日", "一", "二", "三", "四", "五", "六"];
            return arr[d];
        }

        function dateDuibi(a, b) {
            var arr = a.split("-");
            var starttime = new Date(arr[0], arr[1], arr[2]);
            var starttimes = starttime.getTime();

            var arrs = b.split("-");
            var lktime = new Date(arrs[0], arrs[1], arrs[2]);
            var lktimes = lktime.getTime();

            if (starttimes >= lktimes) {

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
                    isOk = dateDuibi(stime, etime);
                    if (isOk) {
                        $(".main").mask("正在生成结果！请稍后......");
                    }
                    return isOk;
                }
            }
            catch (e) {
                isOk = false;
            }
            if (!isOk) {
                alert("请正确输入起止时间！");
            }
            if (isOk) {
                $(".main").mask("正在生成结果！请稍后......");
            }
            return isOk;
        }

        function showatooltip(me) {
            var div3 = $("#tableatooltip");
            div3[0].innerHTML = $(me)[0].tag;
            div3[0].style.display = 'block';
            div3[0].style.left = event.clientX + 1;
            div3[0].style.top = event.clientY + 1;
            div3[0].style.position = "absolute";
        }

        function hideatooltip() {
            $("#tableatooltip")[0].style.display = 'none';
        }

        function clearfindinput(me) {
            $(me).parent().parent().parent().find(".toolselascx input").val("");
        }

        function outStaffScore() {
            var cd = checkFindTime('txtStartTime', 'txtEndTime');
            if (!cd)
                return;
            var sdate = $("input[id$='txtStartTime']").val();
            var edate = $("input[id$='txtEndTime']").val();
            var staffid = $("input[id$='hidStaff_ID']").val();
            var staffname = $("input[id$='txtStaff_NAME']").val();
            var deptid = $("input[id$='hidDEPT_ID']").val();
            window.open("StaffScoreOut.aspx?r=" + Math.random() + "&sdate=" + sdate + "&edate=" + edate + "&staffid=" + staffid + "&staffname=" + escape(staffname) + "&deptid=" + deptid);
            $(".main").unmask();
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
   <div class="topfindl" style="display:none;"><!--需要隐去时，用 style="display:none;"-->        
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul style=" width:100%;">
            <li class="toolselascx"><selStaff:wucSelStaff ID="selStaff" LeftText="员工:" SWidth="50%" runat="server" /></li>
            <li class="toolselascx"><uc1:wucseldept ID="selDept" LeftText="部门:" SWidth="50%" runat="server" /></li>
            <li class="toolselascx"><span><a>起始时间:</a><input class="selshowinput" id="txtStartTime" type="text" runat="server" onclick="setday(this);" /></span></li>
            <li class="toolselascx"><span><a>结束时间:</a><input class="selshowinput" id="txtEndTime" type="text" runat="server" onclick="setday(this);" /></span></li>
            <li style=" float:left; text-align:left; clear:right;"><span><asp:Button ID="btnFind" Text="查询" runat="server" OnClientClick="return checkFindTime('txtStartTime','txtEndTime');" onclick="btnFind_Click"/></span></li>
            <li style=" float:left; text-align:left; clear:right;"><span><input id="btnClear" value="清空" type="button" onclick="clearfindinput(this);"/></span></li>
            <li style=" float:left; text-align:left; clear:right;"><span><input id="btnOut" value="导出" type="button" onclick="outStaffScore();"/></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead id="theadRow">
                <tr>
                   <td class="first"><input type="checkbox" onclick="_selAll(this)" /></td>
                   <td>员工工号</td>
                   <td>员工姓名</td>
                   <td>开始时间</td>
                   <td>结束时间</td>
                   <td>任务数</td>
                   <td>自测平均值/已评任务数</td>
                   <td>直接领导打分平均值/已评任务数</td>
                   <td>间接领导打分平均值/已评任务数</td>
                   <td>完成率平均值</td>
                </tr>
            </thead>
            <tbody id="tbodylist">
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[0]:"error" %>" /></td>                            
                    <td><%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[0]:"error" %></td>
                    <td><%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[1]:"error" %></td>
                    <td><%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[2]:"error" %></td>                     
                    <td><%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[3]:"error" %></td> 
                    <td><%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[4]:"error" %></td> 
                    <td><%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[5]:"error" %></td>
                    <td><%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[6]:"error" %></td>
                    <td><%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[7]:"error" %></td>
                    <td><%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[8]:"error" %></td>       
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
<div id="tableatooltip" style="display:none; text-align:left; background-color:#ffeeaa; border:1px solid #eee"></div>
</div>
    <asp:Literal ID="litScript" runat="server"></asp:Literal>
</asp:Content>
