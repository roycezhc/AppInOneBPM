<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_ROLE_ROLESels" CodeFile="ROLESels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager({listID:'divList'});
        $(function () {
            manager.initBodyRows();
        });
    </script>
    <script type="text/javascript">$(function () { Sels_Load(); });</script>
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
      <dl><dt><%=SYS_ROLE.Attribute.ROLE_NAME.ZhName %>：</dt>
      <dd><span>
                    <input id="txtROLE_NAME" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
               <dt><%=SYS_ROLE.Attribute.CREATER.ZhName %>：</dt><dd><span>
                    <input id="txtCREATER" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
               <dd class="btn">
               <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空"/></span>
               <span><input id="btnSelOK" type="button" onclick="selok();" style="width:60px;" value="确定选择" /></span>
               </dd>
      </dl>
   
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
                    <td class="first"><input type="checkbox" id="ckSelAll" name="all" value='全选' onclick='_selAll(this);'/></td>
                    <td><%=SYS_ROLE.Attribute.ROLE_ID._ZhName %><!--角色ID--></td>
                    <td><%=SYS_ROLE.Attribute.ROLE_NAME._ZhName %><!--角色名--></td>
                    <td><%=SYS_ROLE.Attribute.CREATER._ZhName %><!--CREATER--></td>
                    <td><%=SYS_ROLE.Attribute.CREATIME._ZhName %><!--创建时间--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                    <tr>
                    <td class="first"><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((SYS_ROLE)Container.DataItem).ROLE_ID %>" /></td>
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
     </div>
</div>
</asp:Content>
