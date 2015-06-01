<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_blocksEdit.aspx.cs" Inherits="Ec_blocksEdit" %>
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
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=Ec_blocks.Attribute.Blockid.ZhName %>：</dt><%--Blockid--%>
               <dd><span>
               <!--文字-->
                    <input id="txtBlockid" type="text" runat="server" ck="{type:0,min:1,max:10,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Tabid.ZhName %>：</dt><%--模块id--%>
               <dd><span>
               <!--文字-->
                    <input id="txtTabid" type="text" runat="server" ck="{type:0,min:1,max:10,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Blocklabel.ZhName %>：</dt><%--显示区域名称--%>
               <dd><span>
               <!--文字-->
                    <input id="txtBlocklabel" type="text" runat="server" ck="{type:0,min:1,max:100,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Sequence.ZhName %>：</dt><%--显示顺序--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSequence" type="text" runat="server" ck="{type:0,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Show_title.ZhName %>：</dt><%--标题--%>
               <dd><span>
               <!--文字-->
                    <input id="txtShow_title" type="text" runat="server" ck="{type:0,min:0,max:30,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Visible.ZhName %>：</dt><%--是否可见--%>
               <dd><span>
               <!--文字-->
 
                          <input type="radio" id="IsVisible"  runat="server" name="Visible" value="1"/>可见
                           <input type="radio" id="NoVisible" runat="server" name="Visible" value="0"/>不可见

                   </span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Create_view.ZhName %>：</dt><%--Create_--%>
               <dd><span>
               <!--文字-->
                         <input type="radio" id="IsCreate_view" runat="server" name="Create_view" value="1"  />是
                           <input type="radio" id="NoCreate_view" runat="server" name="Create_view" value="0"/>否
                    
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Edit_view.ZhName %>：</dt><%--Edit_vi--%>
               <dd><span>
               <!--文字-->
                    <input id="txtEdit_view" type="text" runat="server" ck="{type:1,min:0,max:1,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Detail_view.ZhName %>：</dt><%--Detail_--%>
               <dd><span>
               <!--文字-->
                    <input id="txtDetail_view" type="text" runat="server" ck="{type:0,min:0,max:100,need:0}"/></span>
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