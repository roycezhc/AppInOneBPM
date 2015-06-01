<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="USER_LOSS" CodeFile="USER_LOSS.aspx.cs" %>
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
    <dl><dt><b><%="用户挂失" %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text=""></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="确认挂失"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
           <dl>
               <dt>挂失员工号：</dt><%--流程分类名--%>
               <dd><span>
                    <input id="txtSTAFFID" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           
        
           
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">

   </div>
</div>
</asp:Content>