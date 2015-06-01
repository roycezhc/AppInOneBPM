<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILLEdit" CodeFile="BILLEdit.aspx.cs" %>
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

       function delWEVTB(me) {
            $(me).parent().remove();
       }

        function _FormView(me) {
            var href = "BillView.aspx?BillID=<%=keyid %>&r=" + Math.random();
            window.parent.frames["ifrShow"].location.href = href;
        }

        function addDEVTB(me) {
            var divObj = $(me).parent().next();
            var dev = $("select[id$='txtDEV']").val();
            var tb = $(me).prev().val();
            if (tb == undefined || tb == "") {
                return;
            }
            var vvv = dev + "." + tb;
            var olds = divObj.find("input[value='" + vvv + "']"); //alert(olds.length);
            if (olds.length == 0) {
                divObj.append("<p><span>" + dev + "</span>&nbsp;.&nbsp;<span  style='color:blue'>" + tb + "</span><a onclick='delWEVTB(this);'>删除</a><input name='selDEVTB' value='" + vvv + "' type='hidden'/></p>");
                $(me).prev().val("");
            }
        }

       function selTBByDEV(me) {
           var devObj = $("select[id$='txtDEV']");
           var result = window.showModalDialog("TableSel_DEV.aspx?DEV=" + devObj.val() + "&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
           if (result == undefined || result == "") {
               return;
           }
           
           var obj = eval(result);
           me.value = obj.NAME;

           var divObj = $(me).parent().next();
           
           var dev = devObj.val();
           var tb = $(me).val();
           if (tb == undefined || tb == "") {
               return;
           }
           var vvv = dev + "." + tb;
           var olds = divObj.find("input[value='" + vvv + "']"); //alert(olds.length);
           
           if (olds.length == 0) {
               divObj.append("<p><span>" + dev + "</span>&nbsp;.&nbsp;<span style='color:blue'>" + tb + "</span><a onclick='delWEVTB(this);'>删除</a><input name='selDEVTB' value='" + vvv + "' type='hidden'/></p>");
               $(me).val("");
           }

       }

       function selTable(me) {
           var result = window.showModalDialog("TableSel_DEV.aspx?DEV=AIO&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
           if (result == undefined || result == "") {
               return;
           }
           var obj = eval(result);
           var tbname = obj.NAME;
           $(me).prev().val(tbname);
       }
</script>
<style type="text/css">
.devs p{margin:0;padding:0;line-height:22px;}
.devs p span{color:#060;}
.devs p a{margin-left:20px; cursor:pointer;color:#006;}

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
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li class="hide"><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
    <li><span><input id="btnFormView" type="button" value="表单预览" onclick="_FormView(this);"/></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
            <input id="txtBILL_ID" type="hidden" runat="server" ck="{need:0,len:2147483647,type:1}"/>
           <dl>
               <dt><%=SYS_BILL.Attribute.BILL_NAME.ZhName %>：</dt><%--表单名称--%>
               <dd><span>
                
                    <input id="txtBILL_NAME" type="text" runat="server" ck="{need:1,len:150,type:0}"/></span>
               </dd>
           </dl>
           <%--<dl>
               <dt><%=SYS_BILL.Attribute.BILL_TYPE.ZhName %>：</dt>
               <dd><span>
                   <select id="txtBILL_TYPE" runat="server">
                       <option value="0">默认</option>
                       <option value="1">树结构</option>
                   </select></span>
               </dd>
           </dl>--%>
           <dl style="display:none">
               <dt><%=SYS_BILL.Attribute.TABLE_NAME.ZhName %>：</dt><%--物理表名--%>
               <dd style="width:auto;"><span>
                    <input id="txtTABLE_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}" readonly="readonly"/>
                    <input id="Text1" type="button" style="width:30px;" onclick="selTable(this);" value="选择" />
                     <%--<span style="display:block;"><input id="txtTAVLE_EXISTS" type="checkbox" runat="server" style="width:20px;"/><label for="<%=txtTAVLE_EXISTS.ClientID %>">表已存在</label></span>--%>
                    </span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=SYS_BILL.Attribute.BILL_SQL.ZhName %>：</dt><%--单据查询SQL语句--%>
               <dd><span>
                   <textarea id="txtBILL_SQL" cols="20" runat="server" rows="2" style="width:200px;height:100px;"></textarea>
                    </span>
               </dd>
           </dl>
            <dl>
               <dt>数据源：</dt>
               <dd><span><select id="txtDEV" style="width:150px;" runat="server">
                       <option value="AIO">主库数据源</option>
                       <%--<option value="AIO_SYN">主库同步</option>--%>
                       <option value="DEV1">其他设备1</option>
                       <option value="DEV2">其他设备2</option>
                       <option value="DEV3">其他设备3</option>
                   </select></span><br />
                   <span>请选择表：<input id="txtTABLE" type="text" style="width:90px;" onclick="selTBByDEV(this);" /><input id="Button1" type="button" value="添加" onclick="addDEVTB(this);" style="width:30px;display:none;" /></span>
                   <div class="devs">
                       <asp:Literal ID="litHTML" runat="server"></asp:Literal>
                   </div>
               </dd>
           </dl>
            <dl>
               <dt><%=SYS_BILL.Attribute.ADDER.ZhName %>：</dt><%--创建人--%>
               <dd><span>
                
                    <input id="txtADDER" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li class="hide"><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>