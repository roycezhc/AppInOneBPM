<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="APP_STATISTICSEdit.aspx.cs" Inherits="APP_STATISTICSEdit" %>
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
               <dt><%=APP_STATISTICS.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_STATISTICS_ID' type='text' runat='server' ck='{type:1,min:0,max:4,need:0}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.AF_ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_AF_ADDTIME' type='text' readonly='readonly' onclick='setday(this)' runat='server' ck='{need:1,len:8,type:3}' /></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.IP.ZhName %>：</dt><%--IP--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_STATISTICS_IP' type='text' runat='server' ck='{type:0,min:0,max:50,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.LONG.ZhName %>：</dt><%--经度--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_STATISTICS_LONG' type='text' runat='server' ck='{type:0,min:0,max:50,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.LAT.ZhName %>：</dt><%--纬度--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_STATISTICS_LAT' type='text' runat='server' ck='{type:0,min:0,max:50,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_SYS.ZhName %>：</dt><%--设备系统--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_STATISTICS_DEVICE_SYS' type='text' runat='server' ck='{type:0,min:0,max:50,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.VER_CODE.ZhName %>：</dt><%--应用版本号--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_STATISTICS_VER_CODE' type='text' runat='server' ck='{type:0,min:0,max:50,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_MODEL.ZhName %>：</dt><%--设备型号--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_STATISTICS_DEVICE_MODEL' type='text' runat='server' ck='{type:0,min:0,max:50,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.STAFF_ID.ZhName %>：</dt><%--员工编号--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_STATISTICS_STAFF_ID' type='text' runat='server' ck='{type:1,min:0,max:8,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_ID.ZhName %>：</dt><%--设备ID--%>
               <dd><span>
               
                    <script type='text/javascript'>
                        $(function () {
                            var kindEditor = new creatKindEditor('#<%=txtAPP_STATISTICS_DEVICE_ID.ClientID%>');
                        });
                    </script>
                    <input id='txtAPP_STATISTICS_DEVICE_ID' type='text'  runat='server' style='width:668px;height:230px;' ck='{need:1,len:500,type:0}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=APP_STATISTICS.Attribute.VER_NAME.ZhName %>：</dt><%--应用版本名--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_STATISTICS_VER_NAME' type='text' runat='server' ck='{type:0,min:0,max:10,need:1}'/></span>
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