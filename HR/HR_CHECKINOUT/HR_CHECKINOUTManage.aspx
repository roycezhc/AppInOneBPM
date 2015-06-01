<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKINOUTManage" CodeFile="HR_CHECKINOUTManage.aspx.cs" %>
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
   <div class="topfindl"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="HR_CHECKINOUT.USERID">
               <dt><%=HR_CHECKINOUT.Attribute.USERID.ZhName %>：</dt><!--USERID-->
               <dd><span>
                
                    <input id="txtUSERID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHECKINOUT.CHECKTIME">
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTIME.ZhName %>：</dt><!--CHECKTIME-->
               <dd><span>
               
                    <input id="txtCHECKTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHECKINOUT.STAFF_ID">
               <dt><%=HR_CHECKINOUT.Attribute.STAFF_ID.ZhName %>：</dt><!--STAFF_ID-->
               <dd><span>
                
                    <input id="txtSTAFF_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHECKINOUT.CHECKTYPE">
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTYPE.ZhName %>：</dt><!--CHECKTYPE-->
               <dd><span>
                
                    <input id="txtCHECKTYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHECKINOUT.VERIFYCODE">
               <dt><%=HR_CHECKINOUT.Attribute.VERIFYCODE.ZhName %>：</dt><!--VERIFYCODE-->
               <dd><span>
                
                    <input id="txtVERIFYCODE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHECKINOUT.SENSORID">
               <dt><%=HR_CHECKINOUT.Attribute.SENSORID.ZhName %>：</dt><!--SENSORID-->
               <dd><span>
                
                    <input id="txtSENSORID" type="text" runat="server" />
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
            <li><span><input power="newHR_CHECKINOUT" id="btn_New" type="button" value="新建" onclick="manager.newRecord('HR_CHECKINOUTEdit.aspx');" /></span></li>
            <li><span><input power="editHR_CHECKINOUT" id="btn_Edit" type="button" value="新建" onclick="manager.editRecord('HR_CHECKINOUTEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newHR_CHECKINOUT" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('HR_CHECKINOUTBack.aspx');" /></span></li>
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
                <tr keyname="CHECKTIME">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td><a href="HR_CHECKINOUTManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>
                    
                    
                    <td data="{colname:'<%=HR_CHECKINOUT.Attribute.USERID.LongName%>',show:1}"><%=HR_CHECKINOUT.Attribute.USERID._ZhName %></td><!--USERID-->
                    
                    
                    <td data="{colname:'<%=HR_CHECKINOUT.Attribute.CHECKTIME.LongName%>',show:1}"><%=HR_CHECKINOUT.Attribute.CHECKTIME._ZhName %></td><!--CHECKTIME-->
                    
                    
                    <td data="{colname:'<%=HR_CHECKINOUT.Attribute.STAFF_ID.LongName%>',show:1}"><%=HR_CHECKINOUT.Attribute.STAFF_ID._ZhName %></td><!--STAFF_ID-->
                    
                    
                    <td data="{colname:'<%=HR_CHECKINOUT.Attribute.CHECKTYPE.LongName%>',show:1}"><%=HR_CHECKINOUT.Attribute.CHECKTYPE._ZhName %></td><!--CHECKTYPE-->
                    
                    
                    <td data="{colname:'<%=HR_CHECKINOUT.Attribute.VERIFYCODE.LongName%>',show:1}"><%=HR_CHECKINOUT.Attribute.VERIFYCODE._ZhName %></td><!--VERIFYCODE-->
                    
                    
                    <td data="{colname:'<%=HR_CHECKINOUT.Attribute.SENSORID.LongName%>',show:1}"><%=HR_CHECKINOUT.Attribute.SENSORID._ZhName %></td><!--SENSORID-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_CHECKINOUT)Container.DataItem).CHECKTIME%>" /></td>
                    <td><%#((HR_CHECKINOUT)Container.DataItem).USERID %></td>
                    
                    
                    <td><%#(((HR_CHECKINOUT)Container.DataItem).CHECKTIME == DateTime.MinValue) ? "" : ((HR_CHECKINOUT)Container.DataItem).CHECKTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).STAFF_ID %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).CHECKTYPE %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).VERIFYCODE %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).SENSORID %></td>
                    
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
</asp:Content>