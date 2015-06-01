<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMN_ITEMSels" CodeFile="ITEMSels.aspx.cs" %>
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
         
            <dl colname="ITEM_ID">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.ITEM_ID.ZhName %>：</dt><!--ITEM_ID-->
               <dd><span>
                
                    <input id="txtITEM_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="FORM_ID">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.FORM_ID.ZhName %>：</dt><!--FORM_ID-->
               <dd><span>
                
                    <input id="txtFORM_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="COLUMN_ID">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.COLUMN_ID.ZhName %>：</dt><!--COLUMN_ID-->
               <dd><span>
                
                    <input id="txtCOLUMN_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="VALUE">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.VALUE.ZhName %>：</dt><!--选项值-->
               <dd><span>
                
                    <input id="txtVALUE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TEXT">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.TEXT.ZhName %>：</dt><!--选项名-->
               <dd><span>
                
                    <input id="txtTEXT" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DROP_REAL">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.DROP_REAL.ZhName %>：</dt><!--联动下拉框信息-->
               <dd><span>
               
                    <input id="txtDROP_REAL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="COL_HIDE">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.COL_HIDE.ZhName %>：</dt><!--显示隐藏列信息-->
               <dd><span>
               
                    <input id="txtCOL_HIDE" type="text" runat="server"/>
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
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.ITEM_ID._ZhName %><!--ITEM_ID--></td>
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.FORM_ID._ZhName %><!--FORM_ID--></td>
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.COLUMN_ID._ZhName %><!--COLUMN_ID--></td>
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.VALUE._ZhName %><!--选项值--></td>
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.TEXT._ZhName %><!--选项名--></td>
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.DROP_REAL._ZhName %><!--联动下拉框信息--></td>
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.COL_HIDE._ZhName %><!--显示隐藏列信息--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((TF_F_COLUMN_ITEM)Container.DataItem).ITEM_ID %>" /></td>
                     
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).ITEM_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).FORM_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).COLUMN_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).VALUE %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).TEXT %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).DROP_REAL %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).COL_HIDE %></td>
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
