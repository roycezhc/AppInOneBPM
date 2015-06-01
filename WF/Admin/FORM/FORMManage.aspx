<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_FORMManage" CodeFile="FORMManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
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
         
            <dl colname="TF_FORM.FORM_ID">
               <dt><%=TF_FORM.Attribute.FORM_ID.ZhName %>：</dt><!--FORM_ID-->
               <dd><span>
                
                    <input id="txtFORM_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FORM.F_NAME">
               <dt><%=TF_FORM.Attribute.F_NAME.ZhName %>：</dt><!--F_NAME-->
               <dd><span>
                
                    <input id="txtF_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FORM.TB_ID">
               <dt><%=TF_FORM.Attribute.TB_ID.ZhName %>：</dt><!--主表ID-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FORM.TPL_EDIT">
               <dt><%=TF_FORM.Attribute.TPL_EDIT.ZhName %>：</dt><!--TPL_EDIT-->
               <dd><span>
                
                    <input id="txtTPL_EDIT" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FORM.TPL_SHOW">
               <dt><%=TF_FORM.Attribute.TPL_SHOW.ZhName %>：</dt><!--TPL_SHOW-->
               <dd><span>
                
                    <input id="txtTPL_SHOW" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FORM.TPL_PRINT">
               <dt><%=TF_FORM.Attribute.TPL_PRINT.ZhName %>：</dt><!--TPL_PRINT-->
               <dd><span>
                
                    <input id="txtTPL_PRINT" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FORM.TPL_LIST">
               <dt><%=TF_FORM.Attribute.TPL_LIST.ZhName %>：</dt><!--TPL_LIST-->
               <dd><span>
                
                    <input id="txtTPL_LIST" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_FORM.TB_IDS">
               <dt><%=TF_FORM.Attribute.TB_IDS.ZhName %>：</dt><!--其他关联表ID-->
               <dd><span>
                
                    <input id="txtTB_IDS" type="text" runat="server" />
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
            <li><span><input power="newTF_FORM" id="btn_New" type="button" value="新建" onclick="manager.newRecord('TF_FORMEdit.aspx');" /></span></li>
            <li><span><input power="editTF_FORM" id="btn_Edit" type="button" value="新建" onclick="manager.editRecord('TF_FORMEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newTF_FORM" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('FORMBack.aspx');" /></span></li>
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
                <tr keyname="FORM_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>

                    <td data="{colname:'<%=TF_FORM.Attribute.FORM_ID.LongName%>',show:1}"><%=TF_FORM.Attribute.FORM_ID._ZhName %></td><!--FORM_ID-->
                    
                    
                    <td data="{colname:'<%=TF_FORM.Attribute.F_NAME.LongName%>',show:1}"><%=TF_FORM.Attribute.F_NAME._ZhName %></td><!--F_NAME-->
                    
                    
                    <td data="{colname:'<%=TF_FORM.Attribute.TB_ID.LongName%>',show:1}"><%=TF_FORM.Attribute.TB_ID._ZhName %></td><!--主表ID-->
                    
                    
                    <td data="{colname:'<%=TF_FORM.Attribute.TPL_EDIT.LongName%>',show:1}"><%=TF_FORM.Attribute.TPL_EDIT._ZhName %></td><!--TPL_EDIT-->
                    
                    
                    <td data="{colname:'<%=TF_FORM.Attribute.TPL_SHOW.LongName%>',show:1}"><%=TF_FORM.Attribute.TPL_SHOW._ZhName %></td><!--TPL_SHOW-->
                    
                    
                    <td data="{colname:'<%=TF_FORM.Attribute.TPL_PRINT.LongName%>',show:1}"><%=TF_FORM.Attribute.TPL_PRINT._ZhName %></td><!--TPL_PRINT-->
                    
                    
                    <td data="{colname:'<%=TF_FORM.Attribute.TPL_LIST.LongName%>',show:1}"><%=TF_FORM.Attribute.TPL_LIST._ZhName %></td><!--TPL_LIST-->
                    
                    
                    <td data="{colname:'<%=TF_FORM.Attribute.TB_IDS.LongName%>',show:1}"><%=TF_FORM.Attribute.TB_IDS._ZhName %></td><!--其他关联表ID-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_FORM)Container.DataItem).FORM_ID%>" /></td>

                    
                    <td><%#((TF_FORM)Container.DataItem).FORM_ID %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).F_NAME %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TPL_EDIT %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TPL_SHOW %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TPL_PRINT %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TPL_LIST %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TB_IDS %></td>
                    
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