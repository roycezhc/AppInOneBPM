<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_MODELManage.aspx.cs" Inherits="WEC_MODELManage" %>
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
   <div class="topfind hide" ><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="WEC_MODEL.ID" class = "hide">
               <dt><%=WEC_MODEL.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_MODEL.TYPE">
               <dt><%=WEC_MODEL.Attribute.TYPE.ZhName %>：</dt><!--类型-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_MODEL.PIC_URL" class = "hide">
               <dt><%=WEC_MODEL.Attribute.PIC_URL.ZhName %>：</dt><!--图片地址-->
               <dd><span>
               
                    <input id="txtPIC_URL" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_MODEL.PATH" class = "hide">
               <dt><%=WEC_MODEL.Attribute.PATH.ZhName %>：</dt><!--模版路径-->
               <dd><span>
               
                    <input id="txtPATH" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_MODEL.ADDTIME" class = "hide">
               <dt><%=WEC_MODEL.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_MODEL.STATUS">
               <dt><%=WEC_MODEL.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_MODEL.NAME">
               <dt><%=WEC_MODEL.Attribute.NAME.ZhName %>：</dt><!--标题-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server"  ck="{len:50,type:0}" />
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
            <li><span><input power="newWEC_MODEL" id="btn_New" type="button" value="新建" onclick="manager.newRecord('WEC_MODELEdit.aspx','','1',900,700);" /></span></li>
            <li><span><input power="editWEC_MODEL" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('WEC_MODELEdit.aspx','','1',900,700);" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_MODEL" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('WEC_MODELBack.aspx');" /></span></li>
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
                    
                    
                  <%--  <td data="{colname:'<%=WEC_MODEL.Attribute.ID.LongName%>',show:1}"><%=WEC_MODEL.Attribute.ID._ZhName %></td><!--编号-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_MODEL.Attribute.TYPE.LongName%>',show:1}"><%=WEC_MODEL.Attribute.TYPE._ZhName %></td><!--类型-->
                    
                    
                    <td data="{colname:'<%=WEC_MODEL.Attribute.PIC_URL.LongName%>',show:1}"><%=WEC_MODEL.Attribute.PIC_URL._ZhName %></td><!--图片地址-->
                    
                    
                    <%--<td data="{colname:'<%=WEC_MODEL.Attribute.PATH.LongName%>',show:1}"><%=WEC_MODEL.Attribute.PATH._ZhName %></td><!--模版路径-->--%>
                    
                 
                    <td data="{colname:'<%=WEC_MODEL.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_MODEL.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td data="{colname:'<%=WEC_MODEL.Attribute.STATUS.LongName%>',show:1}"><%=WEC_MODEL.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td data="{colname:'<%=WEC_MODEL.Attribute.NAME.LongName%>',show:1}"><%=WEC_MODEL.Attribute.NAME._ZhName %></td><!--标题-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_MODEL)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_MODEL)Container.DataItem).PATH, ((WEC_MODEL)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                 <%--   <td><%#((WEC_MODEL)Container.DataItem).ID %></td>--%>
                    
                    
                    <td><%#FormHelper.GetText(WEC_MODEL.Attribute.TYPE, ((WEC_MODEL)Container.DataItem).TYPE)%></td>
                    
                    
                    <td><img src="<%#((WEC_MODEL)Container.DataItem).PIC_URL %>" style="width:50px;height:50px;"/></td>
                    
                    
                    <%--<td><%#((WEC_MODEL)Container.DataItem).PATH %></td>--%>
                    
                    
                    <td><%#(((WEC_MODEL)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_MODEL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_MODEL.Attribute.STATUS, ((WEC_MODEL)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_MODEL)Container.DataItem).NAME %></td>
                    
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