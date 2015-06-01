<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMN_ITEMManage" CodeFile="ITEMManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        bindWinResize(40);
    });

    function addToTable(str) {
        manager.addToList(str);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
        <ul>
            <li><span><input power="newTF_F_COLUMN_ITEM" id="btn_New" type="button" value="新建" onclick="manager.newRecord('ITEMEdit.aspx?ColID=<%=colid %>');" /></span></li>
            <li><span><input power="editTF_F_COLUMN_ITEM" id="btn_Edit" type="button" value="修改" onclick="manager.editRecord('ITEMEdit.aspx?ColID=<%=colid %>');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('ITEMBack.aspx');" /></span></li>
        </ul>

    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ITEM_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>

                    <td data="{colname:'<%=TF_F_COLUMN_ITEM.Attribute.ITEM_ID.LongName%>',show:1}"><%=TF_F_COLUMN_ITEM.Attribute.ITEM_ID._ZhName %></td><!--ITEM_ID-->
<%--                    
                    
                    <td data="{colname:'<%=TF_F_COLUMN_ITEM.Attribute.FORM_ID.LongName%>',show:1}"><%=TF_F_COLUMN_ITEM.Attribute.FORM_ID._ZhName %></td><!--FORM_ID-->
                    
                    
                    <td data="{colname:'<%=TF_F_COLUMN_ITEM.Attribute.COLUMN_ID.LongName%>',show:1}"><%=TF_F_COLUMN_ITEM.Attribute.COLUMN_ID._ZhName %></td><!--COLUMN_ID-->
                    
                    --%>
                    <td data="{colname:'<%=TF_F_COLUMN_ITEM.Attribute.VALUE.LongName%>',show:1}"><%=TF_F_COLUMN_ITEM.Attribute.VALUE._ZhName %></td><!--选项值-->
                    
                    
                    <td data="{colname:'<%=TF_F_COLUMN_ITEM.Attribute.TEXT.LongName%>',show:1}"><%=TF_F_COLUMN_ITEM.Attribute.TEXT._ZhName %></td><!--选项名-->
                    
                    
                    <td data="{colname:'<%=TF_F_COLUMN_ITEM.Attribute.DROP_REAL.LongName%>',show:1}"><%=TF_F_COLUMN_ITEM.Attribute.DROP_REAL._ZhName %></td><!--联动下拉框信息-->
                    
                    
                    <td data="{colname:'<%=TF_F_COLUMN_ITEM.Attribute.COL_HIDE.LongName%>',show:1}"><%=TF_F_COLUMN_ITEM.Attribute.COL_HIDE._ZhName %></td><!--显示隐藏列信息-->
                </tr>
            </thead>
            <tbody style="display:none;" TPL="yes">
                  <tr><td class="first"><input type="checkbox" value="{ITEM_ID}" /></td>
                    <td>{ITEM_ID}</td>
                    <td>{VALUE}</td>
                    <td>{TEXT}</td>
                    <td>{DROP_REAL}</td>
                    <td>{COL_HIDE}</td></tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_F_COLUMN_ITEM)Container.DataItem).ITEM_ID%>" /></td>
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).ITEM_ID %></td>
<%--                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).FORM_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).COLUMN_ID %></td>
                    
                    --%>
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).VALUE %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).TEXT %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).DROP_REAL %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).COL_HIDE %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
</div>
</asp:Content>