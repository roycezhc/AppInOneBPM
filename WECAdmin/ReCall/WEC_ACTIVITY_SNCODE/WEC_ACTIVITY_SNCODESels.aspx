<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITY_SNCODESels.aspx.cs" Inherits="WEC_ACTIVITY_SNCODESels" %>
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
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SN_CODE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SN_CODE.ZhName %>：</dt><!--SN码-->
               <dd><span>
               
                    <input id="txtSN_CODE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AWARD_TYPE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE.ZhName %>：</dt><!--奖品类别-->
               <dd><span>
               
                    <input id="txtAWARD_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="PHONE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.PHONE.ZhName %>：</dt><!--领取者手机号-->
               <dd><span>
               
                    <input id="txtPHONE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="WX_CODE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.WX_CODE.ZhName %>：</dt><!--领取者微信码-->
               <dd><span>
               
                    <input id="txtWX_CODE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ZJ_TIME">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME.ZhName %>：</dt><!--中奖时间-->
               <dd><span>
               
                    <input id="txtZJ_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="SY_TIME">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SY_TIME.ZhName %>：</dt><!--使用时间-->
               <dd><span>
               
                    <input id="txtSY_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="A_ID">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.A_ID.ZhName %>：</dt><!--活动ID-->
               <dd><span>
               
                    <input id="txtA_ID" type="text" runat="server"/>
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
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.ID._ZhName %><!--编号--></td>
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.SN_CODE._ZhName %><!--SN码--></td>
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE._ZhName %><!--奖品类别--></td>
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.STATUS._ZhName %><!--状态--></td>
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.PHONE._ZhName %><!--领取者手机号--></td>
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.WX_CODE._ZhName %><!--领取者微信码--></td>
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME._ZhName %><!--中奖时间--></td>
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.SY_TIME._ZhName %><!--使用时间--></td>
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.A_ID._ZhName %><!--活动ID--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_ACTIVITY_SNCODE)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).SN_CODE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).AWARD_TYPE %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_ACTIVITY_SNCODE.Attribute.STATUS, ((WEC_ACTIVITY_SNCODE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).PHONE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).WX_CODE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).ZJ_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).SY_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).A_ID %></td>
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
