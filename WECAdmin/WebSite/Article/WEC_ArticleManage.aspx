<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ArticleManage.aspx.cs" Inherits="WEC_ArticleManage" %>
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
         
            <dl colname="WEC_Article.ID" class="hide">
               <dt><%=WEC_Article.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.CID" class="hide">
               <dt><%=WEC_Article.Attribute.CID.ZhName %>：</dt><!--栏目编号-->
               <dd><span>
               
                    <input id="txtCID" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.AID" class="hide">
               <dt><%=WEC_Article.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.TITLE">
               <dt><%=WEC_Article.Attribute.TITLE.ZhName %>：</dt><!--标题-->
               <dd><span>
               
                    <input id="txtTITLE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.DES">
               <dt><%=WEC_Article.Attribute.DES.ZhName %>：</dt><!--描述-->
               <dd><span>
               
                    <input id="txtDES" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.CONTENT" class="hide">
               <dt><%=WEC_Article.Attribute.CONTENT.ZhName %>：</dt><!--内容-->
               <dd><span>
               
                    <input id="txtCONTENT" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.URL" class="hide">
               <dt><%=WEC_Article.Attribute.URL.ZhName %>：</dt><!--外链地址-->
               <dd><span>
               
                    <input id="txtURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.PIC_URL" class="hide">
               <dt><%=WEC_Article.Attribute.PIC_URL.ZhName %>：</dt><!--图片地址-->
               <dd><span>
               
                    <input id="txtPIC_URL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.MODEL_ID" class="hide">
               <dt><%=WEC_Article.Attribute.MODEL_ID.ZhName %>：</dt><!--模版编号-->
               <dd><span>
               
                    <input id="txtMODEL_ID" type="text" runat="server"  ck="{len:18,type:1}" />
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
            <li><span><input power="newWEC_Article" id="btn_New" type="button" value="新建" onclick="manager.newRecord('WEC_ArticleEdit.aspx?DeptID=<%=deptid %>','','1',900,700);" /></span></li>
            <li><span><input power="editWEC_Article" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('WEC_ArticleEdit.aspx?DeptID=<%=deptid %>','','1',900,700);" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_Article" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('WEC_ArticleBack.aspx');" /></span></li>
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
                    
                    
                   <%-- <td data="{colname:'<%=WEC_Article.Attribute.ID.LongName%>',show:1}"><%=WEC_Article.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.CID.LongName%>',show:1}"><%=WEC_Article.Attribute.CID._ZhName %></td><!--栏目编号-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.AID.LongName%>',show:1}"><%=WEC_Article.Attribute.AID._ZhName %></td><!--公众号编号-->
                    --%>
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.TITLE.LongName%>',show:1}"><%=WEC_Article.Attribute.TITLE._ZhName %></td><!--标题-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.DES.LongName%>',show:1}"><%=WEC_Article.Attribute.DES._ZhName %></td><!--描述-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.URL.LongName%>',show:1}"><%=WEC_Article.Attribute.URL._ZhName %></td><!--外链地址-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.PIC_URL.LongName%>',show:1}"><%=WEC_Article.Attribute.PIC_URL._ZhName %></td><!--图片地址-->
                  <%--  
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.MODEL_ID.LongName%>',show:1}"><%=WEC_Article.Attribute.MODEL_ID._ZhName %></td><!--模版编号-->--%>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_Article)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_Article)Container.DataItem).PATH, ((WEC_Article)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                   <%-- <td><%#((WEC_Article)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).CID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).AID %></td>--%>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).DES %></td>
  

                    <td><%#((WEC_Article)Container.DataItem).URL %></td>
                    
                    
                    <td><img style="width:50px;height:50px;" src="<%#((WEC_Article)Container.DataItem).PIC_URL %>" /></td>
  <%--                  
                    
                    <td><%#((WEC_Article)Container.DataItem).MODEL_ID %></td>
                    --%>
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