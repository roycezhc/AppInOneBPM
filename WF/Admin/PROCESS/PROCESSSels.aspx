<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_PROCESS_TPLSels" CodeFile="PROCESSSels.aspx.cs" %>
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
     <div class="topfind">
         
            <dl colname="PROCID">
               <dt><%=WF_PROCESS_TPL.Attribute.PROCID.ZhName %>：</dt><!--流程过程ID-->
               <dd><span>
                
                    <input id="txtPROCID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PROC_NAME">
               <dt><%=WF_PROCESS_TPL.Attribute.PROC_NAME.ZhName %>：</dt><!--过程名-->
               <dd><span>
                
                    <input id="txtPROC_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="WFCID">
               <dt><%=WF_PROCESS_TPL.Attribute.WFID.ZhName %>：</dt><!--所属流程分类-->
               <dd><span>
                
                    <input id="txtWFCID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WF_PROCESS_TPL.Attribute.ADDTIME.ZhName %>：</dt><!--创建时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="EDITIME">
               <dt><%=WF_PROCESS_TPL.Attribute.EDITIME.ZhName %>：</dt><!--修改时间-->
               <dd><span>
               
                    <input id="txtEDITIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="GUID">
               <dt><%=WF_PROCESS_TPL.Attribute.GUID.ZhName %>：</dt><!--唯一版本ID-->
               <dd><span>
                
                    <input id="txtGUID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WF_PROCESS_TPL.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="CONDITION">
               <dt><%=WF_PROCESS_TPL.Attribute.CONDITION.ZhName %>：</dt><!--条件组合-->
               <dd><span>
               
                    <input id="txtSHOW_CONDITION" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="FORMULAR">
               <dt><%=WF_PROCESS_TPL.Attribute.FORMULAR.ZhName %>：</dt><!--条件公式-->
               <dd><span>
               
                    <input id="txtSHOW_FORMULA" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="NOTE">
               <dt><%=WF_PROCESS_TPL.Attribute.NOTE.ZhName %>：</dt><!--备注-->
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
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "全选") %>' onclick='_selAll(this);'/><%=LanguageService.GetLanguageString("Choose", "选择") %></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.PROCID._ZhName %><!--流程过程ID--></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.PROC_NAME._ZhName %><!--过程名--></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.WFID._ZhName %><!--所属流程分类--></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.ADDTIME._ZhName %><!--创建时间--></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.EDITIME._ZhName %><!--修改时间--></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.GUID._ZhName %><!--唯一版本ID--></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.STATUS._ZhName %><!--状态--></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.CONDITION._ZhName %><!--条件组合--></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.FORMULAR._ZhName %><!--条件公式--></td>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.NOTE._ZhName %><!--备注--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WF_PROCESS_TPL)Container.DataItem).PROCID %>" /></td>
                     
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).PROCID %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).PROC_NAME %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).WFID %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).EDITIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).GUID %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WF_PROCESS_TPL.Attribute.STATUS, ((WF_PROCESS_TPL)Container.DataItem).STATUS)%></td>
                    
                    
                     <td><%#((WF_PROCESS_TPL)Container.DataItem).CONDITION %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).FORMULAR %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).NOTE %></td>
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
