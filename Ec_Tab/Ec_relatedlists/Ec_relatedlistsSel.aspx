<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_relatedlistsSel.aspx.cs" Inherits="Ec_relatedlistsSel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });

    function selThis_B(tds) {
        var tdObj = $(tds[0]);
        var aObj = tdObj.find("a");
        if (aObj.length > 0) {
            _selERR = "不能选择有子节点的数据！";
            _selOK = false;
        }
    }
    function selOK_B(id) {
        //alert(id);
        $("input[id$='hidSelID']").val(id);
        //alert($("input[id$='hidSelID']").val());
        __doPostBack("ctl00$cphBody$LinkButton1", "");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="Relation_id">
               <dt><%=Ec_relatedlists.Attribute.Relation_id.ZhName %>：</dt><!--Relatio-->
               <dd><span>
               
                    <input id="txtRelation_id" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Tabid">
               <dt><%=Ec_relatedlists.Attribute.Tabid.ZhName %>：</dt><!--模块id-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Related_tabid">
               <dt><%=Ec_relatedlists.Attribute.Related_tabid.ZhName %>：</dt><!--Related-->
               <dd><span>
               
                    <input id="txtRelated_tabid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Name">
               <dt><%=Ec_relatedlists.Attribute.Name.ZhName %>：</dt><!--Name-->
               <dd><span>
               
                    <input id="txtName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Sequence">
               <dt><%=Ec_relatedlists.Attribute.Sequence.ZhName %>：</dt><!--Sequenc-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Label">
               <dt><%=Ec_relatedlists.Attribute.Label.ZhName %>：</dt><!--Label-->
               <dd><span>
               
                    <input id="txtLabel" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Presence">
               <dt><%=Ec_relatedlists.Attribute.Presence.ZhName %>：</dt><!--是否显示0显示-->
               <dd><span>
               
                    <input id="txtPresence" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TabTableName">
               <dt><%=Ec_relatedlists.Attribute.TabTableName.ZhName %>：</dt><!--主表名-->
               <dd><span>
               
                    <input id="txtTabTableName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ColumnName_PK">
               <dt><%=Ec_relatedlists.Attribute.ColumnName_PK.ZhName %>：</dt><!--主字段名-->
               <dd><span>
               
                    <input id="txtColumnName_PK" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ColumnName_FK">
               <dt><%=Ec_relatedlists.Attribute.ColumnName_FK.ZhName %>：</dt><!--外联字段名-->
               <dd><span>
               
                    <input id="txtColumnName_FK" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Related_tabTableName">
               <dt><%=Ec_relatedlists.Attribute.Related_tabTableName.ZhName %>：</dt><!--外联表名-->
               <dd><span>
               
                    <input id="txtRelated_tabTableName" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl class="btn"><dd>
         <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Relation_id._ZhName %></td><!--Relatio-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Tabid._ZhName %></td><!--模块id-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Related_tabid._ZhName %></td><!--Related-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Name._ZhName %></td><!--Name-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Sequence._ZhName %></td><!--Sequenc-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Label._ZhName %></td><!--Label-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Presence._ZhName %></td><!--是否显示0显示-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.TabTableName._ZhName %></td><!--主表名-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.ColumnName_PK._ZhName %></td><!--主字段名-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.ColumnName_FK._ZhName %></td><!--外联字段名-->
                    
                    
                    <td><%=Ec_relatedlists.Attribute.Related_tabTableName._ZhName %></td><!--外联表名-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
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
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

