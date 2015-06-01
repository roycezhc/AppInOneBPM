<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_INFOEdit" CodeFile="WFINFOEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function () {

         var checker = new formChecker({ formID: 'divForm', btnIDS: 'btnOK,btnSave' });

         //var ck1 = $("input[id$='txtORIGFORM']");
         //txtORIGFORMChg(ck1[0]);
         //var ck2 = $("input[id$='txtHAD_DETAIL']");
         //txtHAD_DETAILChg(ck2[0]);
         // checker.test();
     });

     function txtORIGFORMChg(me) {
         //alert(me.checked);
         if (me.checked == true) {
             $("#dl_FORMTB").show();
             var ck1 = $("input[id$='txtHAD_DETAIL']");
             if (ck1[0].checked == true) {
                 $("#dl_FORMDETAIL").show();
             }

         } else {
             $("#dl_FORMTB").hide();
             $("#dl_FORMDETAIL").hide();
         }

     }

     function txtHAD_DETAILChg(me) {
         if (me.checked == true) {
             $("#dlFORM_TBDETAIL").show();
             var ck1 = $("input[id$='txtORIGFORM']");
             if (ck1[0].checked == true) {
                 $("#dl_FORMDETAIL").show();
                
             }

         } else {
             $("#dlFORM_TBDETAIL").hide();
             $("#dl_FORMDETAIL").hide();
            
         }

     }

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
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>

     <li id="li_NewWFTB" runat="server" visible="false"><span><asp:Button ID="btnNewWFTB" runat="server" Text="创建临时表"
                onclick="btnNewWFTB_Click"/></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
          <input id="txtWFCID" type="hidden" runat="server" ck="{need:0,len:2147483647,type:1}"/>
           <%--<dl>
           <dt>选择表单：</dt><dd>
           <span>
               <input id="txtFORM_ID" type="text"  readonly="readonly" runat="server" style="width:70%;" ck="{need:1,len:20,type:0}"/>
               <input id="hidFORM_ID" type="hidden" runat="server" />
               <input id="btnSel" type="button" value="" class="sel" runat="server" onclick="selFORM(this,1);" />
               </span>
           </dd>
           </dl>--%>
           <dl>
               <dt><%=WF_INFO.Attribute.WFCNAME.ZhName %>：</dt><%--流程分类名--%>
               <dd><span>
                
                    <input id="txtWFCNAME" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           
           <dl class="hide">
               <dt><%=WF_INFO.Attribute.USE_LIMIT.ZhName %>：</dt><%--是否限制提交--%>
               <dd><span>
               
                    <select id="txtUSE_LIMIT" runat="server" ck="{need:0,len:2,type:0}">
                    </select></span>
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
               <dt><%=WF_INFO.Attribute.HAD_DETAIL.ZhName %>：</dt>
               <dd class="ckbs"><span><input id="txtHAD_DETAIL" runat="server" type="checkbox" onclick="txtHAD_DETAILChg(this,1);" /></span>
               </dd>
           </dl>
           <dl class="hide" id="dlFORM_TBDETAIL">
           <dt>选择明细表单：</dt><dd>
           <span>
               <input id="txtFORM_TBDETAIL" type="text"  runat="server" style="width:70%;"/>
               <input id="hidFORM_TBDETAIL" type="hidden" runat="server" />
               <input id="btnsel2" type="button" value="" class="sel" onclick="selFORMTB(this,2);" />
               </span>
           </dd>
           </dl>
           <dl>
               <dt>启用归档：</dt>
               <dd class="ckbs"><span><input id="txtORIGFORM" runat="server" type="checkbox" /></span>
               </dd>
           </dl>
           <dl class="hide" id="dl_FORMTB">
               <dt>归档表名：</dt>
               <dd><span>
                
                    <input id="txtORIGTB" type="text" runat="server" ck="{need:0,len:50,type:0,reg:'\\w'}"/></span>
               </dd>
           </dl>--%>
           <dl>
               <dt><%=WF_INFO.Attribute.NOTE.ZhName %>：</dt><%--备注--%>
               <dd><span>
                    <input id="txtNOTE" type="text" runat="server" ck="{need:0,len:150,type:0}" style="width:300px;"/></span>
               </dd>
           </dl>
           <dl id="dlStatus" runat="server">
               <dt><%=WF_INFO.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:0,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>
           
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">

   </div>
</div>
</asp:Content>