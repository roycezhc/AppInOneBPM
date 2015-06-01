<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_TYPEManage.aspx.cs" Inherits="WEC_C_TYPEManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
        $("#display_search").click(function () {
            $(".topfind").toggleClass("hide");   if($("#display_search").val()=="显示查询")$("#display_search").val("隐藏查询");else $("#display_search").val("显示查询"); 
        });
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
   <div class="topfind hide"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="WEC_C_TYPE.ID" class = "hide">
               <dt><%=WEC_C_TYPE.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_TYPE.AID" class = "hide">
               <dt><%=WEC_C_TYPE.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_TYPE.STATUS">
               <dt><%=WEC_C_TYPE.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_TYPE.ADDTIME">
               <dt><%=WEC_C_TYPE.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_TYPE.NAME">
               <dt><%=WEC_C_TYPE.Attribute.NAME.ZhName %>：</dt><!--分类名称-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_TYPE.SORT" class = "hide">
               <dt><%=WEC_C_TYPE.Attribute.SORT.ZhName %>：</dt><!--显示顺序-->
               <dd><span>
               
                    <input id="txtSORT" type="text" runat="server"  ck="{len:4,type:1}" />
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
            <li><span><input power="newWEC_C_TYPE" id="btn_New" type="button" value="新建" onclick="manager.newRecord('WEC_C_TYPEEdit.aspx');" /></span></li>
            <li><span><input power="editWEC_C_TYPE" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('WEC_C_TYPEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_C_TYPE" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('WEC_C_TYPEBack.aspx');" /></span></li>
            <li><span><input type="button" value="显示查询" id="display_search"/></span></li>
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
                <tr keyname="ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                  <%--  <td data="{colname:'<%=WEC_C_TYPE.Attribute.ID.LongName%>',show:1}"><%=WEC_C_TYPE.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td data="{colname:'<%=WEC_C_TYPE.Attribute.AID.LongName%>',show:1}"><%=WEC_C_TYPE.Attribute.AID._ZhName %></td><!--公众号编号-->--%>
                    
                    
                    
                    <td data="{colname:'<%=WEC_C_TYPE.Attribute.NAME.LongName%>',show:1}"><%=WEC_C_TYPE.Attribute.NAME._ZhName %></td><!--分类名称-->
                    
                    
                    <td data="{colname:'<%=WEC_C_TYPE.Attribute.SORT.LongName%>',show:1}"><%=WEC_C_TYPE.Attribute.SORT._ZhName %></td><!--显示顺序-->

                    <td class="hide"data="{colname:'<%=WEC_C_TYPE.Attribute.STATUS.LongName%>',show:1}"><%=WEC_C_TYPE.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    <td class="hide" data="{colname:'<%=WEC_C_TYPE.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_C_TYPE.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_C_TYPE)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_C_TYPE)Container.DataItem).PATH, ((WEC_C_TYPE)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
<%--                    
                    
                    <td><%#((WEC_C_TYPE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_C_TYPE)Container.DataItem).AID %></td>
                    --%>
                    
                    <td><%#((WEC_C_TYPE)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((WEC_C_TYPE)Container.DataItem).SORT %></td>

                    <td><%#FormHelper.GetText(WEC_C_TYPE.Attribute.STATUS, ((WEC_C_TYPE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_C_TYPE)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_C_TYPE)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
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