<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_relatedlistsManage.aspx.cs" Inherits="Ec_relatedlistsManage" %>
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
         
            <dl colname="Ec_relatedlists.Relation_id">
               <dt><%=Ec_relatedlists.Attribute.Relation_id.ZhName %>：</dt><!--Relatio-->
               <dd><span>
               
                    <input id="txtRelation_id" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.Tabid">
               <dt><%=Ec_relatedlists.Attribute.Tabid.ZhName %>：</dt><!--模块id-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.Related_tabid">
               <dt><%=Ec_relatedlists.Attribute.Related_tabid.ZhName %>：</dt><!--Related-->
               <dd><span>
               
                    <input id="txtRelated_tabid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.Name">
               <dt><%=Ec_relatedlists.Attribute.Name.ZhName %>：</dt><!--Name-->
               <dd><span>
               
                    <input id="txtName" type="text" runat="server"  ck="{len:100,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.Sequence">
               <dt><%=Ec_relatedlists.Attribute.Sequence.ZhName %>：</dt><!--Sequenc-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.Label">
               <dt><%=Ec_relatedlists.Attribute.Label.ZhName %>：</dt><!--Label-->
               <dd><span>
               
                    <input id="txtLabel" type="text" runat="server"  ck="{len:100,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.Presence">
               <dt><%=Ec_relatedlists.Attribute.Presence.ZhName %>：</dt><!--是否显示0显示-->
               <dd><span>
               
                    <input id="txtPresence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.TabTableName">
               <dt><%=Ec_relatedlists.Attribute.TabTableName.ZhName %>：</dt><!--主表名-->
               <dd><span>
               
                    <input id="txtTabTableName" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.ColumnName_PK">
               <dt><%=Ec_relatedlists.Attribute.ColumnName_PK.ZhName %>：</dt><!--主字段名-->
               <dd><span>
               
                    <input id="txtColumnName_PK" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.ColumnName_FK">
               <dt><%=Ec_relatedlists.Attribute.ColumnName_FK.ZhName %>：</dt><!--外联字段名-->
               <dd><span>
               
                    <input id="txtColumnName_FK" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_relatedlists.Related_tabTableName">
               <dt><%=Ec_relatedlists.Attribute.Related_tabTableName.ZhName %>：</dt><!--外联表名-->
               <dd><span>
               
                    <input id="txtRelated_tabTableName" type="text" runat="server"  ck="{len:50,type:0}" />
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
            <li><span><input power="newEc_relatedlists" id="btn_New" type="button" value="新建" onclick="manager.newRecord('Ec_relatedlistsEdit.aspx');" /></span></li>
            <li><span><input power="editEc_relatedlists" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('Ec_relatedlistsEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newEc_relatedlists" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('Ec_relatedlistsBack.aspx');" /></span></li>
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
                <tr keyname="Relation_id">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.Relation_id.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.Relation_id._ZhName %></td><!--Relatio-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.Tabid.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.Tabid._ZhName %></td><!--模块id-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.Related_tabid.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.Related_tabid._ZhName %></td><!--Related-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.Name.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.Name._ZhName %></td><!--Name-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.Sequence.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.Sequence._ZhName %></td><!--Sequenc-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.Label.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.Label._ZhName %></td><!--Label-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.Presence.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.Presence._ZhName %></td><!--是否显示0显示-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.TabTableName.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.TabTableName._ZhName %></td><!--主表名-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.ColumnName_PK.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.ColumnName_PK._ZhName %></td><!--主字段名-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.ColumnName_FK.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.ColumnName_FK._ZhName %></td><!--外联字段名-->
                    
                    
                    <td data="{colname:'<%=Ec_relatedlists.Attribute.Related_tabTableName.LongName%>',show:1}"><%=Ec_relatedlists.Attribute.Related_tabTableName._ZhName %></td><!--外联表名-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((Ec_relatedlists)Container.DataItem).Relation_id%>" /></td>
                   <%-- <td><%#showLeftLinks(((Ec_relatedlists)Container.DataItem).PATH, ((Ec_relatedlists)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).Relation_id %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).Related_tabid %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).Name %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).Sequence %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).Label %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).Presence %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).TabTableName %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).ColumnName_PK %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).ColumnName_FK %></td>
                    
                    
                    <td><%#((Ec_relatedlists)Container.DataItem).Related_tabTableName %></td>
                    
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