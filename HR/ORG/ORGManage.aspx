<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_ORGManage" CodeFile="ORGManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
<script type="text/javascript">

    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
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
            <dl class="hide">
               <dt><%=HR_ORG.Attribute.ORG_ID.ZhName %>：</dt><!--分支机构唯一ID-->
               <dd><span>
                
                    <input id="txtORG_ID" type="text" runat="server" />
               </span></dd>
               </dl><dl>
               <dt><%=HR_ORG.Attribute.ORG_NAME.ZhName %>：</dt><!--分支机构名-->
               <dd><span>
                
                    <input id="txtORG_NAME" type="text" runat="server" />
               </span></dd>
               </dl><dl>
               <dd class="btn">
               <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
<span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
               </dd>
        </dl>
        <div class="clear"></div>
    </div>  
    <div class="tool">
        <ul>
            <li><span><input power="NewORG" id="btn_New" type="button" value="新建" onclick="manager.newRecord('ORGEdit.aspx','PID=<%=pid %>');" /></span></li>
            <li><span class="btn"><input power="NewStaff" id="Button1" type="button" value="新建下级" onclick="manager.newRecord('ORGEdit.aspx','PID');" /></span></li>
            <li><span><input power="EditORG" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('ORGEdit.aspx');" /></span></li>
            <li><span><input power="DeleteORGS" id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('ORGBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li id="liToTop" runat="server"><a href="ORGManage.aspx">返回顶级机构</a></li>
            <li><b>每页显示</b></li>
            <li><input id="txtPageNum" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span class="btn"><asp:Button ID="btnSetPageNum" runat="server" Text="设置" OnClick="btnSetPageNum_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="olAllColCBS"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ORG_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td><a href="ORGManage.aspx" id="a_top" runat="server"><b>/顶级</b></a></td>
                    <td colname="<%=HR_ORG.Attribute.ORG_ID.FieldName%>"><%=HR_ORG.Attribute.ORG_ID._ZhName %></td><!--分支机构唯一ID-->
                    <td colname="<%=HR_ORG.Attribute.ORG_NAME.FieldName%>"><%=HR_ORG.Attribute.ORG_NAME._ZhName %></td><!--分支机构名-->
                    <td colname="<%=HR_ORG.Attribute.P_ORG_ID.FieldName%>"><%=HR_ORG.Attribute.PNAME._ZhName %></td><!--父分支机构ID-->
                    <td colname="<%=HR_ORG.Attribute.EXP1.FieldName%>"><%=HR_ORG.Attribute.EXP1._ZhName%></td>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_ORG)Container.DataItem).ORG_ID%>" id="ckORG" runat="server" /><input value="<%#((HR_ORG)Container.DataItem).PATH%>" type="hidden" /></td>
                    <td><%#showLeftLinks(((HR_ORG)Container.DataItem).PATH, ((HR_ORG)Container.DataItem).PNAME)%></td>
                    <td><%#((HR_ORG)Container.DataItem).ORG_ID %></td>
                    <td><%#((HR_ORG)Container.DataItem).ORG_NAME %></td>
                    <td><%#((HR_ORG)Container.DataItem).PNAME%></td>
                    <td><%#((HR_ORG)Container.DataItem)._EXP1%></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="path-url">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>