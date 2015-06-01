<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_TEMPUSEREdit.aspx.cs" Inherits="SYS_TEMPUSEREdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <style type="text/css">
.form dl dd input{ height:25px; font-size:16px;}
.form dl dt{ line-height:30px;font-size:15px;}
.form dl dt{ line-height:30px;font-size:15px;}
.tool input { font-size:18px; }
.tool ul li { float:none}
.tool ul { float:none}
.tool .btn { margin-left:20px;}
.tool { height:30px;}
</style>
 <script type="text/javascript">
     var checker
       $(function () {
           checker = new formChecker({btnIDS: '' });
       });
       $(document).ready(function () {
           $("#btnCheckNum").click(function () {
               
               var re = /^0?(13|14|15|18)\d{9}$/;
               var tel = $("#txtPHONE").val();
               if (tel.length == 0) {
                   alert("请输入手机号码!");
                   return false;
               }
               if (!re.test(tel)) {
                   alert("请正确输入手机号码!");
                   $("#txtPHONE").focus();
                   return false;
               }

               var url = "SYS_TEMPUSERBack.aspx?action=GetCheckNum&Mobile=" + tel + "&callid=" + callid();
               var resource = {
           };
               $.post(url, { "ResJson": resource }, function (data) {
               if (data == "-100") {
                   alert("验证码已下发，请注意查收")
               } else if (data == "-101") {
                   $("#hidFlag").val('1');
                   alert("下发失败,请任意输入四位验证码进行注册。")
               } else if (data == "-102") {
                   alert("通讯端口被占用，正排队等待")
               } else {
                   alert("请不要重复获取，请在" + data + "秒后重试！")
               }
           });
       });
       $("#btnOK").click(function () {
           if (!checker.checkFormInfo()) {
               return false;
           }

           var txtLOGINNAME = $("#txtLOGINNAME").val();
           var txtPWD = $("#txtPWD").val();
           var txtNAME = $("#txtNAME").val();
           var txtCONAME = $("#txtCONAME").val();
           var txtPHONE = $("#txtPHONE").val();
           var txtCheckNum = $("#txtCheckNum").val();
           var txtEMAIL = $("#txtEMAIL").val();

           if (!/.*[\u4e00-\u9fa5]+.*$/.test(txtCONAME)) {
               alert("请输入中文汉字！");
               $("#txtCONAME").val('');
               $("#txtCONAME").focus();
               return false;
           }
           if (txtCONAME.length<2) {
               alert("请输入两个以上中文汉字！");
               $("#txtCONAME").val('');
               $("#txtCONAME").focus();
               return false;
           }

           var url = "SYS_TEMPUSERBack.aspx?action=Add&loginname=" + txtLOGINNAME + "&pwd=" + txtPWD + "&name=" + txtNAME + "&coname=" + txtCONAME + "&phone=" + txtPHONE + "&checknum=" + txtCheckNum + "&email=" + txtEMAIL + "&callid=" + callid() + "&hidFlag=" + $("#hidFlag").val();
           var resource = {
       };
       $.post(url, { "ResJson": resource }, function (data) {
           if (data == "-1") {
               alert("验证码错误，请重新输入");
               $("#txtCheckNum").val('');
               $("#txtCheckNum").focus();
           } else if (data == "-2") {
               alert("登录名已存在，请重新输入");
               $("#txtLOGINNAME").val('');
               $("#txtLOGINNAME").focus();
           } else {
               alert("注册成功！");
               window.close();
           }
       });
       return false;

   });


});
       function callid() {
           var random = Math.floor(Math.random() * 10001);
           var id = (random + "_" + new Date().getTime()).toString();
           return id;
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
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<input type="hidden" id="hidFlag" value ="0" />
<div class="form" id="divForm">
       <div>
           <dl>
               <dt>试用单位：</dt><%--单位--%>
               <dd><span>
               <!--文字-->
                    <input id="txtCONAME" type="text" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <br>
            <br>
             <br>
           <dl>
               <dt><%=SYS_TEMPUSER.Attribute.PHONE.ZhName %>：</dt><%--手机号码--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPHONE" type="text" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
               <dd>
                   <div class="controls">
                        <span class="insertimage"><a id="btnCheckNum">获取验证码</a></span>
                    </div>
                   </dd>
           </dl>
            <br>
             <br>
              <br>
           <dl >
               <dt>验证码：</dt>
               <dd><span>
                    <input id="txtCheckNum" type="text" ck="{type:1,min:1000,max:9999,need:1}"/></span>
               </dd>
           </dl>
            <br>
             <br>
              <br>
           <dl>
               <dt><%=SYS_TEMPUSER.Attribute.LOGINNAME.ZhName %>：</dt><%--登录名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtLOGINNAME" type="text" ck="{type:0,min:0,max:20,need:1}"/></span>
               </dd>
           </dl>
            <br> <br>
             <br>
           <dl>
               <dt><%=SYS_TEMPUSER.Attribute.PWD.ZhName %>：</dt><%--密码--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPWD" value="123456" type="text"  ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
            <br>
             <br>
              <br>
           <dl>
               <dt><%=SYS_TEMPUSER.Attribute.NAME.ZhName %>：</dt><%--姓名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtNAME" type="text" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
            <br>
             <br>
              <br>
           <dl>
               <dt>QQ：</dt><%--姓名--%>
               <dd><span>
               <!--文字-->
                    <input id="txtEMAIL" type="text" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
            <br> <br> <br>
           
       </div>
       <div class="clear"></div>
    </div>
</div>
<div class="tool">
<ul>
    <li><span class="btn"><input ID="btnOK" value="提交" type=button /></span><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
</asp:Content>