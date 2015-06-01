<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_KNMAShow" CodeFile="KM_KNMAShow.aspx.cs" %>
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
       <div>
        
             <dl>
               <dt><%=KM_KNMA.Attribute.KNMA_ID.ZhName %>：</dt><%--知识标识--%>
               <dd>
                
                    <asp:Label id="txtKNMA_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.KNMA_NAME.ZhName %>：</dt><%--知识标题--%>
               <dd>
                
                    <asp:Label id="txtKNMA_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.P_KNMA_ID.ZhName %>：</dt><%--父级ID--%>
               <dd>
                
                    <asp:Label id="txtP_KNMA_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.CONTENT.ZhName %>：</dt><%--知识内容--%>
               <dd>
                
                    <asp:Label id="txtCONTENT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.CLASS_ID.ZhName %>：</dt><%--知识类别--%>
               <dd>
               
                    <asp:Label id="txtCLASS_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.UP_TYPE.ZhName %>：</dt><%--上传文档类型--%>
               <dd>
               
                    <asp:Label id="txtUP_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EA_SIGN.ZhName %>：</dt><%--审批标志--%>
               <dd>
               
                    <asp:Label id="txtEA_SIGN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.AUTHOR.ZhName %>：</dt><%--作者--%>
               <dd>
                
                    <asp:Label id="txtAUTHOR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.SORT_NO.ZhName %>：</dt><%--序号--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.DEPT_ID.ZhName %>：</dt><%--部门编号--%>
               <dd>
                
                    <asp:Label id="txtDEPT_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.ADD_TIME.ZhName %>：</dt><%--文件录入时间--%>
               <dd>
               
                    <asp:Label id="txtADD_TIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EDIT_TIME.ZhName %>：</dt><%--文件编辑时间--%>
               <dd>
               
                    <asp:Label id="txtEDIT_TIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.PATH_ID.ZhName %>：</dt><%--上级编号--%>
               <dd>
                
                    <asp:Label id="txtPATH_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.CAN_EDIT.ZhName %>：</dt><%--允许共同编辑--%>
               <dd>
               
                    <asp:Label id="txtCAN_EDIT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.CAN_COMMENTS.ZhName %>：</dt><%--允许评论--%>
               <dd>
               
                    <asp:Label id="txtCAN_COMMENTS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.ADD_USER.ZhName %>：</dt><%--录入人--%>
               <dd>
                
                    <asp:Label id="txtADD_USER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EDIT_USER.ZhName %>：</dt><%--编辑人--%>
               <dd>
               
                    <asp:Label ID="txtEDIT_USER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.S_LEVEL.ZhName %>：</dt><%--安全级别--%>
               <dd>
                
                    <asp:Label id="txtS_LEVEL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EXP1.ZhName %>：</dt><%--自定义1--%>
               <dd>
                
                    <asp:Label id="txtEXP1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EXP2.ZhName %>：</dt><%--自定义2--%>
               <dd>
                
                    <asp:Label id="txtEXP2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EXP3.ZhName %>：</dt><%--自定义3--%>
               <dd>
                
                    <asp:Label id="txtEXP3" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EXP4.ZhName %>：</dt><%--自定义4--%>
               <dd>
                
                    <asp:Label id="txtEXP4" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>