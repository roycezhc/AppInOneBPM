<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_Scheduling_IniProjectShow2" CodeFile="HR_Scheduling_IniProjectShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
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
               <dt><%=HR_Scheduling_IniProject.Attribute.ID.ZhName %>：</dt><%--ID--%>
               <dd>
                
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.SelBanciId.ZhName %>：</dt><%--所选班次--%>
               <dd>
                
                    <asp:Label id="txtSelBanciId" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.XiuXi.ZhName %>：</dt><%--休息日--%>
               <dd>
                
                    <asp:Label id="txtXiuXi" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.WorkDayType.ZhName %>：</dt><%--其他排班设置--%>
               <dd>
               
                    <asp:Label id="txtWorkDayType" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.StartTime.ZhName %>：</dt><%--开始日期--%>
               <dd>
               
                    <asp:Label id="txtStartTime" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.EndTime.ZhName %>：</dt><%--结束日期--%>
               <dd>
               
                    <asp:Label id="txtEndTime" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu.ZhName %>：</dt><%--生成方式{--%>
               <dd>
                
                    <asp:Label id="txtFuGaiOrZengBu" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.StaffID.ZhName %>：</dt><%--StaffID--%>
               <dd>
                
                    <asp:Label id="txtStaffID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.DeptID.ZhName %>：</dt><%--DeptID--%>
               <dd>
                
                    <asp:Label id="txtDeptID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.OrgID.ZhName %>：</dt><%--OrgID--%>
               <dd>
                
                    <asp:Label id="txtOrgID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.ProjectName.ZhName %>：</dt><%--方案名称--%>
               <dd>
                
                    <asp:Label id="txtProjectName" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>