<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TABLEEdit2" CodeFile="TABLEEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
    <script src="../../../Lib/JScript/PinYin.js?r=11" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {
           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
       
       function selTBByDEV(me) {
           var devObj = $("select[id$='txtDEV']");
           var result = window.showModalDialog("../../../SYS/BILL/TableSel_DEV.aspx?DEV=" + devObj.val() + "&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面           
            if (result == undefined || result == "") {
               return;
           }

           var obj = eval(result);
           me.value = obj.NAME;
           $("input[id$='txtTB_NAME_Save']").val(obj.NAME);
           $("input[id$='txtDB_NAME_Save']").val(obj.DEV);
           var divObj = $(me).parent().next();

           var dev = obj.DEV;
           var tb = $(me).val();
           if (tb == undefined || tb == "") {
               return;
           }
           var vvv = dev + "." + tb;
           var olds = divObj.find("input[value='" + vvv + "']");
                      
           if (olds.length == 0) {
               //divObj.append("<p><span>" + dev + "</span>&nbsp;.&nbsp;<span style='color:blue'>" + tb + "</span><a onclick='delWEVTB(this);'>删除</a><input name='selDEVTB' value='" + vvv + "' type='hidden'/></p>");
               $(me).val("");
           }
           $("input[id$='txtTB_NAME']").val(tb);
           //$("span[id$='litTB_NAME_PRE']").text("");  

           //归档区，显示出来。表名、数据源名进行赋值。
           //$("input[id$='divSave']").val(tb);
       }

       function selTBByDEV2(me) {
           var devObj = $("select[id$='txtDEV']");
           var result = window.showModalDialog("../../../SYS/BILL/TableSel_DEV.aspx?DEV=" + devObj.val() + "&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
           if (result == undefined || result == "") {
               return;
           }

           var obj = eval(result);
           me.value = obj.NAME;

           var divObj = $(me).parent().next();

           var dev = obj.DEV;
           var tb = $(me).val();
           if (tb == undefined || tb == "") {
               return;
           }
           var vvv = dev + "." + tb;
           var olds = divObj.find("input[value='" + vvv + "']");

           if (olds.length == 0) {
               //divObj.append("<p><span>" + dev + "</span>&nbsp;.&nbsp;<span style='color:blue'>" + tb + "</span><a onclick='delWEVTB(this);'>删除</a><input name='selDEVTB' value='" + vvv + "' type='hidden'/></p>");
               $(me).val("");
           }
           $("input[id$='txtTB_NAME']").val(tb);
           //$("span[id$='litTB_NAME_PRE']").text("");
       }

       function delWEVTB(me) {
           $(me).parent().remove();
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
               <dt><%=TF_TABLE.Attribute.CH_NAME.ZhName %>：</dt><%--中文名--%>
               <dd><span>
                
                    <input id="txtCH_NAME" type="text" runat="server" ck="{need:1,len:50,type:0}" onblur="selPinYin(this, 'txtTB_NAME');"/></span>
               </dd>
           </dl>
            
           <dl>
               <dt>主表名：</dt><%--表名称<%=TF_TABLE.Attribute.TB_NAME.ZhName %>--%>
               <dd><span>
                   <asp:Label ID="litTB_NAME_PRE" runat="server" Text="WFTB_"></asp:Label><input id="txtTB_NAME_PRE" type="hidden" runat="server" value="WFTB_"/>
                    <input id="txtTB_NAME" type="text" runat="server" ck="{need:1,len:50,type:0}" style="width:100px;"/>
                    <input id="selTable" runat="server" type="button" value="" class="sel" title="选择已有表" onclick="selTBByDEV(this);return false;" />
                    </span>
               </dd>
               <div id="source" runat=server>
                   <dt>归档表名：</dt><%--表名称<%=TF_TABLE.Attribute.TB_NAME.ZhName %>--%>
                   <dd><span>
                        <input id="txtTB_NAME_Save" type="text" value="" runat="server" ck="{need:0,len:50,type:0}" style="width:100px;"/>
                   </span>
                   </dd>
                   <dt>数据源：</dt><%--表名称<%=TF_TABLE.Attribute.TB_NAME.ZhName %>--%>
                   <dd><span>
                        <input id="txtDB_NAME_Save" type="text" value="" runat="server" ck="{need:0,len:50,type:0}" style="width:100px;"/>
                   </span>
                   </dd>
               </div>
           </dl>
           <dl style="display:none">
               <dt>关系表：</dt>
               <dd>
                   <span>选择已有表：<input id="txtTABLE" type="text" style="width:90px;" onclick="selTBByDEV2(this);" /><input id="Button1" type="button" value="添加" onclick="addDEVTB(this);" style="width:30px;display:none;" /></span>
                   <div class="devs">
                       <asp:Literal ID="litHTML" runat="server"></asp:Literal>
                   </div>
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
           <dl>
               <dt>创建人：</dt><%--创建人<%=SYS_BILL.Attribute.ADDER.ZhName %>--%>
               <dd><span>
                
                    <input id="txtADDER" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
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