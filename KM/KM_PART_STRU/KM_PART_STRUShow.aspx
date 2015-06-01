<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_PART_STRUShow" CodeFile="KM_PART_STRUShow.aspx.cs" %>
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
               <dt><%=KM_PART_STRU.Attribute.PART_ID.ZhName %>：</dt><%--PART_ID--%>
               <dd>
                
                    <asp:Label id="txtPART_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_NAME.ZhName %>：</dt><%--PART_NAME--%>
               <dd>
                
                    <asp:Label id="txtPART_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.K_PART_ID.ZhName %>：</dt><%--K_PART_ID--%>
               <dd>
                
                    <asp:Label id="txtK_PART_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_CONTENT.ZhName %>：</dt><%--PART_CONTENT--%>
               <dd>
               
                    <asp:Label id="txtPART_CONTENT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_CLASS_ID.ZhName %>：</dt><%--PART_CLASS_ID--%>
               <dd>
                
                    <asp:Label id="txtPART_CLASS_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_EA_SIGN.ZhName %>：</dt><%--PART_EA_SIGN--%>
               <dd>
                
                    <asp:Label id="txtPART_EA_SIGN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_AUTHOR.ZhName %>：</dt><%--PART_AUTHOR--%>
               <dd>
                
                    <asp:Label id="txtPART_AUTHOR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_IS_READ.ZhName %>：</dt><%--PART_IS_READ--%>
               <dd>
                
                    <asp:Label id="txtPART_IS_READ" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.SORT_NO.ZhName %>：</dt><%--SORT_NO--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.IDPATH.ZhName %>：</dt><%--IDPATH--%>
               <dd>
               
                    <asp:Label id="txtIDPATH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.KNAME.ZhName %>：</dt><%--KNAME--%>
               <dd>
               
                    <asp:Label id="txtKNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.SNAME.ZhName %>：</dt><%--SNAME--%>
               <dd>
                
                    <asp:Label id="txtSNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.RNAME.ZhName %>：</dt><%--RNAME--%>
               <dd>
                
                    <asp:Label id="txtRNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.SUB_NUM.ZhName %>：</dt><%--SUB_NUM--%>
               <dd>
                
                    <asp:Label id="txtSUB_NUM" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.SUBOBJECT_NUM.ZhName %>：</dt><%--SUBOBJECT_NUM--%>
               <dd>
                
                    <asp:Label id="txtSUBOBJECT_NUM" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.USE_FLAG.ZhName %>：</dt><%--USE_FLAG--%>
               <dd>
                
                    <asp:Label id="txtUSE_FLAG" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP1.ZhName %>：</dt><%--EXP1--%>
               <dd>
                
                    <asp:Label id="txtEXP1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP2.ZhName %>：</dt><%--EXP2--%>
               <dd>
                
                    <asp:Label id="txtEXP2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP3.ZhName %>：</dt><%--EXP3--%>
               <dd>
                
                    <asp:Label id="txtEXP3" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP4.ZhName %>：</dt><%--EXP4--%>
               <dd>
                
                    <asp:Label id="txtEXP4" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>

       <dl class="f-tit"><dt><em onclick="openMore(this);" class="opended"></em><a>我的关联信息</a></dt></dl>
           <div>
            <iframe name="ifrReal" id="ifrReal" src="KM_PART_STRUReal.aspx" frameborder="0" scrolling="auto" style="width:100%;height:100%;"></iframe>
           </div>
    </div>

</div>
</asp:Content>