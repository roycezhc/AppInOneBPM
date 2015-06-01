<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CUSTOM_CATEBANNEREdit.aspx.cs" Inherits="WEC_CUSTOM_CATEBANNEREdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
       $(function () {
           var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
           var smImage = new creatSmImage('#btnPICURL', '#<%=txtPICURL.ClientID%>', '#<%=hidPICURL.ClientID%>');
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
<div class="form" id="divForm">
       <div>
        
           <dl class = "hide">
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtID" type="text" runat="server" ck="{type:1,min:0,max:18,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.AID.ZhName %>：</dt><%--公众号编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtAID" type="text" runat="server" ck="{type:0,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.NAME.ZhName %>：</dt><%--标题--%>
               <dd><span>
               <!--文字-->
                    <input id="txtNAME" type="text" runat="server" ck="{type:0,min:0,max:18,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.PIC_URL.ZhName %>：</dt><%--图片地址--%>
               <dd> <div class="controls">
					    <img id="txtPICURL" runat="server" style="max-height:100px;vertical-align: middle;">
                        <span class="insertimage"><a id="btnPICURL">选择图片</a></span>  建议大小(宽640高425)
                        <input type="hidden" id="hidPICURL" runat="server" />
                    </div>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.OUT_URL.ZhName %>：</dt><%--链接地址--%>
               <dd><span>
               
                    <textarea id="txtOUT_URL" class="smalltextarea" cols="1" rows="1" 
                            runat="server" ck="{need:0,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.SORT_ID.ZhName %>：</dt><%--排序--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSORT_ID" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
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