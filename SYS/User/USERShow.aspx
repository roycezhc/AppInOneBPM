<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_USERShow" CodeFile="USERShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
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
       <h3> <asp:Literal ID="litTitle" runat="server">某某某</asp:Literal>的详细信息</h3>
       <dl class="f-tit"><dt><em onclick="openMore(this);" class="opened"></em><a>基本信息</a></dt><dd><b id="bERR" runat="server"></b></dd></dl>
       <div>
        
             <dl>
               <dt><%=SYS_USER.Attribute.USER_ID.ZhName %>：</dt><%--用户标识--%>
               <dd>
                
                    <asp:Label id="txtUSER_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.USER_NAME.ZhName %>：</dt><%--用户名--%>
               <dd>
                
                    <asp:Label id="txtUSER_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.PASS.ZhName %>：</dt><%--密码--%>
               <dd>
                
                    <asp:Label id="txtPASS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.EMAIL.ZhName %>：</dt><%--内部邮件--%>
               <dd>
                
                    <asp:Label id="txtEMAIL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.LOGIN_IPS.ZhName %>：</dt><%--可登录IP地址集合--%>
               <dd>
                
                    <asp:Label id="txtLOGIN_IPS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.USE_FLAG.ZhName%>：</dt><%--状态标志--%>
               <dd>
               
                    <asp:Label id="txtSTATE_FLAG" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.EDITTIME.ZhName%>：</dt><%--修改时间--%>
               <dd>
               
                    <asp:Label id="txtEDITIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.ADDTIME.ZhName %>：</dt><%--录入时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.USER_TYPE.ZhName %>：</dt><%--用户类型--%>
               <dd>
               
                    <asp:Label id="txtUSER_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>

       <dl class="f-tit"><dt><em onclick="openMore(this);" class="opended"></em><a>我的关联信息</a></dt></dl>
           <div>
            <iframe name="ifrReal" id="ifrReal" src="UserRole.aspx" frameborder="0" scrolling="auto" style="width:100%;height:100%;"></iframe>
           </div>
    </div>

</div>
</asp:Content>