<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_PART_STRUEditAdv" CodeFile="KM_PART_STRUEditAdv.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script src="../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script src="../Lib/MyDP/selDate.js" type="text/javascript"></script>
<script src="../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

    function addReal(me) {
        var result = window.showModalDialog("../Role/RoleSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result != undefined && result != "") {
            var obj = eval(result);
            var roles = window.frames["ifrReal"]._addOneAndReturn(obj.ID);
            var url = window.frames["ifrReal"].location.pathname; //  window.frames["ifrReal"].document.URL;
            window.frames["ifrReal"].location.href = url + "?mulids=" + roles;
        }

        return false;
    }

    function newReal(me) {

        var result = window.showModalDialog("../Role/RoleEdit.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result != undefined && result != "") {
            var obj = eval(result);
            var roles = window.frames["ifrReal"]._addOneAndReturn(obj.ROLE_ID);
            var url = window.frames["ifrReal"].location.pathname; //
            window.frames["ifrReal"].location.href = url + "?mulids=" + roles;
        }

        return false;
    }

    $(function () {
        var keyid = $("input[id$='txtUser_ID']").val();
        if (keyid != "" && keyid != undefined) {
            var url = window.frames["ifrReal"].location.pathname;
            window.frames["ifrReal"].location.href = url + "?oneid=" + keyid;
        }

        var checker = new formChecker({ formID: "divForm", btnIDS: 'btnOK' });


    });



    function selDept(me) {
        var preDir = "../../../";
        if (arguments.length > 1) {
            preDir = predir;
        }
        var result = window.showModalDialog("../DeptInfo/DeptSel.aspx?r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result == undefined || result == "") return;
        var obj = eval(result);

        var puts = $(me).parent().find("input");
        puts[1].value = obj.name;
        puts[0].value = obj.id;
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <input id="hidKey" type="hidden" value="<%=valObj.PART_ID %>" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>

  <div class="form">
           <dl class="f-tit"><dt><em onclick="openMore(this);" class='opened'></em><a>基本信息</a></dt><dd>
           <input id="btn_EditBase" type="button" value="修改" class="btn" onclick="editThisDepart(this);" />
           <input id="btn_SaveBase" class="btn hide" type="button" onclick="saveThisDepart(this,'StaffBack.aspx');" value="保存" />
           <input id="Button6" class="btn hide" type="button" onclick="cancelThisDepart(this);" value="取消" />
           </dd></dl>
           <div>
             
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_ID.ZhName %>：</dt><%--PART_ID--%>
               <dd>
                
                    <asp:Label id="txtPART_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_NAME.ZhName %>：</dt><%--PART_NAME--%>
               <dd>
                
                    <asp:Label id="txtPART_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.K_PART_ID.ZhName %>：</dt><%--K_PART_ID--%>
               <dd>
                
                    <asp:Label id="txtK_PART_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_CONTENT.ZhName %>：</dt><%--PART_CONTENT--%>
               <dd>
               
                    <asp:Label id="txtPART_CONTENT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_CLASS_ID.ZhName %>：</dt><%--PART_CLASS_ID--%>
               <dd>
                
                    <asp:Label id="txtPART_CLASS_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_EA_SIGN.ZhName %>：</dt><%--PART_EA_SIGN--%>
               <dd>
                
                    <asp:Label id="txtPART_EA_SIGN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_AUTHOR.ZhName %>：</dt><%--PART_AUTHOR--%>
               <dd>
                
                    <asp:Label id="txtPART_AUTHOR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_IS_READ.ZhName %>：</dt><%--PART_IS_READ--%>
               <dd>
                
                    <asp:Label id="txtPART_IS_READ" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.SORT_NO.ZhName %>：</dt><%--SORT_NO--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.IDPATH.ZhName %>：</dt><%--IDPATH--%>
               <dd>
               
                    <asp:Label id="txtIDPATH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.KNAME.ZhName %>：</dt><%--KNAME--%>
               <dd>
               
                    <asp:Label id="txtKNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.SNAME.ZhName %>：</dt><%--SNAME--%>
               <dd>
                
                    <asp:Label id="txtSNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.RNAME.ZhName %>：</dt><%--RNAME--%>
               <dd>
                
                    <asp:Label id="txtRNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.SUB_NUM.ZhName %>：</dt><%--SUB_NUM--%>
               <dd>
                
                    <asp:Label id="txtSUB_NUM" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.SUBOBJECT_NUM.ZhName %>：</dt><%--SUBOBJECT_NUM--%>
               <dd>
                
                    <asp:Label id="txtSUBOBJECT_NUM" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.USE_FLAG.ZhName %>：</dt><%--USE_FLAG--%>
               <dd>
                
                    <asp:Label id="txtUSE_FLAG" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP1.ZhName %>：</dt><%--EXP1--%>
               <dd>
                
                    <asp:Label id="txtEXP1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP2.ZhName %>：</dt><%--EXP2--%>
               <dd>
                
                    <asp:Label id="txtEXP2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP3.ZhName %>：</dt><%--EXP3--%>
               <dd>
                
                    <asp:Label id="txtEXP3" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP4.ZhName %>：</dt><%--EXP4--%>
               <dd>
                
                    <asp:Label id="txtEXP4" runat="server"></asp:Label>
               </dd>
             </dl>
           </div>         
           
           <dl class="f-tit"><dt><em onclick="openMore(this);" class="opended"></em><a>我的关联信息</a></dt><dd>
           <input id="btn_AddReal" type="button" value="添加" class="btn" onclick="addReal(this);" />
           <input id="btn_NewReal" type="button" class="btn" onclick="newReal(this);" value="新建" />
          </dd></dl>
           <div>
            <iframe name="ifrReal" id="ifrReal" src="KM_PART_STRUReal.aspx" frameborder="0" scrolling="auto" style="width:100%;height:100%;"></iframe>
           </div>

    </div>
</div>
</asp:Content>
