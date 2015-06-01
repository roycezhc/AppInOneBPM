<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STAFFEdit" CodeFile="STAFFEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Register src="../../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
    <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/myTabs.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/PinYin.js?r=11" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {

        var checker = new formChecker({btnIDS: 'btnOK' });

    });
    function selNames(me) {
        var txt1 = $("input[id$='txtSNAME']");
        var pinyin1 = toPinyinMy(me.value); //makePy
        if (txt1.val() == "") {
            txt1.val(pinyin1);
        }
        var txt2 = $("input[id$='txtRNAME']");
        if (txt2.val() == "") {
            txt2.val(pinyin1);
        }
        var txt3 = $("input[id$='txtUSER_NAME']");
        if (txt3.val() == "") {
            txt3.val(pinyin1);
        }
        var txt4 = $("input[id$='txtUSER_NAME1']");
        if (txt4.val() == "") {
            txt4.val(pinyin1);
        }
    }
     function selNames2(me) {
        var txt3 = $("input[id$='txtUSER_NAME']");
        if (txt3.val() == "") {
            txt3.val(me.value);
        } 
        var txt4 = $("input[id$='txtUSER_NAME1']");
        if (txt4.val() == "") {
            txt4.val(me.value);
        }
    }
</script>
<style type="text/css">
    body{ overflow:hidden;}
   .form{height:510px; overflow:auto;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="tool">
       <ul>
       <li><span>
              <asp:Button ID="btnOK" runat="server" lang="BtnOK" Text="确定" Width="51" 
               onclick="btnOK_Click"/>
           </span></li>
       <li><span><input onclick="window.close();" lang="close" value="关闭" type="button" /></span></li>
       </ul>
       </div>
  <div class="tabs">
         <ul><li class="show"><a>基本信息</a></li><li><a>详细信息</a></li><li><a>账户信息</a></li></ul>
         <ol><li class="show"><input id="txtSTAFF_ID" type="hidden" runat="server"/>
            <div class="form">
           <dl>
               <dt><%=HR_STAFF.Attribute.STAFF_NO.ZhName %>：</dt><%--员工号--%>
               <dd>
                
                    <span><input id="txtSTAFF_NO" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
               </dl>
           <dl><dt><%=HR_STAFF.Attribute.STAFF_NAME.ZhName%>：</dt><%--员工姓名--%>
               <dd>
                
                    <span><input id="txtNAME" onblur="selNames(this);" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.SNAME.ZhName%>：</dt><%--简称--%>
               <dd>
                
                    <span><input id="txtSNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
               </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.RNAME.ZhName%>：</dt><%--助记码--%>
               <dd>
                
                    <span><input id="txtRNAME" type="text" onblur="selNames2(this);"  runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd><dd>建议姓名简拼，同时作为账户名</dd>
           </dl>
           <dl>
               <dt><%=SYS_USER.Attribute.USER_NAME.ZhName%>：</dt><%--登录用户名--%>
               <dd>
                
                    <span><input id="txtUSER_NAME1" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd><dd>修改登录用户名，请点 账户信息</dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.DEPT_ID.ZhName %>：</dt><%--所属部门标识--%>
               <dd>
               <uc1:wucSelDept ID="wucSelDept1" runat="server" />
               <input type=hidden id="hidDEPT_ID" runat=server />
               </dd>
               </dl>
           <dl><dt><%=HR_STAFF.Attribute.GENDER.ZhName %>：</dt><%--性别--%>
               <dd>
               <span>
                    <select id="txtGENDER" runat="server" ck="{need:0,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.STATION_CODE.ZhName %>：</dt><%--岗位编码--%>
               <dd><selStation:wucSelStation ID="wucSelStation1" runat="server" />
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.POS_NAME.ZhName %>：</dt><%--职位描述--%>
               <dd>
                <span>
                    <input id="txtPOS_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <div class="clear"></div>
           </div>
         </li>
         <li>
           <div class="form">
           <dl>
               <dt><%=HR_STAFF.Attribute.WORK_TYPE_CODE.ZhName %>：</dt><%--工作分工种类--%>
               <dd>
               <span>
                    <select id="txtWORK_TYPE_CODE" runat="server" ck="{need:0,len:8,type:0}">
                    </select></span>
               </dd>
               </dl>
           <dl>
               <dt>技能等级：</dt><%--技能等级--%>
               <dd>
                <span>
                    <input id="txtTECH_LEVEL_CODE" type="text" runat="server" ck="{need:0,len:8,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.YMD.ZhName %>：</dt><%--出生年月--%>
               <dd>
                <span>
                    <input id="txtYMD" type="text" runat="server" onclick="setday(this);" ck="{need:3,len:22,type:0}"/></span>
               </dd>
               </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.MOBILE.ZhName %>：</dt><%--手机号码--%>
               <dd>
                <span>
                    <input id="txtMOBILE" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.OFFICE_TEL.ZhName %>：</dt><%--办公电弧--%>
               <dd>
                <span>
                    <input id="txtOFFICE_TEL" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
               </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.CERT_FLAG.ZhName %>：</dt><%--持证标记--%>
               <dd>
                <span>
                    <input id="txtCERT_FLAG" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.FIXED_FLAG.ZhName %>：</dt><%--定编标志--%>
               <dd>
                <span>
                    <input id="txtFIXED_FLAG" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
               </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.ON_POS_FLAG.ZhName %>：</dt><%--在岗标志--%>
               <dd>
                <span>
                    <input id="txtON_POS_FLAG" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.PROFESSION_CODE.ZhName %>：</dt><%--本专业工作日期--%>
               <dd>
                <span>
                    <input id="txtPROFESSION_CODE" type="text" runat="server" onclick="setday(this);" ck="{need:3,len:22,type:0}"/></span>
               </dd>
        </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.PROFESSION_BGN_DATE.ZhName %>：</dt><%--本专业工作日期--%>
               <dd>
                <span>
                    <input id="txtPROFESSION_BGN_DATE" type="text" runat="server" onclick="setday(this);" ck="{need:3,len:22,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.JOIN_DATE.ZhName %>：</dt><%--工作日期--%>
               <dd>
                <span>
                    <input id="txtJOIN_DATE" type="text" onclick="setday(this);" runat="server" ck="{need:3,len:22,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.POLITICAL_STATUS_CODE.ZhName %>：</dt><%--政治面貌--%>
               <dd>
                <span>
                    <input id="txtPOLITICAL_STATUS_CODE" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.TITLE_CODE.ZhName %>：</dt><%--职称编码--%>
               <dd>
                <span>
                    <input id="txtTITLE_CODE" type="text" runat="server" ck="{need:0,len:8,type:0}"/></span>
               </dd>
            </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.STATUS_CODE.ZhName %>：</dt><%--调退亡状态--%>
               <dd>
                <span>
                    <input id="txtSTATUS_CODE" type="text" runat="server" ck="{need:0,len:8,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.ADDR.ZhName %>：</dt><%--联系地址--%>
               <dd>
                <span>
                    <input id="txtADDR" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
       </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.EMAIL.ZhName %>：</dt><%--电子邮件--%>
               <dd>
                <span>
                    <input id="txtEMAIL" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.NATION.ZhName %>：</dt><%--民族--%>
               <dd>
                <span>
                    <input id="txtNATION" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.NATIVE_PLACE.ZhName %>：</dt><%--籍贯--%>
               <dd>
                <span>
                    <input id="txtNATIVE_PLACE" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.POST_NO.ZhName %>：</dt><%--邮政编码--%>
               <dd>
                <span>
                    <input id="txtPOST_NO" type="text" runat="server" ck="{need:0,len:18,type:0}"/></span>
               </dd>
                          </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.DEGREE_CODE.ZhName %>：</dt><%--文化程度--%>
               <dd>
                <span>
                    <input id="txtDEGREE_CODE" type="text" runat="server" ck="{need:0,len:8,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.GRAD_SCHOOL.ZhName %>：</dt><%--毕业学校--%>
               <dd>
                <span>
                    <input id="txtGRAD_SCHOOL" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.GRAD_DATE.ZhName %>：</dt><%--毕业时间--%>
               <dd>
                <span>
                    <input id="txtGRAD_DATE" type="text" runat="server" onclick="setday(this);" ck="{need:3,len:33,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.MAJOR.ZhName %>：</dt><%--专业--%>
               <dd>
                <span>
                    <input id="txtMAJOR" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
            <dt><%=HR_STAFF.Attribute.REMARK.ZhName %>：</dt><%--备注--%>
               <dd>
               <span>
                    <textarea id="txtREMARK" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:888,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               
               <dt><%=HR_STAFF.Attribute.PHOTO.ZhName %>：</dt><%--照片地址--%>
               <dd>
               <span>
                    <textarea id="txtPHOTO" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:550,type:0}" /></span>
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



           <div class="clear"></div>
           </div>
         </li>
         <li>
           <div class="form">
           
           <!--用户模块-->
           <dl>
                   <dt><%=SYS_USER.Attribute.USER_NAME.ZhName %>：</dt><%--用户名--%>
                   <dd>
                        <span><input id="txtUSER_NAME" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
                   </dd>
               </dl>
               <dl>
                   <dt>初始密码：</dt><%--密码--%>
                   <dd>
                        <span><input id="txtPASS" type="password" readonly="readonly" runat="server" ck="{need:0,len:20,type:0}"/></span>
                   </dd>
                   <dd>默认密码123456，首次登录必须改</dd>
               </dl>
               
           <dl>
              <dt><%=HR_STAFF.Attribute.USER_ID.ZhName %>：</dt><%--用户标识--%>
               <dd>
                <span>
                    <input id="txtUSER_ID" type="text" runat="server" readonly="readonly" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>


           <div class="clear"></div>
           </div>
         </li>         </ol>
   </div>
   <div class="tool"></div>
</div>
</asp:Content>