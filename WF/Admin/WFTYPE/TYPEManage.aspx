<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_TYPEManage" CodeFile="TYPEManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
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
    <dl><dt><b><%=title %></b></dt><dd><a href="../WFINFO/WFINFOManage.aspx">返回</a></dd></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind">
         
            <dl colname="WF_TYPE.TYPE_NAME">
               <dt><%=WF_TYPE.Attribute.TYPE_NAME.ZhName %>：</dt><!--分类名-->
               <dd><span>
                
                    <input id="txtTYPE_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WF_TYPE.CREATER">
               <dt><%=WF_TYPE.Attribute.CREATER.ZhName %>：</dt><!--创建人-->
               <dd><span>
                
                    <input id="txtCREATER" type="text" runat="server" />
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
            <li><span><input power="newWF_TYPE" id="btn_New" type="button" value="新建" onclick="manager.newRecord('TYPEEdit.aspx');" /></span></li>
            <li><span><input power="editWF_TYPE" id="btn_Edit" type="button" value="修改" onclick="manager.editRecord('TYPEEdit.aspx');" /></span></li>
             <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('TYPEBack.aspx');" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="TYPE_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=WF_TYPE.Attribute.TYPE_ID.LongName%>',show:1}"><%=WF_TYPE.Attribute.TYPE_ID._ZhName %></td><!--流程分类ID-->
                    
                    
                    <td data="{colname:'<%=WF_TYPE.Attribute.TYPE_NAME.LongName%>',show:1}"><%=WF_TYPE.Attribute.TYPE_NAME._ZhName %></td><!--分类名-->
                    
                    
                    <td data="{colname:'<%=WF_TYPE.Attribute.CREATER.LongName%>',show:1}"><%=WF_TYPE.Attribute.CREATER._ZhName %></td><!--创建人-->

                     <td data="{colname:'<%=WF_TYPE.Attribute.STATUS.LongName%>',show:1}"><%=WF_TYPE.Attribute.STATUS._ZhName %></td><!--创建人-->
                    
                    
                    <td data="{colname:'<%=WF_TYPE.Attribute.CREATE_TIME.LongName%>',show:1}"><%=WF_TYPE.Attribute.CREATE_TIME._ZhName %></td><!--创建时间-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            <td>{TYPE_ID}</td>
            <td>{TYPE_NAME}</td>
            <td>{CREATER}</td>
<td>{CREATE_TIME}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WF_TYPE)Container.DataItem).TYPE_ID%>" /></td>
                    <td><%#((WF_TYPE)Container.DataItem).TYPE_ID %></td>
                    
                    
                    <td><%#((WF_TYPE)Container.DataItem).TYPE_NAME %></td>
                    
                    
                    <td><%#((WF_TYPE)Container.DataItem).CREATER %></td>
                    
                     <td><%#((WF_TYPE)Container.DataItem).STATUS == 1 ? "正常" : (((WF_TYPE)Container.DataItem).STATUS == 2 ? "禁用" : "未启用")%></td>
                    
                    <td><%#(((WF_TYPE)Container.DataItem).CREATE_TIME == DateTime.MinValue) ? "" : ((WF_TYPE)Container.DataItem).CREATE_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
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