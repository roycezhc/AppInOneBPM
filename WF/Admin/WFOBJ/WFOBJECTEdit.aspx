<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WFOBJECTEdit.aspx.cs" Inherits="WF_WFOBJECTEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });

       function selFORM(me, type) {
           var win = window.showModalDialog("../FORM/FORMSel.aspx?TBTYPE=" + type + "&r=" + Math.random(), "", "dialogHeight: 500px; dialogWidth: 600px; dialogTop:; dialogLeft:; edge: Raised; center: Yes; help: No; resizable: No; status: No;"); if (!win) { win = window.returnValue; } //jin-shenjian chrome刷新父画面
           if (win != "" && win != undefined) {
               var obj = eval(win);
               var hid = $(me).prev();
               var txt = hid.prev();
               hid.val(obj.ID);
               txt.val(obj.Name);

               $("input[id$='txtWFCNAME']").val(obj.Name);
           }
       }
       function selTYPE_ID(me, type) {
           var win = window.showModalDialog("../WFTYPE/TYPESel.aspx?r=" + Math.random(), "", "dialogHeight: 500px; dialogWidth: 600px; dialogTop:; dialogLeft:; edge: Raised; center: Yes; help: No; resizable: No; status: No;"); if (!win) { win = window.returnValue; } //jin-shenjian chrome刷新父画面
           if (win != "" && win != undefined) {
               var obj = eval(win);
               var hid = $(me).prev();
               var txt = hid.prev();
               hid.val(obj.ID);
               txt.val(obj.Name);
           }
       }
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
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <%--<li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        <input id="txtWF_OBJ_ID" type="hidden" runat="server" ck="{need:0,len:2147483647,type:1}"/>
           <dl>
               <dt><%=WF_WFOBJECT.Attribute.WF_OBJ_NAME.ZhName %>：</dt><%--流程实例名称--%>
               <dd><span>
                
                    <input id="txtWF_OBJ_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_WFOBJECT.Attribute.WFID_SRC.ZhName %>：</dt><%--所属流程ID--%>
               <dd><span>
                
                    <input id="txtWFID_SRC" type="text" readonly="readonly" style=" background:#aaa;" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
           <dt>选择表单：</dt><dd>
           <span>
               <input id="txtFORM_ID" type="text"  readonly="readonly" runat="server" style="width:70%;" ck="{need:1,len:20,type:0}"/>
               <input id="hidFORM_ID" type="hidden" runat="server" />
               <input id="btnSel" type="button" value="" class="sel" runat="server" onclick="selFORM(this,1);" />
               </span>
           </dd>
           </dl>
           <dl>
           <dt>所属分类：</dt><dd>
           <span>
               <input id="txtTYPE_ID" type="text"  readonly="readonly" runat="server" style="width:70%;" ck="{need:1,len:20,type:0}"/>
               <input id="hidTYPE_ID" type="hidden" runat="server" />
               <input id="Button1" type="button" value="" class="sel" runat="server" onclick="selTYPE_ID(this,1);" />
               </span>
           </dd>
           </dl>
          <%-- <dl>
               <dt><%=WF_WFOBJECT.Attribute.STATUS.ZhName %>：</dt>
               <dd><span>
                
                    <select id="txtSTATUS" runat="server" ck="{need:0,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>--%>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
   <%-- <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>