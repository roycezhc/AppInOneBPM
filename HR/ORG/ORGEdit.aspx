<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_ORGEdit" CodeFile="ORGEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
    <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {
        var checker = new formChecker({ formID: "divForm", btnIDS: 'btnOK' });
    });

    function selORG(me) {

        var result = window.showModalDialog("ORGSel.aspx?r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result == undefined || result == "") return;
        var obj = eval(result);

        var puts = $(me).parent().find("input");
        puts[1].value = obj.name;
        puts[0].value = obj.id;
    }
    function selNames(me) {
        var txt1 = $("input[id$='txtSNAME']");
        var txt2 = $("input[id$='txtRNAME']");
        if (txt1.val() == "") {
            txt1.val(me.value);
        }
        if (txt2.val() == "") {
            txt2.val(me.value);
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
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="tool">
    <ol>
    <li><span>
              <asp:Button ID="btnOK" runat="server" lang="BtnOK" Text="确定" Width="51" 
               onclick="btnOK_Click"/>
           </span></li>
    <li><span><input onclick="window.close();" lang="close" value="关闭" type="button" /></span></li>
    </ol>
   </div>
    <div class="form" id="divForm">
       <dl class="f-tit"><dt><em onclick="openMore(this);" class="opened"></em><a>基本信息</a></dt><dd><b id="bERR" runat="server"></b></dd></dl>
       <div>
           <input id="txtORG_ID" type="hidden" runat="server"/>
           <dl>
               <dt><%=HR_ORG.Attribute.ORG_NAME.ZhName %>：</dt><%--分支机构名--%>
               <dd>
                
                    <span><input id="txtORG_NAME" type="text"  onblur="selNames(this);" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
            <dt>父机构名称：</dt>
            <dd><selorg:wucselorg ID="wucSelORG1" runat="server" /></dd>
            
        </dl>
         <dl>
            <dt>序号：</dt>
            <dd><span><input id="txtSortNum" value="0" type="text" runat="server" ck="{need:1,len:999999999,dtype:1}"/></span></dd>
        </dl>
        <dl>
               <dt><%=HR_ORG.Attribute.SNAME.ZhName%>：</dt><%--SNAME--%>
               <dd>
                
                    <span><input id="txtSNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
            </dl>
         <dl>
               <dt><%=HR_ORG.Attribute.RNAME.ZhName%>：</dt><%--RNAME--%>
               <dd>
                
                    <span><input id="txtRNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
      <dl>
               <dt><%=HR_ORG.Attribute.EXP1.ZhName%>：</dt><%--自定义1--%>
               <dd>
                
                    <span><input id="txtEXP1" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
               </dl>
         <dl>
               <dt><%=HR_ORG.Attribute.EXP2.ZhName%>：</dt><%--自定义2--%>
               <dd>
                
                    <span><input id="txtEXP2" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_ORG.Attribute.EXP3.ZhName%>：</dt><%--自定义3--%>
               <dd>
                
                    <span><input id="txtEXP3" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>

</div>
</asp:Content>