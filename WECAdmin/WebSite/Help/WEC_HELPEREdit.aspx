<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_HELPEREdit.aspx.cs" Inherits="WEC_HELPEREdit" %>
<%@ Import Namespace="AgileFrame.Core" %><%@ Import Namespace="AgileFrame.Common" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
       $(function () {
          // var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
           var kindEditor = new creatKindEditor('#<%=txtHELPCONTEN.ClientID%>');
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
        
           <dl class = "hide ">
               <dt><%=WEC_HELPER.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtID" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_HELPER.Attribute.TITLE.ZhName %>：</dt><%--标题--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTITLE" type="text" runat="server" ck="{type:0,min:0,max:200,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_HELPER.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_HELPER.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd><span>
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
        
           <dl class = "">
               <dt><%=WEC_HELPER.Attribute.KEYVALUE.ZhName %>：</dt><%--键值--%>
               <dd><span>
               <!--文字-->
                    <input id="txtKEYVALUE" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_HELPER.Attribute.PID.ZhName %>：</dt><%--父节点ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPID" type="text" runat="server" ck="{type:0,min:0,max:50}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_HELPER.Attribute.SORT_ID.ZhName %>：</dt><%--排序ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSORT_ID" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
              <dl class = "">
               <dt><%=WEC_HELPER.Attribute.HELPCONTEN.ZhName %>：</dt><%--具体内容--%>
               <dd><span>
               <!--文字-->
                    <input id="txtHELPCONTEN" type="text" runat="server" ck="{type:0,min:0,max:16,need:1}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
  
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    
</ul>
   </div>
</div>
</asp:Content>