<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_FORMSels" CodeFile="FORMSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
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
         
            <dl colname="FORM_ID">
               <dt><%=TF_FORM.Attribute.FORM_ID.ZhName %>：</dt><!--FORM_ID-->
               <dd><span>
                
                    <input id="txtFORM_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="F_NAME">
               <dt><%=TF_FORM.Attribute.F_NAME.ZhName %>：</dt><!--F_NAME-->
               <dd><span>
                
                    <input id="txtF_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_ID">
               <dt><%=TF_FORM.Attribute.TB_ID.ZhName %>：</dt><!--主表ID-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TPL_EDIT">
               <dt><%=TF_FORM.Attribute.TPL_EDIT.ZhName %>：</dt><!--TPL_EDIT-->
               <dd><span>
                
                    <input id="txtTPL_EDIT" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TPL_SHOW">
               <dt><%=TF_FORM.Attribute.TPL_SHOW.ZhName %>：</dt><!--TPL_SHOW-->
               <dd><span>
                
                    <input id="txtTPL_SHOW" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TPL_PRINT">
               <dt><%=TF_FORM.Attribute.TPL_PRINT.ZhName %>：</dt><!--TPL_PRINT-->
               <dd><span>
                
                    <input id="txtTPL_PRINT" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TPL_LIST">
               <dt><%=TF_FORM.Attribute.TPL_LIST.ZhName %>：</dt><!--TPL_LIST-->
               <dd><span>
                
                    <input id="txtTPL_LIST" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_IDS">
               <dt><%=TF_FORM.Attribute.TB_IDS.ZhName %>：</dt><!--其他关联表ID-->
               <dd><span>
                
                    <input id="txtTB_IDS" type="text" runat="server"/>
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
                    
                    
                    <td><%=TF_FORM.Attribute.FORM_ID._ZhName %><!--FORM_ID--></td>
                    
                    
                    <td><%=TF_FORM.Attribute.F_NAME._ZhName %><!--F_NAME--></td>
                    
                    
                    <td><%=TF_FORM.Attribute.TB_ID._ZhName %><!--主表ID--></td>
                    
                    
                    <td><%=TF_FORM.Attribute.TPL_EDIT._ZhName %><!--TPL_EDIT--></td>
                    
                    
                    <td><%=TF_FORM.Attribute.TPL_SHOW._ZhName %><!--TPL_SHOW--></td>
                    
                    
                    <td><%=TF_FORM.Attribute.TPL_PRINT._ZhName %><!--TPL_PRINT--></td>
                    
                    
                    <td><%=TF_FORM.Attribute.TPL_LIST._ZhName %><!--TPL_LIST--></td>
                    
                    
                    <td><%=TF_FORM.Attribute.TB_IDS._ZhName %><!--其他关联表ID--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((TF_FORM)Container.DataItem).FORM_ID %>" /></td>
                     
                    
                    <td><%#((TF_FORM)Container.DataItem).FORM_ID %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).F_NAME %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TPL_EDIT %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TPL_SHOW %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TPL_PRINT %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TPL_LIST %></td>
                    
                    
                    <td><%#((TF_FORM)Container.DataItem).TB_IDS %></td>
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
