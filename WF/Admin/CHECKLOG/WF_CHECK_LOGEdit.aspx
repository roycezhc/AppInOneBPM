<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_CHECK_LOGEdit" CodeFile="WF_CHECK_LOGEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.LOG_ID.ZhName %>：</dt><%--日志ID--%>
               <dd><span>
                
                    <input id="txtLOG_ID" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.WFID.ZhName %>：</dt><%--WFCID--%>
               <dd><span>
                
                    <input id="txtWFCID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.PROCID.ZhName %>：</dt><%--过程ID--%>
               <dd><span>
                
                    <input id="txtPROCID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.STEP_ID.ZhName %>：</dt><%--步骤ID--%>
               <dd><span>
                
                    <input id="txtSTEP_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.RECID.ZhName%>：</dt><%--记录ID--%>
               <dd><span>
                
                    <input id="txtREC_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.DETAIL_ID.ZhName %>：</dt><%--明细记录ID--%>
               <dd><span>
                
                    <input id="txtDETAIL_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.RESULT.ZhName %>：</dt><%--最终结果--%>
               <dd><span>
               
                    <select id="txtRESULT" runat="server" ck="{need:0,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.CHECKER.ZhName %>：</dt><%--最后审核人--%>
               <dd><span>
                
                    <input id="txtCHECKER" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.CHECK_TIME.ZhName %>：</dt><%--最后审批时间--%>
               <dd><span>
               
                    <input id="txtCHECK_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.NOTE.ZhName %>：</dt><%--最后审批意见--%>
               <dd><span>
               
                    <textarea id="txtNOTE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.RESULTS.ZhName %>：</dt><%--各次审批结果--%>
               <dd><span>
                
                    <input id="txtRESULTS" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.CHECKERS.ZhName %>：</dt><%--各次审批人--%>
               <dd><span>
               
                    <FCKV2:FCKeditor ID="txtCHECKERS" runat="server" Height="250" Width="400" ToolbarSet="Basic" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.CHECK_TIMES.ZhName %>：</dt><%--各次审批时间--%>
               <dd><span>
               
                    <FCKV2:FCKeditor ID="txtCHECK_TIMES" runat="server" Height="250" Width="400" ToolbarSet="Basic" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECK_LOG.Attribute.NOTES.ZhName %>：</dt><%--各次审批意见--%>
               <dd><span>
               
                    <FCKV2:FCKeditor ID="txtNOTES" runat="server" Height="250" Width="400" ToolbarSet="Basic" /></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>