<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CS_DEFAULTRESPONSEEdit.aspx.cs" Inherits="WEC_CS_DEFAULTRESPONSEEdit" %>
<%@ Import Namespace="AgileFrame.Core" %><%@ Import Namespace="AgileFrame.Common" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
     $(function () {
         
           var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
           $("#ctl00_cphBody_txtMODELID").change(function () {
             //  alert($("#ctl00_cphBody_txtMSGCONTENT").val());
               $.ajax({
                   url: "WEC_CS_DEFAULTRESPONSEAJAX.aspx",
                   type: "post",
                   data: { "modelid": $("#ctl00_cphBody_txtMODELID").val() },
                   dataType: "text",
                   success: function (data) {
                      
                   
                       $("#ctl00_cphBody_txtMSGCONTENT").val(data);
                     
                   },
                   error: function (data,res) {
                       console.log(res);
                   }
               });
           }

           );
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
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtID" type="text" runat="server" ck="{type:1,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.AID.ZhName %>：</dt><%--公众号编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtAID" type="text" runat="server" ck="{type:1,min:0,max:18,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
        
           <dl class = "">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.STARTTIME.ZhName %>：</dt><%--开始时间--%>
               <dd><span>
               
                    <input id="txtSTARTTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ENDTIME.ZhName %>：</dt><%--结束时间--%>
               <dd><span>
               
                    <input id="txtENDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
            <dl class = "">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt>模板ID：</dt><%--模板ID--%>
               <dd><span>
                    <select id="txtMODELID" runat="server" >
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.MSGCONTENT.ZhName %>：</dt><%--消息内容--%>
               <dd><span id="txtMODELAREA" runat="server">
               <!--文字-->
                   <textarea id="txtMSGCONTENT" runat="server" rows="5" cols="9" style="width:200px;height:100px;"/>
                    </span>
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