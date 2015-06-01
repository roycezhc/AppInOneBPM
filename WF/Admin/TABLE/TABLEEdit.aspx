<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TABLEEdit2" CodeFile="TABLEEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
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
<asp:Label ID="litWarn" runat="server" Text=""></asp:Label>
</div>
<div class="tool">
<ul>
   <%-- <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
           <input id="txtTB_ID" type="hidden" runat="server"/>
           <dl>
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>：</dt><%--表名称--%>
               <dd><span>
                   <asp:Label ID="litTB_NAME_PRE" runat="server" Text="WFTB_"></asp:Label><input id="txtTB_NAME_PRE" type="hidden" runat="server" value="WFTB_"/>
                    <input id="txtTB_NAME" type="text" runat="server" ck="{need:1,len:50,type:0}" style="width:90px;"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=TF_TABLE.Attribute.CH_NAME.ZhName %>：</dt><%--中文名--%>
               <dd><span>
                
                    <input id="txtCH_NAME" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=TF_TABLE.Attribute.SORT_NO.ZhName %>：</dt><%--序号--%>
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" ck="{need:1,len:99,type:2}" value="1"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=TF_TABLE.Attribute.TB_TYPE.ZhName %>：</dt><%--表类型--%>
               <dd><span>
               
                    <select id="txtTB_TYPE" runat="server" ck="{need:1,len:5}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt>备注：</dt><%--NOTE--%>
               <dd><span>
               
                    <textarea id="txtNOTE" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:950,type:0}" /></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
   <%-- <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>