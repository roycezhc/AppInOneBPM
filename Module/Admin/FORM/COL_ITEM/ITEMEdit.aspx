<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMN_ITEMEdit" CodeFile="ITEMEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function () {

         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });

         setItemVal($("input[id$='ckSetVal']")[0]);

         selF($("#<%=txtDROP_REALF.ClientID %>").get(0));

         $("#<%=txtDROP_REAL.ClientID %>").val("<%=selVal %>");
     });

       function setItemVal(me) {
           if (me.checked == true) {
               $(me).parent().parent().next().show();
           } else {
               $(me).parent().parent().next().hide();
           }

       }
       function selF(obj) {
           $.ajax({
               url: "ITEMBack.aspx",
               type: "post",
               async: false,
               dataType: "json",
               data: { selVal: $(obj).val() },
               success: function (data) {
                   html = "";
                   $.each(data.list, function (i, obj) {
                       html += "<option value='" + obj.ITEM_ID + "'>" + obj.TEXT + "</option>\r\n";
                   });
                   $("#<%=txtDROP_REAL.ClientID %>").html(html);
                   $("#<%=hidDROP_REAL.ClientID %>").val(data.first);
               }
           });

       }
       function sel(obj) {
           $("#<%=hidDROP_REAL.ClientID %>").val($(obj).val());
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
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        <input id="txtITEM_ID" type="hidden" runat="server" ck="{need:0,len:2147483647,type:1}"/>
            <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.TEXT.ZhName %>：</dt><%--选项名--%>
               <dd><span>
                
                    <input id="txtTEXT" type="text" runat="server" ck="{need:0,len:30,type:0}"/></span>
               </dd>
           </dl>
           <dl>
           <dt>&nbsp;</dt><dd class="ckbs"><input id="ckSetVal" runat="server" type="checkbox" onclick="setItemVal(this);" /><label for="<%=ckSetVal.ClientID %>">指定项值</label></dd>
           </dl>
           <dl class="hide">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.VALUE.ZhName %>：</dt><%--选项值--%>
               <dd><span><input id="txtVALUE" type="text" runat="server" ck="{need:0,len:30,type:0}"/></span>
                   
               </dd>
           </dl>
          
           <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.DROP_REAL.ZhName %>：</dt><%--联动下拉框信息--%>
               <dd><span>
                    <select id="txtDROP_REALF" onchange="selF(this)"  runat="server" >
                    </select>
                    <select id="txtDROP_REAL"  onchange="sel(this)" runat="server">
                    </select>
                    <input type="hidden" runat="server" id="hidDROP_REAL"/>
                   </span>
               </dd>
           </dl>
           <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.COL_HIDE.ZhName %>：</dt><%--显示隐藏列信息--%>
               <dd><span>
               
                    <textarea id="txtCOL_HIDE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">

   </div>
</div>
</asp:Content>