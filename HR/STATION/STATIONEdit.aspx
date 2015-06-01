<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STATIONEdit" CodeFile="STATIONEdit.aspx.cs" %>
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
               <dt><%=HR_STATION.Attribute.STATION_ID.ZhName %>：</dt><%--岗位编号--%>
               <dd><span>
                
                    <input id="txtSTATION_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STATION.Attribute.STATION_NAME.ZhName %>：</dt><%--岗位名称--%>
               <dd><span>
                
                    <input id="txtSTATION_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STATION.Attribute.SORT_NO.ZhName %>：</dt><%--序号--%>
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STATION_TYPE.Attribute.TYPE_NAME.ZhName%>：</dt><%--类型--%>
               <dd><span>
                
                    <select id="txtTYPE_NAME" runat="server" ck="{need:0,len:8,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STATION_LEVEL.Attribute.LEVEL_NAME.ZhName%>：</dt><%--等级--%>
               <dd><span>
                
                    <select id="txtLEVEL_NAME" runat="server" ck="{need:0,len:8,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STATION.Attribute.MBR_NUM.ZhName %>：</dt><%--员工定编--%>
               <dd><span>
                
                    <input id="txtMBR_NUM" type="text" runat="server" ck="{need:0,len:2147483647,type:2}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">

   </div>
</div>
</asp:Content>