<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_DATASOURCEManage" CodeFile="SYS_DATASOURCEManage.aspx.cs" %>
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
         
            <dl colname="SYS_DATASOURCE.ID">
               <dt><%=SYS_DATASOURCE.Attribute.ID.ZhName %>：</dt><!--自动标识-->
               <dd><span>
                
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_DATASOURCE.SourceConnectString">
               <dt><%=SYS_DATASOURCE.Attribute.SourceConnectString.ZhName %>：</dt><!--数据源连接字符串-->
               <dd><span>
                
                    <input id="txtSourceConnectString" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_DATASOURCE.SourceType">
               <dt><%=SYS_DATASOURCE.Attribute.SourceType.ZhName %>：</dt><!--数据源类型-->
               <dd><span>
                
                    <input id="txtSourceType" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_DATASOURCE.SourceName">
               <dt><%=SYS_DATASOURCE.Attribute.SourceName.ZhName %>：</dt><!--数据源简称-->
               <dd><span>
                
                    <input id="txtSourceName" type="text" runat="server" />
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
            <li><span><input power="newSYS_DATASOURCE" id="btn_New" type="button" value="新建" onclick="manager.newRecord('SYS_DATASOURCEEdit.aspx');" /></span></li>
            <li><span><input power="editSYS_DATASOURCE" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('SYS_DATASOURCEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newSYS_DATASOURCE" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('SYS_DATASOURCEBack.aspx');" /></span></li>
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
                   <%-- <td><a href="SYS_DATASOURCEManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=SYS_DATASOURCE.Attribute.ID.LongName%>',show:1}"><%=SYS_DATASOURCE.Attribute.ID._ZhName %></td><!--自动标识-->
                    
                    
                    <td data="{colname:'<%=SYS_DATASOURCE.Attribute.SourceConnectString.LongName%>',show:1}"><%=SYS_DATASOURCE.Attribute.SourceConnectString._ZhName %></td><!--数据源连接字符串-->
                    
                    
                    <td data="{colname:'<%=SYS_DATASOURCE.Attribute.SourceType.LongName%>',show:1}"><%=SYS_DATASOURCE.Attribute.SourceType._ZhName %></td><!--数据源类型-->
                    
                    
                    <td data="{colname:'<%=SYS_DATASOURCE.Attribute.SourceName.LongName%>',show:1}"><%=SYS_DATASOURCE.Attribute.SourceName._ZhName %></td><!--数据源简称-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            
            <td>{ID}</td>
            
            <td>{SourceConnectString}</td>
            
            <td>{SourceType}</td>
            
            <td>{SourceName}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_DATASOURCE)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((SYS_DATASOURCE)Container.DataItem).PATH, ((SYS_DATASOURCE)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).SourceConnectString %></td>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).SourceType %></td>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).SourceName %></td>
                    
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