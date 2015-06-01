<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_blocksManage.aspx.cs" Inherits="Ec_blocksManage" %>
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
         
            <dl colname="Ec_blocks.Blockid">
               <dt><%=Ec_blocks.Attribute.Blockid.ZhName %>：</dt><!--Blockid-->
               <dd><span>
               
                    <input id="txtBlockid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Tabid">
               <dt><%=Ec_blocks.Attribute.Tabid.ZhName %>：</dt><!--模块id-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Blocklabel">
               <dt><%=Ec_blocks.Attribute.Blocklabel.ZhName %>：</dt><!--显示区域名称-->
               <dd><span>
               
                    <input id="txtBlocklabel" type="text" runat="server"  ck="{len:100,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Sequence">
               <dt><%=Ec_blocks.Attribute.Sequence.ZhName %>：</dt><!--显示顺序-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Show_title">
               <dt><%=Ec_blocks.Attribute.Show_title.ZhName %>：</dt><!--标题-->
               <dd><span>
               
                    <input id="txtShow_title" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Visible">
               <dt><%=Ec_blocks.Attribute.Visible.ZhName %>：</dt><!--是否可见-->
               <dd><span>
               
                    <input id="txtVisible" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Create_view">
               <dt><%=Ec_blocks.Attribute.Create_view.ZhName %>：</dt><!--Create_-->
               <dd><span>
               
                    <input id="txtCreate_view" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Edit_view">
               <dt><%=Ec_blocks.Attribute.Edit_view.ZhName %>：</dt><!--Edit_vi-->
               <dd><span>
               
                    <input id="txtEdit_view" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Detail_view">
               <dt><%=Ec_blocks.Attribute.Detail_view.ZhName %>：</dt><!--Detail_-->
               <dd><span>
               
                    <input id="txtDetail_view" type="text" runat="server"  ck="{len:4,type:1}" />
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
            <li><span><input power="newEc_blocks" id="btn_New" type="button" value="新建" onclick="manager.newRecord('Ec_blocksEdit.aspx');" /></span></li>
            <li><span><input power="editEc_blocks" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('Ec_blocksEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newEc_blocks" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('Ec_blocksBack.aspx');" /></span></li>
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
                <tr keyname="Blockid">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Blockid.LongName%>',show:1}"><%=Ec_blocks.Attribute.Blockid._ZhName %></td><!--Blockid-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Tabid.LongName%>',show:1}"><%=Ec_blocks.Attribute.Tabid._ZhName %></td><!--模块id-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Blocklabel.LongName%>',show:1}"><%=Ec_blocks.Attribute.Blocklabel._ZhName %></td><!--显示区域名称-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Sequence.LongName%>',show:1}"><%=Ec_blocks.Attribute.Sequence._ZhName %></td><!--显示顺序-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Show_title.LongName%>',show:1}"><%=Ec_blocks.Attribute.Show_title._ZhName %></td><!--标题-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Visible.LongName%>',show:1}"><%=Ec_blocks.Attribute.Visible._ZhName %></td><!--是否可见-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Create_view.LongName%>',show:1}"><%=Ec_blocks.Attribute.Create_view._ZhName %></td><!--Create_-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Edit_view.LongName%>',show:1}"><%=Ec_blocks.Attribute.Edit_view._ZhName %></td><!--Edit_vi-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Detail_view.LongName%>',show:1}"><%=Ec_blocks.Attribute.Detail_view._ZhName %></td><!--Detail_-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((Ec_blocks)Container.DataItem).Blockid%>" /></td>
                   <%-- <td><%#showLeftLinks(((Ec_blocks)Container.DataItem).PATH, ((Ec_blocks)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Blockid %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Blocklabel %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Sequence %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Show_title %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Visible %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Create_view %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Edit_view %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Detail_view %></td>
                    
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