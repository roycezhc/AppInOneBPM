<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TABLESels2" CodeFile="TABLESels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows();
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
         
            <dl colname="TB_ID">
               <dt><%=TF_TABLE.Attribute.TB_ID.ZhName %>：</dt><!--表ID-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_NAME">
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>：</dt><!--表名称-->
               <dd><span>
                
                    <input id="txtTB_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CH_NAME">
               <dt><%=TF_TABLE.Attribute.CH_NAME.ZhName %>：</dt><!--中文名-->
               <dd><span>
                
                    <input id="txtCH_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="M_TB_ID">
               <dt><%=TF_TABLE.Attribute.M_TB_ID.ZhName %>：</dt><!--主表ID-->
               <dd><span>
                
                    <input id="txtM_TB_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SORT_NO">
               <dt><%=TF_TABLE.Attribute.SORT_NO.ZhName %>：</dt><!--序号-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_TYPE">
               <dt><%=TF_TABLE.Attribute.TB_TYPE.ZhName %>：</dt><!--表类型-->
               <dd><span>
               
                    <select id="txtTB_TYPE" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="NOTE">
               <dt><%=TF_TABLE.Attribute.NOTE.ZhName %>：</dt><!--NOTE-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server"/>

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
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "全选") %>' onclick='_selsAll(this);'/><%=LanguageService.GetLanguageString("Choose", "选择") %></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_ID._ZhName %><!--表ID--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_NAME._ZhName %><!--表名称--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.CH_NAME._ZhName %><!--中文名--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.M_TB_ID._ZhName %><!--主表ID--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.SORT_NO._ZhName %><!--序号--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_TYPE._ZhName %><!--表类型--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.NOTE._ZhName %><!--NOTE--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selsThis(this);" value="<%#((TF_TABLE)Container.DataItem).TB_ID %>" /></td>
                     
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).CH_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).M_TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(TF_TABLE.Attribute.TB_TYPE, ((TF_TABLE)Container.DataItem).TB_TYPE)%></td>
                    
                    
                     <td><%#((TF_TABLE)Container.DataItem).NOTE %></td>
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
