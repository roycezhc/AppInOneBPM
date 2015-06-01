<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKWORKDEVICEEdit2" CodeFile="HR_CHECKWORKDEVICEEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
       function selORG(me) {

           var result = window.showModalDialog("../../ORG/ORGSel.aspx?r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
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
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
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
        
           <dl>
               <dt><%=HR_CHECKWORKDEVICE.Attribute.DeviceID.ZhName %>：</dt><%--设备ID--%>
               <dd><span>
                
                    <input id="txtDeviceID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHECKWORKDEVICE.Attribute.DeviceName.ZhName %>：</dt><%--设备名称--%>
               <dd><span>
                
                    <input id="txtDeviceName" type="text" runat="server" ck="{need:1,len:100,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt>所属分支机构：</dt>
               <dd><span>
                <selorg:wucselorg ID="wucSelORG1" runat="server" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHECKWORKDEVICE.Attribute.USE_FLAG.ZhName %>：</dt><%--是否启用--%>
               <dd><span>
               
                    <select id="txtUSE_FLAG" runat="server" ck="{need:1,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHECKWORKDEVICE.Attribute.DeptTable.ZhName %>：</dt><%--部门表--%>
               <dd><span>
               
                    <select id="txtDeptTable" runat="server" ck="{need:1,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_CHECKWORKDEVICE.Attribute.StaffTable.ZhName %>：</dt><%--员工表--%>
               <dd><span>
               
                    <select id="txtStaffTable" runat="server" ck="{need:1,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
</div>
</asp:Content>