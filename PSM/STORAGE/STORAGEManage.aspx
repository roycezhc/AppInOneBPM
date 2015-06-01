<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="IM_STORAGEManage" CodeFile="STORAGEManage.aspx.cs" %>
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
         <dl>
               <dt><%=IM_STORAGE.Attribute.NAME.ZhName %>：</dt><!--仓库名-->
               <dd><span>
                
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
               <dt><%=IM_STORAGE.Attribute.SNAME.ZhName %>：</dt><!--仓库简称-->
               <dd><span>
                
                    <input id="txtSNAME" type="text" runat="server" />
               </span></dd>
               <dt><%=IM_STORAGE.Attribute.RNAME.ZhName %>：</dt><!--助记码-->
               <dd><span>
                
                    <input id="txtRNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl>
            <dt>所属机构：</dt>
            <dd><selorg:wucselorg ID="wucSelORG1" runat="server" /></dd>
               <dt><%=IM_STORAGE.Attribute.USE_FLAG.ZhName%>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATE" runat="server" >
                    </select>
               </span></dd>
               <dd class="btn">
               <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
               </dd>
        </dl>
        <div class="clear"></div>
    </div>  
    <div class="tool">
        <ul>
            <li><span><input power="NewSTORAGE" id="btn_New" type="button" value="新建" onclick="manager.newRecord('STORAGEEdit.aspx','PID=<%=pid %>');" /></span></li>
            <li><span class="btn"><input power="NewStaff" id="Button1" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>
            <li><span><input power="EditSTORAGE" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('STORAGEEdit.aspx');" /></span></li>
            <li><span><input power="DeleteSTORAGEs" id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('STORAGEBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageNum" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="btnSetPageNum" runat="server" Text="设置" OnClick="btnSetPageNum_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="olAllColCBS"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="STOR_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td><a href="STORAGEManage.aspx" id="a_top" runat="server"><b>/顶级</b></a></td>
                    <td colname="<%=IM_STORAGE.Attribute.STOR_ID.FieldName%>"><%=IM_STORAGE.Attribute.STOR_ID._ZhName %></td><!--仓库唯一标识-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.NAME.FieldName%>"><%=IM_STORAGE.Attribute.NAME._ZhName %></td><!--仓库名-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.SNAME.FieldName%>"><%=IM_STORAGE.Attribute.SNAME._ZhName %></td><!--仓库简称-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.RNAME.FieldName%>"><%=IM_STORAGE.Attribute.RNAME._ZhName %></td><!--助记码-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.ORG_ID.FieldName%>"><%=IM_STORAGE.Attribute.ORG_ID._ZhName %></td><!--机构ID-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.USE_FLAG.FieldName%>"><%=IM_STORAGE.Attribute.USE_FLAG._ZhName%></td><!--状态-->
                    
                    
                    <td colname="<%=IM_STORAGE.Attribute.REMARK.FieldName%>"><%=IM_STORAGE.Attribute.REMARK._ZhName %></td><!--REMARK-->
                   <td colname="<%=IM_STORAGE.Attribute.PNAME.FieldName%>"><%=IM_STORAGE.Attribute.PNAME._ZhName%></td><!--助记码-->
                    
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((IM_STORAGE)Container.DataItem).STOR_ID%>" /><input value="<%#((IM_STORAGE)Container.DataItem).PATH%>" type="hidden" /></td>
                    <td><%#showLeftLinks(((IM_STORAGE)Container.DataItem).PATH, ((IM_STORAGE)Container.DataItem).PNAME)%></td>
                    <td><%#((IM_STORAGE)Container.DataItem).STOR_ID %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).NAME %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).SNAME %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).RNAME %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).ORG_ID %></td>
                    <td><%#FormHelper.GetText(IM_STORAGE.Attribute.USE_FLAG, ((IM_STORAGE)Container.DataItem).USE_FLAG)%></td>
                     <td><%#((IM_STORAGE)Container.DataItem).REMARK %></td>
                      <td><%#((IM_STORAGE)Container.DataItem).PNAME %></td>
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