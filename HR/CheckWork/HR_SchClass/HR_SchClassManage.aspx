<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_SchClassManage" CodeFile="HR_SchClassManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    var selectedID = "";
    var page;

    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);

        var trs = $("#tbodyList").find("tr");
        var headtds = $("#theadRow").find("td");
        for (var i = 0; i < trs.length; i++) {
            var trObj = $(trs[i]);
            trObj.bind("click", trObj, function (e) {
                selectedID = e.data.find("input[type='hidden']").val(); //选中行中的input 
                if (selectedID == undefined || selectedID == "") {
                    var tds = e.data.children();
                    selectedID = $(tds[0]).text(); //选中td第一格                        
                }
                //showAllInfo(e.data, $("#theadRow"), "bodyDetail", 3, 1);
                selThis(e.data);
            });
            /*双击选中返回*/
            $(trs[i]).bind("dblclick", $(trs[i]), function (e) { //作为选择窗体时生效，双击直接选中行，并关闭窗体
                selok(); //selThis(e.data); selok();
            });
        }
    });

    var selinfo = "";
    function selok() {
        if (selinfo == "") {
            alert('请选择一条记录！');
            return;
        }
        window.returnValue = selinfo; //返回一个JSON格式的字符串。 alert(window.returnValue);
        window.close();
    }
    function selThis(el) {
        var trs = el.parent().find("tr");
        var tds = el.children();

        var tmlID = $(tds[10]).text();

        selinfo = "({ID:'" + $(tds[1]).text() + "',NO:'" + $(tds[3]).text() + "',Name:'"
            + $(tds[4]).text() + "',TmlID:'" + tmlID
            + "'})";
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
   <div class="topfindl" style="display:none;"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="HR_SchClass.SchClassid">
               <dt><%=HR_SchClass.Attribute.SchClassid.ZhName %>：</dt><!--班次编号-->
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.SchName">
               <dt><%=HR_SchClass.Attribute.SchName.ZhName %>：</dt><!--班次时段名称-->
               <dd><span>
                
                    <input id="txtSchName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.StartHour">
               <dt><%=HR_SchClass.Attribute.StartHour.ZhName %>：</dt><!--开始时间小时-->
               <dd><span>
                
                    <input id="txtStartHour" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.StartMin">
               <dt><%=HR_SchClass.Attribute.StartMin.ZhName %>：</dt><!--开始时间分钟-->
               <dd><span>
                
                    <input id="txtStartMin" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.EndHour">
               <dt><%=HR_SchClass.Attribute.EndHour.ZhName %>：</dt><!--结束时间小时-->
               <dd><span>
                
                    <input id="txtEndHour" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.EndMin">
               <dt><%=HR_SchClass.Attribute.EndMin.ZhName %>：</dt><!--结束时间-->
               <dd><span>
                
                    <input id="txtEndMin" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.LateMinutes">
               <dt><%=HR_SchClass.Attribute.LateMinutes.ZhName %>：</dt><!--计迟到分钟数-->
               <dd><span>
                
                    <input id="txtLateMinutes" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.EarlyMinutes">
               <dt><%=HR_SchClass.Attribute.EarlyMinutes.ZhName %>：</dt><!--计早退分钟数-->
               <dd><span>
                
                    <input id="txtEarlyMinutes" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckIn">
               <dt><%=HR_SchClass.Attribute.CheckIn.ZhName %>：</dt><!--上班签到-->
               <dd><span>
               
                    <input id="txtCheckIn" type="checkbox" runat="server" class="ckb" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOut">
               <dt><%=HR_SchClass.Attribute.CheckOut.ZhName %>：</dt><!--下班签到-->
               <dd><span>
               
                    <input id="txtCheckOut" type="checkbox" runat="server" class="ckb" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckInHour1">
               <dt><%=HR_SchClass.Attribute.CheckInHour1.ZhName %>：</dt><!--开始签到时间小时-->
               <dd><span>
                
                    <input id="txtCheckInHour1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckInMin1">
               <dt><%=HR_SchClass.Attribute.CheckInMin1.ZhName %>：</dt><!--开始签到时间分钟-->
               <dd><span>
                
                    <input id="txtCheckInMin1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckInHour2">
               <dt><%=HR_SchClass.Attribute.CheckInHour2.ZhName %>：</dt><!--结束签到时间小时-->
               <dd><span>
                
                    <input id="txtCheckInHour2" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckInMin2">
               <dt><%=HR_SchClass.Attribute.CheckInMin2.ZhName %>：</dt><!--结束签到时间分钟(int(4))-->
               <dd><span>
                
                    <input id="txtCheckInMin2" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOutHour1">
               <dt><%=HR_SchClass.Attribute.CheckOutHour1.ZhName %>：</dt><!--开始签退时间小时-->
               <dd><span>
                
                    <input id="txtCheckOutHour1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOutMin1">
               <dt><%=HR_SchClass.Attribute.CheckOutMin1.ZhName %>：</dt><!--开始签退时间分钟-->
               <dd><span>
                
                    <input id="txtCheckOutMin1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOutHour2">
               <dt><%=HR_SchClass.Attribute.CheckOutHour2.ZhName %>：</dt><!--结束签退时间小时-->
               <dd><span>
                
                    <input id="txtCheckOutHour2" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOutMin2">
               <dt><%=HR_SchClass.Attribute.CheckOutMin2.ZhName %>：</dt><!--结束签退时间分钟-->
               <dd><span>
                
                    <input id="txtCheckOutMin2" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.Color">
               <dt><%=HR_SchClass.Attribute.Color.ZhName %>：</dt><!--表示颜色-->
               <dd><span>
                
                    <input id="txtColor" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.IsOverTime">
               <dt><%=HR_SchClass.Attribute.IsOverTime.ZhName %>：</dt><!--计算加班-->
               <dd><span>
               
                    <input id="txtIsOvertime" type="checkbox" runat="server" class="ckb" />
               </span></dd>
               
        </dl>
         <dl><dt></dt><dd class="btn">
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul style=" width:300px;">
            <li><span><input power="newHR_SchClass" id="btn_New" type="button" value="新建" onclick="manager.newRecord('HR_SchClassEdit.aspx');" /></span></li>
            <li><span><input power="editHR_SchClass" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('HR_SchClassEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newHR_SchClass" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('HR_SchClassBack.aspx');" /></span></li>
            <!--<li><span><input id="btn_Add" type="button" value="添加" onclick="selok();" /></span></li>-->
        </ul>
        <ol style=" display:none;">
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead id="theadRow">
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
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchClassid %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchName %></td>
                    
                    
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
    <div class="path-url hide">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>