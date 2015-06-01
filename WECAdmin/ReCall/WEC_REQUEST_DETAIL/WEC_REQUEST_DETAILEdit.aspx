<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUEST_DETAILEdit.aspx.cs" Inherits="WEC_REQUEST_DETAILEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
 <script type="text/javascript">
     $(function () {
         changetype();
         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
         var kindEditor = new creatKindEditor('#<%=txtDESCRIPTION.ClientID%>');
         var smImage = new creatSmImage('#btnPICURL', '#<%=txtPICURL.ClientID%>', '#<%=hidPICURL.ClientID%>');
         
     });
     function changetype() {
         $("#type").addClass("hide");
         for (i = 0; i < 5; i++) {
             $("#type" + i).addClass("hide");
         }

         $("#type" + $("#<%=txtTYPE_ID.ClientID %>").val()).removeClass("hide");
     }
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
               <dt><%=WEC_REQUEST_DETAIL.Attribute.ID.ZhName %>：</dt><%--详细ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtID" type="text" runat="server" ck="{type:1,min:0,need:0}"/></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TID.ZhName %>：</dt><%--回复ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTID" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TITLE.ZhName %>：</dt><%--标题--%>
               <dd><span>
                    <input id="txtTITLE" type="text"  runat="server" ck="{type:0,min:0,need:1}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.SORT_ID.ZhName %>：</dt><%--排序--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSORT_ID" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.PICURL.ZhName %>：</dt><%--图片地址--%>
               <dd>
                    <div class="controls">
					    <img id="txtPICURL" runat="server" style="max-height:100px;vertical-align: middle;">
                        <span class="insertimage"><a id="btnPICURL">选择图文封面</a></span>  建议大小(宽720高400)
                        <input type="hidden" id="hidPICURL" runat="server" />
                    </div>
               <%--<span>
                    <img id="imgBanner" runat=server  class="preview_pic"/>
                    <asp:FileUpload ID="fileUp" runat="server" style = " border:none"  onChange="onUploadImgChange(this,'ctl00_cphBody_imgBanner',200,200)" />--%>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.NOTE.ZhName %>：</dt><%--描述--%>
               <dd><span>
                    <textarea id="txtNOTE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TYPE_ID.ZhName %>：</dt><%--业务类型--%>
               <dd><span>
               
                    <select id="txtTYPE_ID" runat="server" ck="{len:50,type:0}" onchange="changetype()" >
                    </select></span>
               </dd>
           </dl>
           <dl id ="type"  class="hide">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.DESCRIPTION.ZhName %>：</dt><%--描述--%>
               <dd><span>
                    <input id="txtDESCRIPTION" type="text"  runat="server" style="width:668px;height:230px;"/></span>
                    <input id="txtUrl" type="hidden"  runat="server" />
               </dd>
           </dl>
           <dl id ="type0"  class="hide">
               <dt>url地址：</dt>
               <dd><span >
         
                    <textarea id="txtAddress" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl id ="type2"  class="hide">
               <dt>栏目：</dt>
               <dd><span >
         
                     <select id="selColumn" runat="server" ck="{len:50,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl id ="type3"  class="hide">
               <dt>文章：</dt>
               <dd><span >
         
                     <select id="selArticle" runat="server" ck="{len:50,type:0}">
                    </select></span>
               </dd>
           </dl>
            <dl id ="type4"  class="hide">
               <dt>活动：</dt>
               <dd><span >
         
                     <select id="selActivity" runat="server" ck="{len:50,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_REQUEST_DETAIL.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
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