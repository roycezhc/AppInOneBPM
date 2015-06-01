<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_relatedlistsSels.aspx.cs" Inherits="Ec_relatedlistsSels" %>
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
         
            <dl colname="Relation_id">
               <dt><%=Ec_relatedlists.Attribute.Relation_id.ZhName %>：</dt><!--Relatio-->
               <dd><span>
               
                    <input id="txtRelation_id" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Tabid">
               <dt><%=Ec_relatedlists.Attribute.Tabid.ZhName %>：</dt><!--模块id-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Related_tabid">
               <dt><%=Ec_relatedlists.Attribute.Related_tabid.ZhName %>：</dt><!--Related-->
               <dd><span>
               
                    <input id="txtRelated_tabid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Name">
               <dt><%=Ec_relatedlists.Attribute.Name.ZhName %>：</dt><!--Name-->
               <dd><span>
               
                    <input id="txtName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Sequence">
               <dt><%=Ec_relatedlists.Attribute.Sequence.ZhName %>：</dt><!--Sequenc-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Label">
               <dt><%=Ec_relatedlists.Attribute.Label.ZhName %>：</dt><!--Label-->
               <dd><span>
               
                    <input id="txtLabel" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Presence">
               <dt><%=Ec_relatedlists.Attribute.Presence.ZhName %>：</dt><!--是否显示0显示-->
               <dd><span>
               
                    <input id="txtPresence" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TabTableName">
               <dt><%=Ec_relatedlists.Attribute.TabTableName.ZhName %>：</dt><!--主表名-->
               <dd><span>
               
                    <input id="txtTabTableName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ColumnName_PK">
               <dt><%=Ec_relatedlists.Attribute.ColumnName_PK.ZhName %>：</dt><!--主字段名-->
               <dd><span>
               
                    <input id="txtColumnName_PK" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ColumnName_FK">
               <dt><%=Ec_relatedlists.Attribute.ColumnName_FK.ZhName %>：</dt><!--外联字段名-->
               <dd><span>
               
                    <input id="txtColumnName_FK" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Related_tabTableName">
               <dt><%=Ec_relatedlists.Attribute.Related_tabTableName.ZhName %>：</dt><!--外联表名-->
               <dd><span>
               
                    <input id="txtRelated_tabTableName" type="text" runat="server"/>
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
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Relation_id._ZhName %><!--Relatio--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Tabid._ZhName %><!--模块id--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Related_tabid._ZhName %><!--Related--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Name._ZhName %><!--Name--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Sequence._ZhName %><!--Sequenc--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Label._ZhName %><!--Label--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Presence._ZhName %><!--是否显示0显示--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.TabTableName._ZhName %><!--主表名--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.ColumnName_PK._ZhName %><!--主字段名--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.ColumnName_FK._ZhName %><!--外联字段名--></td>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Related_tabTableName._ZhName %><!--外联表名--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((Ec_relatedlists)Container.DataItem).Relation_id %>" /></td>
                     
                    
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
    <div class="pages">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
     </div>
     </div>
     </div>
 </div>
</asp:Content>
