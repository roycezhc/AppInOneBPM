<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_entitynameManage.aspx.cs" Inherits="Ec_entitynameManage" %>
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
         
            <dl colname="Ec_entityname.Tabid">
               <dt><%=Ec_entityname.Attribute.Tabid.ZhName %>：</dt><!--Tabid-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_entityname.Modulename">
               <dt><%=Ec_entityname.Attribute.Modulename.ZhName %>：</dt><!--IsTab英文-->
               <dd><span>
               
                    <input id="txtModulename" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_entityname.Tablename">
               <dt><%=Ec_entityname.Attribute.Tablename.ZhName %>：</dt><!--表名-->
               <dd><span>
               
                    <input id="txtTablename" type="text" runat="server"  ck="{len:100,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_entityname.Fieldname">
               <dt><%=Ec_entityname.Attribute.Fieldname.ZhName %>：</dt><!--表NAME-->
               <dd><span>
               
                    <input id="txtFieldname" type="text" runat="server"  ck="{len:150,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_entityname.Entityidfield">
               <dt><%=Ec_entityname.Attribute.Entityidfield.ZhName %>：</dt><!--表ID-->
               <dd><span>
               
                    <input id="txtEntityidfield" type="text" runat="server"  ck="{len:150,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_entityname.Remarks">
               <dt><%=Ec_entityname.Attribute.Remarks.ZhName %>：</dt><!--IsTab中文-->
               <dd><span>
               
                    <input id="txtRemarks" type="text" runat="server"  ck="{len:255,type:0}" />
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
            <li><span><input power="newEc_entityname" id="btn_New" type="button" value="新建" onclick="manager.newRecord('Ec_entitynameEdit.aspx');" /></span></li>
            <li><span><input power="editEc_entityname" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('Ec_entitynameEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newEc_entityname" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('Ec_entitynameBack.aspx');" /></span></li>
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
                <tr keyname="Tabid">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=Ec_entityname.Attribute.Tabid.LongName%>',show:1}"><%=Ec_entityname.Attribute.Tabid._ZhName %></td><!--Tabid-->
                    
                    
                    <td data="{colname:'<%=Ec_entityname.Attribute.Modulename.LongName%>',show:1}"><%=Ec_entityname.Attribute.Modulename._ZhName %></td><!--IsTab英文-->
                    
                    
                    <td data="{colname:'<%=Ec_entityname.Attribute.Tablename.LongName%>',show:1}"><%=Ec_entityname.Attribute.Tablename._ZhName %></td><!--表名-->
                    
                    
                    <td data="{colname:'<%=Ec_entityname.Attribute.Fieldname.LongName%>',show:1}"><%=Ec_entityname.Attribute.Fieldname._ZhName %></td><!--表NAME-->
                    
                    
                    <td data="{colname:'<%=Ec_entityname.Attribute.Entityidfield.LongName%>',show:1}"><%=Ec_entityname.Attribute.Entityidfield._ZhName %></td><!--表ID-->
                    
                    
                    <td data="{colname:'<%=Ec_entityname.Attribute.Remarks.LongName%>',show:1}"><%=Ec_entityname.Attribute.Remarks._ZhName %></td><!--IsTab中文-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((Ec_entityname)Container.DataItem).Tabid%>" /></td>
                   <%-- <td><%#showLeftLinks(((Ec_entityname)Container.DataItem).PATH, ((Ec_entityname)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Modulename %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Tablename %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Fieldname %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Entityidfield %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Remarks %></td>
                    
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