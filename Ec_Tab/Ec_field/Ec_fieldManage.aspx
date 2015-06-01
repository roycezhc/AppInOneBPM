<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_fieldManage.aspx.cs" Inherits="Ec_fieldManage" %>
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
         
            <dl colname="Ec_field.Fieldid">
               <dt><%=Ec_field.Attribute.Fieldid.ZhName %>：</dt><!--字段ID-->
               <dd><span>
               
                    <input id="txtFieldid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Tabid">
               <dt><%=Ec_field.Attribute.Tabid.ZhName %>：</dt><!--模块ID-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Columnname">
               <dt><%=Ec_field.Attribute.Columnname.ZhName %>：</dt><!--列名-->
               <dd><span>
               
                    <input id="txtColumnname" type="text" runat="server"  ck="{len:30,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Tablename">
               <dt><%=Ec_field.Attribute.Tablename.ZhName %>：</dt><!--表名-->
               <dd><span>
               
                    <input id="txtTablename" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Generatedtype">
               <dt><%=Ec_field.Attribute.Generatedtype.ZhName %>：</dt><!--生成类型-->
               <dd><span>
               
                    <input id="txtGeneratedtype" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Uitype">
               <dt><%=Ec_field.Attribute.Uitype.ZhName %>：</dt><!--控件类型-->
               <dd><span>
               
                    <select id="txtUitype" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Fieldname">
               <dt><%=Ec_field.Attribute.Fieldname.ZhName %>：</dt><!--字段名-->
               <dd><span>
               
                    <input id="txtFieldname" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Fieldlabel">
               <dt><%=Ec_field.Attribute.Fieldlabel.ZhName %>：</dt><!--字段标签-->
               <dd><span>
               
                    <input id="txtFieldlabel" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Readonly">
               <dt><%=Ec_field.Attribute.Readonly.ZhName %>：</dt><!--只读-->
               <dd><span>
               
                    <select id="txtReadonly" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Presence">
               <dt><%=Ec_field.Attribute.Presence.ZhName %>：</dt><!--是否存在-->
               <dd><span>
               
                    <select id="txtPresence" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Selected">
               <dt><%=Ec_field.Attribute.Selected.ZhName %>：</dt><!--是否选择-->
               <dd><span>
               
                    <select id="txtSelected" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Maximumlength">
               <dt><%=Ec_field.Attribute.Maximumlength.ZhName %>：</dt><!--最大长度-->
               <dd><span>
               
                    <input id="txtMaximumlength" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Sequence">
               <dt><%=Ec_field.Attribute.Sequence.ZhName %>：</dt><!--顺序号-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Block">
               <dt><%=Ec_field.Attribute.Block.ZhName %>：</dt><!--布局编号-->
               <dd><span>
               
                    <input id="txtBlock" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Displaytype">
               <dt><%=Ec_field.Attribute.Displaytype.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtDisplaytype" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Typeofdata">
               <dt><%=Ec_field.Attribute.Typeofdata.ZhName %>：</dt><!--包含‘o’是必-->
               <dd><span>
               
                    <input id="txtTypeofdata" type="text" runat="server"  ck="{len:100,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Quickcreate">
               <dt><%=Ec_field.Attribute.Quickcreate.ZhName %>：</dt><!--是否快速创建-->
               <dd><span>
               
                    <select id="txtQuickcreate" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Quickcreatesequence">
               <dt><%=Ec_field.Attribute.Quickcreatesequence.ZhName %>：</dt><!--快速创建的次序-->
               <dd><span>
               
                    <input id="txtQuickcreatesequence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Info_type">
               <dt><%=Ec_field.Attribute.Info_type.ZhName %>：</dt><!--类型-->
               <dd><span>
               
                    <select id="txtInfo_type" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.CtrlType">
               <dt><%=Ec_field.Attribute.CtrlType.ZhName %>：</dt><!--控件类型-->
               <dd><span>
               
                    <select id="txtCtrlType" runat="server" >
                    </select>
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
            <li><span><input power="newEc_field" id="btn_New" type="button" value="新建" onclick="manager.newRecord('Ec_fieldEdit.aspx');" /></span></li>
            <li><span><input power="editEc_field" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('Ec_fieldEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newEc_field" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('Ec_fieldBack.aspx');" /></span></li>
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
                <tr keyname="Fieldid">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Fieldid.LongName%>',show:1}"><%=Ec_field.Attribute.Fieldid._ZhName %></td><!--字段ID-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Tabid.LongName%>',show:1}"><%=Ec_field.Attribute.Tabid._ZhName %></td><!--模块ID-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Columnname.LongName%>',show:1}"><%=Ec_field.Attribute.Columnname._ZhName %></td><!--列名-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Tablename.LongName%>',show:1}"><%=Ec_field.Attribute.Tablename._ZhName %></td><!--表名-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Generatedtype.LongName%>',show:1}"><%=Ec_field.Attribute.Generatedtype._ZhName %></td><!--生成类型-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Uitype.LongName%>',show:1}"><%=Ec_field.Attribute.Uitype._ZhName %></td><!--控件类型-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Fieldname.LongName%>',show:1}"><%=Ec_field.Attribute.Fieldname._ZhName %></td><!--字段名-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Fieldlabel.LongName%>',show:1}"><%=Ec_field.Attribute.Fieldlabel._ZhName %></td><!--字段标签-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Readonly.LongName%>',show:1}"><%=Ec_field.Attribute.Readonly._ZhName %></td><!--只读-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Presence.LongName%>',show:1}"><%=Ec_field.Attribute.Presence._ZhName %></td><!--是否存在-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Selected.LongName%>',show:1}"><%=Ec_field.Attribute.Selected._ZhName %></td><!--是否选择-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Maximumlength.LongName%>',show:1}"><%=Ec_field.Attribute.Maximumlength._ZhName %></td><!--最大长度-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Sequence.LongName%>',show:1}"><%=Ec_field.Attribute.Sequence._ZhName %></td><!--顺序号-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Block.LongName%>',show:1}"><%=Ec_field.Attribute.Block._ZhName %></td><!--布局编号-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Displaytype.LongName%>',show:1}"><%=Ec_field.Attribute.Displaytype._ZhName %></td><!--状态-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Typeofdata.LongName%>',show:1}"><%=Ec_field.Attribute.Typeofdata._ZhName %></td><!--包含‘o’是必-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Quickcreate.LongName%>',show:1}"><%=Ec_field.Attribute.Quickcreate._ZhName %></td><!--是否快速创建-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Quickcreatesequence.LongName%>',show:1}"><%=Ec_field.Attribute.Quickcreatesequence._ZhName %></td><!--快速创建的次序-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Info_type.LongName%>',show:1}"><%=Ec_field.Attribute.Info_type._ZhName %></td><!--类型-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.CtrlType.LongName%>',show:1}"><%=Ec_field.Attribute.CtrlType._ZhName %></td><!--控件类型-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((Ec_field)Container.DataItem).Fieldid%>" /></td>
                   <%-- <td><%#showLeftLinks(((Ec_field)Container.DataItem).PATH, ((Ec_field)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Fieldid %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Columnname %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Tablename %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Generatedtype %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Uitype, ((Ec_field)Container.DataItem).Uitype)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Fieldname %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Fieldlabel %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Readonly, ((Ec_field)Container.DataItem).Readonly)%></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Presence, ((Ec_field)Container.DataItem).Presence)%></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Selected, ((Ec_field)Container.DataItem).Selected)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Maximumlength %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Sequence %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Block %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Displaytype, ((Ec_field)Container.DataItem).Displaytype)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Typeofdata %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Quickcreate, ((Ec_field)Container.DataItem).Quickcreate)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Quickcreatesequence %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Info_type, ((Ec_field)Container.DataItem).Info_type)%></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.CtrlType, ((Ec_field)Container.DataItem).CtrlType)%></td>
                    
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