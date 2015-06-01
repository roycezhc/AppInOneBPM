<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_KNMAEdit" CodeFile="KM_KNMAEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
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
               <dt><%=KM_KNMA.Attribute.KNMA_ID.ZhName %>：</dt><%--知识标识--%>
               <dd><span>
                
                    <input id="txtKNMA_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.KNMA_NAME.ZhName %>：</dt><%--知识标题--%>
               <dd><span>
                
                    <input id="txtKNMA_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.P_KNMA_ID.ZhName %>：</dt><%--父级ID--%>
               <dd><span>
                
                    <input id="txtP_KNMA_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.CONTENT.ZhName %>：</dt><%--知识内容--%>
               <dd><span>
                
                    <input id="txtCONTENT" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.CLASS_ID.ZhName %>：</dt><%--知识类别--%>
               <dd><span>
               
                    <select id="txtCLASS_ID" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.UP_TYPE.ZhName %>：</dt><%--上传文档类型--%>
               <dd><span>
               
                    <select id="txtUP_TYPE" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EA_SIGN.ZhName %>：</dt><%--审批标志--%>
               <dd><span>
               
                    <select id="txtEA_SIGN" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.AUTHOR.ZhName %>：</dt><%--作者--%>
               <dd><span>
                
                    <input id="txtAUTHOR" type="text" runat="server" ck="{need:0,len:10,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.SORT_NO.ZhName %>：</dt><%--序号--%>
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.DEPT_ID.ZhName %>：</dt><%--部门编号--%>
               <dd><span>
                
                    <input id="txtDEPT_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.ADD_TIME.ZhName %>：</dt><%--文件录入时间--%>
               <dd><span>
               
                    <input id="txtADD_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EDIT_TIME.ZhName %>：</dt><%--文件编辑时间--%>
               <dd><span>
               
                    <input id="txtEDIT_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.PATH_ID.ZhName %>：</dt><%--上级编号--%>
               <dd><span>
                
                    <input id="txtPATH_ID" type="text" runat="server" ck="{need:0,len:10,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.CAN_EDIT.ZhName %>：</dt><%--允许共同编辑--%>
               <dd><span>
               
                    <select id="txtCAN_EDIT" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.CAN_COMMENTS.ZhName %>：</dt><%--允许评论--%>
               <dd><span>
               
                    <select id="txtCAN_COMMENTS" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.ADD_USER.ZhName %>：</dt><%--录入人--%>
               <dd><span>
                
                    <input id="txtADD_USER" type="text" runat="server" ck="{need:0,len:10,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EDIT_USER.ZhName %>：</dt><%--编辑人--%>
               <dd><span>
               
                    <FCKV2:FCKeditor ID="txtEDIT_USER" runat="server" Height="250" Width="400" ToolbarSet="Basic" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.S_LEVEL.ZhName %>：</dt><%--安全级别--%>
               <dd><span>
                
                    <input id="txtS_LEVEL" type="text" runat="server" ck="{need:0,len:10,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EXP1.ZhName %>：</dt><%--自定义1--%>
               <dd><span>
                
                    <input id="txtEXP1" type="text" runat="server" ck="{need:0,len:40,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EXP2.ZhName %>：</dt><%--自定义2--%>
               <dd><span>
                
                    <input id="txtEXP2" type="text" runat="server" ck="{need:0,len:40,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EXP3.ZhName %>：</dt><%--自定义3--%>
               <dd><span>
                
                    <input id="txtEXP3" type="text" runat="server" ck="{need:0,len:40,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EXP4.ZhName %>：</dt><%--自定义4--%>
               <dd><span>
                
                    <input id="txtEXP4" type="text" runat="server" ck="{need:0,len:40,type:0}"/></span>
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