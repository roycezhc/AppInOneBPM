<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_SchedulingManage" CodeFile="HR_SchedulingManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
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
   <div class="topfindl" style="display:none;"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="HR_Scheduling.Year">
               <dt><%=HR_Scheduling.Attribute.SchYear.ZhName%>：</dt><!--年-->
               <dd><span>
                
                    <input id="txtYear" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling.Month">
               <dt><%=HR_Scheduling.Attribute.SchMonth.ZhName%>：</dt><!--月-->
               <dd><span>
                
                    <input id="txtMonth" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling.Day">
               <dt><%=HR_Scheduling.Attribute.SchDay.ZhName%>：</dt><!--日-->
               <dd><span>
                
                    <input id="txtDay" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling.Type">
               <dt><%=HR_Scheduling.Attribute.SchType.ZhName%>：</dt><!--类型-->
               <dd><span>
               
                    <select id="txtType" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling.SchClassid">
               <dt><%=HR_Scheduling.Attribute.SchClassid.ZhName %>：</dt><!--排版编号-->
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl><dt></dt><dd class="btn">
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newHR_Scheduling" id="btn_New" type="button" value="新建" onclick="manager.newRecord('HR_SchedulingEdit.aspx');" /></span></li>
            <li><span><input power="editHR_Scheduling" id="btn_Edit" type="button" value="新建" onclick="manager.editRecord('HR_SchedulingEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newHR_Scheduling" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('HR_SchedulingBack.aspx');" /></span></li>
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
                <tr keyname="Day">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchYear.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchYear._ZhName%></td><!--年-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchMonth.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchMonth._ZhName%></td><!--月-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchDay.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchDay._ZhName%></td><!--日-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchType.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchType._ZhName%></td><!--类型-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchClassid.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchClassid._ZhName %></td><!--排版编号-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_Scheduling)Container.DataItem).SchDay%>" /></td>
                    
                    <td><%#((HR_Scheduling)Container.DataItem).SchYear %></td>
                    
                    
                    <td><%#((HR_Scheduling)Container.DataItem).SchMonth%></td>
                    
                    
                    <td><%#((HR_Scheduling)Container.DataItem).SchDay%></td>
                    
                    
                    <td><%#FormHelper.GetText(HR_Scheduling.Attribute.SchType, ((HR_Scheduling)Container.DataItem).SchType)%></td>
                    
                    
                    <td><%#((HR_Scheduling)Container.DataItem).SchClassid %></td>
                    
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