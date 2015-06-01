<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_USERNoticeInfoEdit" CodeFile="USERNoticeInfoEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
  <script src="../../Lib/JScript/myTabs.js" type="text/javascript"></script>
<script type="text/javascript">
    function _myCheck() {
        var roleids = window.frames["ifrReal"]._getSelRealIDS();
        $("input[id$='hidSelReals']").val(roleids);
        return true;
    }
</script>
<style type="text/css">
body,html{ overflow:hidden;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
    <div class="titnav">
       <dl><dt><b><%=title %></b></dt></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
     <ul><li><span class="btn"><asp:Button ID="btnSave" runat="server" lang="BtnOK" Text="保存" onclick="btnOK_Click"/></span></li></ul>
    </div>
               <div class="form" id="divForm"><input id="txtUSER_ID" type="hidden" runat="server"/>
               <dl>
                   <dt><%=SYS_USER.Attribute.USER_NAME.ZhName %>：</dt><%--用户名--%>
                   <dd>
                        <span><input id="txtUSER_NAME" type="text" readonly="readonly" runat="server" ck="{need:1,len:20,type:0}"/></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.REAL_NAME.ZhName %>：</dt>
                   <dd>
                        <span><input id="txtREAL_NAME" type="text" readonly="readonly" runat="server" ck="{need:1,len:20,type:0}"/></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.EMAIL.ZhName %>：</dt><%--内部邮件--%>
                   <dd><span><input id="txtEMAIL" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.IS_EMAIL_Remind.ZhName %>：</dt><%--是否邮件提醒--%>
                   <dd><span>
                
                        <input id="txtIS_EMAIL_Remind" type="checkbox" class="ckb" runat="server" /></span>
                   </dd>
               </dl>
               <dl>
                   <dt>工作电脑IP地址：</dt>
                   <dd><span><input id="txtLOGIN_IPS" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
                   </dd>
                   <dd><span>支持多IP，以“,”号分割。</span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.IS_FeiQ_Remind.ZhName %>：</dt><%--是否飞秋提醒--%>
                   <dd><span>
                
                        <input id="txtIS_FeiQ_Remind" type="checkbox" class="ckb" runat="server" /></span>
                   </dd>
               </dl>
               <dl style="display:none;">
                   <dt><%=SYS_USER.Attribute.USER_QQ.ZhName %>：</dt><%--用户QQ--%>
                   <dd><span>
                
                        <input id="txtUSER_QQ" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
                   </dd>
               </dl>
               <dl style="display:none;">
                   <dt><%=SYS_USER.Attribute.IS_QQ_Remind.ZhName %>：</dt><%--是否QQ提醒--%>
                   <dd><span>
                
                        <input id="txtIS_QQ_Remind" type="checkbox" class="ckb" runat="server" /></span>
                   </dd>
               </dl>
               <dl style="display:none;">
                   <dt><%=SYS_USER.Attribute.USER_Taobao.ZhName %>：</dt><%--用户旺旺--%>
                   <dd><span>
                
                        <input id="txtUSER_Taobao" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
                   </dd>
               </dl>
               <dl style="display:none;">
                   <dt><%=SYS_USER.Attribute.IS_Taobao_Remind.ZhName %>：</dt><%--是否旺旺提醒--%>
                   <dd><span>
                
                        <input id="txtIS_Taobao_Remind" type="checkbox" class="ckb" runat="server" /></span>
                   </dd>
               </dl>
               <div class="clear"></div>
           </div>
</div>
</asp:Content>