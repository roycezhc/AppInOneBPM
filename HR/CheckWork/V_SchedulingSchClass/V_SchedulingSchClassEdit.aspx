<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="V_SchedulingSchClassEdit" CodeFile="V_SchedulingSchClassEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchName.ZhName %>：</dt><%--SchName--%>
               <dd><span>
                
                    <input id="txtSchName" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.LateMinutes.ZhName %>：</dt><%--LateMinutes--%>
               <dd><span>
                
                    <input id="txtLateMinutes" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.EarlyMinutes.ZhName %>：</dt><%--EarlyMinutes--%>
               <dd><span>
                
                    <input id="txtEarlyMinutes" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckIn.ZhName %>：</dt><%--CheckIn--%>
               <dd><span>
                
                    <input id="txtCheckIn" type="checkbox" class="ckb" runat="server" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOut.ZhName %>：</dt><%--CheckOut--%>
               <dd><span>
                
                    <input id="txtCheckOut" type="checkbox" class="ckb" runat="server" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.Color.ZhName %>：</dt><%--Color--%>
               <dd><span>
                
                    <input id="txtColor" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.IsOverTime.ZhName %>：</dt><%--IsOverTime--%>
               <dd><span>
                
                    <input id="txtIsOvertime" type="checkbox" class="ckb" runat="server" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchYear.ZhName %>：</dt><%--Year--%>
               <dd><span>
                
                    <input id="txtYear" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchMonth.ZhName%>：</dt><%--Month--%>
               <dd><span>
                
                    <input id="txtMonth" type="text" runat="server" ck="{need:1,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchDay.ZhName%>：</dt><%--Day--%>
               <dd><span>
                
                    <input id="txtDay" type="text" runat="server" ck="{need:1,len:65025,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchType.ZhName%>：</dt><%--Type--%>
               <dd><span>
                
                    <input id="txtType" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchClassid.ZhName %>：</dt><%--SchClassid--%>
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.StartHour.ZhName %>：</dt><%--StartHour--%>
               <dd><span>
                
                    <input id="txtStartHour" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.StartMin.ZhName %>：</dt><%--StartMin--%>
               <dd><span>
                
                    <input id="txtStartMin" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.EndHour.ZhName %>：</dt><%--EndHour--%>
               <dd><span>
                
                    <input id="txtEndHour" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.EndMin.ZhName %>：</dt><%--EndMin--%>
               <dd><span>
                
                    <input id="txtEndMin" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckInHour1.ZhName %>：</dt><%--CheckInHour1--%>
               <dd><span>
                
                    <input id="txtCheckInHour1" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckInMin1.ZhName %>：</dt><%--CheckInMin1--%>
               <dd><span>
                
                    <input id="txtCheckInMin1" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckInHour2.ZhName %>：</dt><%--CheckInHour2--%>
               <dd><span>
                
                    <input id="txtCheckInHour2" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckInMin2.ZhName %>：</dt><%--CheckInMin2--%>
               <dd><span>
                
                    <input id="txtCheckInMin2" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutHour1.ZhName %>：</dt><%--CheckOutHour1--%>
               <dd><span>
                
                    <input id="txtCheckOutHour1" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutMin1.ZhName %>：</dt><%--CheckOutMin1--%>
               <dd><span>
                
                    <input id="txtCheckOutMin1" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutMin2.ZhName %>：</dt><%--CheckOutMin2--%>
               <dd><span>
                
                    <input id="txtCheckOutMin2" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutHour2.ZhName %>：</dt><%--CheckOutHour2--%>
               <dd><span>
                
                    <input id="txtCheckOutHour2" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>