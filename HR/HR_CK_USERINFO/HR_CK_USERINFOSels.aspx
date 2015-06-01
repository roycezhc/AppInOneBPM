<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CK_USERINFOSels" CodeFile="HR_CK_USERINFOSels.aspx.cs" %>
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
               <dt><%=HR_CK_USERINFO.Attribute.USERID.ZhName %>：</dt><!--USERID-->
               <dd><span>
                
                    <input id="txtUSERID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="STAFF_ID">
               <dt><%=HR_CK_USERINFO.Attribute.STAFF_ID.ZhName %>：</dt><!--STAFF_ID-->
               <dd><span>
                
                    <input id="txtSTAFF_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="BADGENUMBER">
               <dt><%=HR_CK_USERINFO.Attribute.BADGENUMBER.ZhName %>：</dt><!--BADGENUMBER-->
               <dd><span>
                
                    <input id="txtBADGENUMBER" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SSN">
               <dt><%=HR_CK_USERINFO.Attribute.SSN.ZhName %>：</dt><!--SSN-->
               <dd><span>
                
                    <input id="txtSSN" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="NAME">
               <dt><%=HR_CK_USERINFO.Attribute.NAME.ZhName %>：</dt><!--NAME-->
               <dd><span>
                
                    <input id="txtNAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="GENDER">
               <dt><%=HR_CK_USERINFO.Attribute.GENDER.ZhName %>：</dt><!--GENDER-->
               <dd><span>
                
                    <input id="txtGENDER" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TITLE">
               <dt><%=HR_CK_USERINFO.Attribute.TITLE.ZhName %>：</dt><!--TITLE-->
               <dd><span>
                
                    <input id="txtTITLE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PAGER">
               <dt><%=HR_CK_USERINFO.Attribute.PAGER.ZhName %>：</dt><!--PAGER-->
               <dd><span>
                
                    <input id="txtPAGER" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="BIRTHDAY">
               <dt><%=HR_CK_USERINFO.Attribute.BIRTHDAY.ZhName %>：</dt><!--BIRTHDAY-->
               <dd><span>
               
                    <input id="txtBIRTHDAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="HIREDDAY">
               <dt><%=HR_CK_USERINFO.Attribute.HIREDDAY.ZhName %>：</dt><!--HIREDDAY-->
               <dd><span>
               
                    <input id="txtHIREDDAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="STREET">
               <dt><%=HR_CK_USERINFO.Attribute.STREET.ZhName %>：</dt><!--STREET-->
               <dd><span>
                
                    <input id="txtSTREET" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CITY">
               <dt><%=HR_CK_USERINFO.Attribute.CITY.ZhName %>：</dt><!--CITY-->
               <dd><span>
                
                    <input id="txtCITY" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="STATE">
               <dt><%=HR_CK_USERINFO.Attribute.STATE.ZhName %>：</dt><!--STATE-->
               <dd><span>
                
                    <input id="txtSTATE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ZIP">
               <dt><%=HR_CK_USERINFO.Attribute.ZIP.ZhName %>：</dt><!--ZIP-->
               <dd><span>
                
                    <input id="txtZIP" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="OPHONE">
               <dt><%=HR_CK_USERINFO.Attribute.OPHONE.ZhName %>：</dt><!--OPHONE-->
               <dd><span>
                
                    <input id="txtOPHONE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="FPHONE">
               <dt><%=HR_CK_USERINFO.Attribute.FPHONE.ZhName %>：</dt><!--FPHONE-->
               <dd><span>
                
                    <input id="txtFPHONE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="VERIFICATIONMETHOD">
               <dt><%=HR_CK_USERINFO.Attribute.VERIFICATIONMETHOD.ZhName %>：</dt><!--VERIFICATIONMETHOD-->
               <dd><span>
                
                    <input id="txtVERIFICATIONMETHOD" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DEFAULTDEPTID">
               <dt><%=HR_CK_USERINFO.Attribute.DEFAULTDEPTID.ZhName %>：</dt><!--DEFAULTDEPTID-->
               <dd><span>
                
                    <input id="txtDEFAULTDEPTID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SECURITYFLAGS">
               <dt><%=HR_CK_USERINFO.Attribute.SECURITYFLAGS.ZhName %>：</dt><!--SECURITYFLAGS-->
               <dd><span>
                
                    <input id="txtSECURITYFLAGS" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ATT">
               <dt><%=HR_CK_USERINFO.Attribute.ATT.ZhName %>：</dt><!--ATT-->
               <dd><span>
                
                    <input id="txtATT" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="INLATE">
               <dt><%=HR_CK_USERINFO.Attribute.INLATE.ZhName %>：</dt><!--INLATE-->
               <dd><span>
                
                    <input id="txtINLATE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="OUTEARLY">
               <dt><%=HR_CK_USERINFO.Attribute.OUTEARLY.ZhName %>：</dt><!--OUTEARLY-->
               <dd><span>
                
                    <input id="txtOUTEARLY" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="OVERTIME">
               <dt><%=HR_CK_USERINFO.Attribute.OVERTIME.ZhName %>：</dt><!--OVERTIME-->
               <dd><span>
                
                    <input id="txtOVERTIME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SEP">
               <dt><%=HR_CK_USERINFO.Attribute.SEP.ZhName %>：</dt><!--SEP-->
               <dd><span>
                
                    <input id="txtSEP" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="HOLIDAY">
               <dt><%=HR_CK_USERINFO.Attribute.HOLIDAY.ZhName %>：</dt><!--HOLIDAY-->
               <dd><span>
                
                    <input id="txtHOLIDAY" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MINZU">
               <dt><%=HR_CK_USERINFO.Attribute.MINZU.ZhName %>：</dt><!--MINZU-->
               <dd><span>
                
                    <input id="txtMINZU" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PASSWORD">
               <dt><%=HR_CK_USERINFO.Attribute.PASSWORD.ZhName %>：</dt><!--PASSWORD-->
               <dd><span>
                
                    <input id="txtPASSWORD" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="LUNCHDURATION">
               <dt><%=HR_CK_USERINFO.Attribute.LUNCHDURATION.ZhName %>：</dt><!--LUNCHDURATION-->
               <dd><span>
                
                    <input id="txtLUNCHDURATION" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MVerifyPass">
               <dt><%=HR_CK_USERINFO.Attribute.MVerifyPass.ZhName %>：</dt><!--MVerifyPass-->
               <dd><span>
                
                    <input id="txtMVerifyPass" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PHOTO">
               <dt><%=HR_CK_USERINFO.Attribute.PHOTO.ZhName %>：</dt><!--PHOTO-->
               <dd><span>
                
                    <input id="txtPHOTO" type="text" runat="server"/>
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
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.USERID._ZhName %><!--USERID--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.STAFF_ID._ZhName %><!--STAFF_ID--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.BADGENUMBER._ZhName %><!--BADGENUMBER--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.SSN._ZhName %><!--SSN--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.NAME._ZhName %><!--NAME--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.GENDER._ZhName %><!--GENDER--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.TITLE._ZhName %><!--TITLE--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.PAGER._ZhName %><!--PAGER--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.BIRTHDAY._ZhName %><!--BIRTHDAY--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.HIREDDAY._ZhName %><!--HIREDDAY--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.STREET._ZhName %><!--STREET--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.CITY._ZhName %><!--CITY--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.STATE._ZhName %><!--STATE--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.ZIP._ZhName %><!--ZIP--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.OPHONE._ZhName %><!--OPHONE--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.FPHONE._ZhName %><!--FPHONE--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.VERIFICATIONMETHOD._ZhName %><!--VERIFICATIONMETHOD--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.DEFAULTDEPTID._ZhName %><!--DEFAULTDEPTID--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.SECURITYFLAGS._ZhName %><!--SECURITYFLAGS--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.ATT._ZhName %><!--ATT--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.INLATE._ZhName %><!--INLATE--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.OUTEARLY._ZhName %><!--OUTEARLY--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.OVERTIME._ZhName %><!--OVERTIME--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.SEP._ZhName %><!--SEP--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.HOLIDAY._ZhName %><!--HOLIDAY--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.MINZU._ZhName %><!--MINZU--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.PASSWORD._ZhName %><!--PASSWORD--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.LUNCHDURATION._ZhName %><!--LUNCHDURATION--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.MVerifyPass._ZhName %><!--MVerifyPass--></td>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.PHOTO._ZhName %><!--PHOTO--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((HR_CK_USERINFO)Container.DataItem).USERID %>" /></td>
                     
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).USERID %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).STAFF_ID %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).BADGENUMBER %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).SSN %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).GENDER %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).PAGER %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).BIRTHDAY.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).HIREDDAY.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).STREET %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).CITY %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).STATE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).ZIP %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).OPHONE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).FPHONE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).VERIFICATIONMETHOD %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).DEFAULTDEPTID %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).SECURITYFLAGS %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).ATT %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).INLATE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).OUTEARLY %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).OVERTIME %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).SEP %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).HOLIDAY %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).MINZU %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).PASSWORD %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).LUNCHDURATION %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).MVerifyPass %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).PHOTO %></td>
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
