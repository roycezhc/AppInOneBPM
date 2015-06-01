<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_APPEdit.aspx.cs" Inherits="SYS_APPEdit" %>
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
               <dt><%=SYS_APP.Attribute.APP_ID.ZhName %>：</dt><%--APP_ID--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_ID' type='text' runat='server' ck='{type:0,min:0,max:50,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=SYS_APP.Attribute.APP_NAME.ZhName %>：</dt><%--APP_NAM--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_NAME' type='text' runat='server' ck='{type:0,min:0,max:50,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=SYS_APP.Attribute.APP_LABEL.ZhName %>：</dt><%--应用系统名--%>
               <dd><span>
               <!--文字-->
                    <input id='txtAPP_LABEL' type='text' runat='server' ck='{type:0,min:0,max:50,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=SYS_APP.Attribute.DEFAULT_URL.ZhName %>：</dt><%--内部首页地址--%>
               <dd><span>
               
                    <textarea id='txtDEFAULT_URL' class='smalltextarea' cols='1' rows='1' style='height:20px;width:300px;overflow:hidden;' 
                            runat='server' ck='{need:1,len:200,type:0}' /></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=SYS_APP.Attribute.DEFAULT_URL_NAME.ZhName %>：</dt><%--内部首页名称--%>
               <dd><span>
               <!--文字-->
                    <input id='txtDEFAULT_URL_NAME' type='text' runat='server' ck='{type:0,min:0,max:200,need:1}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=SYS_APP.Attribute.IsBigSystem.ZhName %>：</dt><%--是否独立系统--%>
               <dd><span>
               
                    <select id='txtIsBigSystem' runat='server' ck='{need:0,len:1,type:1}'>
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=SYS_APP.Attribute.Note.ZhName %>：</dt><%--备注--%>
               <dd><span>
               
                    <script type='text/javascript'>
                        $(function () {
                            var kindEditor = new creatKindEditor('#<%=txtNote.ClientID%>');
                        });
                    </script>
                    <input id='txtNote' type='text'  runat='server' style='width:668px;height:230px;' ck='{need:0,len:500,type:0}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=SYS_APP.Attribute.APP_IMG.ZhName %>：</dt><%--图标--%>
               <dd><span>
                             
                    <script type='text/javascript'>
                        $(function () {
                            var smImage = new creatSmImage('#btntxtAPP_IMG', '#<%=txtAPP_IMG.ClientID%>', '#<%=hidtxtAPP_IMG.ClientID%>');
                        });
                    </script>
                    <div class='controls'>
					    <img id='txtAPP_IMG' runat='server' style='max-height:100px;vertical-align: middle;'>
                        <span class='insertimage'><a id='btntxtAPP_IMG'>选择图文封面</a></span>  建议大小(宽720高400)
                        <input type='hidden' id='hidtxtAPP_IMG' runat='server' />
                    </div></span>
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