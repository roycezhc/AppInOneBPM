<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_Scheduling_IniProjectSel2" CodeFile="HR_Scheduling_IniProjectSel.aspx.cs" %>
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
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="ID">
               <dt><%=HR_Scheduling_IniProject.Attribute.ID.ZhName %>：</dt><!--ID-->
               <dd><span>
                
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SelBanciId">
               <dt><%=HR_Scheduling_IniProject.Attribute.SelBanciId.ZhName %>：</dt><!--所选班次-->
               <dd><span>
                
                    <input id="txtSelBanciId" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="XiuXi">
               <dt><%=HR_Scheduling_IniProject.Attribute.XiuXi.ZhName %>：</dt><!--休息日-->
               <dd><span>
                
                    <input id="txtXiuXi" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="WorkDayType">
               <dt><%=HR_Scheduling_IniProject.Attribute.WorkDayType.ZhName %>：</dt><!--其他排班设置-->
               <dd><span>
               
                    <textarea id="txtWorkDayType" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="StartTime">
               <dt><%=HR_Scheduling_IniProject.Attribute.StartTime.ZhName %>：</dt><!--开始日期-->
               <dd><span>
               
                    <input id="txtStartTime" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EndTime">
               <dt><%=HR_Scheduling_IniProject.Attribute.EndTime.ZhName %>：</dt><!--结束日期-->
               <dd><span>
               
                    <input id="txtEndTime" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FuGaiOrZengBu">
               <dt><%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu.ZhName %>：</dt><!--生成方式{-->
               <dd><span>
                
                    <input id="txtFuGaiOrZengBu" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="StaffID">
               <dt><%=HR_Scheduling_IniProject.Attribute.StaffID.ZhName %>：</dt><!--StaffID-->
               <dd><span>
                
                    <input id="txtStaffID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DeptID">
               <dt><%=HR_Scheduling_IniProject.Attribute.DeptID.ZhName %>：</dt><!--DeptID-->
               <dd><span>
                
                    <input id="txtDeptID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OrgID">
               <dt><%=HR_Scheduling_IniProject.Attribute.OrgID.ZhName %>：</dt><!--OrgID-->
               <dd><span>
                
                    <input id="txtOrgID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ProjectName">
               <dt><%=HR_Scheduling_IniProject.Attribute.ProjectName.ZhName %>：</dt><!--方案名称-->
               <dd><span>
                
                    <input id="txtProjectName" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl class="btn"><dd>
         <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.ID._ZhName %></td><!--ID-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.SelBanciId._ZhName %></td><!--所选班次-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.XiuXi._ZhName %></td><!--休息日-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.WorkDayType._ZhName %></td><!--其他排班设置-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.StartTime._ZhName %></td><!--开始日期-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.EndTime._ZhName %></td><!--结束日期-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu._ZhName %></td><!--生成方式{-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.StaffID._ZhName %></td><!--StaffID-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.DeptID._ZhName %></td><!--DeptID-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.OrgID._ZhName %></td><!--OrgID-->
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.ProjectName._ZhName %></td><!--方案名称-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
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
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

