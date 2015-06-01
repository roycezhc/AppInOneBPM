<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_STEP_FORM_TPLManage" CodeFile="SFManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
    <script src="../../../Lib/JScript/MyJsCore.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        bindWinResize(40); 
    });
    function selCol(me) {
        var url = "../FORM/COLUMN/COLUMNSel.aspx?formid=<%=formid %>";
        window.sels = window.showModalDialog(url, "selCol", "dialogHeight=550px; dialogWidth=700px;dialogLeft:;dialogTop:; status=No;");
//         if (!sels) { } //jin-shenjian chromeË¢ÐÂ¸¸»­Ãæ
       //chrome
        if (navigator.userAgent.toLowerCase().indexOf('chrome') > -1) {
        } else {
            cb();
        }
    }

    function cb() {
        if (!window.sels) {
            window.sels = window.returnValue;
        }
        if (window.sels != "" && window.sels != undefined) {
            var obj = eval(window.sels);
            $.ajax({
                url: "SFBack.aspx?selCOLUMN=" + obj.ID + "&StepID=<%=stepid %>",
                cache: false,
                success: function (svrData) {
                    window.location.href = getCurNoCacheHref(); // alert(svrData);
                },
                error: function (a, b, c) {
                    alert(a);
                }
            });

        }
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
        <ul>
            <li><span><input power="newWF_STEP_FORM_TPL" id="btn_New" type="button" value="Ìí¼Ó" onclick="selCol(this);" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="É¾³ý" onclick="manager.delByKeyID('SFBack.aspx');" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr>
                    <td class="first"></td>
                    <td data="{colname:'<%=V_STEP_FORM_TPL.Attribute.STEP_FID.LongName%>',show:0}"><%=V_STEP_FORM_TPL.Attribute.STEP_FID._ZhName%></td>
                    <td data="{colname:'<%=V_STEP_FORM_TPL.Attribute.COLUMN_ID.LongName%>',show:1}"><%=WF_STEP_FORM_TPL.Attribute.COLUMN_ID._ZhName %></td><!--COLUMN_ID-->
                    <td data="{colname:'<%=V_STEP_FORM_TPL.Attribute.SHOW_NAME.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.SHOW_NAME._ZhName%></td><!--ÏÔÊ¾Ãû³Æ-->
                    <td data="{colname:'<%=V_STEP_FORM_TPL.Attribute.CTRL_TYPE.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.CTRL_TYPE._ZhName%></td><!--CTRL_TYPE-->
                    <td data="{colname:'<%=V_STEP_FORM_TPL.Attribute.MAX_VAL.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.MAX_VAL._ZhName%></td><!--MAX_VAL-->
                    <td data="{colname:'<%=V_STEP_FORM_TPL.Attribute.MIN_VAL.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.MIN_VAL._ZhName%></td><!--MIN_VAL-->
                    <td data="{colname:'<%=V_STEP_FORM_TPL.Attribute.IS_NEED.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.IS_NEED._ZhName%></td><!--IS_NEED-->
                 </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"></td>
                    <td><%#((V_STEP_FORM_TPL)Container.DataItem).STEP_FID %></td>
                    <td><%#((V_STEP_FORM_TPL)Container.DataItem).COLUMN_ID %></td>
                    <td><%#((V_STEP_FORM_TPL)Container.DataItem).SHOW_NAME %></td>
                    <td><%#((V_STEP_FORM_TPL)Container.DataItem).CTRL_TYPE %></td>
                    <td><%#((V_STEP_FORM_TPL)Container.DataItem).MAX_VAL %></td>
                    <td><%#((V_STEP_FORM_TPL)Container.DataItem).MIN_VAL %></td>
                    <td><%#((V_STEP_FORM_TPL)Container.DataItem).IS_NEED %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
</div>
</asp:Content>