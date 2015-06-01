<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_SchClassShow" CodeFile="HR_SchClassShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=HR_SchClass.Attribute.SchClassid.ZhName %>：</dt><%--班次编号--%>
               <dd>
                
                    <asp:Label id="txtSchClassid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.SchName.ZhName %>：</dt><%--班次时段名称--%>
               <dd>
                
                    <asp:Label id="txtSchName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.StartHour.ZhName %>：</dt><%--开始时间小时--%>
               <dd>
                
                    <asp:Label id="txtStartHour" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.StartMin.ZhName %>：</dt><%--开始时间分钟--%>
               <dd>
                
                    <asp:Label id="txtStartMin" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.EndHour.ZhName %>：</dt><%--结束时间小时--%>
               <dd>
                
                    <asp:Label id="txtEndHour" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.EndMin.ZhName %>：</dt><%--结束时间--%>
               <dd>
                
                    <asp:Label id="txtEndMin" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.LateMinutes.ZhName %>：</dt><%--计迟到分钟数--%>
               <dd>
                
                    <asp:Label id="txtLateMinutes" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.EarlyMinutes.ZhName %>：</dt><%--计早退分钟数--%>
               <dd>
                
                    <asp:Label id="txtEarlyMinutes" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckIn.ZhName %>：</dt><%--上班签到--%>
               <dd>
                
                    <asp:CheckBox id="txtCheckIn" runat="server" ></asp:CheckBox>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckOut.ZhName %>：</dt><%--下班签到--%>
               <dd>
                
                    <asp:CheckBox id="txtCheckOut" runat="server" ></asp:CheckBox>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckInHour1.ZhName %>：</dt><%--开始签到时间小时--%>
               <dd>
                
                    <asp:Label id="txtCheckInHour1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckInMin1.ZhName %>：</dt><%--开始签到时间分钟--%>
               <dd>
                
                    <asp:Label id="txtCheckInMin1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckInHour2.ZhName %>：</dt><%--结束签到时间小时--%>
               <dd>
                
                    <asp:Label id="txtCheckInHour2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckInMin2.ZhName %>：</dt><%--结束签到时间分钟(int(4))--%>
               <dd>
                
                    <asp:Label id="txtCheckInMin2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckOutHour1.ZhName %>：</dt><%--开始签退时间小时--%>
               <dd>
                
                    <asp:Label id="txtCheckOutHour1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckOutMin1.ZhName %>：</dt><%--开始签退时间分钟--%>
               <dd>
                
                    <asp:Label id="txtCheckOutMin1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckOutHour2.ZhName %>：</dt><%--结束签退时间小时--%>
               <dd>
                
                    <asp:Label id="txtCheckOutHour2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.CheckOutMin2.ZhName %>：</dt><%--结束签退时间分钟--%>
               <dd>
                
                    <asp:Label id="txtCheckOutMin2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.Color.ZhName %>：</dt><%--表示颜色--%>
               <dd>
                
                    <asp:Label id="txtColor" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_SchClass.Attribute.IsOverTime.ZhName %>：</dt><%--计算加班--%>
               <dd>
                
                    <asp:CheckBox id="txtIsOvertime" runat="server" ></asp:CheckBox>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>