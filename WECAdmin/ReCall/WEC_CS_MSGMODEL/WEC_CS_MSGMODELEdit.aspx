<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CS_MSGMODELEdit.aspx.cs" Inherits="WEC_CS_MSGMODELEdit" %>
<%@ Import Namespace="AgileFrame.Core" %><%@ Import Namespace="AgileFrame.Common" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
       $(function () {
           var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });

           $("#addStr").click(function () {
               //alert($("#ctl00_cphBody_txtMODELCONTENT").val());
               $("#ctl00_cphBody_txtMODELCONTENT").val($("#txtMODELCONTENT").val() + "{xxx}");
           });
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
<%--<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>--%>
<div class="form" id="divForm">
       <div>
        
           <dl class = "hide">
               <dt><%=WEC_CS_MSGMODEL.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtID" type="text" runat="server" /></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_CS_MSGMODEL.Attribute.AID.ZhName %>：</dt><%--公众号编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtAID" type="text" runat="server" /></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_CS_MSGMODEL.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server"  /></span>
               </dd>
           </dl>
               <dl class = "">
               <dt><%=WEC_CS_MSGMODEL.Attribute.MODELNAME.ZhName %>：</dt><%--模板名称--%>
               <dd><span>
               
                    <input id="txtMODELNAME" type="text"  runat="server"  /></span>
               </dd>
           </dl>

             <dl class = "">
               <dt>模板内容：</dt><%--模板内容(占位--%>
               <dd><span >
                    <textarea style="width:200px;height:100px;" rows="5" cols="9" id="txtMODELCONTENT" type="text" runat="server" />
                   </span>
                  <%-- <span >
                       <input id="addStr" type="button" value="添加占位符"/>
                   </span>--%>
               </dd>
           </dl>

           <dl class = "">
               <dt><%=WEC_CS_MSGMODEL.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
         
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
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