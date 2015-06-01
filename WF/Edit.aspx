<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_EDIT_TB" CodeFile="Edit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
  
 <script src="../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script src="Lib/formedit.js" type="text/javascript"></script>
 <script src="../UCtrl/js/SelEmp.js" type="text/javascript"></script>

 <script type="text/javascript">


     $(function () {
         //debugger;
         var checker = new formChecker({ formID: "divForm", btnIDS: 'btnOK,btnSave', blurEvt: true });

         var divLst = $("td.detail"); //alert(divLst.length);
         //如果有明细表单，记录下默认的明细个数
         if (divLst.length > 0) {
             var trNum = divLst.find("tbody").children().length; //alert(trNum);
             $("input[id$='hidDetailRows']").val(trNum);

             var trs = divLst.find("table tbody tr"); //alert(trs.length);
             trs.each(function (i) {
                 var trObj = $(this);
                 bindTrInputEvent(trObj);
             });
         }
     });


     function selFileChg(me) {
         var fiels = $(me).attr("exdfile");
         var vvv = me.value;
         vvv = vvv.substring(vvv.lastIndexOf('.'), vvv.length);
         if (fiels.indexOf(vvv) == -1) {
             alert("必须输入以下格式的文件：" + fiels);
             return false;
         }
     }     
</script>
   
<style type="text/css">
.tbill{margin:5px auto;width:750px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
<input id="hidDetailRows" type="hidden"  runat="server" />
   <div class="titnav">
        <dl><dt><b><%=title %></b></dt></dl>
     </div>
     
   <div class="warn">
    <asp:Label ID="litWarn" runat="server" Text=""></asp:Label>
   </div>
   <div class="tbill" id="divForm"><!--zlg 控制两行显示-->
       <h2><%=wfcname%>单</h2>
       <table>
         <tbody>
          <tr>
                <td class="lbl"><label><%=WF_FORMBASE.Attribute.RECNO.ZhName %>：</label></td>
                <td colspan="3"><input id="txtRECNO" type="text" readonly="readonly" class="dis" runat="server" ck="{need:1,len:50,type:0}"/></td>
          </tr>
          <tr>
                <td class="lbl"><label><%=WF_FORMBASE.Attribute.DEPT_NAME.ZhName%>：</label></td>
                <td><selDept:wucSelDept ID="txtDEPT_ID" runat="server" /></td>
                <td class="lbl"><label><%=WF_FORMBASE.Attribute.STAFF_NAME.ZhName%>：</label></td>
                <td><selStaff:wucSelStaff ID="txtSTAFF_ID" runat="server" /></td>
          </tr>
          <asp:Literal ID="litFormMore" runat="server"></asp:Literal>
          <tr>
                <td class="lbl"><label><%=WF_FORMBASE.Attribute.NOTE.ZhName %>：</label></td>
                <td colspan="3"><textarea id="txtNOTE" cols="80" rows="6" runat="server" ck="{need:0,len:550,type:0}" /></td>
          </tr>
          <tr>
                <td class="lbl"><label><%=WF_FORMBASE.Attribute.CDEPT_NAME.ZhName%>：</label></td>
                <td><input id="txtCDEPT_NAME" readonly="readonly" class="dis" type="text" runat="server" ck="{need:1,len:50,type:0}"/>
                    <input id="txtCDEPT_ID" type="hidden" runat="server"/></td>
                <td class="lbl"><label><%=WF_FORMBASE.Attribute.CSTAFF_NAME.ZhName%>：</label></td>
                <td><input id="txtCSTAFF_NAME" type="text" readonly="readonly" class="dis" runat="server" ck="{need:1,len:50,type:0}"/>
                    <input id="txtCSTAFF_ID" type="hidden" runat="server" /></td>
          </tr>
          <tr>
                <td class="lbl"><label>附件：</label></td><td colspan="3"><wucUpFilesBfSubmit:UpFilesBfSubmit ID="UpFilesBfSubmit1" runat="server" /></td>
          </tr>
          </tbody>
       </table>
    </div>

   <div class="tool">
        <p><span><asp:Button ID="btnSave" runat="server" Text="确定保存"
                        onclick="btnOK_Click"/></span>
            <span><asp:Button ID="btnOK" runat="server" Text="提交审批" onclick="btnOK_Click"/></span>
            <span id="sp_Back" runat="server"><input onclick="window.location.href='<%=backUrl %>';" lang="CloseWin" value="取消" type="button" /></span>
        </p>
  </div>
</div>

</asp:Content>