<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHKWKDIVKEYVALUEEdit2" CodeFile="HR_CHKWKDIVKEYVALUEEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
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
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId.ZhName %>：</dt><%--组ID--%>
               <dd><span>
                
                    <input id="txtGroupId" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID.ZhName %>：</dt><%--设备ID--%>
               <dd><span>
                
                    <input id="txtDeviceID" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName.ZhName %>：</dt><%--AIO表名--%>
               <dd><span>
                
                    <input id="txtAIOTableName" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName.ZhName %>：</dt><%--AIO关键字段名--%>
               <dd><span>
                
                    <input id="txtAIOKeyFieldName" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName.ZhName %>：</dt><%--其他系统关键字段名--%>
               <dd><span>
                
                    <input id="txtOtherKeyFieldName" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue.ZhName %>：</dt><%--AIO关键字段值--%>
               <dd><span>
                
                    <input id="txtAIOKeyValue" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue.ZhName %>：</dt><%--其他系统关键字段值--%>
               <dd><span>
                
                    <input id="txtOtherKeyValue" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
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