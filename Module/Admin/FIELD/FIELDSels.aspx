<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TB_FIELDSels2" CodeFile="FIELDSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows(); Sels_Load();
        });
    </script>
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
         
            <dl colname="FIELD_ID">
               <dt><%=TF_TB_FIELD.Attribute.FIELD_ID.ZhName %>：</dt><!--ID-->
               <dd><span>
                
                    <input id="txtFIELD_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="FIELD_NAME">
               <dt><%=TF_TB_FIELD.Attribute.FIELD_NAME.ZhName %>：</dt><!--字段名-->
               <dd><span>
                
                    <input id="txtFIELD_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="FIELD_TYPE">
               <dt></dt><!--字段类型-->
               <dd><span>
               
                    <select id="txtFIELD_TYPE" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="DB_TYPE">
               <dt><%=TF_TB_FIELD.Attribute.DB_TYPE.ZhName %>：</dt><!--对应数据类型-->
               <dd><span>
                
                    <input id="txtDB_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="IS_NULL">
               <dt><%=TF_TB_FIELD.Attribute.IS_NULL.ZhName %>：</dt><!--IS_NULL-->
               <dd><span>
                
                    <input id="txtIS_NULL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="NOTE">
               <dt><%=TF_TB_FIELD.Attribute.NOTE.ZhName %>：</dt><!--中文名-->
               <dd><span>
                
                    <input id="txtNOTE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DEFAULT_VAL">
               <dt><%=TF_TB_FIELD.Attribute.DEFAULT_VAL.ZhName %>：</dt><!--默认值-->
               <dd><span>
                
                    <input id="txtDEFAULT_VAL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_ID">
               <dt><%=TF_TB_FIELD.Attribute.TB_ID.ZhName %>：</dt><!--所属表ID-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CTRL_TYPE">
               <dt><%=TF_TB_FIELD.Attribute.CTRL_TYPE.ZhName %>：</dt><!--默认控件类型-->
               <dd><span>
                
                    <input id="txtCTRL_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SORT_NO">
               <dt><%=TF_TB_FIELD.Attribute.SORT_NO.ZhName %>：</dt><!--序号-->
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
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.FIELD_ID._ZhName %><!--ID--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.FIELD_NAME._ZhName %><!--字段名--></td>
                    
                    
                   <%-- <td><%=TF_TB_FIELD.Attribute.FIELD_TYPE._ZhName %><!--字段类型--></td>
                    --%>
                    
                    <td><%=TF_TB_FIELD.Attribute.DB_TYPE._ZhName %><!--对应数据类型--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.IS_NULL._ZhName %><!--IS_NULL--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.NOTE._ZhName %><!--中文名--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.DEFAULT_VAL._ZhName %><!--默认值--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.TB_ID._ZhName %><!--所属表ID--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.CTRL_TYPE._ZhName %><!--默认控件类型--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.SORT_NO._ZhName %><!--序号--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((TF_TB_FIELD)Container.DataItem).FIELD_ID %>" /></td>
                     
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_ID %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_NAME %></td>
                    
            <%--        
                    <td><%#formhelper.GetOptionText(TF_TB_FIELD.Attribute.FIELD_TYPE, ((TF_TB_FIELD)Container.DataItem).FIELD_TYPE)%></td>
                    
                    --%>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DB_TYPE %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).IS_NULL %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).DEFAULT_VAL %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).SORT_NO %></td>
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
