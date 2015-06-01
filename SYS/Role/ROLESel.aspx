<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_ROLE_Sel" CodeFile="ROLESel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
   <base target="_self" />
    <script type="text/javascript">$(function () { Sel_Load(); });</script>
    <script type="text/javascript">
       
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
    <div class="titnav">
        <dl><dt><b>角色选择</b></dt></dl>
    </div>
    <div class="tool">
     
    </div>
    <div class="topfind">
               <span><%=SYS_ROLE.Attribute.ROLE_NAME.ZhName %>：</span><!--角色名-->
               <span>
                    <input id="txtROLE_NAME" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span>
               <span><%=SYS_ROLE.Attribute.CREATER.ZhName %>：</span><!--CREATER-->
               <span>
                    <input id="txtCREATER" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span>
               <span class="btn"><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span class="btn"><input id="btnClear" type="button" value="清空" onclick="clearForm(this);"/></span>
        <span class="btn"><input id="btnSelOK" type="button" onclick="selok();" style="width:60px;" value="确定选择" /></span>
    </div>    
     <div class="tblist">
         <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td><%=SYS_ROLE.Attribute.ROLE_ID._ZhName %><!--角色ID--></td>
                    <td><%=SYS_ROLE.Attribute.ROLE_NAME._ZhName %><!--角色名--></td>
                    <td><%=SYS_ROLE.Attribute.CREATER._ZhName %><!--CREATER--></td>
                    <td><%=SYS_ROLE.Attribute.CREATIME._ZhName %><!--创建时间--></td>
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td><%#((SYS_ROLE)Container.DataItem).ROLE_ID %></td>
                    <td><%#((SYS_ROLE)Container.DataItem).ROLE_NAME %></td>
                    <td><%#((SYS_ROLE)Container.DataItem).CREATER %></td>
                    <td><%#((SYS_ROLE)Container.DataItem).CREATIME.ToString("yyyy-MM-dd")%></td>
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
</asp:Content>