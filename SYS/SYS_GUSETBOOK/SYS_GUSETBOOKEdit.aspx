<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_GUSETBOOKEdit.aspx.cs" Inherits="SYS_GUSETBOOKEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
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
               <dt><%=SYS_GUSETBOOK.Attribute.ID.ZhName %>：</dt><%--ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtID" type="text" runat="server" ck="{type:1,min:0,max:8,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.TYPE.ZhName %>：</dt><%--类型--%>
               <dd><span>
               
                    <select id="txtTYPE" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.MEMO.ZhName %>：</dt><%--内容--%>
               <dd><span>
               
                    <textarea id="txtMEMO" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.EMAIL.ZhName %>：</dt><%--邮箱--%>
               <dd><span>
               <!--文字-->
                    <input id="txtEMAIL" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.MOBIL.ZhName %>：</dt><%--手机号码--%>
               <dd><span>
               <!--文字-->
                    <input id="txtMOBIL" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.ANSWER.ZhName %>：</dt><%--回复--%>
               <dd><span>
               
                    <textarea id="txtANSWER" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.USERNAME.ZhName %>：</dt><%--姓名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtUSERNAME" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
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