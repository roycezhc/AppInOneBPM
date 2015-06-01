<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STAFFReal2" CodeFile="STAFFReal.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/Mdl/manage.js" type="text/javascript"></script>
<script type="text/javascript">
   

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidOneID" type="hidden" runat="server" /><!--一对多关系中一那个表的主键-->
<input id="hidMulIDS" type="hidden" runat="server" /><!--一对多关系中多那个表的主键-->
<div class="main">
     <div class="tblist" style="height:auto;">
         <table cellpadding="0" cellspacing="0">
            <thead >
                <tr>
                    <td class="<%=hideEditLinkClsName %>">&nbsp;</td>
                    
                    
                    <td><%=HR_STAFF.Attribute.STAFF_ID._ZhName %></td><!--员工标示-->
                    
                    
                    <td><%=HR_STAFF.Attribute.STAFF_NO._ZhName %></td><!--员工号-->
                    
                    
                    <td><%=HR_STAFF.Attribute.STAFF_NAME._ZhName%></td><!--员工姓名-->
                    
                    
                    <td><%=HR_STAFF.Attribute.DEPT_ID._ZhName %></td><!--所属部门标识-->
                    
                    
                    <td><%=HR_STAFF.Attribute.GENDER._ZhName %></td><!--性别-->
                    
                    
                    <td><%=HR_STAFF.Attribute.PHOTO._ZhName %></td><!--照片地址-->
                    
                    
                    <td><%=HR_STAFF.Attribute.POS_NAME._ZhName %></td><!--职位描述-->
                    
                    
                    <td><%=HR_STAFF.Attribute.STATION_CODE._ZhName %></td><!--岗位编码-->
                    
                    
                    <td><%=HR_STAFF.Attribute.WORK_TYPE_CODE._ZhName %></td><!--工作分工种类-->
                    
                    
                    <td><%=HR_STAFF.Attribute.TECH_LEVEL_CODE._ZhName %></td><!--技术等级-->
                    
                    
                    <td><%=HR_STAFF.Attribute.YMD._ZhName %></td><!--出生年月-->
                    
                    
                    <td><%=HR_STAFF.Attribute.MOBILE._ZhName %></td><!--手机号码-->
                    
                    
                    <td><%=HR_STAFF.Attribute.OFFICE_TEL._ZhName %></td><!--办公电弧-->
                    
                    
                    <td><%=HR_STAFF.Attribute.CERT_FLAG._ZhName %></td><!--持证标记-->
                    
                    
                    <td><%=HR_STAFF.Attribute.FIXED_FLAG._ZhName %></td><!--定编标志-->
                    
                    
                    <td><%=HR_STAFF.Attribute.ON_POS_FLAG._ZhName %></td><!--在岗标志-->
                    
                    
                    <td><%=HR_STAFF.Attribute.PROFESSION_CODE._ZhName %></td><!--本专业工作日期-->
                    
                    
                    <td><%=HR_STAFF.Attribute.PROFESSION_BGN_DATE._ZhName %></td><!--本专业工作日期-->
                    
                    
                    <td><%=HR_STAFF.Attribute.JOIN_DATE._ZhName %></td><!--工作日期-->
                    
                    
                    <td><%=HR_STAFF.Attribute.POLITICAL_STATUS_CODE._ZhName %></td><!--政治面貌-->
                    
                    
                    <td><%=HR_STAFF.Attribute.TITLE_CODE._ZhName %></td><!--职称编码-->
                    
                    
                    <td><%=HR_STAFF.Attribute.STATUS_CODE._ZhName %></td><!--调退亡状态-->
                    
                    
                    <td><%=HR_STAFF.Attribute.ADDR._ZhName %></td><!--联系地址-->
                    
                    
                    <td><%=HR_STAFF.Attribute.EMAIL._ZhName %></td><!--电子邮件-->
                    
                    
                    <td><%=HR_STAFF.Attribute.NATION._ZhName %></td><!--民族-->
                    
                    
                    <td><%=HR_STAFF.Attribute.NATIVE_PLACE._ZhName %></td><!--籍贯-->
                    
                    
                    <td><%=HR_STAFF.Attribute.POST_NO._ZhName %></td><!--邮政编码-->
                    
                    
                    <td><%=HR_STAFF.Attribute.DEGREE_CODE._ZhName %></td><!--文化程度-->
                    
                    
                    <td><%=HR_STAFF.Attribute.GRAD_SCHOOL._ZhName %></td><!--毕业学校-->
                    
                    
                    <td><%=HR_STAFF.Attribute.GRAD_DATE._ZhName %></td><!--毕业时间-->
                    
                    
                    <td><%=HR_STAFF.Attribute.MAJOR._ZhName %></td><!--专业-->
                    
                    
                    <td><%=HR_STAFF.Attribute.AF_ADDTIME._ZhName %></td><!--录入时间-->
                    
                    
                    <td><%=HR_STAFF.Attribute.AF_EDITTIME._ZhName %></td><!--修改时间-->
                    
                    
                    <td><%=HR_STAFF.Attribute.REMARK._ZhName %></td><!--备注-->
                    
                    
                    <td><%=HR_STAFF.Attribute.USER_ID._ZhName %></td><!--用户标识-->
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server">
                <ItemTemplate>
                <tr>
                    <td class="<%#hideEditLinkClsName %>">
                    <a href="HR_STAFFFEdit.aspx?STAFF_ID=<%#((HR_STAFF)Container.DataItem).STAFF_ID %>">编辑</a>
                    <a href="" data="<%#((SYS_ROLE)Container.DataItem).ROLE_ID %>">移除</a>
                    </td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_ID %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NO %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NAME%></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).DEPT_ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(HR_STAFF.Attribute.GENDER, ((HR_STAFF)Container.DataItem).GENDER)%></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((HR_STAFF)Container.DataItem).PHOTO) %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).POS_NAME %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STATION_CODE %></td>
                    
                    
                    <td><%#FormHelper.GetText(HR_STAFF.Attribute.WORK_TYPE_CODE, ((HR_STAFF)Container.DataItem).WORK_TYPE_CODE)%></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).TECH_LEVEL_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).YMD %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).MOBILE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).OFFICE_TEL %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).CERT_FLAG %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).FIXED_FLAG %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).ON_POS_FLAG %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).PROFESSION_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).PROFESSION_BGN_DATE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).JOIN_DATE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).POLITICAL_STATUS_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).TITLE_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STATUS_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).ADDR %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).NATION %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).NATIVE_PLACE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).POST_NO %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).DEGREE_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).GRAD_SCHOOL %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).GRAD_DATE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).MAJOR %></td>
                    
                    
                    <td><%#(((HR_STAFF)Container.DataItem).AF_ADDTIME == DateTime.MinValue) ? "" : ((HR_STAFF)Container.DataItem).AF_ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((HR_STAFF)Container.DataItem).AF_EDITTIME == DateTime.MinValue) ? "" : ((HR_STAFF)Container.DataItem).AF_EDITTIME.ToString("yyyy-MM-dd HH:mm")%></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((HR_STAFF)Container.DataItem).REMARK) %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).USER_ID %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
     </div>
</div>
</asp:Content>