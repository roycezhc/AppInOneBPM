<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_FIELD_DBTYPESels2" CodeFile="DBTYPESels.aspx.cs" %>
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
         
            <dl colname="TYPE_ID">
               <dt><%=TF_FIELD_DBTYPE.Attribute.TYPE_ID.ZhName %>：</dt><!--TYPE_ID-->
               <dd><span>
                
                    <input id="txtTYPE_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TYPE_NAME">
               <dt><%=TF_FIELD_DBTYPE.Attribute.TYPE_NAME.ZhName %>：</dt><!--TYPE_NAME-->
               <dd><span>
                
                    <input id="txtTYPE_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DB_TYPE">
               <dt><%=TF_FIELD_DBTYPE.Attribute.DB_TYPE.ZhName %>：</dt><!--DB_TYPE-->
               <dd><span>
                
                    <input id="txtDB_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CTRL_TYPES">
               <dt><%=TF_FIELD_DBTYPE.Attribute.CTRL_TYPES.ZhName %>：</dt><!--CTRL_TYPES-->
               <dd><span>
               
                    <input id="txtCTRL_TYPES" type="text" runat="server"/>

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
                    
                    
                    <td><%=TF_FIELD_DBTYPE.Attribute.TYPE_ID._ZhName %><!--TYPE_ID--></td>
                    
                    
                    <td><%=TF_FIELD_DBTYPE.Attribute.TYPE_NAME._ZhName %><!--TYPE_NAME--></td>
                    
                    
                    <td><%=TF_FIELD_DBTYPE.Attribute.DB_TYPE._ZhName %><!--DB_TYPE--></td>
                    
                    
                    <td><%=TF_FIELD_DBTYPE.Attribute.CTRL_TYPES._ZhName %><!--CTRL_TYPES--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((TF_FIELD_DBTYPE)Container.DataItem).TYPE_ID %>" /></td>
                     
                    
                    <td><%#((TF_FIELD_DBTYPE)Container.DataItem).TYPE_ID %></td>
                    
                    
                    <td><%#((TF_FIELD_DBTYPE)Container.DataItem).TYPE_NAME %></td>
                    
                    
                    <td><%#((TF_FIELD_DBTYPE)Container.DataItem).DB_TYPE %></td>
                    
                    
                     <td><%#((TF_FIELD_DBTYPE)Container.DataItem).CTRL_TYPES %></td>
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
