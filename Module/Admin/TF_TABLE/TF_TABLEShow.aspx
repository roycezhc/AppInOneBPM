<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="TF_TABLEShow.aspx.cs" Inherits="TF_TABLEShow" %>
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
               <dt><%=TF_TABLE.Attribute.TB_ID.ZhName %>：</dt><%--表ID--%>
               <dd>
                
                    <asp:Label id="txtTB_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>：</dt><%--表名--%>
               <dd>
                
                    <asp:Label id="txtTB_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.WF_TB_NAME.ZhName %>：</dt><%--流程表名--%>
               <dd>
                
                    <asp:Label id="txtWF_TB_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.CH_NAME.ZhName %>：</dt><%--中文名--%>
               <dd>
                
                    <asp:Label id="txtCH_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.M_TB_ID.ZhName %>：</dt><%--主表ID--%>
               <dd>
                
                    <asp:Label id="txtM_TB_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.SORT_NO.ZhName %>：</dt><%--序号--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.TB_TYPE.ZhName %>：</dt><%--表类型--%>
               <dd>
               
                    <asp:Label id="txtTB_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.NOTE.ZhName %>：</dt><%--备注--%>
               <dd>
               
                    <asp:Label id="txtNOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.CREATED.ZhName %>：</dt><%--创建人--%>
               <dd>
                
                    <asp:Label id="txtCREATED" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.DB_SRC.ZhName %>：</dt><%--数据源--%>
               <dd>
                
                    <asp:Label id="txtDB_SRC" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.MENU_NAME.ZhName %>：</dt><%--模块菜单名--%>
               <dd>
                
                    <asp:Label id="txtMENU_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.KEY_NAME.ZhName %>：</dt><%--主键名--%>
               <dd>
                
                    <asp:Label id="txtKEY_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.KEY_TYPE.ZhName %>：</dt><%--数据类型--%>
               <dd>
                
                    <asp:Label id="txtKEY_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.API_NAME.ZhName %>：</dt><%--API对象名--%>
               <dd>
                
                    <asp:Label id="txtAPI_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ALLOW_REPORT.ZhName %>：</dt><%--允许报表--%>
               <dd>
                
                    <asp:Label id="txtALLOW_REPORT" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ALLOW_ACTIVITY.ZhName %>：</dt><%--允许活动--%>
               <dd>
                
                    <asp:Label id="txtALLOW_ACTIVITY" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.MODIFY_HIS.ZhName %>：</dt><%--跟踪字段历史--%>
               <dd>
                
                    <asp:Label id="txtMODIFY_HIS" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ALLOW_USER_AREA.ZhName %>：</dt><%--启用用户级分部--%>
               <dd>
                
                    <asp:Label id="txtALLOW_USER_AREA" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ALLOW_PUBLIC.ZhName %>：</dt><%--可用于客户入口网站 此选项使得自定义对象可通过 Salesforce 客户入口网站使用。--%>
               <dd>
                
                    <asp:Label id="txtALLOW_PUBLIC" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.TB_NAMESPACE.ZhName %>：</dt><%--命名空间前缀--%>
               <dd>
                
                    <asp:Label id="txtTB_NAMESPACE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.INSTALL_STAT.ZhName %>：</dt><%--部署状态--%>
               <dd>
                
                    <asp:Label id="txtINSTALL_STAT" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ADD_NOTE_FILE.ZhName %>：</dt><%--添加备注和附件--%>
               <dd>
                
                    <asp:Label id="txtADD_NOTE_FILE" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.HAS_WF.ZhName %>：</dt><%--审批功能--%>
               <dd>
                
                    <asp:Label id="txtHAS_WF" runat="server" ></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>