<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_XX_MESSAGESels.aspx.cs" Inherits="WEC_XX_MESSAGESels" %>
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
               <dt><%=WEC_XX_MESSAGE.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="OPENID">
               <dt><%=WEC_XX_MESSAGE.Attribute.OPENID.ZhName %>：</dt><!--微信ID-->
               <dd><span>
               
                    <input id="txtOPENID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TYPE">
               <dt><%=WEC_XX_MESSAGE.Attribute.TYPE.ZhName %>：</dt><!--消息类型-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="S_CONTENT">
               <dt><%=WEC_XX_MESSAGE.Attribute.S_CONTENT.ZhName %>：</dt><!--消息内容(nv-->
               <dd><span>
               
                    <input id="txtS_CONTENT" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WEC_XX_MESSAGE.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="ISCOLLECT">
               <dt><%=WEC_XX_MESSAGE.Attribute.ISCOLLECT.ZhName %>：</dt><!--是否收藏-->
               <dd><span>
               
                    <input id="txtISCOLLECT" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="LATITUDE">
               <dt><%=WEC_XX_MESSAGE.Attribute.LATITUDE.ZhName %>：</dt><!--纬度-->
               <dd><span>
               
                    <input id="txtLATITUDE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="LONGITUDE">
               <dt><%=WEC_XX_MESSAGE.Attribute.LONGITUDE.ZhName %>：</dt><!--经度-->
               <dd><span>
               
                    <input id="txtLONGITUDE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PRECISION">
               <dt><%=WEC_XX_MESSAGE.Attribute.PRECISION.ZhName %>：</dt><!--精度-->
               <dd><span>
               
                    <input id="txtPRECISION" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CITY">
               <dt><%=WEC_XX_MESSAGE.Attribute.CITY.ZhName %>：</dt><!--用户所在城市-->
               <dd><span>
               
                    <input id="txtCITY" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PROVINCE">
               <dt><%=WEC_XX_MESSAGE.Attribute.PROVINCE.ZhName %>：</dt><!--用户所在省-->
               <dd><span>
               
                    <input id="txtPROVINCE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="COUNTRY">
               <dt><%=WEC_XX_MESSAGE.Attribute.COUNTRY.ZhName %>：</dt><!--用户所在国家-->
               <dd><span>
               
                    <input id="txtCOUNTRY" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="HEADIMGURL">
               <dt><%=WEC_XX_MESSAGE.Attribute.HEADIMGURL.ZhName %>：</dt><!--用户头像，最后-->
               <dd><span>
               
                    <input id="txtHEADIMGURL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CHANNELID">
               <dt><%=WEC_XX_MESSAGE.Attribute.CHANNELID.ZhName %>：</dt><!--渠道-->
               <dd><span>
               
                    <input id="txtCHANNELID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AID">
               <dt><%=WEC_XX_MESSAGE.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"/>
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
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.ID._ZhName %><!--编号--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.OPENID._ZhName %><!--微信ID--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.TYPE._ZhName %><!--消息类型--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.S_CONTENT._ZhName %><!--消息内容(nv--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.ADDTIME._ZhName %><!--添加时间--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.ISCOLLECT._ZhName %><!--是否收藏--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.LATITUDE._ZhName %><!--纬度--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.LONGITUDE._ZhName %><!--经度--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.PRECISION._ZhName %><!--精度--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.CITY._ZhName %><!--用户所在城市--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.PROVINCE._ZhName %><!--用户所在省--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.COUNTRY._ZhName %><!--用户所在国家--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.HEADIMGURL._ZhName %><!--用户头像，最后--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.CHANNELID._ZhName %><!--渠道--></td>
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.AID._ZhName %><!--公众号编号--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_XX_MESSAGE)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).OPENID %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_XX_MESSAGE.Attribute.TYPE, ((WEC_XX_MESSAGE)Container.DataItem).TYPE)%></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_XX_MESSAGE)Container.DataItem).S_CONTENT) %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).ISCOLLECT %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).LATITUDE %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).LONGITUDE %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).PRECISION %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).CITY %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).PROVINCE %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).COUNTRY %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).HEADIMGURL %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).CHANNELID %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).AID %></td>
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
