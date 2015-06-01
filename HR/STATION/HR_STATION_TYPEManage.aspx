<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="HR_STATION_TYPEManage.aspx.cs" Inherits="HR_STATION_TYPEManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
         
            <dl colname="HR_STATION_TYPE.TYPE_ID">
               <dt><%=HR_STATION_TYPE.Attribute.TYPE_ID.ZhName %>：</dt><!--岗位类型ID-->
               <dd><span>
               
                    <input id="txtTYPE_ID" type="text" runat="server"  ck="{len:8,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_STATION_TYPE.TYPE_NAME">
               <dt><%=HR_STATION_TYPE.Attribute.TYPE_NAME.ZhName %>：</dt><!--岗位类型名称-->
               <dd><span>
               
                    <input id="txtTYPE_NAME" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_STATION_TYPE.ADDTIME">
               <dt><%=HR_STATION_TYPE.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
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
            <li><span><input power="newHR_STATION_TYPE" id="btn_New" type="button" value="新建" onclick="manager.newRecord('HR_STATION_TYPEEdit.aspx');" /></span></li>
            <li><span><input power="editHR_STATION_TYPE" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('HR_STATION_TYPEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newHR_STATION_TYPE" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('HR_STATION_TYPEBack.aspx');" /></span></li>
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
                <tr keyname="TYPE_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=HR_STATION_TYPE.Attribute.TYPE_ID.LongName%>',show:1}"><%=HR_STATION_TYPE.Attribute.TYPE_ID._ZhName %></td><!--岗位类型ID-->
                    
                    
                    <td data="{colname:'<%=HR_STATION_TYPE.Attribute.TYPE_NAME.LongName%>',show:1}"><%=HR_STATION_TYPE.Attribute.TYPE_NAME._ZhName %></td><!--岗位类型名称-->
                    
                    
                    <td data="{colname:'<%=HR_STATION_TYPE.Attribute.ADDTIME.LongName%>',show:1}"><%=HR_STATION_TYPE.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_STATION_TYPE)Container.DataItem).TYPE_ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((HR_STATION_TYPE)Container.DataItem).PATH, ((HR_STATION_TYPE)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((HR_STATION_TYPE)Container.DataItem).TYPE_ID %></td>
                    
                    
                    <td><%#((HR_STATION_TYPE)Container.DataItem).TYPE_NAME %></td>
                    
                    
                    <td><%#(((HR_STATION_TYPE)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((HR_STATION_TYPE)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
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