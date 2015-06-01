<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_Scheduling_IniProjectEdit" CodeFile="HR_Scheduling_IniProjectEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
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
               <dt><%=HR_Scheduling_IniProject.Attribute.ID.ZhName %>：</dt><%--ID--%>
               <dd><span>
                
                    <input id="txtID" type="text" runat="server" ck="{need:1,len:16,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.SelBanciId.ZhName %>：</dt><%--所选班次--%>
               <dd><span>
                
                    <input id="txtSelBanciId" type="text" runat="server" ck="{need:0,len:100,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.XiuXi.ZhName %>：</dt><%--休息日--%>
               <dd><span>
                
                    <input id="txtXiuXi" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.WorkDayType.ZhName %>：</dt><%--其他排班设置--%>
               <dd><span>
               
                    <textarea id="txtWorkDayType" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:300,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.StartTime.ZhName %>：</dt><%--开始日期--%>
               <dd><span>
               
                    <input id="txtStartTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.EndTime.ZhName %>：</dt><%--结束日期--%>
               <dd><span>
               
                    <input id="txtEndTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu.ZhName %>：</dt><%--生成方式{--%>
               <dd><span>
                
                    <input id="txtFuGaiOrZengBu" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.StaffID.ZhName %>：</dt><%--StaffID--%>
               <dd><span>
                
                    <input id="txtStaffID" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.DeptID.ZhName %>：</dt><%--DeptID--%>
               <dd><span>
                
                    <input id="txtDeptID" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.OrgID.ZhName %>：</dt><%--OrgID--%>
               <dd><span>
                
                    <input id="txtOrgID" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling_IniProject.Attribute.ProjectName.ZhName %>：</dt><%--方案名称--%>
               <dd><span>
                
                    <input id="txtProjectName" type="text" runat="server" ck="{need:0,len:30,type:0}"/></span>
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