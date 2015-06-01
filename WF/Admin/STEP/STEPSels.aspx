<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_STEP_TPLSels" CodeFile="STEPSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
    <script type="text/javascript">$(function () { Sels_Load(); });</script>
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows();
        });

        function _selOK_B(sels) {
            var selObj = eval(sels);
            var str = "";
            for (var a = 0; a < selObj.length; a++) {
                if (str != "") {
                    str += ",";
                }
                str += selObj[a].ID;
            }
            var id = '<%=stepid %>';
            if (id != "") {
                $.ajax({
                    url: "STEPBack.aspx?ToStepIDS=" + str + "&StepID=" + id + "&PATH_TYPE=" + '<%=PATH_TYPE %>',
                    cache: false,
                    success: function (svrData) {
                        window.close();
                    },
                    error: function (a, b, c) {
                        alert("更新失败");
                    }
                });
            }

        }
    </script>
    
    <style type="text/css">
    #divList tbody tr td{ cursor:pointer;}
    .lrlayout .left{border:none;}
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
 <div class="main">
    <input id="hidCondition" type="hidden" runat="server" />
    <input id="hidOld" type="hidden" runat="server" />
    <input id="hidInitIDS" type="hidden" runat="server" />
    <div class="titnav">
       <dl><dt><b><%#title %>多选</b></dt><dd></dd></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="lrlayout">
    <div class="left" style="width:150px;height:400px;">
       <select id="selectedlist" multiple="multiple" style="color:Blue;width:100%;height:100%;">
       </select>
    </div>
    <div class="right" style="margin-left:152px;height:400px;">
    <div class="tool">
      <ol><li> <span><input id="btnSelOK" type="button" value="<%=LanguageService.GetLanguageString("SureChoose", "确定选择") %>" onclick="selsok();" /></span></li></ol>
    </div>
    <div class="tblist" id="divList">
       <table cellpadding="0" cellspacing="0">
             <thead>
                <tr>
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "全选") %>' onclick='_selAll(this);'/><%=LanguageService.GetLanguageString("Choose", "选择") %></td>
                    
                    
                    <td><%=WF_STEP_TPL.Attribute.STEP_ID._ZhName %><!--步骤ID--></td>
                    
                    
                    <td><%=WF_STEP_TPL.Attribute.STEP_NAME._ZhName %><!--步骤名--></td>

                    <td><%=WF_STEP_TPL.Attribute.STEP_TYPE._ZhName %><!--状态--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WF_STEP_TPL)Container.DataItem).STEP_ID %>" /></td>
                     
                    
                    <td><%#((WF_STEP_TPL)Container.DataItem).STEP_ID %></td>
                    
                    
                    <td><%#((WF_STEP_TPL)Container.DataItem).STEP_NAME %></td>


                    <td><%#FormHelper.GetText(WF_STEP_TPL.Attribute.STEP_TYPE,((WF_STEP_TPL)Container.DataItem).STEP_TYPE)%></td>
                    </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
     </div>
     </div>
 </div>
</asp:Content>
