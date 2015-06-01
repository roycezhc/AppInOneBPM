<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_PUBLICLISTShow.aspx.cs" Inherits="WEC_PUBLICLISTShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.AID.ZhName %>：</dt><%--公众号ID--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.USER_ID.ZhName %>：</dt><%--用户ID--%>
               <dd>
               
                    <asp:Label id="txtUSER_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_NAME.ZhName %>：</dt><%--公众号名称--%>
               <dd>
               
                    <asp:Label id="txtPLC_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID.ZhName %>：</dt><%--原始ID--%>
               <dd>
               
                    <asp:Label id="txtPLC_SOURCEID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.WECHAT_ID.ZhName %>：</dt><%--微信号--%>
               <dd>
               
                    <asp:Label id="txtWECHAT_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.AVATAR_URL.ZhName %>：</dt><%--图片地址--%>
               <dd>
               
                    <asp:Label id="txtAVATAR_URL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.API_KEY.ZhName %>：</dt><%--API地址--%>
               <dd>
               
                    <asp:Label id="txtAPI_KEY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.TOKEN.ZhName %>：</dt><%--TOKEN--%>
               <dd>
               
                    <asp:Label id="txtTOKEN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.LOCATION.ZhName %>：</dt><%--地区--%>
               <dd>
               
                    <asp:Label id="txtLOCATION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.EMAIL.ZhName %>：</dt><%--邮箱--%>
               <dd>
               
                    <asp:Label id="txtEMAIL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.FUNS.ZhName %>：</dt><%--粉丝数--%>
               <dd>
               
                    <asp:Label id="txtFUNS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.TYPE.ZhName %>：</dt><%--所属类型--%>
               <dd>
               
                    <asp:Label id="txtTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.START_DAY.ZhName %>：</dt><%--开始时间--%>
               <dd>
               
                    <asp:Label id="txtSTART_DAY" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.END_DAY.ZhName %>：</dt><%--到期时间--%>
               <dd>
               
                    <asp:Label id="txtEND_DAY" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.PACKAGE_ID.ZhName %>：</dt><%--套餐类型--%>
               <dd>
               
                    <asp:Label id="txtPACKAGE_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.IS_NEWS.ZhName %>：</dt><%--关注回复类型--%>
               <dd>
               
                    <asp:Label id="txtIS_NEWS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY.ZhName %>：</dt><%--默认无匹配回复--%>
               <dd>
               
                    <asp:Label id="txtDEFAULT_REPLAY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG.ZhName %>：</dt><%--是否开启--%>
               <dd>
               
                    <asp:Label id="txtDEFAULT_REPLAY_FALG" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE.ZhName %>：</dt><%--默认LBS查询--%>
               <dd>
               
                    <asp:Label id="txtLBS_DISTANCE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.APPID.ZhName %>：</dt><%--APPID--%>
               <dd>
               
                    <asp:Label id="txtAPPID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.APPSESECRET.ZhName %>：</dt><%--APPSECR--%>
               <dd>
               
                    <asp:Label id="txtAPPSESECRET" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>