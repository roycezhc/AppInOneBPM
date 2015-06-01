<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_tabEdit.aspx.cs" Inherits="Ec_tabEdit" %>
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
               <dt><%=Ec_tab.Attribute.Tabid.ZhName %>：</dt><%--Tabid--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTabid" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_tab.Attribute.Name.ZhName %>：</dt><%--模块名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtName" type="text" runat="server" ck="{type:0,min:0,max:25,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_tab.Attribute.Presence.ZhName %>：</dt><%--Presenc--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPresence" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_tab.Attribute.Tabsequence.ZhName %>：</dt><%--Tabsequ--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTabsequence" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_tab.Attribute.Tablabel.ZhName %>：</dt><%--选项卡标签--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTablabel" type="text" runat="server" ck="{type:0,min:0,max:25,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_tab.Attribute.Modifiedby.ZhName %>：</dt><%--Modifie--%>
               <dd><span>
               <!--文字-->
                    <input id="txtModifiedby" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_tab.Attribute.Modifiedtime.ZhName %>：</dt><%--修改时间--%>
               <dd><span>
               <!--文字-->
                    <input id="txtModifiedtime" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_tab.Attribute.Customized.ZhName %>：</dt><%--定制--%>
               <dd><span>
               <!--文字-->
                    <input id="txtCustomized" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_tab.Attribute.Reportable.ZhName %>：</dt><%--Reporta--%>
               <dd><span>
               <!--文字-->
                    <input id="txtReportable" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
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