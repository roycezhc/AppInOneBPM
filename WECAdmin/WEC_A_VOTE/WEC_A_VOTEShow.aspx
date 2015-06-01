<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_A_VOTEShow.aspx.cs" Inherits="WEC_A_VOTEShow" %>
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
        <%if(valObj.DataBaseTable!=null) //jinsj 明细表
              foreach (DataBaseTableRelation dr1 in valObj.DataBaseTable.SubTable_ChaZhao)
              {
                  DataBaseTable dt1 = dr1.DataBaseTable;
                  %>
                  <a href=""><%=dt1.ZhName %>,<%=dt1.IDField %><%=dt1.NameField %></a>
                  <%
              }%>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.AID.ZhName %>：</dt><%--公众号编号--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.KEYWORD.ZhName %>：</dt><%--关键词--%>
               <dd>
               
                    <asp:Label id="txtKEYWORD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.TITLE.ZhName %>：</dt><%--投票标题--%>
               <dd>
               
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.PICURL.ZhName %>：</dt><%--投票图片--%>
               <dd>
               
                    <asp:Label id="txtPICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.INSTRUCTION.ZhName %>：</dt><%--投票说明--%>
               <dd>
               
                    <asp:Label id="txtINSTRUCTION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.PIC_SHOW.ZhName %>：</dt><%--图片显示--%>
               <dd>
               
                    <asp:Label id="txtPIC_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.IS_RADIO.ZhName %>：</dt><%--是否多选--%>
               <dd>
               
                    <asp:Label id="txtIS_RADIO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.SELECT_NUM.ZhName %>：</dt><%--多选数量--%>
               <dd>
               
                    <asp:Label id="txtSELECT_NUM" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.TIME.ZhName %>：</dt><%--时间设置--%>
               <dd>
               
                    <asp:Label id="txtTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.RESULT.ZhName %>：</dt><%--投票结果--%>
               <dd>
               
                    <asp:Label id="txtRESULT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.SHARE.ZhName %>：</dt><%--是否分享--%>
               <dd>
               
                    <asp:Label id="txtSHARE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.KIND.ZhName %>：</dt><%--类别--%>
               <dd>
               
                    <asp:Label id="txtKIND" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>