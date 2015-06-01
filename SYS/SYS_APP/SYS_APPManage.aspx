<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_APPManage.aspx.cs" Inherits="SYS_APPManage" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->
        
         
            <dl colname="SYS_APP.APP_ID">
               <dt><%=SYS_APP.Attribute.APP_ID.ZhName %>：</dt><!--APP_ID-->
               <dd><span>
               
                    <input id="txtAPP_ID" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_APP.APP_NAME">
               <dt><%=SYS_APP.Attribute.APP_NAME.ZhName %>：</dt><!--APP_NAM-->
               <dd><span>
               
                    <input id="txtAPP_NAME" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_APP.APP_LABEL">
               <dt><%=SYS_APP.Attribute.APP_LABEL.ZhName %>：</dt><!--应用系统名-->
               <dd><span>
               
                    <input id="txtAPP_LABEL" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_APP.DEFAULT_URL">
               <dt><%=SYS_APP.Attribute.DEFAULT_URL.ZhName %>：</dt><!--内部首页地址-->
               <dd><span>
               
                    <input id="txtDEFAULT_URL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_APP.DEFAULT_URL_NAME">
               <dt><%=SYS_APP.Attribute.DEFAULT_URL_NAME.ZhName %>：</dt><!--内部首页名称-->
               <dd><span>
               
                    <input id="txtDEFAULT_URL_NAME" type="text" runat="server"  ck="{len:200,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_APP.IsBigSystem">
               <dt><%=SYS_APP.Attribute.IsBigSystem.ZhName %>：</dt><!--是否独立系统-->
               <dd><span>
               
                    <select id="txtIsBigSystem" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_APP.Note">
               <dt><%=SYS_APP.Attribute.Note.ZhName %>：</dt><!--备注-->
               <dd><span>
               
                    <input id="txtNote" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_APP.APP_IMG">
               <dt><%=SYS_APP.Attribute.APP_IMG.ZhName %>：</dt><!--图标-->
               <dd><span>
               
                    <input id="txtAPP_IMG" type="text" runat="server"  ck="{len:300,type:0}" />
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
            <li><span><input power="newSYS_APP" id="btn_New" type="button" value="新建" onclick="manager.newRecord('SYS_APPEdit.aspx');" /></span></li>
            <li><span><input power="editSYS_APP" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('SYS_APPEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newSYS_APP" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('SYS_APPBack.aspx');" /></span></li>
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
                <tr keyname="APP_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%--<td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=SYS_APP.Attribute.APP_ID.LongName%>',show:1}"><%=SYS_APP.Attribute.APP_ID._ZhName %></td><!--APP_ID-->
                    
                    
                    <td data="{colname:'<%=SYS_APP.Attribute.APP_NAME.LongName%>',show:1}"><%=SYS_APP.Attribute.APP_NAME._ZhName %></td><!--APP_NAM-->
                    
                    
                    <td data="{colname:'<%=SYS_APP.Attribute.APP_LABEL.LongName%>',show:1}"><%=SYS_APP.Attribute.APP_LABEL._ZhName %></td><!--应用系统名-->
                    
                    
                    <td data="{colname:'<%=SYS_APP.Attribute.DEFAULT_URL.LongName%>',show:1}"><%=SYS_APP.Attribute.DEFAULT_URL._ZhName %></td><!--内部首页地址-->
                    
                    
                    <td data="{colname:'<%=SYS_APP.Attribute.DEFAULT_URL_NAME.LongName%>',show:1}"><%=SYS_APP.Attribute.DEFAULT_URL_NAME._ZhName %></td><!--内部首页名称-->
                    
                    
                    <td data="{colname:'<%=SYS_APP.Attribute.IsBigSystem.LongName%>',show:1}"><%=SYS_APP.Attribute.IsBigSystem._ZhName %></td><!--是否独立系统-->
                    
                    
                    <td data="{colname:'<%=SYS_APP.Attribute.Note.LongName%>',show:1}"><%=SYS_APP.Attribute.Note._ZhName %></td><!--备注-->
                    
                    
                    <td data="{colname:'<%=SYS_APP.Attribute.APP_IMG.LongName%>',show:1}"><%=SYS_APP.Attribute.APP_IMG._ZhName %></td><!--图标-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_APP)Container.DataItem).APP_ID%>" /></td>
                     <td>
                    <%#GetHtml(((SYS_APP)Container.DataItem), new SYS_APP(),
                        SYS_APP.Attribute.APP_ID, SYS_APP.Attribute.APP_NAME)%>                    
                    </td>
                   <%-- <td><%#showLeftLinks(((SYS_APP)Container.DataItem).PATH, ((SYS_APP)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_ID %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_NAME %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_LABEL %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).DEFAULT_URL %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).DEFAULT_URL_NAME %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(SYS_APP.Attribute.IsBigSystem, ((SYS_APP)Container.DataItem).IsBigSystem)%></td>
                    
                    
                     <td><%#HtmlHelper.GetSummary(((SYS_APP)Container.DataItem).Note) %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_IMG %></td>
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