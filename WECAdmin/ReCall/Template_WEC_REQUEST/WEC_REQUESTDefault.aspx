<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUESTDefault.aspx.cs" Inherits="WEC_REQUESTDefault" %>
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
    <dl>
        <dt>
            <b><%=title %></b>
          <%--  <div><a href="http://115.29.224.227/appinone/wecadmin/website/help/wec_helperdetail">帮助</a></div>--%>

        </dt>

    </dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form" id="divForm">
       <div>
           <dl>
               <dt>默认关注回复：</dt><%--回复类型--%>
               <dd><span>
                     <select id="txtMEMO" runat="server" ck="{need:1,len:4,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt>默认无匹配回复：</dt><%--关键字--%>
               <dd><span>
               <!--文字-->
                    <input id="txtKEYWORD" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt>是否开启无匹配回复：</dt><%--状态--%>
               <dd><span>
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_REQUEST.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_REQUEST.Attribute.AID.ZhName %>：</dt><%--公众号ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtAID" type="text" runat="server" ck="{type:0,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
           <li><span class="btn"><a href="http://115.29.224.227/appinone/wecadmin/website/help/wec_helperdetail?key=<%=title %>">查看帮助</a></span></li>
</ul>
   </div>
</div>
</asp:Content>