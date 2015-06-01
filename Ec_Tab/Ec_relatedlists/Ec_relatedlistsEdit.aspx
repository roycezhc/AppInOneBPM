<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_relatedlistsEdit.aspx.cs" Inherits="Ec_relatedlistsEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
       $(function () {
           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Relation_id.ZhName %>：</dt><%--Relatio--%>
               <dd><span>
               <!--文字-->
                    <input id="txtRelation_id" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Tabid.ZhName %>：</dt><%--模块id--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTabid" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Related_tabid.ZhName %>：</dt><%--Related--%>
               <dd><span>
               <!--文字-->
                    <input id="txtRelated_tabid" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Name.ZhName %>：</dt><%--Name--%>
               <dd><span>
               <!--文字-->
                    <input id="txtName" type="text" runat="server" ck="{type:0,min:0,max:100,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Sequence.ZhName %>：</dt><%--Sequenc--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSequence" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Label.ZhName %>：</dt><%--Label--%>
               <dd><span>
               <!--文字-->
                    <input id="txtLabel" type="text" runat="server" ck="{type:0,min:0,max:100,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Presence.ZhName %>：</dt><%--是否显示0显示--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPresence" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.TabTableName.ZhName %>：</dt><%--主表名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTabTableName" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.ColumnName_PK.ZhName %>：</dt><%--主字段名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtColumnName_PK" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.ColumnName_FK.ZhName %>：</dt><%--外联字段名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtColumnName_FK" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Related_tabTableName.ZhName %>：</dt><%--外联表名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtRelated_tabTableName" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>