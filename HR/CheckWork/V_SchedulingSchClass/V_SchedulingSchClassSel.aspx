<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="V_SchedulingSchClassSel" CodeFile="V_SchedulingSchClassSel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });

    function selThis_B(tds) {
        var tdObj = $(tds[0]);
        var aObj = tdObj.find("a");
        if (aObj.length > 0) {
            _selERR = "不能选择有子节点的数据！";
            _selOK = false;
        }
    }
    function selOK_B(id) {
        //alert(id);
        $("input[id$='hidSelID']").val(id);
        //alert($("input[id$='hidSelID']").val());
        __doPostBack("ctl00$cphBody$LinkButton1", "");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>
   <div class="topfindl"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="SchName">
               <dt><%=V_SchedulingSchClass.Attribute.SchName.ZhName %>：</dt><!--SchName-->
               <dd><span>
                
                    <input id="txtSchName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LateMinutes">
               <dt><%=V_SchedulingSchClass.Attribute.LateMinutes.ZhName %>：</dt><!--LateMinutes-->
               <dd><span>
                
                    <input id="txtLateMinutes" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EarlyMinutes">
               <dt><%=V_SchedulingSchClass.Attribute.EarlyMinutes.ZhName %>：</dt><!--EarlyMinutes-->
               <dd><span>
                
                    <input id="txtEarlyMinutes" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckIn">
               <dt><%=V_SchedulingSchClass.Attribute.CheckIn.ZhName %>：</dt><!--CheckIn-->
               <dd><span>
               
                    <input id="txtCheckIn" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOut">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOut.ZhName %>：</dt><!--CheckOut-->
               <dd><span>
               
                    <input id="txtCheckOut" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="Color">
               <dt><%=V_SchedulingSchClass.Attribute.Color.ZhName %>：</dt><!--Color-->
               <dd><span>
                
                    <input id="txtColor" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="IsOverTime">
               <dt><%=V_SchedulingSchClass.Attribute.IsOverTime.ZhName %>：</dt><!--IsOverTime-->
               <dd><span>
               
                    <input id="txtIsOvertime" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="Year">
               <dt><%=V_SchedulingSchClass.Attribute.SchYear.ZhName %>：</dt><!--Year-->
               <dd><span>
                
                    <input id="txtYear" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Month">
               <dt><%=V_SchedulingSchClass.Attribute.SchMonth.ZhName %>：</dt><!--Month-->
               <dd><span>
                
                    <input id="txtMonth" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Day">
               <dt><%=V_SchedulingSchClass.Attribute.SchDay.ZhName %>：</dt><!--Day-->
               <dd><span>
                
                    <input id="txtDay" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Type">
               <dt><%=V_SchedulingSchClass.Attribute.SchType.ZhName %>：</dt><!--Type-->
               <dd><span>
                
                    <input id="txtType" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SchClassid">
               <dt><%=V_SchedulingSchClass.Attribute.SchClassid.ZhName %>：</dt><!--SchClassid-->
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="StartHour">
               <dt><%=V_SchedulingSchClass.Attribute.StartHour.ZhName %>：</dt><!--StartHour-->
               <dd><span>
                
                    <input id="txtStartHour" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="StartMin">
               <dt><%=V_SchedulingSchClass.Attribute.StartMin.ZhName %>：</dt><!--StartMin-->
               <dd><span>
                
                    <input id="txtStartMin" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EndHour">
               <dt><%=V_SchedulingSchClass.Attribute.EndHour.ZhName %>：</dt><!--EndHour-->
               <dd><span>
                
                    <input id="txtEndHour" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EndMin">
               <dt><%=V_SchedulingSchClass.Attribute.EndMin.ZhName %>：</dt><!--EndMin-->
               <dd><span>
                
                    <input id="txtEndMin" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckInHour1">
               <dt><%=V_SchedulingSchClass.Attribute.CheckInHour1.ZhName %>：</dt><!--CheckInHour1-->
               <dd><span>
                
                    <input id="txtCheckInHour1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckInMin1">
               <dt><%=V_SchedulingSchClass.Attribute.CheckInMin1.ZhName %>：</dt><!--CheckInMin1-->
               <dd><span>
                
                    <input id="txtCheckInMin1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckInHour2">
               <dt><%=V_SchedulingSchClass.Attribute.CheckInHour2.ZhName %>：</dt><!--CheckInHour2-->
               <dd><span>
                
                    <input id="txtCheckInHour2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckInMin2">
               <dt><%=V_SchedulingSchClass.Attribute.CheckInMin2.ZhName %>：</dt><!--CheckInMin2-->
               <dd><span>
                
                    <input id="txtCheckInMin2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOutHour1">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutHour1.ZhName %>：</dt><!--CheckOutHour1-->
               <dd><span>
                
                    <input id="txtCheckOutHour1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOutMin1">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutMin1.ZhName %>：</dt><!--CheckOutMin1-->
               <dd><span>
                
                    <input id="txtCheckOutMin1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOutMin2">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutMin2.ZhName %>：</dt><!--CheckOutMin2-->
               <dd><span>
                
                    <input id="txtCheckOutMin2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOutHour2">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutHour2.ZhName %>：</dt><!--CheckOutHour2-->
               <dd><span>
                
                    <input id="txtCheckOutHour2" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl><dt></dt><dd class="btn">
         <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchName._ZhName %></td><!--SchName-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.LateMinutes._ZhName %></td><!--LateMinutes-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.EarlyMinutes._ZhName %></td><!--EarlyMinutes-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckIn._ZhName %></td><!--CheckIn-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOut._ZhName %></td><!--CheckOut-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.Color._ZhName %></td><!--Color-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.IsOverTime._ZhName %></td><!--IsOverTime-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchYear._ZhName %></td><!--Year-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchMonth._ZhName %></td><!--Month-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchDay._ZhName %></td><!--Day-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchType._ZhName %></td><!--Type-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchClassid._ZhName %></td><!--SchClassid-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.StartHour._ZhName %></td><!--StartHour-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.StartMin._ZhName %></td><!--StartMin-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.EndHour._ZhName %></td><!--EndHour-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.EndMin._ZhName %></td><!--EndMin-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckInHour1._ZhName %></td><!--CheckInHour1-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckInMin1._ZhName %></td><!--CheckInMin1-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckInHour2._ZhName %></td><!--CheckInHour2-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckInMin2._ZhName %></td><!--CheckInMin2-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOutHour1._ZhName %></td><!--CheckOutHour1-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOutMin1._ZhName %></td><!--CheckOutMin1-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOutMin2._ZhName %></td><!--CheckOutMin2-->
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOutHour2._ZhName %></td><!--CheckOutHour2-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).SchName %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).LateMinutes %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).EarlyMinutes %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckIn %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckOut %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).Color %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).IsOverTime %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).SchYear %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).SchMonth %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).SchDay %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).SchType %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).SchClassid %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).StartHour %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).StartMin %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).EndHour %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).EndMin %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckInHour1 %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckInMin1 %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckInHour2 %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckInMin2 %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckOutHour1 %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckOutMin1 %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckOutMin2 %></td>
                    
                    
                    <td><%#((V_SchedulingSchClass)Container.DataItem).CheckOutHour2 %></td>
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
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

