<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_A_VOTEManage.aspx.cs" Inherits="WEC_A_VOTEManage" %>
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
         
            <dl colname="WEC_A_VOTE.ID">
               <dt><%=WEC_A_VOTE.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.AID">
               <dt><%=WEC_A_VOTE.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.STATUS">
               <dt><%=WEC_A_VOTE.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.ADDTIME">
               <dt><%=WEC_A_VOTE.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.KEYWORD">
               <dt><%=WEC_A_VOTE.Attribute.KEYWORD.ZhName %>：</dt><!--关键词-->
               <dd><span>
               
                    <input id="txtKEYWORD" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.TITLE">
               <dt><%=WEC_A_VOTE.Attribute.TITLE.ZhName %>：</dt><!--投票标题-->
               <dd><span>
               
                    <input id="txtTITLE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.PICURL">
               <dt><%=WEC_A_VOTE.Attribute.PICURL.ZhName %>：</dt><!--投票图片-->
               <dd><span>
               
                    <input id="txtPICURL" type="text" runat="server"  ck="{len:500,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.INSTRUCTION">
               <dt><%=WEC_A_VOTE.Attribute.INSTRUCTION.ZhName %>：</dt><!--投票说明-->
               <dd><span>
               
                    <input id="txtINSTRUCTION" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.PIC_SHOW">
               <dt><%=WEC_A_VOTE.Attribute.PIC_SHOW.ZhName %>：</dt><!--图片显示-->
               <dd><span>
               
                    <select id="txtPIC_SHOW" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.IS_RADIO">
               <dt><%=WEC_A_VOTE.Attribute.IS_RADIO.ZhName %>：</dt><!--是否多选-->
               <dd><span>
               
                    <select id="txtIS_RADIO" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.SELECT_NUM">
               <dt><%=WEC_A_VOTE.Attribute.SELECT_NUM.ZhName %>：</dt><!--多选数量-->
               <dd><span>
               
                    <input id="txtSELECT_NUM" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.TIME">
               <dt><%=WEC_A_VOTE.Attribute.TIME.ZhName %>：</dt><!--时间设置-->
               <dd><span>
               
                    <input id="txtTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.RESULT">
               <dt><%=WEC_A_VOTE.Attribute.RESULT.ZhName %>：</dt><!--投票结果-->
               <dd><span>
               
                    <input id="txtRESULT" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.SHARE">
               <dt><%=WEC_A_VOTE.Attribute.SHARE.ZhName %>：</dt><!--是否分享-->
               <dd><span>
               
                    <select id="txtSHARE" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_A_VOTE.KIND">
               <dt><%=WEC_A_VOTE.Attribute.KIND.ZhName %>：</dt><!--类别-->
               <dd><span>
               
                    <select id="txtKIND" runat="server" >
                    </select>
               </span></dd>aj
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newWEC_A_VOTE" id="btn_New" type="button" value="新建" onclick="manager.newRecord('WEC_A_VOTEEdit.aspx');" /></span></li>
            <li><span><input power="editWEC_A_VOTE" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('WEC_A_VOTEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_A_VOTE" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('WEC_A_VOTEBack.aspx');" /></span></li>
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
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.ID.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.AID.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.AID._ZhName %></td><!--公众号编号-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.STATUS.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.KEYWORD.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.KEYWORD._ZhName %></td><!--关键词-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.TITLE.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.TITLE._ZhName %></td><!--投票标题-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.PICURL.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.PICURL._ZhName %></td><!--投票图片-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.INSTRUCTION.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.INSTRUCTION._ZhName %></td><!--投票说明-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.PIC_SHOW.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.PIC_SHOW._ZhName %></td><!--图片显示-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.IS_RADIO.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.IS_RADIO._ZhName %></td><!--是否多选-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.SELECT_NUM.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.SELECT_NUM._ZhName %></td><!--多选数量-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.TIME.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.TIME._ZhName %></td><!--时间设置-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.RESULT.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.RESULT._ZhName %></td><!--投票结果-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.SHARE.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.SHARE._ZhName %></td><!--是否分享-->
                    
                    
                    <td data="{colname:'<%=WEC_A_VOTE.Attribute.KIND.LongName%>',show:1}"><%=WEC_A_VOTE.Attribute.KIND._ZhName %></td><!--类别-->
            </tr>
            </tbody>
            <  >
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_A_VOTE)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_A_VOTE)Container.DataItem).PATH, ((WEC_A_VOTE)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).AID %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.STATUS, ((WEC_A_VOTE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).ADDTIME %></td>
                    
                    
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).KEYWORD) %></td>
                    
                    
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).TITLE) %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).PICURL %></td>
                    
                    
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).INSTRUCTION) %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.PIC_SHOW, ((WEC_A_VOTE)Container.DataItem).PIC_SHOW)%></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.IS_RADIO, ((WEC_A_VOTE)Container.DataItem).IS_RADIO)%></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).SELECT_NUM %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).TIME %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).RESULT %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.SHARE, ((WEC_A_VOTE)Container.DataItem).SHARE)%></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.KIND, ((WEC_A_VOTE)Container.DataItem).KIND)%></td>
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