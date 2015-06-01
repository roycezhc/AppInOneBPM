<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_A_VOTESels.aspx.cs" Inherits="WEC_A_VOTESels" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows(); Sels_Load();
        });
    </script>
    <script src="../../Lib/Mdl/Sels.js" type="text/javascript"></script>
    <style type="text/css">
    #divList tbody tr td{ cursor:pointer;}
    .lrlayout .left{border:none;}
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
 <div class="main">
    <input id="hidCondition" type="hidden" runat="server" />
    <input id="hidOld" type="hidden" runat="server" />
    <input id="hidInitIDS" type="hidden" runat="server" />
    <div class="titnav">
       <dl><dt><b><%#title %>多选</b></dt><dd></dd></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
     <div class="topfind">
         
            <dl colname="ID">
               <dt><%=WEC_A_VOTE.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AID">
               <dt><%=WEC_A_VOTE.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_A_VOTE.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WEC_A_VOTE.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="KEYWORD">
               <dt><%=WEC_A_VOTE.Attribute.KEYWORD.ZhName %>：</dt><!--关键词-->
               <dd><span>
               
                    <input id="txtKEYWORD" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="TITLE">
               <dt><%=WEC_A_VOTE.Attribute.TITLE.ZhName %>：</dt><!--投票标题-->
               <dd><span>
               
                    <input id="txtTITLE" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="PICURL">
               <dt><%=WEC_A_VOTE.Attribute.PICURL.ZhName %>：</dt><!--投票图片-->
               <dd><span>
               
                    <input id="txtPICURL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="INSTRUCTION">
               <dt><%=WEC_A_VOTE.Attribute.INSTRUCTION.ZhName %>：</dt><!--投票说明-->
               <dd><span>
               
                    <input id="txtINSTRUCTION" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="PIC_SHOW">
               <dt><%=WEC_A_VOTE.Attribute.PIC_SHOW.ZhName %>：</dt><!--图片显示-->
               <dd><span>
               
                    <select id="txtPIC_SHOW" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="IS_RADIO">
               <dt><%=WEC_A_VOTE.Attribute.IS_RADIO.ZhName %>：</dt><!--是否多选-->
               <dd><span>
               
                    <select id="txtIS_RADIO" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="SELECT_NUM">
               <dt><%=WEC_A_VOTE.Attribute.SELECT_NUM.ZhName %>：</dt><!--多选数量-->
               <dd><span>
               
                    <input id="txtSELECT_NUM" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TIME">
               <dt><%=WEC_A_VOTE.Attribute.TIME.ZhName %>：</dt><!--时间设置-->
               <dd><span>
               
                    <input id="txtTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="RESULT">
               <dt><%=WEC_A_VOTE.Attribute.RESULT.ZhName %>：</dt><!--投票结果-->
               <dd><span>
               
                    <input id="txtRESULT" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SHARE">
               <dt><%=WEC_A_VOTE.Attribute.SHARE.ZhName %>：</dt><!--是否分享-->
               <dd><span>
               
                    <select id="txtSHARE" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="KIND">
               <dt><%=WEC_A_VOTE.Attribute.KIND.ZhName %>：</dt><!--类别-->
               <dd><span>
               
                    <select id="txtKIND" runat="server">
                    </select>
               </span></dd>
        </dl>     
        <dl class="btn"><dd>
        <a href="#" class="btn"><asp:Button ID="btnFind" runat="server" Text="查询" OnClick="btnFind_Click" /></a>
        <a href="#" class="btn"><input id="btnSelOK" type="button" value="<%=LanguageService.GetLanguageString("SureChoose", "确定选择") %>" onclick="selok();" /></a>
        <a href="#" class="btn"><input type="button" id="btnClear" value="<%=LanguageService.GetLanguageString("Clear", "清空") %>" /></a>
        </dd></dl>
        <div class="clear"></div>
    </div>    
    <div class="lrlayout">
    <div class="left" style="width:150px;height:400px;">
       <select id="selectedlist" multiple="multiple" style="color:Blue;width:100%;height:100%;">
       </select>
    </div>
    <div class="right" style="margin-left:152px;height:400px;">
    <div class="tblist" id="divList">
       <table cellpadding="0" cellspacing="0">
             <thead>
                <tr>
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "全选") %>' onclick='_selAll(this);'/><%=LanguageService.GetLanguageString("Choose", "选择") %></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.ID._ZhName %><!--编号--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.AID._ZhName %><!--公众号编号--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.STATUS._ZhName %><!--状态--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.ADDTIME._ZhName %><!--添加时间--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.KEYWORD._ZhName %><!--关键词--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.TITLE._ZhName %><!--投票标题--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.PICURL._ZhName %><!--投票图片--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.INSTRUCTION._ZhName %><!--投票说明--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.PIC_SHOW._ZhName %><!--图片显示--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.IS_RADIO._ZhName %><!--是否多选--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.SELECT_NUM._ZhName %><!--多选数量--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.TIME._ZhName %><!--时间设置--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.RESULT._ZhName %><!--投票结果--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.SHARE._ZhName %><!--是否分享--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.KIND._ZhName %><!--类别--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_A_VOTE)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).AID %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.STATUS, ((WEC_A_VOTE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).ADDTIME %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).KEYWORD) %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).TITLE) %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).PICURL %></td>
                    
                    <!--HTML-->
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
    <div class="pages">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
     </div>
     </div>
     </div>
 </div>
</asp:Content>
