<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_SUB_STRUEdit" CodeFile="KM_SUB_STRUEdit.aspx.cs" %>
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
               <dt><%=KM_SUB_STRU.Attribute.SUB_ID.ZhName %>：</dt><%--SUB_ID--%>
               <dd>
                
                    <input id="txtSUB_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_NAME.ZhName %>：</dt><%--SUB_NAME--%>
               <dd>
                
                    <input id="txtSUB_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.K_SUB_ID.ZhName %>：</dt><%--K_SUB_ID--%>
               <dd>
                
                    <input id="txtK_SUB_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_CONTENT.ZhName %>：</dt><%--SUB_CONTENT--%>
               <dd>
               
                    <textarea id="txtSUB_CONTENT" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:1000,type:0}" />
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_CLASS_ID.ZhName %>：</dt><%--SUB_CLASS_ID--%>
               <dd>
                
                    <input id="txtSUB_CLASS_ID" type="text" runat="server" ck="{need:0,len:10,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_EA_SIGN.ZhName %>：</dt><%--SUB_EA_SIGN--%>
               <dd>
                
                    <input id="txtSUB_EA_SIGN" type="text" runat="server" ck="{need:0,len:10,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_AUTHOR.ZhName %>：</dt><%--SUB_AUTHOR--%>
               <dd>
                
                    <input id="txtSUB_AUTHOR" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_IS_READ.ZhName %>：</dt><%--SUB_IS_READ--%>
               <dd>
                
                    <input id="txtSUB_IS_READ" type="text" runat="server" ck="{need:0,len:10,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SORT_NO.ZhName %>：</dt><%--SORT_NO--%>
               <dd>
                
                    <input id="txtSORT_NO" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.IDPATH.ZhName %>：</dt><%--IDPATH--%>
               <dd>
               
                    <textarea id="txtIDPATH" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" />
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.KNAME.ZhName %>：</dt><%--KNAME--%>
               <dd>
               
                    <textarea id="txtKNAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:400,type:0}" />
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SNAME.ZhName %>：</dt><%--SNAME--%>
               <dd>
                
                    <input id="txtSNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.RNAME.ZhName %>：</dt><%--RNAME--%>
               <dd>
                
                    <input id="txtRNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_NUM.ZhName %>：</dt><%--SUB_NUM--%>
               <dd>
                
                    <input id="txtSUB_NUM" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUBOBJECT_NUM.ZhName %>：</dt><%--SUBOBJECT_NUM--%>
               <dd>
                
                    <input id="txtSUBOBJECT_NUM" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.USE_FLAG.ZhName %>：</dt><%--USE_FLAG--%>
               <dd>
                
                    <input id="txtUSE_FLAG" type="text" runat="server" ck="{need:0,len:2,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.EXP1.ZhName %>：</dt><%--EXP1--%>
               <dd>
                
                    <input id="txtEXP1" type="text" runat="server" ck="{need:0,len:40,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.EXP2.ZhName %>：</dt><%--EXP2--%>
               <dd>
                
                    <input id="txtEXP2" type="text" runat="server" ck="{need:0,len:40,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.EXP3.ZhName %>：</dt><%--EXP3--%>
               <dd>
                
                    <input id="txtEXP3" type="text" runat="server" ck="{need:0,len:40,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_SUB_STRU.Attribute.EXP4.ZhName %>：</dt><%--EXP4--%>
               <dd>
                
                    <input id="txtEXP4" type="text" runat="server" ck="{need:0,len:40,type:0}"/>
               </dd>
           </dl>
       </div>

       <dl class="f-tit"><dt><em onclick="openMore(this);"></em><a>我的关联信息</a></dt><dd>
           <input id="btn_AddReal" type="button" value="添加" class="btn" onclick="addReal(this);" />
           <input id="btn_NewReal" type="button" class="btn" onclick="newReal(this);" value="新建" />
       </dd></dl>
       <div class="hide">
         <iframe name="ifrReal" id="ifrReal" src="KM_SUB_STRUReal.aspx" frameborder="0" scrolling="auto" style="width:100%;"></iframe>
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