<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_fieldSels.aspx.cs" Inherits="Ec_fieldSels" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows(); Sels_Load();
        });
    </script>
    <script src="../../Lib/Mdl/Sels.js" type="text/javascript"></script>
    <style type="text/css">
    #divList tbody tr td{ cursor:pointer;}
    .lrlayout .left{border:none;}
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
 <div class="main">
    <input id="hidCondition" type="hidden" runat="server" />
    <input id="hidOld" type="hidden" runat="server" />
    <input id="hidInitIDS" type="hidden" runat="server" />
    <div class="titnav">
       <dl><dt><b><%#title %>多选</b></dt><dd></dd></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
     <div class="topfind">
         
            <dl colname="Fieldid">
               <dt><%=Ec_field.Attribute.Fieldid.ZhName %>：</dt><!--字段ID-->
               <dd><span>
               
                    <input id="txtFieldid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Tabid">
               <dt><%=Ec_field.Attribute.Tabid.ZhName %>：</dt><!--模块ID-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Columnname">
               <dt><%=Ec_field.Attribute.Columnname.ZhName %>：</dt><!--列名-->
               <dd><span>
               
                    <input id="txtColumnname" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Tablename">
               <dt><%=Ec_field.Attribute.Tablename.ZhName %>：</dt><!--表名-->
               <dd><span>
               
                    <input id="txtTablename" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Generatedtype">
               <dt><%=Ec_field.Attribute.Generatedtype.ZhName %>：</dt><!--生成类型-->
               <dd><span>
               
                    <input id="txtGeneratedtype" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Uitype">
               <dt><%=Ec_field.Attribute.Uitype.ZhName %>：</dt><!--控件类型-->
               <dd><span>
               
                    <select id="txtUitype" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="Fieldname">
               <dt><%=Ec_field.Attribute.Fieldname.ZhName %>：</dt><!--字段名-->
               <dd><span>
               
                    <input id="txtFieldname" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Fieldlabel">
               <dt><%=Ec_field.Attribute.Fieldlabel.ZhName %>：</dt><!--字段标签-->
               <dd><span>
               
                    <input id="txtFieldlabel" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Readonly">
               <dt><%=Ec_field.Attribute.Readonly.ZhName %>：</dt><!--只读-->
               <dd><span>
               
                    <select id="txtReadonly" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="Presence">
               <dt><%=Ec_field.Attribute.Presence.ZhName %>：</dt><!--是否存在-->
               <dd><span>
               
                    <select id="txtPresence" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="Selected">
               <dt><%=Ec_field.Attribute.Selected.ZhName %>：</dt><!--是否选择-->
               <dd><span>
               
                    <select id="txtSelected" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="Maximumlength">
               <dt><%=Ec_field.Attribute.Maximumlength.ZhName %>：</dt><!--最大长度-->
               <dd><span>
               
                    <input id="txtMaximumlength" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Sequence">
               <dt><%=Ec_field.Attribute.Sequence.ZhName %>：</dt><!--顺序号-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Block">
               <dt><%=Ec_field.Attribute.Block.ZhName %>：</dt><!--布局编号-->
               <dd><span>
               
                    <input id="txtBlock" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Displaytype">
               <dt><%=Ec_field.Attribute.Displaytype.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtDisplaytype" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="Typeofdata">
               <dt><%=Ec_field.Attribute.Typeofdata.ZhName %>：</dt><!--包含‘o’是必-->
               <dd><span>
               
                    <input id="txtTypeofdata" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Quickcreate">
               <dt><%=Ec_field.Attribute.Quickcreate.ZhName %>：</dt><!--是否快速创建-->
               <dd><span>
               
                    <select id="txtQuickcreate" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="Quickcreatesequence">
               <dt><%=Ec_field.Attribute.Quickcreatesequence.ZhName %>：</dt><!--快速创建的次序-->
               <dd><span>
               
                    <input id="txtQuickcreatesequence" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Info_type">
               <dt><%=Ec_field.Attribute.Info_type.ZhName %>：</dt><!--类型-->
               <dd><span>
               
                    <select id="txtInfo_type" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="CtrlType">
               <dt><%=Ec_field.Attribute.CtrlType.ZhName %>：</dt><!--控件类型-->
               <dd><span>
               
                    <select id="txtCtrlType" runat="server">
                    </select>
               </span></dd>
        </dl>     
        <dl class="btn"><dd>
        <a href="#" class="btn"><asp:Button ID="btnFind" runat="server" Text="查询" OnClick="btnFind_Click" /></a>
        <a href="#" class="btn"><input id="btnSelOK" type="button" value="<%=LanguageService.GetLanguageString("SureChoose", "确定选择") %>" onclick="selok();" /></a>
        <a href="#" class="btn"><input type="button" id="btnClear" value="<%=LanguageService.GetLanguageString("Clear", "清空") %>" /></a>
        </dd></dl>
        <div class="clear"></div>
    </div>    
    <div class="lrlayout">
    <div class="left" style="width:150px;height:400px;">
       <select id="selectedlist" multiple="multiple" style="color:Blue;width:100%;height:100%;">
       </select>
    </div>
    <div class="right" style="margin-left:152px;height:400px;">
    <div class="tblist" id="divList">
       <table cellpadding="0" cellspacing="0">
             <thead>
                <tr>
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "全选") %>' onclick='_selAll(this);'/><%=LanguageService.GetLanguageString("Choose", "选择") %></td>
                    
                    
                    <td><%=Ec_field.Attribute.Fieldid._ZhName %><!--字段ID--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Tabid._ZhName %><!--模块ID--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Columnname._ZhName %><!--列名--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Tablename._ZhName %><!--表名--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Generatedtype._ZhName %><!--生成类型--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Uitype._ZhName %><!--控件类型--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Fieldname._ZhName %><!--字段名--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Fieldlabel._ZhName %><!--字段标签--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Readonly._ZhName %><!--只读--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Presence._ZhName %><!--是否存在--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Selected._ZhName %><!--是否选择--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Maximumlength._ZhName %><!--最大长度--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Sequence._ZhName %><!--顺序号--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Block._ZhName %><!--布局编号--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Displaytype._ZhName %><!--状态--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Typeofdata._ZhName %><!--包含‘o’是必--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Quickcreate._ZhName %><!--是否快速创建--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Quickcreatesequence._ZhName %><!--快速创建的次序--></td>
                    
                    
                    <td><%=Ec_field.Attribute.Info_type._ZhName %><!--类型--></td>
                    
                    
                    <td><%=Ec_field.Attribute.CtrlType._ZhName %><!--控件类型--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((Ec_field)Container.DataItem).Fieldid %>" /></td>
                     
                    
                    <td><%#((Ec_field)Container.DataItem).Fieldid %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Columnname %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Tablename %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Generatedtype %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(Ec_field.Attribute.Uitype, ((Ec_field)Container.DataItem).Uitype)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Fieldname %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Fieldlabel %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(Ec_field.Attribute.Readonly, ((Ec_field)Container.DataItem).Readonly)%></td>
                    
                    
                    <td><%#formhelper.GetOptionText(Ec_field.Attribute.Presence, ((Ec_field)Container.DataItem).Presence)%></td>
                    
                    
                    <td><%#formhelper.GetOptionText(Ec_field.Attribute.Selected, ((Ec_field)Container.DataItem).Selected)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Maximumlength %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Sequence %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Block %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(Ec_field.Attribute.Displaytype, ((Ec_field)Container.DataItem).Displaytype)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Typeofdata %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(Ec_field.Attribute.Quickcreate, ((Ec_field)Container.DataItem).Quickcreate)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Quickcreatesequence %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(Ec_field.Attribute.Info_type, ((Ec_field)Container.DataItem).Info_type)%></td>
                    
                    
                    <td><%#formhelper.GetOptionText(Ec_field.Attribute.CtrlType, ((Ec_field)Container.DataItem).CtrlType)%></td>
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
     </div>
 </div>
</asp:Content>
