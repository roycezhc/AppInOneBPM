<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_STEP_TPLSel" CodeFile="STEPSel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });
//    function selOK_E(ids) {//alert(ids);
//        var id = '<%=stepid %>';
//        if (id != "") {
//            $.ajax({
//                url: "STEPBack.aspx?ToStepIDS=" + ids + "&StepID=" + id,
//                cache: false,
//                success: function (svrData) {

//                },
//                error: function (a, b, c) {
//                    alert(a);
//                }
//            });
//        }
//    }

    function setSelInfo(tds, index) {


        selInfo = "({ID:'" + $(tds[0]).text() + "',Name:'" + $(tds[1]).text() + "',Type:'" + $(tds[2]).text() + "'})"; //选中td第一格
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
  <div class="titnav">
    <dl><dt></dt><dd><a href="STEPEdit.aspx?PROCID=<%=procid %>&stepType=<%=selType %>&preUrl=STEPSel.aspx?PROCID=<%=procid %>">新建节点</a></dd></dl>
  </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
  </div>
        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td><%=WF_STEP_TPL.Attribute.STEP_ID._ZhName %></td><!--步骤ID-->
                    <td><%=WF_STEP_TPL.Attribute.STEP_NAME._ZhName %></td><!--步骤名-->
                    <td style="display:none;"><%=WF_STEP_TPL.Attribute.STEP_TYPE._ZhName %></td><!--状态-->
                    <td><%=WF_STEP_TPL.Attribute.STEP_TYPE._ZhName %></td><!--状态-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                    <td><%#((WF_STEP_TPL)Container.DataItem).STEP_ID %></td>
                    <td><%#((WF_STEP_TPL)Container.DataItem).STEP_NAME %></td>
                    <td style="display:none;"><%#((WF_STEP_TPL)Container.DataItem).STEP_TYPE%></td>
                    <td><%#FormHelper.GetText(WF_STEP_TPL.Attribute.STEP_TYPE,((WF_STEP_TPL)Container.DataItem).STEP_TYPE)%></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
</asp:Content>

