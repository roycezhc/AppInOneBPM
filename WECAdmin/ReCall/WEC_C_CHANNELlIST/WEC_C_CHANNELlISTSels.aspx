<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_CHANNELlISTSels.aspx.cs" Inherits="WEC_C_CHANNELlISTSels" %>
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
               <dt><%=WEC_C_CHANNELlIST.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_C_CHANNELlIST.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="NAME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NAME.ZhName %>：</dt><!--渠道名称-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="URL">
               <dt><%=WEC_C_CHANNELlIST.Attribute.URL.ZhName %>：</dt><!--渠道url-->
               <dd><span>
               
                    <input id="txtURL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="REMARK">
               <dt><%=WEC_C_CHANNELlIST.Attribute.REMARK.ZhName %>：</dt><!--渠道备注-->
               <dd><span>
               
                    <input id="txtREMARK" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CATEGORY_ID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.ZhName %>：</dt><!--渠道分类-->
               <dd><span>
               
                    <input id="txtCATEGORY_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="QRCODE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.QRCODE.ZhName %>：</dt><!--二维码样式-->
               <dd><span>
               
                    <input id="txtQRCODE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="NOTE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NOTE.ZhName %>：</dt><!--备注信息-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ADDRESS">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDRESS.ZhName %>：</dt><!--渠道所在地区-->
               <dd><span>
               
                    <input id="txtADDRESS" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TYPE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.TYPE.ZhName %>：</dt><!--渠道类型-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server">
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
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ID._ZhName %><!--编号--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.AID._ZhName %><!--公众号编号--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.STATUS._ZhName %><!--状态--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ADDTIME._ZhName %><!--添加时间--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.NAME._ZhName %><!--渠道名称--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.URL._ZhName %><!--渠道url--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.REMARK._ZhName %><!--渠道备注--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID._ZhName %><!--渠道分类--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.QRCODE._ZhName %><!--二维码样式--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.NOTE._ZhName %><!--备注信息--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ADDRESS._ZhName %><!--渠道所在地区--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.TYPE._ZhName %><!--渠道类型--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_C_CHANNELlIST)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).AID %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_C_CHANNELlIST.Attribute.STATUS, ((WEC_C_CHANNELlIST)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).URL %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).REMARK %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).CATEGORY_ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).QRCODE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ADDRESS %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_C_CHANNELlIST.Attribute.TYPE, ((WEC_C_CHANNELlIST)Container.DataItem).TYPE)%></td>
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
