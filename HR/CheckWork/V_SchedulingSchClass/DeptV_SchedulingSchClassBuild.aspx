<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CheckWork_V_SchedulingSchClass_DeptV_SchedulingSchClassBuild" CodeFile="DeptV_SchedulingSchClassBuild.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
   <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
 <link href="../Uploadify/jquery_loadmask.css" rel="stylesheet" type="text/css" />
     <script src="../Uploadify/jquery_loadmask.js" type="text/javascript"></script>
 <script type="text/javascript">
     var manager = new ListManager();
     $(function () {
         manager.initBodyRows();
         manager.initFindDL();
         //manager.initPageSizeEvt("txtPageNum");
         bindWinResize(40);
     });

     function selDaysChange(me) {
         var weeks = $(me).parent().parent().parent().parent().find(".xiuxiriweek");
         if (weeks == null || weeks == undefined || weeks.length < 7)
             return;
     }

     function deleteCheckedItem() {
         var cks = $("#tbList tbody tr input");

         var count = 0;
         for (var i = 0; i < cks.length; i++) {
             if (cks[i].checked) {
                 cks[i].parentNode.parentNode.parentNode.removeChild(cks[i].parentNode.parentNode);
                 count++;
             }
         }
         if (count == 0)
             alert('请选中一条以上记录！');
     }

     function addItem() {
         var ids = $("#tbList tbody tr .cssSchClassid");
         var haveids = "";
         for (var i = 0; i < ids.length; i++) {
             haveids += ids[i].innerText + ",";
         }
         var rec = manager.newRecord('../HR_SchClass/HR_SchClassManage.aspx?haveschids=' + haveids);
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
         else
             return true;
     }

     function checkFindTime(sid, eid) {
         var isOk = false;
         try {
             return dateDuibi($("#cphBody_" + sid).val(), $("#cphBody_" + eid).val());
         }
         catch (e) {
             isOk = false;
         }
         if (!isOk) {
             alert("请正确输入起止时间！");
         }
         return isOk;
     }

     function checkInput() {
         var isTimeRight = checkFindTime("txtStartTime", "txtEndTime");
         if (!isTimeRight)
             return isTimeRight;
         var paibanid = "";
         var selpaibanid = 0;
         var paiban = $(".tblist table tbody .first input");
         for (var i = 0; i < paiban.length; i++) {
             if (paiban[i].checked) {
                 paibanid += paiban[i].value + ",";
                 selpaibanid++;
             }
         }
         if (selpaibanid < 1) {
             alert("至少需要勾选一个班次！");
             return false;
         }
         $("#cphBody_hidSelBanciId").val(paibanid);
         $(".main").mask("正在生成！根据生成方式和生成数量，生成时间由几分钟到几十分钟不等，增补生成方式比较耗时，请稍后......");
         return true;
     }
     function addWdType(me) {
         var isTimeRight = checkFindTime("txtSDate", "txtEDate");
         if (!isTimeRight)
             return;
         try {
             var stDate = $("#cphBody_txtSDate").val();
             var enDate = $("#cphBody_txtEDate").val();
             var wdType = $("#cphBody_dll_Type").val();
             if (stDate == "" || enDate == "" || wdType == "" || wdType == null) {
                 alert("请完整输入起止日期和值班类型！");
                 return;
             }

             var wdty = "";
             wdty += "<tr>";
             wdty += "  <td>" + stDate + "</td>";
             wdty += "  <td>" + enDate + "</td>";
             wdty += "  <td>" + wdType + "</td>";
             wdty += "  <td><input style='width:40px;' type='button' value='删除' onclick='delWdType(this);'/></td>";
             wdty += "</tr>";

             var tb = $(me).parent().parent().parent().next();
             tb.html(tb.html() + wdty);
             $("#cphBody_hidwdtype").val(encodeURI(tb.html()));
         } catch (e) { }
     }

     function delWdType(me) {
         var tb = $(me).parent().parent().parent();
         tb[0].removeChild($(me).parent().parent()[0]);
         $("#cphBody_hidwdtype").val(encodeURI(tb.html()));
     }

</script>
<style type="text/css">
.xiuxiriweek{ display:none;}
.xiuxirimonth{ display:none;}

.hdtable{width:100%;_width:99%;height:auto; border:none;border-collapse:collapse;text-align:left;font-family:Geneva, Arial, Helvetica, sans-serif;}
.hdtable thead{background:url(../../../Themes/Default/img/bg.png) 0 -310px;color:#444;font-weight:bold; text-align:left;}
.hdtable thead tr td,th{border:solid 1px #bbc;line-height:22px; text-indent:5px;text-align:left;}/**/

.hdtable thead tr td.first,th.first{width:30px;}
.hdtable thead tr td.first input,th.first input{ background:none;}

.hdtable thead tr th.asc div{padding-right:12px; background:url(../../../Themes/Default/img/asc.gif) right center no-repeat;}
.hdtable thead tr th.desc div{padding-right:12px;background:url(../../../Themes/Default/img/desc.gif) right center no-repeat;}
.hdtable thead tr td.asc div{padding-right:12px; background:url(../../../Themes/Default/img/asc.gif) right center no-repeat;}
.hdtable thead tr td.desc div{padding-right:12px;background:url(../../../Themes/Default/img/desc.gif) right center no-repeat;}

.hdtable tbody tr td{width:auto;color:#333;line-height:20px;font-size:12px; text-indent:5px;border:solid 1px #aaa;white-space:nowrap;}
.hdtable tbody tr td.first{background:#def url(../../../Themes/Default/img/bg.png) 0 -310px; vertical-align:top;}
.hdtable tbody tr td.first a{color:#600;}
.hdtable tbody tr td.edited{ background:#ddf;}
.hdtable tbody tr td a{cursor:pointer; text-decoration:none;color:#009;margin:0 3px 0 3px;}
.hdtable tbody tr td a.dis{color:#aaa;}
.hdtable tbody tr td input{border:none; background:none;}

.hdtable tbody tr.tr-h td{background:url(img/bg.png) 0 -310px;color:#333;}

.hdtable tbody tr.sel{ background:#ffeeaa; cursor:pointer;}
.hdtable tbody tr.sel td{color:#036;}
.hdtable tbody tr.over{ background:#efd;}
.hdtable tbody tr.over td{color:#009;}
.hdtable table thead{ background:#eee;}
.hdtable table thead th{height:20px;line-height:20px;color:#333;font-weight:normal;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
    <input id="hidSelBanciId" name="hidSelBanciId" type="hidden" runat="server" />
    <input id="hidstaffid" type="hidden" runat="server" />
    <input id="hiddeptid" type="hidden" runat="server" />
    <input id="hidorgid" type="hidden" runat="server" />
    <input id="hidname" type="hidden" runat="server" />
    <input id="hidwdtype" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt>开始日期：</dt>
               <dd style=" width:80px;"><span>
                    <input style=" width:80px;" id="txtStartTime" runat="server" type="text" readonly="readonly" onclick="setday(this)" /></span>
               </dd>
               <dt>结束日期：</dt>
               <dd style=" width:80px;"><span>
                    <input style=" width:80px;" id="txtEndTime" runat="server" type="text" readonly="readonly" onclick="setday(this)" /></span>
               </dd>
           </dl>
           <dl>
               <dt>缺省休息日设置：</dt>
               <dd  style=" width:90px;"><span>
                    <input style=" width:80px;" id="txtXiuXi" runat="server" type="text" /></span>
               </dd>
               <dd style=" width:400px; color:Green;"><span>
                    每周起始日为周一，如果周六休息则填“6”,如果周六周日休息则“6,7”，中间以逗号分割，各数字取值范围1-7。</span>
               </dd>
           </dl>
           <dl>
               <dt>指定值班类型设置：</dt>
               <dd style="width:400px; ">
                   <table class="hdtable">
                        <thead>
                            <tr>
                                <td style="width:80px;">起始日期</td>
                                <td style="width:80px;">结束日期</td>
                                <td style="width:80px;">值班类型</td>
                                <td style="width:90px;"></td>
                            </tr>
                            <tr>
                                <td style="width:90px;"><input style=" width:80px;" id="txtSDate" runat="server" type="text" readonly="readonly" onclick="setday(this)" /></td>
                                <td style="width:90px;"><input style=" width:80px;" id="txtEDate" runat="server" type="text" readonly="readonly" onclick="setday(this)" /></td>
                                <td style="width:90px;"><select id="dll_Type" runat="server" style="width:80px;"></select></td>
                                <td style="width:50px;">
                                    <input style=" width:40px;" type="button" value="添加" onclick="addWdType(this);"/>
                                </td>
                            </tr>
                        </thead>
                        <tbody id="tbyWorkDayType" runat="server"></tbody>
                   </table>
               </dd>
           </dl>
           <dl>
               <dt>生成方式：</dt>
               <dd style=" width:90px;"><span>
                    <input style=" width:18px; border:0px none #000;float:left;" id="chkFuGai" name="buildtype" runat="server" title="覆盖生成" type="radio" checked="true"/><a style="float:left;">覆盖生成</a></span>
               </dd>
               <dd style=" width:500px; color:Green;"><span>
                    对应组织或个人，在开始时间和结束时间内的，原有排版记录将被删除后重新生成。</span>
               </dd>
           </dl>
           <dl>
               <dt></dt>
               <dd style=" width:90px;">
                    <span>
                    <input style=" width:18px;border:0px none #000; float:left;" id="chkUpdate" name="buildtype" runat="server" title="增补生成" type="radio" /><a style="float:left;">增补生成</a></span>
               </dd>
               <dd style=" width:500px; color:Green;"><span>
                    对应组织或个人，在开始时间和结束时间内的，补充没有的排班，对原排班不做修改。</span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
       <div class="tool">
        <ul style="width:100%;">
            <!--<li><span><input power="newHR_SchClass" id="btn_New" type="button" value="增加" onclick="manager.newRecord('../HR_SchClass/HR_SchClassEdit.aspx');" /></span></li>
            <li><span><input power="editHR_SchClass" id="btn_Edit" type="button" value="修改" onclick="manager.editRecord('../HR_SchClass/HR_SchClassEdit.aspx');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="$('.main').mask('正在删除，请稍后......');manager.delBySelIDS('../HR_SchClass/HR_SchClassBack.aspx');$('.main').unmask();" /></span></li>-->
            <li><span class="btn"><asp:Button ID="btnBuild" runat="server" Text="生成" OnClientClick="return checkInput();" onclick="btnOK_Click"/></span></li>
            <!--<li>方案名:<input style=" width:80px;" id="txtProjectName" runat="server" type="text" value="默认方案" onclick="" /></li>-->


            <li style="float:right;"><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
            <li style="float:right;"><span class="btn"><asp:Button ID="btnRefresh" runat="server" Text="刷新列表" onclick="btnRefresh_Click"/></span></li>
        </ul>
    </div>
    <div class="tblist" style="height:250px; max-height:300px;">
         <table cellpadding="0" cellspacing="0" id="tbList" >
            <thead>
                <tr keyname="SchClassid">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>                    
                    
                    <td><%=HR_SchClass.Attribute.SchClassid._ZhName %></td><!--班次编号-->
                    
                    
                    <td>班次名称</td><!--班次时段名称-->
                    
                    
                    <td>值班时段</td><!--值班时段-->
                    
                    <td>计迟/早分钟</td><!--计迟到/早退分钟数-->
                    
                    <td>签到</td><!--上班签到-->
                    
                    <td>签退</td><!--下班签到-->
                    
                    <td>签到时段</td><!--签到时段-->
                    
                    <td>签退时段</td><!--签退时段-->
                    
                    <td>颜色</td><!--表示颜色-->
                    <td>加班</td><!--计算加班-->

                    <td>量值</td><!--计算加班-->

                    <td>单位</td><!--计算加班-->
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_SchClass)Container.DataItem).SchClassid%>" /></td>
                    
                    <td class="cssSchClassid"><%#((HR_SchClass)Container.DataItem).SchClassid%></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchName%></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).StartHour.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).StartMin.ToString().PadLeft(2, '0') + "--" + ((HR_SchClass)Container.DataItem).EndHour.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).EndMin.ToString().PadLeft(2, '0')%></td>
  
                    
                    <td><%#((HR_SchClass)Container.DataItem).LateMinutes + "/" + ((HR_SchClass)Container.DataItem).EarlyMinutes%></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckIn ? "是" : "否"%></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOut ? "是" : "否"%></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInHour1.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).CheckInMin1.ToString().PadLeft(2, '0') + "--" + ((HR_SchClass)Container.DataItem).CheckInHour2.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).CheckInMin2.ToString().PadLeft(2, '0')%></td>
                    

                    <td><%#((HR_SchClass)Container.DataItem).CheckOutHour1.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).CheckOutMin1.ToString().PadLeft(2, '0') + "--" + ((HR_SchClass)Container.DataItem).CheckOutHour2.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).CheckOutMin2.ToString().PadLeft(2, '0')%></td>

                    
                    <td style=" background-color:<%#((HR_SchClass)Container.DataItem).Color %>"></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).IsOverTime ? "是" : "否"%></td>

                    <td><%#((HR_SchClass)Container.DataItem).SchNumber%></td>

                    <td><%#formHelper.GetOptionText(HR_SchClass.Attribute.SchUnit, ((HR_SchClass)Container.DataItem).SchUnit)%></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
   <div class="tool">
        <ul style="width:100%;">
                    <li style="color:Green">最近3次历史配置班次 列于此处供参考</li>                    
                    <li style="float:right; display:none;"><a target="_blank" href="../../HR_Scheduling_IniProject/HR_Scheduling_IniProjectManage.aspx?staffid=<%=Request["staffid"] %>&deptid=<%=Request["deptid"] %>&orgid=<%=Request["orgid"] %>">打开所选对象的历史配置记录详细</a></li>
        </ul>
    </div>
    <div class="tblist" style="height:250px; max-height:100px;">
         <table cellpadding="0" cellspacing="0" id="Table1">
            <thead>
                <tr keyname="ID">
                    <td class="first" style="display:none"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="HR_Scheduling_IniProjectManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.ProjectName.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.ProjectName._ZhName %></td><!--方案名称-->
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.ID.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.ID._ZhName %></td><!--ID-->
                                        
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.SelBanciId.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.SelBanciId._ZhName %></td><!--所选班次-->
                                        
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.XiuXi.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.XiuXi._ZhName %></td><!--休息日-->
                                        
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.WorkDayType.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.WorkDayType._ZhName %></td><!--其他排班设置-->
                                        
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.StartTime.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.StartTime._ZhName %></td><!--开始日期-->
                                        
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.EndTime.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.EndTime._ZhName %></td><!--结束日期-->
                                        
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu._ZhName %></td><!--生成方式{-->
                                        
                    <td style="display:none" data="{colname:'<%=HR_Scheduling_IniProject.Attribute.StaffID.LongName%>',show:0}"><%=HR_Scheduling_IniProject.Attribute.StaffID._ZhName %></td><!--StaffID-->
                                        
                    <td style="display:none" data="{colname:'<%=HR_Scheduling_IniProject.Attribute.DeptID.LongName%>',show:0}"><%=HR_Scheduling_IniProject.Attribute.DeptID._ZhName %></td><!--DeptID-->
                                        
                    <td style="display:none" data="{colname:'<%=HR_Scheduling_IniProject.Attribute.OrgID.LongName%>',show:0}"><%=HR_Scheduling_IniProject.Attribute.OrgID._ZhName %></td><!--OrgID-->
                                        
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            
            <td>{ProjectName}</td>

            <td>{ID}</td>
            
            <td>{SelBanciId}</td>
            
            <td>{XiuXi}</td>
            
            <td>{WorkDayType}</td>
            
            <td>{StartTime}</td>
            
            <td>{EndTime}</td>
            
            <td>{FuGaiOrZengBu}</td>
            
            <td>{StaffID}</td>
            
            <td>{DeptID}</td>
            
            <td>{OrgID}</td>
            
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="rptIniProject" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td style="display:none" class="first"><input type="checkbox" value="<%#((HR_Scheduling_IniProject)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((HR_Scheduling_IniProject)Container.DataItem).PATH, ((HR_Scheduling_IniProject)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>

                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).ProjectName %></td>
                   
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).SelBanciId %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).XiuXi %></td>
                    
                    
                    <td><table><%#((HR_Scheduling_IniProject)Container.DataItem).WorkDayType.Replace("button", "hidden")%></table></td>
                    
                    
                    <td><%#(((HR_Scheduling_IniProject)Container.DataItem).StartTime == DateTime.MinValue) ? "" : ((HR_Scheduling_IniProject)Container.DataItem).StartTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((HR_Scheduling_IniProject)Container.DataItem).EndTime == DateTime.MinValue) ? "" : ((HR_Scheduling_IniProject)Container.DataItem).EndTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).FuGaiOrZengBu %></td>
                    
                    
                    <td style="display:none"><%#((HR_Scheduling_IniProject)Container.DataItem).StaffID %></td>
                    
                    
                    <td style="display:none"><%#((HR_Scheduling_IniProject)Container.DataItem).DeptID %></td>
                    
                    
                    <td style="display:none"><%#((HR_Scheduling_IniProject)Container.DataItem).OrgID %></td>
                                        
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    
    </div>
</div>
    <asp:Literal ID="litScript" runat="server"></asp:Literal>
</asp:Content>