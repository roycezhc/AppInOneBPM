<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_PUBLICLISTEdit.aspx.cs" Inherits="WEC_PUBLICLISTEdit" %>
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
<div class="form" id="divForm">
       <div>
        
           <dl class="hide">
               <dt><%=WEC_PUBLICLIST.Attribute.AID.ZhName %>：</dt><%--公众号ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtAID" type="text" runat="server" ck="{type:1,min:0,need:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=WEC_PUBLICLIST.Attribute.USER_ID.ZhName %>：</dt><%--用户ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtUSER_ID" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_NAME.ZhName %>：</dt><%--公众号名称--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPLC_NAME" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID.ZhName %>：</dt><%--原始ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPLC_SOURCEID" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.WECHAT_ID.ZhName %>：</dt><%--微信号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtWECHAT_ID" type="text" runat="server" ck="{type:0,min:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.AVATAR_URL.ZhName %>：</dt><%--图片地址--%>
               <dd><span>
               
                    <textarea id="txtAVATAR_URL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.API_KEY.ZhName %>：</dt><%--API地址--%>
               <dd><span>
               
                    <textarea id="txtAPI_KEY" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.TOKEN.ZhName %>：</dt><%--TOKEN--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTOKEN" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.LOCATION.ZhName %>：</dt><%--地区--%>
               <dd><span>
               <!--文字-->
                    <input id="txtLOCATION" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.EMAIL.ZhName %>：</dt><%--邮箱--%>
               <dd><span>
               <!--文字-->
                    <input id="txtEMAIL" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.FUNS.ZhName %>：</dt><%--粉丝数--%>
               <dd><span>
               <!--文字-->
                    <input id="txtFUNS" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.TYPE.ZhName %>：</dt><%--所属类型--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTYPE" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.START_DAY.ZhName %>：</dt><%--开始时间--%>
               <dd><span>
               
                    <input id="txtSTART_DAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.END_DAY.ZhName %>：</dt><%--到期时间--%>
               <dd><span>
               
                    <input id="txtEND_DAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSTATUS" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.PACKAGE_ID.ZhName %>：</dt><%--套餐类型--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPACKAGE_ID" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.IS_NEWS.ZhName %>：</dt><%--关注回复类型--%>
               <dd><span>
               
                    <select id="txtIS_NEWS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY.ZhName %>：</dt><%--默认无匹配回复--%>
               <dd><span>
               
                    <textarea id="txtDEFAULT_REPLAY" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG.ZhName %>：</dt><%--是否开启--%>
               <dd><span>
               
                    <select id="txtDEFAULT_REPLAY_FALG" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE.ZhName %>：</dt><%--默认LBS查询--%>
               <dd><span>
               <!--文字-->
                    <input id="txtLBS_DISTANCE" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.APPID.ZhName %>：</dt><%--APPID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtAPPID" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.APPSESECRET.ZhName %>：</dt><%--APPSECR--%>
               <dd><span>
               <!--文字-->
                    <input id="txtAPPSESECRET" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
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