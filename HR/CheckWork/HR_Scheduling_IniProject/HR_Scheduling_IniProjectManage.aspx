<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CK_Scheduling_IniProjectManage2" CodeFile="HR_Scheduling_IniProjectManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="HR_Scheduling_IniProject.ID">
               <dt><%=HR_Scheduling_IniProject.Attribute.ID.ZhName %>：</dt><!--ID-->
               <dd><span>
                
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.SelBanciId">
               <dt><%=HR_Scheduling_IniProject.Attribute.SelBanciId.ZhName %>：</dt><!--所选班次-->
               <dd><span>
                
                    <input id="txtSelBanciId" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.XiuXi">
               <dt><%=HR_Scheduling_IniProject.Attribute.XiuXi.ZhName %>：</dt><!--休息日-->
               <dd><span>
                
                    <input id="txtXiuXi" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.WorkDayType">
               <dt><%=HR_Scheduling_IniProject.Attribute.WorkDayType.ZhName %>：</dt><!--其他排班设置-->
               <dd><span>
               
                    <input id="txtWorkDayType" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.StartTime">
               <dt><%=HR_Scheduling_IniProject.Attribute.StartTime.ZhName %>：</dt><!--开始日期-->
               <dd><span>
               
                    <input id="txtStartTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.EndTime">
               <dt><%=HR_Scheduling_IniProject.Attribute.EndTime.ZhName %>：</dt><!--结束日期-->
               <dd><span>
               
                    <input id="txtEndTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.FuGaiOrZengBu">
               <dt><%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu.ZhName %>：</dt><!--生成方式{-->
               <dd><span>
                
                    <input id="txtFuGaiOrZengBu" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.StaffID">
               <dt><%=HR_Scheduling_IniProject.Attribute.StaffID.ZhName %>：</dt><!--StaffID-->
               <dd><span>
                
                    <input id="txtStaffID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.DeptID">
               <dt><%=HR_Scheduling_IniProject.Attribute.DeptID.ZhName %>：</dt><!--DeptID-->
               <dd><span>
                
                    <input id="txtDeptID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.OrgID">
               <dt><%=HR_Scheduling_IniProject.Attribute.OrgID.ZhName %>：</dt><!--OrgID-->
               <dd><span>
                
                    <input id="txtOrgID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling_IniProject.ProjectName">
               <dt><%=HR_Scheduling_IniProject.Attribute.ProjectName.ZhName %>：</dt><!--方案名称-->
               <dd><span>
                
                    <input id="txtProjectName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newHR_Scheduling_IniProject" id="btn_New" type="button" value="新建" onclick="manager.newRecord('HR_Scheduling_IniProjectEdit.aspx');" /></span></li>
            <li><span><input power="editHR_Scheduling_IniProject" id="btn_Edit" type="button" value="新建" onclick="manager.editRecord('HR_Scheduling_IniProjectEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newHR_Scheduling_IniProject" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('HR_Scheduling_IniProjectBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="HR_Scheduling_IniProjectManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.ID.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.ID._ZhName %></td><!--ID-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.SelBanciId.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.SelBanciId._ZhName %></td><!--所选班次-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.XiuXi.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.XiuXi._ZhName %></td><!--休息日-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.WorkDayType.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.WorkDayType._ZhName %></td><!--其他排班设置-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.StartTime.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.StartTime._ZhName %></td><!--开始日期-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.EndTime.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.EndTime._ZhName %></td><!--结束日期-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu._ZhName %></td><!--生成方式{-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.StaffID.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.StaffID._ZhName %></td><!--StaffID-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.DeptID.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.DeptID._ZhName %></td><!--DeptID-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.OrgID.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.OrgID._ZhName %></td><!--OrgID-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling_IniProject.Attribute.ProjectName.LongName%>',show:1}"><%=HR_Scheduling_IniProject.Attribute.ProjectName._ZhName %></td><!--方案名称-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            
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
            
            <td>{ProjectName}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_Scheduling_IniProject)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((HR_Scheduling_IniProject)Container.DataItem).PATH, ((HR_Scheduling_IniProject)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).SelBanciId %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).XiuXi %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).WorkDayType %></td>
                    
                    
                    <td><%#(((HR_Scheduling_IniProject)Container.DataItem).StartTime == DateTime.MinValue) ? "" : ((HR_Scheduling_IniProject)Container.DataItem).StartTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((HR_Scheduling_IniProject)Container.DataItem).EndTime == DateTime.MinValue) ? "" : ((HR_Scheduling_IniProject)Container.DataItem).EndTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).FuGaiOrZengBu %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).StaffID %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).DeptID %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).OrgID %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).ProjectName %></td>
                    
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