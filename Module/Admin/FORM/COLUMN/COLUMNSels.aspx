<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMNSels" CodeFile="COLUMNSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
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
     <div class="topfindl">
         
            <dl colname="COLUMN_ID">
               <dt><%=TF_F_COLUMN.Attribute.COLUMN_ID.ZhName %>：</dt><!--COLUMN_ID-->
               <dd><span>
                
                    <input id="txtCOLUMN_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="FORM_ID">
               <dt><%=TF_F_COLUMN.Attribute.FORM_ID.ZhName %>：</dt><!--FORM_ID-->
               <dd><span>
                
                    <input id="txtFORM_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_ID">
               <dt><%=TF_F_COLUMN.Attribute.TB_ID.ZhName %>：</dt><!--栏目所属表-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="FIELD_ID">
               <dt><%=TF_F_COLUMN.Attribute.FIELD_ID.ZhName %>：</dt><!--FIELD_ID-->
               <dd><span>
                
                    <input id="txtFIELD_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SHOW_NAME">
               <dt><%=TF_F_COLUMN.Attribute.SHOW_NAME.ZhName %>：</dt><!--显示名称-->
               <dd><span>
                
                    <input id="txtSHOW_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CTRL_TYPE">
               <dt><%=TF_F_COLUMN.Attribute.CTRL_TYPE.ZhName %>：</dt><!--CTRL_TYPE-->
               <dd><span>
                
                    <input id="txtCTRL_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MAX_VAL">
               <dt><%=TF_F_COLUMN.Attribute.MAX_VAL.ZhName %>：</dt><!--MAX_VAL-->
               <dd><span>
                
                    <input id="txtMAX_VAL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MIN_VAL">
               <dt><%=TF_F_COLUMN.Attribute.MIN_VAL.ZhName %>：</dt><!--MIN_VAL-->
               <dd><span>
                
                    <input id="txtMIN_VAL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="IS_NEED">
               <dt><%=TF_F_COLUMN.Attribute.IS_NEED.ZhName %>：</dt><!--IS_NEED-->
               <dd><span>
                
                    <input id="txtIS_NEED" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CAL_FORMULA">
               <dt><%=TF_F_COLUMN.Attribute.CAL_FORMULA.ZhName %>：</dt><!--行计算规则-->
               <dd><span>
                
                    <input id="txtCAL_FORMULA" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SUM_FIELD_ID">
               <dt><%=TF_F_COLUMN.Attribute.SUM_FIELD_ID.ZhName %>：</dt><!--合计到表字段ID,表ID.字段ID-->
               <dd><span>
                
                    <input id="txtSUM_FIELD_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SORT_NO">
               <dt><%=TF_F_COLUMN.Attribute.SORT_NO.ZhName %>：</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server"/>
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
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.COLUMN_ID._ZhName %><!--COLUMN_ID--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.FORM_ID._ZhName %><!--FORM_ID--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.TB_ID._ZhName %><!--栏目所属表--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.FIELD_ID._ZhName %><!--FIELD_ID--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.SHOW_NAME._ZhName %><!--显示名称--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.CTRL_TYPE._ZhName %><!--CTRL_TYPE--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.MAX_VAL._ZhName %><!--MAX_VAL--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.MIN_VAL._ZhName %><!--MIN_VAL--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.IS_NEED._ZhName %><!--IS_NEED--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.CAL_FORMULA._ZhName %><!--行计算规则--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.SUM_FIELD_ID._ZhName %><!--合计到表字段ID,表ID.字段ID--></td>
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.SORT_NO._ZhName %><!--SORT_NO--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((TF_F_COLUMN)Container.DataItem).COLUMN_ID %>" /></td>
                     
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).COLUMN_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).FORM_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).FIELD_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).SHOW_NAME %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).MAX_VAL %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).MIN_VAL %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).IS_NEED %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).CAL_FORMULA %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).SUM_FIELD_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).SORT_NO %></td>
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
