<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TABLEManage2" CodeFile="TABLEManage.aspx.cs" %>
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
         
            <dl colname="TF_TABLE.TB_ID">
               <dt><%=TF_TABLE.Attribute.TB_ID.ZhName %>：</dt><!--表ID-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TABLE.TB_NAME">
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>：</dt><!--表名称-->
               <dd><span>
                
                    <input id="txtTB_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TABLE.CH_NAME">
               <dt><%=TF_TABLE.Attribute.CH_NAME.ZhName %>：</dt><!--中文名-->
               <dd><span>
                
                    <input id="txtCH_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TABLE.M_TB_ID">
               <dt><%=TF_TABLE.Attribute.M_TB_ID.ZhName %>：</dt><!--主表ID-->
               <dd><span>
                
                    <input id="txtM_TB_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TABLE.SORT_NO">
               <dt><%=TF_TABLE.Attribute.SORT_NO.ZhName %>：</dt><!--序号-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TABLE.TB_TYPE">
               <dt><%=TF_TABLE.Attribute.TB_TYPE.ZhName %>：</dt><!--表类型-->
               <dd><span>
               
                    <select id="txtTB_TYPE" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TABLE.NOTE">
               <dt><%=TF_TABLE.Attribute.NOTE.ZhName %>：</dt><!--NOTE-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server" />
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
            <li><span><input power="newTF_TABLE" id="btn_New" type="button" value="新建" onclick="manager.newRecord('TF_TABLEEdit.aspx');" /></span></li>
            <li><span><input power="editTF_TABLE" id="btn_Edit" type="button" value="新建" onclick="manager.editRecord('TF_TABLEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newTF_TABLE" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('TF_TABLEBack.aspx');" /></span></li>
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
                <tr keyname="TB_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=TF_TABLE.Attribute.TB_ID.LongName%>',show:1}"><%=TF_TABLE.Attribute.TB_ID._ZhName %></td><!--表ID-->
                    
                    
                    <td data="{colname:'<%=TF_TABLE.Attribute.TB_NAME.LongName%>',show:1}"><%=TF_TABLE.Attribute.TB_NAME._ZhName %></td><!--表名称-->
                    
                    
                    <td data="{colname:'<%=TF_TABLE.Attribute.CH_NAME.LongName%>',show:1}"><%=TF_TABLE.Attribute.CH_NAME._ZhName %></td><!--中文名-->
                    
                    
                    <td data="{colname:'<%=TF_TABLE.Attribute.M_TB_ID.LongName%>',show:1}"><%=TF_TABLE.Attribute.M_TB_ID._ZhName %></td><!--主表ID-->
                    
                    
                    <td data="{colname:'<%=TF_TABLE.Attribute.SORT_NO.LongName%>',show:1}"><%=TF_TABLE.Attribute.SORT_NO._ZhName %></td><!--序号-->
                    
                    
                    <td data="{colname:'<%=TF_TABLE.Attribute.TB_TYPE.LongName%>',show:1}"><%=TF_TABLE.Attribute.TB_TYPE._ZhName %></td><!--表类型-->
                    
                    
                    <td data="{colname:'<%=TF_TABLE.Attribute.NOTE.LongName%>',show:1}"><%=TF_TABLE.Attribute.NOTE._ZhName %></td><!--NOTE-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_TABLE)Container.DataItem).TB_ID%>" /></td>

                    <td><%#((TF_TABLE)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).CH_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).M_TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#FormHelper.GetText(TF_TABLE.Attribute.TB_TYPE, ((TF_TABLE)Container.DataItem).TB_TYPE)%></td>
                    
                    
                     <td><%#((TF_TABLE)Container.DataItem).NOTE %></td>
                    
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