<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_fieldEdit.aspx.cs" Inherits="Ec_fieldEdit" %>
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
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=Ec_field.Attribute.Fieldid.ZhName %>：</dt><%--字段ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtFieldid" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Tabid.ZhName %>：</dt><%--模块ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTabid" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Columnname.ZhName %>：</dt><%--列名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtColumnname" type="text" runat="server" ck="{type:0,min:0,max:30,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Tablename.ZhName %>：</dt><%--表名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTablename" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Generatedtype.ZhName %>：</dt><%--生成类型--%>
               <dd><span>
               <!--文字-->
                    <input id="txtGeneratedtype" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Uitype.ZhName %>：</dt><%--控件类型--%>
               <dd><span>
               
                    <select id="txtUitype" runat="server" ck="{need:0,len:30,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Fieldname.ZhName %>：</dt><%--字段名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtFieldname" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Fieldlabel.ZhName %>：</dt><%--字段标签--%>
               <dd><span>
               <!--文字-->
                    <input id="txtFieldlabel" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Readonly.ZhName %>：</dt><%--只读--%>
               <dd><span>
               
                    <select id="txtReadonly" runat="server" ck="{need:0,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Presence.ZhName %>：</dt><%--是否存在--%>
               <dd><span>
               
                    <select id="txtPresence" runat="server" ck="{need:0,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Selected.ZhName %>：</dt><%--是否选择--%>
               <dd><span>
               
                    <select id="txtSelected" runat="server" ck="{need:0,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Maximumlength.ZhName %>：</dt><%--最大长度--%>
               <dd><span>
               <!--文字-->
                    <input id="txtMaximumlength" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Sequence.ZhName %>：</dt><%--顺序号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSequence" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Block.ZhName %>：</dt><%--布局编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtBlock" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Displaytype.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtDisplaytype" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Typeofdata.ZhName %>：</dt><%--包含‘o’是必--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTypeofdata" type="text" runat="server" ck="{type:0,min:0,max:100,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Quickcreate.ZhName %>：</dt><%--是否快速创建--%>
               <dd><span>
               
                    <select id="txtQuickcreate" runat="server" ck="{need:0,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Quickcreatesequence.ZhName %>：</dt><%--快速创建的次序--%>
               <dd><span>
               <!--文字-->
                    <input id="txtQuickcreatesequence" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Info_type.ZhName %>：</dt><%--类型--%>
               <dd><span>
               
                    <select id="txtInfo_type" runat="server" ck="{need:1,len:20,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.CtrlType.ZhName %>：</dt><%--控件类型--%>
               <dd><span>
               
                    <select id="txtCtrlType" runat="server" ck="{need:1,len:50,type:0}">
                    </select></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
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