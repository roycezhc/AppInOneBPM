<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_CHANNELlISTManage.aspx.cs" Inherits="WEC_C_CHANNELlISTManage" %>
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
         
            <dl colname="WEC_C_CHANNELlIST.ID" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.AID" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.STATUS" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.ADDTIME" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.NAME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NAME.ZhName %>：</dt><!--渠道名称-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.URL" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.URL.ZhName %>：</dt><!--渠道url-->
               <dd><span>
               
                    <input id="txtURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.REMARK" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.REMARK.ZhName %>：</dt><!--渠道备注-->
               <dd><span>
               
                    <input id="txtREMARK" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.CATEGORY_ID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.ZhName %>：</dt><!--渠道分类-->
               <dd><span>
               
                    <input id="txtCATEGORY_ID" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.QRCODE" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.QRCODE.ZhName %>：</dt><!--二维码样式-->
               <dd><span>
               
                    <input id="txtQRCODE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.NOTE" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NOTE.ZhName %>：</dt><!--备注信息-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.ADDRESS" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDRESS.ZhName %>：</dt><!--渠道所在地区-->
               <dd><span>
               
                    <input id="txtADDRESS" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.TYPE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.TYPE.ZhName %>：</dt><!--渠道类型-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
                    </select>
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
            <li><span><input power="newWEC_C_CHANNELlIST" id="btn_New" type="button" value="新建" onclick="manager.newRecord('WEC_C_CHANNELlISTEdit.aspx');" /></span></li>
            <li><span><input power="editWEC_C_CHANNELlIST" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('WEC_C_CHANNELlISTEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_C_CHANNELlIST" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('WEC_C_CHANNELlISTBack.aspx');" /></span></li>
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
                    
                   <%-- 
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.ID.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.AID.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.AID._ZhName %></td><!--公众号编号-->--%>

                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.NAME.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.NAME._ZhName %></td><!--渠道名称-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.URL.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.URL._ZhName %></td><!--渠道url-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.REMARK.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.REMARK._ZhName %></td><!--渠道备注-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID._ZhName %></td><!--渠道分类-->
                    
                    
                   <%-- <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.QRCODE.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.QRCODE._ZhName %></td><!--二维码样式-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.NOTE.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.NOTE._ZhName %></td><!--备注信息-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.ADDRESS.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.ADDRESS._ZhName %></td><!--渠道所在地区-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.TYPE.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.TYPE._ZhName %></td><!--渠道类型-->

                     <td >操作</td><!--渠道类型-->

                      <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.STATUS.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_C_CHANNELlIST)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_C_CHANNELlIST)Container.DataItem).PATH, ((WEC_C_CHANNELlIST)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                <%--    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).AID %></td>--%>
     
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).URL %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).REMARK %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).CATEGORY_ID %></td>
                    
                    
                   <%-- <td><%#((WEC_C_CHANNELlIST)Container.DataItem).QRCODE %></td>--%>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ADDRESS %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_C_CHANNELlIST.Attribute.TYPE, ((WEC_C_CHANNELlIST)Container.DataItem).TYPE)%></td>

                    <td><a href ="<%#((WEC_C_CHANNELlIST)Container.DataItem).FILEPATH %>" >下载</a></td>

                    <td><%#FormHelper.GetText(WEC_C_CHANNELlIST.Attribute.STATUS, ((WEC_C_CHANNELlIST)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
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