<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CUSTOM_WEB_SETManage.aspx.cs" Inherits="WEC_CUSTOM_WEB_SETManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
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
     <style>
        .tblist table tbody tr td input {
           border: solid 1px #65a;
            background: #0b9594;
            color: #fff;
            font-family: 宋体;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->
        
         
         
            <dl colname="WEC_CUSTOM_WEB_SET.A_ID">
               <dt><%=WEC_CUSTOM_WEB_SET.Attribute.A_ID.ZhName %>：</dt><!--网站编号-->
               <dd><span>
               
                    <input id="txtWEC_CUSTOM_WEB_SET_A_ID" type="text" runat="server"  ck="{len:4,type:1}" />
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
            <li><span><input power="newWEC_CUSTOM_WEB_SET" id="btn_New" type="button" value="新建" onclick="manager.newRecord('WEC_CUSTOM_WEB_SETEdit.aspx');" /></span></li>
            <li><span><input power="editWEC_CUSTOM_WEB_SET" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('WEC_CUSTOM_WEB_SETEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_CUSTOM_WEB_SET" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('WEC_CUSTOM_WEB_SETBack.aspx');" /></span></li>
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
                   <%--<td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                  
                    
                    
                    <td data="{colname:'<%=WEC_CUSTOM_WEB_SET.Attribute.A_ID.LongName%>',show:1}"><%=WEC_CUSTOM_WEB_SET.Attribute.A_ID._ZhName %></td><!--网站编号-->
                    <td>操作</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_CUSTOM_WEB_SET)Container.DataItem).ID%>" /></td>
                    <%-- <td>
                    <%#GetHtml(((WEC_CUSTOM_WEB_SET)Container.DataItem), new WEC_CUSTOM_WEB_SET(),
                        WEC_CUSTOM_WEB_SET.Attribute.ID, WEC_CUSTOM_WEB_SET.Attribute.ID)%>                    
                    </td>--%>
                   <%-- <td><%#showLeftLinks(((WEC_CUSTOM_WEB_SET)Container.DataItem).PATH, ((WEC_CUSTOM_WEB_SET)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((WEC_CUSTOM_WEB_SET)Container.DataItem).A_ID %></td>

                      <td> 
                        <input  type="button" value="栏目管理" onclick="window.open('../WebSite/SiteColumn/SiteColumnTree.aspx?aid=<%#((WEC_CUSTOM_WEB_SET)Container.DataItem).A_ID %>')" />
                        <input  type="button" value="首页顶部广告" onclick="window.open('../WebSite/CateBanner/WEC_CUSTOM_CATEBANNERManage.aspx?aid=<%#((WEC_CUSTOM_WEB_SET)Container.DataItem).A_ID %>')" />
                        <input  type="button" value="模板选择" onclick="window.open('../WebSite/Model/WEC_CUSTOM_MODELManage.aspx?aid=<%#((WEC_CUSTOM_WEB_SET)Container.DataItem).A_ID %>')" />
                    </td>
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