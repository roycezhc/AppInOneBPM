<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLFormEdit" CodeFile="COLFormEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
     var billid = "<%=billid %>";
     $(function () {

         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });

         _FORM_CTRL_CHG();
     });

       function _FORM_CTRL_CHG(me) {
           if (me == undefined) {
               me = $("select[id$='txtFORM_CTRL_ID']")[0]; // alert($("select[id$='txtDATA_TYPE']").length);
           }
//           var btnObj = $(me).next();
//           if (btnObj.attr("showtypes").indexOf(me.value) != -1) {
//               btnObj.show();
//           } else {
//               btnObj.hide();
           //           }
           //alert(me.value);
           var dlSel = $("#dlSelTBINFO");
           if (me.value == "43") {
               dlSel.show();
           } else {
               dlSel.hide();
           }
       }

       function _SetItems(me) {
           var result = window.showModalDialog('COLITEMManage.aspx?ColID=<%=keyid %>&r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面

       }

</script>
<style type="text/css">
.form dl dt{width:160px;}
</style>
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
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存"
                onclick="btnOK_Click"/></span></li>
   <%-- <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>--%>
<%--    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>--%>
    <li id="liSetItems" runat="server" visible="false"><span><input  type="button" value="控件列表项" onclick="_SetItems();" style="font-weight:bold;color:#900;"/></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
           <input id="txtCOL_ID" type="hidden" runat="server"/>
           <input id="txtBILL_ID" type="hidden" runat="server" ck="{need:1,len:2147483647,type:1}"/>
            <dl>
               <dt>逻辑字段名称：</dt><%--列默认名--%>
               <dd><span>
                    <input id="txtCOL_NOTE" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt>所属物理表(英文)：</dt><%--列所属表--%>
               <dd><span>
                    <input id="txtTABLE_NAME" type="text" onblur="checkTBName(this);" runat="server" ck="{need:1,len:50,type:'string',reg:'^\\w+?$'}" style="width:70%;"/>
                    <input id="hidTABLE_NAME" type="hidden" runat="server"/>
                    <input id="Button4" runat="server" type="button" value="" class="sel" title="选择表" onclick="selTable(this);return false;" />
                    </span>
               </dd>
           </dl>
            
           <dl class="hide">
               <dt>字段名(英文字母)：</dt><%--字段名--%>
               <dd><span>
                     <input id="txtCOL_NAME" type="text" runat="server" ck="{need:0,len:50,type:'string',reg:'^\\w+?$'}" style="width:70%;"/>
                     <input id="btnSelCol" runat="server" type="button" value="" class="sel" title="选择关联表字段" onclick="selTableField(this);return false;" />
                    </span>
               </dd>
           </dl>
            <dl>
               <dt><%=SYS_BILL_COL.Attribute.DISPLAY_NAME.ZhName %>：</dt><%--列自定义显示名--%>
               <dd><span>
                
                    <input id="txtDISPLAY_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRL_ID.ZhName %>：</dt><%--列表单控件类型--%>
               <dd><span>
                <select name="txtFORM_CTRL_ID" id="txtFORM_CTRL_ID" onchange="_FORM_CTRL_CHG(this)">
                         <asp:Literal ID="litCTRL_TYPE" runat="server"></asp:Literal>
                   </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_SHOW.ZhName %>：</dt><%--需要有表单界面输入--%>
               <dd><span>
                <select id="txtFORM_SHOW" runat="server">
                       <option value="1">是</option><option value="0">否</option>
                   </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_NEED.ZhName %>：</dt><%--是否必填--%>
               <dd><span>
                <select id="txtFORM_NEED" runat="server">
                       <option value="1">是</option><option value="0">否</option>
                   </select></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=SYS_BILL_COL.Attribute.FORM_MIN.ZhName %>：</dt><%--最小值--%>
               <dd><span>
                    <input id="txtFORM_MIN" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=SYS_BILL_COL.Attribute.FORM_MAX.ZhName %>：</dt><%--最大值--%>
               <dd><span>
                
                    <input id="txtFORM_MAX" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH.ZhName %>：</dt><%--控件宽度--%>
               <dd><span>
                
                    <input id="txtFORM_CTRLWIDTH" type="text" value="0" runat="server" ck="{need:0,len:200,type:'number'}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt>排序号：</dt><%--SORT_NO--%>
               <dd><span>
                    <input id="txtSORT_NO" type="text" value="1" runat="server" ck="{need:0,len:2147483647,type:'number'}"/>
                   </span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.TITLE.ZhName %>：</dt><%--提示标题--%>
               <dd><span>
                
                    <input id="txtTITLE" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>

       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存"
                onclick="btnOK_Click"/></span></li>
   <%-- <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>--%>
</ul>
   </div>
</div>
</asp:Content>