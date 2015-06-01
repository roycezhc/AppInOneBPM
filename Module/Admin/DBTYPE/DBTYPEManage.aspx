<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_FIELD_DBTYPEManage2" CodeFile="DBTYPEManage.aspx.cs" %>
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
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfindl"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="TF_FIELD_DBTYPE.TYPE_ID">
               <dt><%=TF_FIELD_DBTYPE.Attribute.TYPE_ID.ZhName %>：</dt><!--TYPE_ID-->
               <dd><span>
                
                    <input id="txtTYPE_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FIELD_DBTYPE.TYPE_NAME">
               <dt><%=TF_FIELD_DBTYPE.Attribute.TYPE_NAME.ZhName %>：</dt><!--TYPE_NAME-->
               <dd><span>
                
                    <input id="txtTYPE_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FIELD_DBTYPE.DB_TYPE">
               <dt><%=TF_FIELD_DBTYPE.Attribute.DB_TYPE.ZhName %>：</dt><!--DB_TYPE-->
               <dd><span>
                
                    <input id="txtDB_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FIELD_DBTYPE.CTRL_TYPES">
               <dt><%=TF_FIELD_DBTYPE.Attribute.CTRL_TYPES.ZhName %>：</dt><!--CTRL_TYPES-->
               <dd><span>
               
                    <input id="txtCTRL_TYPES" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl><dt></dt><dd class="btn">
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newTF_FIELD_DBTYPE" id="btn_New" type="button" value="新建" onclick="manager.newRecord('TF_FIELD_DBTYPEEdit.aspx');" /></span></li>
            <li><span><input power="editTF_FIELD_DBTYPE" id="btn_Edit" type="button" value="新建" onclick="manager.editRecord('TF_FIELD_DBTYPEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newTF_FIELD_DBTYPE" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('TF_FIELD_DBTYPEBack.aspx');" /></span></li>
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
                <tr keyname="TYPE_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>

                    <td data="{colname:'<%=TF_FIELD_DBTYPE.Attribute.TYPE_ID.LongName%>',show:1}"><%=TF_FIELD_DBTYPE.Attribute.TYPE_ID._ZhName %></td><!--TYPE_ID-->
                    
                    
                    <td data="{colname:'<%=TF_FIELD_DBTYPE.Attribute.TYPE_NAME.LongName%>',show:1}"><%=TF_FIELD_DBTYPE.Attribute.TYPE_NAME._ZhName %></td><!--TYPE_NAME-->
                    
                    
                    <td data="{colname:'<%=TF_FIELD_DBTYPE.Attribute.DB_TYPE.LongName%>',show:1}"><%=TF_FIELD_DBTYPE.Attribute.DB_TYPE._ZhName %></td><!--DB_TYPE-->
                    
                    
                    <td data="{colname:'<%=TF_FIELD_DBTYPE.Attribute.CTRL_TYPES.LongName%>',show:1}"><%=TF_FIELD_DBTYPE.Attribute.CTRL_TYPES._ZhName %></td><!--CTRL_TYPES-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_FIELD_DBTYPE)Container.DataItem).TYPE_ID%>" /></td>

                    <td><%#((TF_FIELD_DBTYPE)Container.DataItem).TYPE_ID %></td>
                    
                    
                    <td><%#((TF_FIELD_DBTYPE)Container.DataItem).TYPE_NAME %></td>
                    
                    
                    <td><%#((TF_FIELD_DBTYPE)Container.DataItem).DB_TYPE %></td>
                    
                    
                     <td><%#((TF_FIELD_DBTYPE)Container.DataItem).CTRL_TYPES %></td>
                    
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