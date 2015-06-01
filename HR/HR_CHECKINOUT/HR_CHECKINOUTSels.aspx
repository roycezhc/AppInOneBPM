<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKINOUTSels" CodeFile="HR_CHECKINOUTSels.aspx.cs" %>
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
         
            <dl colname="USERID">
               <dt><%=HR_CHECKINOUT.Attribute.USERID.ZhName %>：</dt><!--USERID-->
               <dd><span>
                
                    <input id="txtUSERID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CHECKTIME">
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTIME.ZhName %>：</dt><!--CHECKTIME-->
               <dd><span>
               
                    <input id="txtCHECKTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="STAFF_ID">
               <dt><%=HR_CHECKINOUT.Attribute.STAFF_ID.ZhName %>：</dt><!--STAFF_ID-->
               <dd><span>
                
                    <input id="txtSTAFF_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CHECKTYPE">
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTYPE.ZhName %>：</dt><!--CHECKTYPE-->
               <dd><span>
                
                    <input id="txtCHECKTYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="VERIFYCODE">
               <dt><%=HR_CHECKINOUT.Attribute.VERIFYCODE.ZhName %>：</dt><!--VERIFYCODE-->
               <dd><span>
                
                    <input id="txtVERIFYCODE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SENSORID">
               <dt><%=HR_CHECKINOUT.Attribute.SENSORID.ZhName %>：</dt><!--SENSORID-->
               <dd><span>
                
                    <input id="txtSENSORID" type="text" runat="server"/>
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
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.USERID._ZhName %><!--USERID--></td>
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.CHECKTIME._ZhName %><!--CHECKTIME--></td>
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.STAFF_ID._ZhName %><!--STAFF_ID--></td>
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.CHECKTYPE._ZhName %><!--CHECKTYPE--></td>
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.VERIFYCODE._ZhName %><!--VERIFYCODE--></td>
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.SENSORID._ZhName %><!--SENSORID--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((HR_CHECKINOUT)Container.DataItem).CHECKTIME %>" /></td>
                     
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).USERID %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).CHECKTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).STAFF_ID %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).CHECKTYPE %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).VERIFYCODE %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).SENSORID %></td>
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
