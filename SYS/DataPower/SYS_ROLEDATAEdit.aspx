<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_ROLEDATAEdit" CodeFile="SYS_ROLEDATAEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

    function addReal(me) {
        var result = window.showModalDialog("../Role/RoleSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result != undefined && result != "") {
            var obj = eval(result);
            var roles = window.frames["ifrReal"]._addOneAndReturn(obj.ID);
            var url = window.frames["ifrReal"].location.pathname;//  window.frames["ifrReal"].document.URL;
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

    function _myCheck() {
        var roleids = window.frames["ifrReal"]._getSelRealIDS();
        $("input[id$='hidSelReals']").val(roleids);
        return true;
    }
   
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="form" id="divForm">
       <dl class="f-tit"><dt><em onclick="openMore(this);" class="opened"></em><a>基本信息</a></dt><dd><b id="bERR" runat="server"></b></dd></dl>
       <div>
        
           <dl>
               <dt><%=SYS_ROLEDATA.Attribute.ROLE_ID.ZhName %>：</dt><%--ROLE_ID--%>
               <dd>
                
                    <input id="txtROLE_ID" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_ROLEDATA.Attribute.DATA_TYPE.ZhName %>：</dt><%--DATA_TYPE--%>
               <dd>
                
                    <input id="txtDATA_TYPE" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_ROLEDATA.Attribute.DATA_ID.ZhName %>：</dt><%--DATA_ID--%>
               <dd>
                
                    <input id="txtDATA_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
       </div>

       <dl class="f-tit"><dt><em onclick="openMore(this);"></em><a>我的关联信息</a></dt><dd>
           <input id="btn_AddReal" type="button" value="添加" class="btn" onclick="addReal(this);" />
           <input id="btn_NewReal" type="button" class="btn" onclick="newReal(this);" value="新建" />
       </dd></dl>
       <div class="hide">
         <iframe name="ifrReal" id="ifrReal" src="SYS_ROLEDATAReal.aspx" frameborder="0" scrolling="auto" style="width:100%;"></iframe>
       </div>
       <dl class="f-btn"><dt></dt><dd>
           <a href="#" class="btn"><span>
              <asp:Button ID="btnOK" runat="server" lang="BtnOK" Text="确定" Width="51" 
               onclick="btnOK_Click"/>
           </span></a>
           <a href="#" class="btn"><span><input onclick="window.close();" lang="close" value="关闭" type="button" /></span></a>
       </dd></dl>
    </div>

</div>
</asp:Content>