<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CS_DEFAULTRESPONSEShow.aspx.cs" Inherits="WEC_CS_DEFAULTRESPONSEShow" %>
<%@ Import Namespace="AgileFrame.Core" %><%@ Import Namespace="AgileFrame.Common" %>
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
   <div class="relationlist">
       <%-- <%if(valObj.DataBaseTable()!=null)
              foreach (DataBaseTable dt1 in valObj.DataBaseTable().SubTable)
              {
                  %>
                  <a href=""><%=dt1.ZhName %>,<%=dt1.IDField %><%=dt1.NameField %></a>
                  <%
              }%>--%>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.AID.ZhName %>：</dt><%--公众号编号--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.STARTTIME.ZhName %>：</dt><%--开始时间--%>
               <dd>
               
                    <asp:Label id="txtSTARTTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ENDTIME.ZhName %>：</dt><%--结束时间--%>
               <dd>
               
                    <asp:Label id="txtENDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.MSGCONTENT.ZhName %>：</dt><%--消息内容--%>
               <dd>
               
                    <asp:Label id="txtMSGCONTENT" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>