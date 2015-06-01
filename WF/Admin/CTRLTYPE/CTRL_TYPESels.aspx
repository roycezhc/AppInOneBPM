<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_CTRL_TYPESels" CodeFile="CTRL_TYPESels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows(); Sels_Load();
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
     <div class="topfindl">
         
            <dl colname="CTRL_TYPE">
               <dt><%=TF_CTRL_TYPE.Attribute.CTRL_TYPE.ZhName %>：</dt><!--CTRL_TYPE-->
               <dd><span>
                
                    <input id="txtCTRL_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="P_CTRL_TYPE">
               <dt><%=TF_CTRL_TYPE.Attribute.P_CTRL_TYPE.ZhName %>：</dt><!--P_CTRL_TYPE-->
               <dd><span>
                
                    <input id="txtP_CTRL_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CTRL_NAME">
               <dt><%=TF_CTRL_TYPE.Attribute.CTRL_NAME.ZhName %>：</dt><!--类型名-->
               <dd><span>
                
                    <input id="txtCTRL_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="EL_HTML">
               <dt><%=TF_CTRL_TYPE.Attribute.EL_HTML.ZhName %>：</dt><!--EL_HTML-->
               <dd><span>
               
                    <input id="txtEL_HTML" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="SORT_NO">
               <dt><%=TF_CTRL_TYPE.Attribute.SORT_NO.ZhName %>：</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="JS_CODE">
               <dt><%=TF_CTRL_TYPE.Attribute.JS_CODE.ZhName %>：</dt><!--JS_CODE-->
               <dd><span>
               
                    <input id="txtJS_CODE" type="text" runat="server"/>

               </span></dd>
        </dl>     
        <dl><dt>&nbsp;</dt><dd class="btn">
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
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.CTRL_TYPE._ZhName %><!--CTRL_TYPE--></td>
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.P_CTRL_TYPE._ZhName %><!--P_CTRL_TYPE--></td>
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.CTRL_NAME._ZhName %><!--类型名--></td>
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.EL_HTML._ZhName %><!--EL_HTML--></td>
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.SORT_NO._ZhName %><!--SORT_NO--></td>
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.JS_CODE._ZhName %><!--JS_CODE--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((TF_CTRL_TYPE)Container.DataItem).CTRL_TYPE %>" /></td>
                     
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).P_CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).CTRL_NAME %></td>
                    
                    
                     <td><%#((TF_CTRL_TYPE)Container.DataItem).EL_HTML %></td>
                    
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).SORT_NO %></td>
                    
                    
                     <td><%#((TF_CTRL_TYPE)Container.DataItem).JS_CODE %></td>
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
