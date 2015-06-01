<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="TF_TABLESels.aspx.cs" Inherits="TF_TABLESels" %>
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
         
            <dl colname="TB_ID">
               <dt><%=TF_TABLE.Attribute.TB_ID.ZhName %>：</dt><!--表ID-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_NAME">
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>：</dt><!--表名-->
               <dd><span>
                
                    <input id="txtTB_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="WF_TB_NAME">
               <dt><%=TF_TABLE.Attribute.WF_TB_NAME.ZhName %>：</dt><!--流程表名-->
               <dd><span>
                
                    <input id="txtWF_TB_NAME" type="text" runat="server"/>
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
               <dt><%=TF_TABLE.Attribute.NOTE.ZhName %>：</dt><!--备注-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="CREATED">
               <dt><%=TF_TABLE.Attribute.CREATED.ZhName %>：</dt><!--创建人-->
               <dd><span>
                
                    <input id="txtCREATED" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DB_SRC">
               <dt><%=TF_TABLE.Attribute.DB_SRC.ZhName %>：</dt><!--数据源-->
               <dd><span>
                
                    <input id="txtDB_SRC" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MENU_NAME">
               <dt><%=TF_TABLE.Attribute.MENU_NAME.ZhName %>：</dt><!--模块菜单名-->
               <dd><span>
                
                    <input id="txtMENU_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="KEY_NAME">
               <dt><%=TF_TABLE.Attribute.KEY_NAME.ZhName %>：</dt><!--主键名-->
               <dd><span>
                
                    <input id="txtKEY_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="KEY_TYPE">
               <dt><%=TF_TABLE.Attribute.KEY_TYPE.ZhName %>：</dt><!--数据类型-->
               <dd><span>
                
                    <input id="txtKEY_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="API_NAME">
               <dt><%=TF_TABLE.Attribute.API_NAME.ZhName %>：</dt><!--API对象名-->
               <dd><span>
                
                    <input id="txtAPI_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ALLOW_REPORT">
               <dt><%=TF_TABLE.Attribute.ALLOW_REPORT.ZhName %>：</dt><!--允许报表-->
               <dd><span>
                
                    <input id="txtALLOW_REPORT" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="ALLOW_ACTIVITY">
               <dt><%=TF_TABLE.Attribute.ALLOW_ACTIVITY.ZhName %>：</dt><!--允许活动-->
               <dd><span>
                
                    <input id="txtALLOW_ACTIVITY" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="MODIFY_HIS">
               <dt><%=TF_TABLE.Attribute.MODIFY_HIS.ZhName %>：</dt><!--跟踪字段历史-->
               <dd><span>
                
                    <input id="txtMODIFY_HIS" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="ALLOW_USER_AREA">
               <dt><%=TF_TABLE.Attribute.ALLOW_USER_AREA.ZhName %>：</dt><!--启用用户级分部-->
               <dd><span>
                
                    <input id="txtALLOW_USER_AREA" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="ALLOW_PUBLIC">
               <dt><%=TF_TABLE.Attribute.ALLOW_PUBLIC.ZhName %>：</dt><!--可用于客户入口网站 此选项使得自定义对象可通过 Salesforce 客户入口网站使用。-->
               <dd><span>
                
                    <input id="txtALLOW_PUBLIC" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="TB_NAMESPACE">
               <dt><%=TF_TABLE.Attribute.TB_NAMESPACE.ZhName %>：</dt><!--命名空间前缀-->
               <dd><span>
                
                    <input id="txtTB_NAMESPACE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="INSTALL_STAT">
               <dt><%=TF_TABLE.Attribute.INSTALL_STAT.ZhName %>：</dt><!--部署状态-->
               <dd><span>
                
                    <input id="txtINSTALL_STAT" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="ADD_NOTE_FILE">
               <dt><%=TF_TABLE.Attribute.ADD_NOTE_FILE.ZhName %>：</dt><!--添加备注和附件-->
               <dd><span>
                
                    <input id="txtADD_NOTE_FILE" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="HAS_WF">
               <dt><%=TF_TABLE.Attribute.HAS_WF.ZhName %>：</dt><!--审批功能-->
               <dd><span>
                
                    <input id="txtHAS_WF" type="checkbox" runat="server" class="ckbs" />
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
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_ID._ZhName %><!--表ID--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_NAME._ZhName %><!--表名--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.WF_TB_NAME._ZhName %><!--流程表名--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.CH_NAME._ZhName %><!--中文名--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.M_TB_ID._ZhName %><!--主表ID--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.SORT_NO._ZhName %><!--序号--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_TYPE._ZhName %><!--表类型--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.NOTE._ZhName %><!--备注--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.CREATED._ZhName %><!--创建人--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.DB_SRC._ZhName %><!--数据源--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.MENU_NAME._ZhName %><!--模块菜单名--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.KEY_NAME._ZhName %><!--主键名--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.KEY_TYPE._ZhName %><!--数据类型--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.API_NAME._ZhName %><!--API对象名--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_REPORT._ZhName %><!--允许报表--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_ACTIVITY._ZhName %><!--允许活动--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.MODIFY_HIS._ZhName %><!--跟踪字段历史--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_USER_AREA._ZhName %><!--启用用户级分部--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_PUBLIC._ZhName %><!--可用于客户入口网站 此选项使得自定义对象可通过 Salesforce 客户入口网站使用。--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_NAMESPACE._ZhName %><!--命名空间前缀--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.INSTALL_STAT._ZhName %><!--部署状态--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ADD_NOTE_FILE._ZhName %><!--添加备注和附件--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.HAS_WF._ZhName %><!--审批功能--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((TF_TABLE)Container.DataItem).TB_ID %>" /></td>
                     
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).WF_TB_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).CH_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).M_TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(TF_TABLE.Attribute.TB_TYPE, ((TF_TABLE)Container.DataItem).TB_TYPE)%></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((TF_TABLE)Container.DataItem).NOTE) %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).CREATED %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).DB_SRC %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).MENU_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).KEY_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).KEY_TYPE %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).API_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_REPORT %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_ACTIVITY %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).MODIFY_HIS %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_USER_AREA %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_PUBLIC %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_NAMESPACE %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).INSTALL_STAT %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ADD_NOTE_FILE %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).HAS_WF %></td>
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
