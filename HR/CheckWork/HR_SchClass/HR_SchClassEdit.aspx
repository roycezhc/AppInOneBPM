<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_SchClassEdit" CodeFile="HR_SchClassEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
    <script src="../../../Lib/JScript/selColor.js" type="text/javascript"></script>
 <script type="text/javascript">
     function chkChange(me) {
         if (me.checked) {
             $(me).parent().parent().parent().next().show();
         }
         else {
             $(me).parent().parent().parent().next().hide();
         }
     }
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
<ul style="width:300px;">
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存并退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存并继续"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=HR_SchClass.Attribute.SchClassid.ZhName %>：</dt><%--班次编号--%>
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_SchClass.Attribute.SchName.ZhName %>：</dt><%--班次时段名称--%>
               <dd><span>
                
                    <input id="txtSchName" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt>开始时间：</dt>
               <dd>
                   <span>
                        <select id="txtStartHour" style="width:40px;" runat="server"></select><span style=" display:inline-block; font-weight:bold; line-height:20px; ">时</span>
                        <select id="txtStartMin" style="width:40px;" runat="server"></select></select><span style="  display:inline-block;font-weight:bold; line-height:20px; ">分</span>
                   </span>
               </dd>
           </dl>
           <dl>
               <dt>结束时间：</dt>
               <dd>
                   <span>
                        <select id="txtEndHour" style="width:40px;" runat="server"></select><span style=" display:inline-block; font-weight:bold; line-height:20px; ">时</span>
                        <select id="txtEndMin" style="width:40px;" runat="server"></select><span style="  display:inline-block;font-weight:bold; line-height:20px; ">分</span>
                   </span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_SchClass.Attribute.CheckIn.ZhName %>：</dt><%--上班签到--%>
               <dd style="width:600px;">
                   <span>
                        <input style="width:20px; border:none;" id="txtCheckIn" type="checkbox" onclick="chkChange(this);"  class="ckb" runat="server" />
                   </span>
               </dd>
           </dl>
            <dl <%=txtCheckIn.Checked?"":"style='display:none;'" %>>
               <dt>签入开始时间：</dt><%--上班签到--%>
               <dd style="width:600px;">
                   <span>
                        <select id="txtCheckInHour1" style="width:40px;" runat="server"></select><span style=" display:inline-block; font-weight:bold; line-height:20px; ">时</span>
                        <select id="txtCheckInMin1" style="width:40px;" runat="server"></select></select><span style="  display:inline-block;font-weight:bold; line-height:20px; ">分</span>
                        <span style=" display:inline-block; font-weight:bold; line-height:20px; ">&nbsp;&nbsp;结束时间：</span>
                        <select id="txtCheckInHour2" style="width:40px;" runat="server"></select><span style=" display:inline-block; font-weight:bold; line-height:20px; ">时</span>
                        <select id="txtCheckInMin2" style="width:40px;" runat="server"></select></select><span style="  display:inline-block;font-weight:bold; line-height:20px; ">分</span>
                        <span style=" display:inline-block; font-weight:bold; line-height:20px; ">&nbsp;&nbsp;计迟到分钟数：</span>
                        <select style="width:45px;" id="txtLateMinutes" runat="server"></select>
                   </span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_SchClass.Attribute.CheckOut.ZhName %>：</dt><%--下班签到--%>
               <dd style="width:600px;">
                   <span>
                       <input style="width:20px; border:none;" id="txtCheckOut" type="checkbox" onclick="chkChange(this);"  class="ckb" runat="server" />
                   </span>
               </dd>
           </dl>
           <dl <%=txtCheckOut.Checked?"":"style='display:none;'" %>>
               <dt>签退开始时间：</dt>
               <dd style="width:600px;">
                   <span>
                        <select id="txtCheckOutHour1" style="width:40px;" runat="server"></select><span style=" display:inline-block; font-weight:bold; line-height:20px; ">时</span>
                        <select id="txtCheckOutMin1" style="width:40px;" runat="server"></select></select><span style="  display:inline-block;font-weight:bold; line-height:20px; ">分</span>
                        <span style=" display:inline-block; font-weight:bold; line-height:20px; ">&nbsp;&nbsp;结束时间：</span>
                        <select id="txtCheckOutHour2" style="width:40px;" runat="server"></select><span style=" display:inline-block; font-weight:bold; line-height:20px; ">时</span>
                        <select id="txtCheckOutMin2" style="width:40px;" runat="server"></select></select><span style="  display:inline-block;font-weight:bold; line-height:20px; ">分</span>
                        <span style=" display:inline-block; font-weight:bold; line-height:20px; ">&nbsp;&nbsp;计迟到分钟数：</span>
                        <select style="width:45px;" id="txtEarlyMinutes" runat="server"></select>
                   </span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_SchClass.Attribute.Color.ZhName %>：</dt><%--表示颜色--%>
               <dd><span>
                    <input type="button" value="颜色选择" id="inputcolor" style="background-color:<%=txtColor.Value%>; width:100px;" onclick="coloropen(this)"/>
                    <div id="colorpane" style="position:absolute;z-index:999;display:none;"></div> 
                    <input id="txtColor" type="hidden" runat="server" value="#009"/>
                    </span>
               </dd>
           </dl>
            <dl>
               <dt><%=HR_SchClass.Attribute.SchNumber.ZhName %>：</dt><%--量值--%>
               <dd>
               <span>
                    <select style="width:50px;" id="txtSchNumber" runat="server"></select>
                    <asp:DropDownList style="width:80px;" ID="txtSchUnit" runat="server"></asp:DropDownList>
               </span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_SchClass.Attribute.IsOverTime.ZhName %>：</dt><%--计算加班--%>
               <dd><span>
                    <input style="width:20px; border:none;" id="txtIsOvertime" type="checkbox" class="ckb" runat="server" /></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul style="width:300px;">
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存并退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存并继续"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>