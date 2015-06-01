<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_fieldShow.aspx.cs" Inherits="Ec_fieldShow" %>
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
               <dt><%=Ec_field.Attribute.Fieldid.ZhName %>：</dt><%--字段ID--%>
               <dd>
               
                    <asp:Label id="txtFieldid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Tabid.ZhName %>：</dt><%--模块ID--%>
               <dd>
               
                    <asp:Label id="txtTabid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Columnname.ZhName %>：</dt><%--列名--%>
               <dd>
               
                    <asp:Label id="txtColumnname" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Tablename.ZhName %>：</dt><%--表名--%>
               <dd>
               
                    <asp:Label id="txtTablename" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Generatedtype.ZhName %>：</dt><%--生成类型--%>
               <dd>
               
                    <asp:Label id="txtGeneratedtype" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Uitype.ZhName %>：</dt><%--控件类型--%>
               <dd>
               
                    <asp:Label id="txtUitype" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Fieldname.ZhName %>：</dt><%--字段名--%>
               <dd>
               
                    <asp:Label id="txtFieldname" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Fieldlabel.ZhName %>：</dt><%--字段标签--%>
               <dd>
               
                    <asp:Label id="txtFieldlabel" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Readonly.ZhName %>：</dt><%--只读--%>
               <dd>
               
                    <asp:Label id="txtReadonly" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Presence.ZhName %>：</dt><%--是否存在--%>
               <dd>
               
                    <asp:Label id="txtPresence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Selected.ZhName %>：</dt><%--是否选择--%>
               <dd>
               
                    <asp:Label id="txtSelected" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Maximumlength.ZhName %>：</dt><%--最大长度--%>
               <dd>
               
                    <asp:Label id="txtMaximumlength" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Sequence.ZhName %>：</dt><%--顺序号--%>
               <dd>
               
                    <asp:Label id="txtSequence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Block.ZhName %>：</dt><%--布局编号--%>
               <dd>
               
                    <asp:Label id="txtBlock" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Displaytype.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtDisplaytype" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Typeofdata.ZhName %>：</dt><%--包含‘o’是必--%>
               <dd>
               
                    <asp:Label id="txtTypeofdata" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Quickcreate.ZhName %>：</dt><%--是否快速创建--%>
               <dd>
               
                    <asp:Label id="txtQuickcreate" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Quickcreatesequence.ZhName %>：</dt><%--快速创建的次序--%>
               <dd>
               
                    <asp:Label id="txtQuickcreatesequence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Info_type.ZhName %>：</dt><%--类型--%>
               <dd>
               
                    <asp:Label id="txtInfo_type" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.CtrlType.ZhName %>：</dt><%--控件类型--%>
               <dd>
               
                    <asp:Label id="txtCtrlType" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>