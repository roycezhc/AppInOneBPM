<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKWORKDEVICESels2" CodeFile="HR_CHECKWORKDEVICESels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows();
        });
    </script>
    <script type="text/javascript">$(function () { Sels_Load(); });</script>
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
         
            <dl colname="DeviceID">
               <dt><%=HR_CHECKWORKDEVICE.Attribute.DeviceID.ZhName %>：</dt><!--设备ID-->
               <dd><span>
                
                    <input id="txtDeviceID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ORG_ID">
               <dt><%=HR_CHECKWORKDEVICE.Attribute.ORG_ID.ZhName %>：</dt><!--分支机构标识-->
               <dd><span>
                
                    <input id="txtORG_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="USE_FLAG">
               <dt><%=HR_CHECKWORKDEVICE.Attribute.USE_FLAG.ZhName %>：</dt><!--是否启用-->
               <dd><span>
               
                    <select id="txtUSE_FLAG" runat="server">
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
                    
                    
                    <td><%=HR_CHECKWORKDEVICE.Attribute.DeviceID._ZhName %><!--设备ID--></td>
                    
                    
                    <td><%=HR_CHECKWORKDEVICE.Attribute.ORG_ID._ZhName %><!--分支机构标识--></td>
                    
                    
                    <td><%=HR_CHECKWORKDEVICE.Attribute.USE_FLAG._ZhName %><!--是否启用--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((HR_CHECKWORKDEVICE)Container.DataItem).DeviceID %>" /></td>
                     
                    
                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).DeviceID %></td>
                    
                    
                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).ORG_ID %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(HR_CHECKWORKDEVICE.Attribute.USE_FLAG, ((HR_CHECKWORKDEVICE)Container.DataItem).USE_FLAG)%></td>
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
