<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHKWKDIVKEYVALUESels2" CodeFile="HR_CHKWKDIVKEYVALUESels.aspx.cs" %>
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
         
            <dl colname="GroupId">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId.ZhName %>：</dt><!--组ID-->
               <dd><span>
                
                    <input id="txtGroupId" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DeviceID">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID.ZhName %>：</dt><!--设备ID-->
               <dd><span>
                
                    <input id="txtDeviceID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AIOTableName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName.ZhName %>：</dt><!--AIO表名-->
               <dd><span>
                
                    <input id="txtAIOTableName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AIOKeyFieldName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName.ZhName %>：</dt><!--AIO关键字段名-->
               <dd><span>
                
                    <input id="txtAIOKeyFieldName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="OtherKeyFieldName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName.ZhName %>：</dt><!--其他系统关键字段名-->
               <dd><span>
                
                    <input id="txtOtherKeyFieldName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AIOKeyValue">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue.ZhName %>：</dt><!--AIO关键字段值-->
               <dd><span>
                
                    <input id="txtAIOKeyValue" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="OtherKeyValue">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue.ZhName %>：</dt><!--其他系统关键字段值-->
               <dd><span>
                
                    <input id="txtOtherKeyValue" type="text" runat="server"/>
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
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId._ZhName %><!--组ID--></td>
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID._ZhName %><!--设备ID--></td>
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName._ZhName %><!--AIO表名--></td>
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName._ZhName %><!--AIO关键字段名--></td>
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName._ZhName %><!--其他系统关键字段名--></td>
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue._ZhName %><!--AIO关键字段值--></td>
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue._ZhName %><!--其他系统关键字段值--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyFieldName %>" /></td>
                     
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).GroupId %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).DeviceID %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOTableName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOKeyFieldName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyFieldName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOKeyValue %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyValue %></td>
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
