<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="V_SchedulingSchClassSels" CodeFile="V_SchedulingSchClassSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows();
        });
    </script>
    <script type="text/javascript">$(function () { Sels_Load(); });</script>
    <style type="text/css">
    #divList tbody tr td{ cursor:pointer;}
    .lrlayout .left{border:none;}
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
 <div class="main">
    <input id="hidCondition" type="hidden" runat="server" />
    <input id="hidOld" type="hidden" runat="server" />
    <input id="hidInitIDS" type="hidden" runat="server" />
    <div class="titnav">
       <dl><dt><b><%#title %>多选</b></dt><dd></dd></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
     <div class="topfindl">
         
            <dl colname="SchName">
               <dt><%=V_SchedulingSchClass.Attribute.SchName.ZhName %>：</dt><!--SchName-->
               <dd><span>
                
                    <input id="txtSchName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="LateMinutes">
               <dt><%=V_SchedulingSchClass.Attribute.LateMinutes.ZhName %>：</dt><!--LateMinutes-->
               <dd><span>
                
                    <input id="txtLateMinutes" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="EarlyMinutes">
               <dt><%=V_SchedulingSchClass.Attribute.EarlyMinutes.ZhName %>：</dt><!--EarlyMinutes-->
               <dd><span>
                
                    <input id="txtEarlyMinutes" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckIn">
               <dt><%=V_SchedulingSchClass.Attribute.CheckIn.ZhName %>：</dt><!--CheckIn-->
               <dd><span>
                
                    <input id="txtCheckIn" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="CheckOut">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOut.ZhName %>：</dt><!--CheckOut-->
               <dd><span>
                
                    <input id="txtCheckOut" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="Color">
               <dt><%=V_SchedulingSchClass.Attribute.Color.ZhName %>：</dt><!--Color-->
               <dd><span>
                
                    <input id="txtColor" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="IsOverTime">
               <dt><%=V_SchedulingSchClass.Attribute.IsOverTime.ZhName %>：</dt><!--IsOverTime-->
               <dd><span>
                
                    <input id="txtIsOvertime" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="Year">
               <dt><%=V_SchedulingSchClass.Attribute.SchYear.ZhName %>：</dt><!--Year-->
               <dd><span>
                
                    <input id="txtYear" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Month">
               <dt><%=V_SchedulingSchClass.Attribute.SchMonth.ZhName %>：</dt><!--Month-->
               <dd><span>
                
                    <input id="txtMonth" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Day">
               <dt><%=V_SchedulingSchClass.Attribute.SchDay.ZhName %>：</dt><!--Day-->
               <dd><span>
                
                    <input id="txtDay" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Type">
               <dt><%=V_SchedulingSchClass.Attribute.SchType.ZhName %>：</dt><!--Type-->
               <dd><span>
                
                    <input id="txtType" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SchClassid">
               <dt><%=V_SchedulingSchClass.Attribute.SchClassid.ZhName %>：</dt><!--SchClassid-->
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="StartHour">
               <dt><%=V_SchedulingSchClass.Attribute.StartHour.ZhName %>：</dt><!--StartHour-->
               <dd><span>
                
                    <input id="txtStartHour" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="StartMin">
               <dt><%=V_SchedulingSchClass.Attribute.StartMin.ZhName %>：</dt><!--StartMin-->
               <dd><span>
                
                    <input id="txtStartMin" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="EndHour">
               <dt><%=V_SchedulingSchClass.Attribute.EndHour.ZhName %>：</dt><!--EndHour-->
               <dd><span>
                
                    <input id="txtEndHour" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="EndMin">
               <dt><%=V_SchedulingSchClass.Attribute.EndMin.ZhName %>：</dt><!--EndMin-->
               <dd><span>
                
                    <input id="txtEndMin" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckInHour1">
               <dt><%=V_SchedulingSchClass.Attribute.CheckInHour1.ZhName %>：</dt><!--CheckInHour1-->
               <dd><span>
                
                    <input id="txtCheckInHour1" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckInMin1">
               <dt><%=V_SchedulingSchClass.Attribute.CheckInMin1.ZhName %>：</dt><!--CheckInMin1-->
               <dd><span>
                
                    <input id="txtCheckInMin1" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckInHour2">
               <dt><%=V_SchedulingSchClass.Attribute.CheckInHour2.ZhName %>：</dt><!--CheckInHour2-->
               <dd><span>
                
                    <input id="txtCheckInHour2" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckInMin2">
               <dt><%=V_SchedulingSchClass.Attribute.CheckInMin2.ZhName %>：</dt><!--CheckInMin2-->
               <dd><span>
                
                    <input id="txtCheckInMin2" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckOutHour1">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutHour1.ZhName %>：</dt><!--CheckOutHour1-->
               <dd><span>
                
                    <input id="txtCheckOutHour1" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckOutMin1">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutMin1.ZhName %>：</dt><!--CheckOutMin1-->
               <dd><span>
                
                    <input id="txtCheckOutMin1" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckOutMin2">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutMin2.ZhName %>：</dt><!--CheckOutMin2-->
               <dd><span>
                
                    <input id="txtCheckOutMin2" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckOutHour2">
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutHour2.ZhName %>：</dt><!--CheckOutHour2-->
               <dd><span>
                
                    <input id="txtCheckOutHour2" type="text" runat="server"/>
               </span></dd>
        </dl>     
        <dl><dt>&nbsp;</dt><dd class="btn">
        <a href="#" class="btn"><asp:Button ID="btnFind" runat="server" Text="查询" OnClick="btnFind_Click" /></a>
        <a href="#" class="btn"><input id="btnSelOK" type="button" value="<%=LanguageService.GetLanguageString("SureChoose", "确定选择") %>" onclick="selok();" /></a>
        <a href="#" class="btn"><input type="button" id="btnClear" value="<%=LanguageService.GetLanguageString("Clear", "清空") %>" /></a>
        </dd></dl>
        <div class="clear"></div>
    </div>    
    <div class="lrlayout">
    <div class="left" style="width:150px;height:400px;">
       <select id="selectedlist" multiple="multiple" style="color:Blue;width:100%;height:100%;">
       </select>
    </div>
    <div class="right" style="margin-left:152px;height:400px;">
    <div class="tblist" id="divList">
       <table cellpadding="0" cellspacing="0">
             <thead>
                <tr>
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "全选") %>' onclick='_selAll(this);'/><%=LanguageService.GetLanguageString("Choose", "选择") %></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchName._ZhName %><!--SchName--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.LateMinutes._ZhName %><!--LateMinutes--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.EarlyMinutes._ZhName %><!--EarlyMinutes--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckIn._ZhName %><!--CheckIn--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOut._ZhName %><!--CheckOut--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.Color._ZhName %><!--Color--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.IsOverTime._ZhName %><!--IsOverTime--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchYear._ZhName %><!--Year--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchMonth._ZhName %><!--Month--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchDay._ZhName %><!--Day--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchType._ZhName %><!--Type--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.SchClassid._ZhName %><!--SchClassid--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.StartHour._ZhName %><!--StartHour--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.StartMin._ZhName %><!--StartMin--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.EndHour._ZhName %><!--EndHour--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.EndMin._ZhName %><!--EndMin--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckInHour1._ZhName %><!--CheckInHour1--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckInMin1._ZhName %><!--CheckInMin1--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckInHour2._ZhName %><!--CheckInHour2--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckInMin2._ZhName %><!--CheckInMin2--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOutHour1._ZhName %><!--CheckOutHour1--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOutMin1._ZhName %><!--CheckOutMin1--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOutMin2._ZhName %><!--CheckOutMin2--></td>
                    
                    
                    <td><%=V_SchedulingSchClass.Attribute.CheckOutHour2._ZhName %><!--CheckOutHour2--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((V_SchedulingSchClass)Container.DataItem).SchName %>" /></td>
                     
                    
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
    <div class="pages">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
     </div>
     </div>
     </div>
 </div>
</asp:Content>
