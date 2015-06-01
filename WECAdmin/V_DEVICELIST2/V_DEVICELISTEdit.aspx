<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="V_DEVICELISTEdit.aspx.cs" Inherits="V_DEVICELISTEdit" %>
<%@ Import Namespace="AgileFrame.Core" %><%@ Import Namespace="AgileFrame.Common" %>
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
        
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_ID' type='text' runat='server' ck='{type:1,min:0,max:18,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.USER_ID.ZhName %>：</dt><%--用户编号--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_USER_ID' type='text' runat='server' ck='{type:1,min:0,max:18,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.DEVICE_ID.ZhName %>：</dt><%--TOKEN_I--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_DEVICE_ID' type='text' runat='server' ck='{type:0,min:0,max:500,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.KIND.ZhName %>：</dt><%--类型--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_KIND' type='text' runat='server' ck='{type:1,min:0,max:4,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.DEBUG.ZhName %>：</dt><%--状态--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_DEBUG' type='text' runat='server' ck='{type:1,min:0,max:4,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_STATUS' type='text' runat='server' ck='{type:1,min:0,max:4,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.AF_ADDTIEM.ZhName %>：</dt><%--AF_ADDT--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_AF_ADDTIEM' type='text' runat='server' ck='{type:2,min:0,max:8,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.AF_EDITTIME.ZhName %>：</dt><%--AF_EDIT--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_AF_EDITTIME' type='text' runat='server' ck='{type:2,min:0,max:8,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.TOKEN_ID.ZhName %>：</dt><%--TOKEN_I--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_TOKEN_ID' type='text' runat='server' ck='{type:0,min:0,max:500,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=V_DEVICELIST.Attribute.STAFF_NAME.ZhName %>：</dt><%--员工姓名--%>
               <dd><span>
               <!--文字-->
                    <input id='txtV_DEVICELIST_STAFF_NAME' type='text' runat='server' ck='{type:0,min:0,max:500,need:1}'/></span>
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