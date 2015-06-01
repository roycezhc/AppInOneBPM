<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLEdit" CodeFile="COLEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
     document.write('<script language="javascript" type="text/javascript" src="../../Lib/JScript/formCheck2012.js' + '?r=' + Math.random() + '"></script' + '>');
     document.write('<script language="javascript" type="text/javascript" src="../../Lib/MyDP/selDate.js' + '?r=' + Math.random() + '"></script' + '>');
 </script>
  <script type="text/javascript">
      function load_DivShowHide() {
          //打开收起
          var divs = $("div.grp");
          var aObjs = divs.find("a");
          for (var a = 0; a < aObjs.length; a++) {
              var aObj = $(aObjs[a]);
//              var tps = aObj.attr("showtypes")
//              var hidObj;
//              if (tps != undefined) {
//                  hidObj = $(tps)[0];
//              }              
              aObj.bind("click", aObj, function (e) {
                  hidObj = e.data.parent().next();//这里有变化
                  var txt = e.data.text();
                  if (txt == "展开") {
                      hidObj.show(); e.data.text("收起");

                  } else {
                      hidObj.hide(); e.data.text("展开");
                  }
              });

              aObj.parent().bind("dblclick", aObj, function (e) {
                  hidObj = e.data.parent().next(); //这里有变化
                  var txt = e.data.text();
                  if (txt == "展开") {
                      hidObj.show(); e.data.text("收起");

                  } else {
                      hidObj.hide(); e.data.text("展开");
                  }
              });
          }
      }
  </script>
 <script type="text/javascript">
     var keyid = "<%=billid %>";     
     $(function () {
         //展开、收起栏
         load_DivShowHide();

         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
         //类似于 if (!IsPostBack)
         if (keyid == "0") {
             $("#dlBILL_AFTREDTL").hide();
         }
         DATA_TYPE_CHG();
         //CONN_SOURCE_CHG();
         checkTBName();
         ISPK_CHG();
         _FORM_CTRL_CHG();
     });

     function ISPK_CHG(me) {
         if (me == undefined) {
             me = $("select[id$='txtISPK']")[0];
         }
         var dtype = $("select[id$='txtDATA_TYPE']").val();
         if (me.value == "1" && (dtype == "nvarchar" || dtype == "varchar" || dtype == "nchar")) {
             $("#dlPK_VALCODE").show();
         } else {
             $("#dlPK_VALCODE").hide();
         }
     }
     function selTable(me) {
         var devObj = $("select[id$='txtDB_SRC_CHG']");
         var result = window.showModalDialog("TableSel_DEV.aspx?DEV=" + devObj.val() + "&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面


         if (result == undefined || result == "") {
             return;
         }
         var obj = eval(result);
         $("input[id$='txtTABLE_NAME']").val(obj.NAME);
         $("input[id$='hidTABLE_NAME']").val(obj.NAME);

         checkTBName();
     }

     function selTableField(me) {
         var devObj = $("select[id$='txtCONN_SOURCE']");
         var result = "";
         if (devObj.val() == "" || devObj.val() == "AIO") {
             result = window.showModalDialog("TableFieldSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
         } else {
             
             result = window.showModalDialog("TableFieldSel_DEV.aspx?DEV=" + devObj.val() + "&TB=" + $("input[id$='txtTABLE_NAME']").val() + "&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
         }
        
         if (result == undefined || result == "") {
             return;
         }
         var obj = eval(result); 
//         var mainTB = $("input[id$='hidTABLE_NAME']").val();
//         if (mainTB != obj.tablename && obj.iskey == "1") {
//             $("input[id$='hidIsFK']").val("1");
//         }

         $("input[id$='txtCOL_NAME']").val(obj.colname);
         $("input[id$='hidFK_NAME']").val(obj.colname);
         $("input[id$='txtTABLE_NAME']").val(obj.tablename);
         $("input[id$='txtCOL_SHOW']").val(obj.showname);
         $("input[id$='txtCOL_NOTE']").val(obj.colnote);
         $("select[id$='txtDATA_TYPE']").val(obj.datatype);
        
         checkTBName();
         DATA_TYPE_CHG();
        
     }

     function DB_SRC_CHG(me) {
         if (me == undefined) {
             me = $("select[id$='txtDB_SRC_CHG']")[0]; // alert($("select[id$='txtDATA_TYPE']").length);
         }

     }

       function DATA_TYPE_CHG(me) {
           if (me == undefined) {
               me = $("select[id$='txtDATA_TYPE']")[0];// alert($("select[id$='txtDATA_TYPE']").length);
           }
           var dlLen = $("#dlDATA_LEN"); //数据长度
           var dlAcc = $("#dlDATA_ACC"); //数据精度
           var selIsAuto = $("select[id$='txtIS_AUTO']"); //是否是数字递增字段
           //如果我的value在 对方的showtypes里面，则显示对方，否则不显示
           var tp = me.value;
           var tps = dlLen.attr("showtypes");//alert(tp+"|"+tps);
           if (tps.indexOf(tp) != -1) {
               dlLen.show(); $("input[id$='txtDATA_LEN']").val("50");
               if (tp == "decimal" || tp == "numeric") {
                   $("input[id$='txtDATA_LEN']").val("25");
               }
           } else {
               dlLen.hide(); $("input[id$='txtDATA_LEN']").val("0");
           }
           tps = dlAcc.attr("showtypes");// alert(tps + "|" + tp);
           if (tps.indexOf(tp) != -1) {
               dlAcc.show();
           } else {
               dlAcc.hide();
           }
           tps = selIsAuto.attr("showtypes");
           if (tps.indexOf(tp) != -1) {
               selIsAuto.attr("disabled", false);
           } else {
               selIsAuto.val("0");
               selIsAuto.attr("disabled", true);
           }
       }

       function _FormView() {//alert("sss");
           var href = "BillView.aspx?BillID=" + keyid + "&r=" + Math.random();
           window.parent.frames["ifrShow"].location.href = href;
       }

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

      

       function _setROW_FORMULAR(me) {
           var result = window.showModalDialog('RowFormular.aspx?BillID=' + keyid + '&row=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=400px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
           if (result != undefined) {
               $(me).prev().val(result);
           }
       }

       function _setCOL_FORMULAR(me) {
           alert(($("input[id$='txtBILL_COL_FORMULAR']").val()));
           var result = window.showModalDialog('ColFormular.aspx?BillID=' + keyid + '&BILL_COL_FORMULAR=' + ($("input[id$='txtBILL_COL_FORMULAR']").val()) + '&col=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
           if (result != undefined) {
               $(me).prev().val(result);
           }
       }
       //检查表名，如果是
       function checkTBName(me) {
           if (me == undefined) {
               me = $("input[id$='txtTABLE_NAME']")[0];
           }
           //关联表值字段，是否显示；由字段表名与hid表名是否一致来决定
           if (me.value != $(me).next().val()) {
               //$("#divFKInfo").show();
           } else {
               $("#divFKInfo").hide();
           }
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
    <li><span><input id="Button1" type="button" value="表单预览" onclick="_FormView();"/></span></li>
    <li id="liSetItems" runat="server" visible="false"><span><input  type="button" value="控件列表项" onclick="_SetItems();" style="font-weight:bold;color:#900;"/></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
           <input id="txtCOL_ID" type="hidden" runat="server"/>
           <input id="txtBILL_ID" type="hidden" runat="server" ck="{need:1,len:2147483647,type:1}"/>
          
           <div class="grp"><label>基本属性</label><a>收起</a></div>
           <div>
            <dl>
               <dt>逻辑字段名称：</dt><%--列默认名--%>
               <dd><span>
                    <input id="txtCOL_NOTE" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt>其他数据源：</dt>
               <dd><span><select id="txtDB_SRC" runat="server" onchange="DB_SRC_CHG(this);">
                       <option value="AIO_SYN">同库表</option>
                       <option value="DEV1">其他设备1</option>
                       <option value="DEV2">其他设备2</option>
                       <option value="DEV3">其他设备3</option>
                   </select></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt>所属物理表(英文)：</dt><%--列所属表--%>
               <dd><span>
                    <input id="txtTABLE_NAME" type="text" onblur="checkTBName(this);" runat="server" ck="{need:0,len:50,type:'string',reg:'^\\w+?$'}" style="width:70%;"/>
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
           <div id="divFKInfo" class="hide">
             <dl>
               <dt>关联表值字段(英文)：</dt><%--用于显示信息的列名--%>
               <dd><span>
                
                    <input id="hidFK_NAME" type="text" runat="server" ck="{need:0,len:50,type:'string',reg:'^\\w+?$'}"/></span>
               </dd>
              </dl>
            <dl>
               <dt>关联表名称字段(英文)：</dt><%--用于显示信息的列名--%>
               <dd><span>
                
                    <input id="txtCOL_SHOW" type="text" runat="server" ck="{need:0,len:50,type:'string',reg:'^\\w+?$'}"/></span>
               </dd>
            </dl>
            </div>
            <dl class="hide">
               <dt><%=SYS_BILL_COL.Attribute.DISPLAY_NAME.ZhName %>：</dt><%--列自定义显示名--%>
               <dd><span>
                
                    <input id="txtDISPLAY_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE.ZhName %>：</dt><%--验证数据类型--%>
               <dd><span>
                <select id="txtFORM_CHECKTYPE" runat="server">
                       <option value="string">字符串</option>
                       <option value="date">日期</option>
                       <option value="number">整数</option>
                       <option value="decimal">数字</option>
                   </select></span>
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
           <div class="hide" id="dlSelTBINFO">
           <dl>
             <dt>表名：</dt><dd><span><input id="txtSEL_TBNAME" runat="server" type="text" style="width:120px;" /></span></dd>
           </dl>
           <dl><dt>主键字段：</dt><dd><select id="txtSEL_KEY" runat="server" style="width:120px;"></select></dd></dl>
           <dl><dt>名称字段：</dt><dd><select id="txtSEL_NAME" runat="server" style="width:120px;"></select></dd></dl>
           </div>
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
               <dt><%=SYS_BILL_COL.Attribute.FORM_ONEROW.ZhName %>：</dt><%--显示在整行--%>
               <dd><span>
                <select id="txtFORM_ONEROW" runat="server">
                       <option value="1">是</option><option value="0">否</option>
                   </select></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH.ZhName %>：</dt><%--控件宽度--%>
               <dd><span>
                
                    <input id="txtFORM_CTRLWIDTH" type="text" value="0" runat="server" ck="{need:0,len:200,type:'number'}"/></span>
               </dd>
           </dl>
           </div>
           <div class="grp"><label>单据属性</label><a>收起</a></div>
           <div>
           <dl id="dl_BILL_ROW_FORMULAR" runat="server" visible="false">
               <dt style="color:#900;">总计字段公式：</dt><%--行之间计算关系公式，比容总金额＝某子表单列的和--%>
               <dd><span>
                   <input id="txtBILL_ROW_FORMULAR" type="text" readonly="readonly" runat="server" style="width:70%;" />
                   <input id="Button2" type="button" value="设置" onclick="_setROW_FORMULAR(this);" style="width:40px;" />
               </span>
               </dd>
           </dl>
           <dl id="dl_BILL_COL_FORMULAR" runat="server" visible="false">
               <dt style="color:#900;">合计字段公式：</dt><%--列之间计算公式，比如金额＝单价*数量--%>
               <dd><span>
                 <input id="txtBILL_COL_FORMULAR" type="text" readonly="readonly" runat="server" style="width:70%;" />
                 <input id="Button3" type="button" value="设置" onclick="_setCOL_FORMULAR(this);" style="width:40px;" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_ISHEADER.ZhName %>：</dt><%--是否显示在表头--%>
               <dd><span>
                   <select id="txtBILL_ISHEADER" runat="server">
                       <option value="1">是</option><option value="0">否</option>
                   </select></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH.ZhName %>：</dt><%--单据表头宽度--%>
               <dd><span>
                
                    <input id="txtBILL_HERDERWIDTH" type="text" value="0" runat="server" ck="{need:0,len:200,type:'number'}"/></span>
               </dd>
           </dl>
            <dl id="dlBILL_AFTREDTL">
               <dt>显示在明细之后：</dt><%--是否显示在表头--%>
               <dd><span>
                   <select id="txtBILL_AFTREDTL" runat="server">
                       <option value="0">否</option><option value="1">是</option>
                   </select></span>
               </dd>
             </dl>
           </div>
          
           <div class="grp"><label>查询属性</label><a>展开</a></div>
           <div class="hide">
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_INBILL.ZhName %>：</dt><%--表单列表里条件--%>
               <dd><span>
                <select id="txtSEARCH_INBILL" runat="server">
                       <option value="1">是</option><option value="0">否</option>
                   </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_TYPE.ZhName %>：</dt><%--查询数据类型--%>
               <dd><span>
                <select id="txtSEARCH_TYPE" runat="server">
                       <option value="string">字符串</option>
                       <option value="date">日期</option>
                       <option value="number">数字</option>
                   </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR.ZhName %>：</dt><%--查询公式--%>
               <dd><span>
               <select id="txtSEARCH_FORMULAR" runat="server">
                       <option value="LikeRight">like '%key'</option>
                       <option value="LikeLeft'">like 'key%'</option>
                       <option value="LikeAll'">like '%key%'</option>
                       <option value="Equal">=</option>
                       <option value="EqualLarge">>=</option>
                       <option value="EqualSmall"><=</option>

                   </select></span>
               </dd>
           </dl>
          </div>
           <div class="grp"><label>数据属性</label><a>展开</a></div>
           <div class="hide">
          
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.DATA_TYPE.ZhName %>：</dt><%--数据类型--%>
               <dd><span>
                   <select id="txtDATA_TYPE" ck="{need:0,len:50,type:0}" runat="server" onchange="DATA_TYPE_CHG(this);">
                       <%--<option value="nvarchar">nvarchar</option>
                       <option value="int">int</option>
                       <option value="bigint">bigint</option>
                       <option value="date">date</option>
                       <option value="datetime">datetime</option>
                       <option value="decimal">decimal</option>
                       <option value="ntext">ntext</option>
                       <option value="float">float</option>
                       <option value="numeric">numeric</option>
                       <option value="nchar">nchar</option>--%>
                   </select></span>
               </dd>
           </dl>
           <dl showtypes="nvarchar,decimal,numeric,nchar" id="dlDATA_LEN">
               <dt><%=SYS_BILL_COL.Attribute.DATA_LEN.ZhName %>：</dt><%--数据长度--%>
               <dd><span>
                    <input id="txtDATA_LEN" type="text" value="0" runat="server" ck="{need:0,len:4000,type:'number'}"/></span>
               </dd>
           </dl>
           <dl showtypes="decimal,numeric" id="dlDATA_ACC">
               <dt><%=SYS_BILL_COL.Attribute.DATA_ACC.ZhName %>：</dt><%--数据精度--%>
               <dd><span>
                
                    <input id="txtDATA_ACC" type="text" value="0" runat="server" ck="{need:0,len:12,type:'number'}"/></span>
               </dd>
           </dl>
            <dl class="hide">
                   <dt><%=SYS_BILL_COL.Attribute.IS_AUTO.ZhName %>：</dt><%--是否是数字递增字段--%>
                   <dd><span>
                       <select id="txtIS_AUTO" runat="server" showtypes="int,bigint,decimal,numeric">
                           <option value="0">否</option><option value="1">是</option>
                       </select></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_BILL_COL.Attribute.ISPK.ZhName %>：</dt><%--是否是数字递增字段--%>
                   <dd><span>
                       <select id="txtISPK" runat="server" onchange="ISPK_CHG(this);">
                           <option value="0">否</option><option value="1">是</option>
                       </select></span>
                   </dd>
               </dl>

           <dl>
               <dt>排序号：</dt><%--SORT_NO--%>
               <dd><span>
                    <input id="txtSORT_NO" type="text" value="1" runat="server" ck="{need:0,len:2147483647,type:'number'}"/>
                   </span>
               </dd>
           </dl>
           
         <%--  </div>
           <div class="grp"><label>字段属性</label><a>展开</a></div>
           <div class="hide">--%>
              
           <dl class="hide">
               <dt><%=SYS_BILL_COL.Attribute.TITLE.ZhName %>：</dt><%--提示标题--%>
               <dd><span>
                
                    <input id="txtTITLE" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>
           <dl id="dlPK_VALCODE" showtypes="nvarchar,nchar,ntext,char,varchar">
               <dt>主键值编码格式：</dt><%--SORT_NO--%>
               <dd><span>
                    <input id="txtPK_VALCODE" type="text" value="" runat="server" ck="{need:0,len:2147483647,type:'string'}"/></span>
               </dd>
           </dl> 
               
               <dl class="hide">
               <dt><%=SYS_BILL_COL.Attribute.DVAL.ZhName %>：</dt><%--默认值--%>
               <dd><span>
                
                    <input id="txtDVAL" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>
           </div>
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
    <li><span><input id="btnFormView" type="button" value="表单预览" onclick="_FormView();"/></span></li>
</ul>
   </div>
</div>
</asp:Content>