<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_WF_FORM_FormDesign" CodeFile="FormDesign.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var oEditor = null;
    //保存光标位置，在该位置处插入客户端图片
    function getFckEditorObj() {//alert("ssss");
        return FCKeditorAPI.GetInstance("<%=txtHTML.ClientID %>");
    }

    function initForm(me) {
        if (oEditor == null) {
            oEditor = getFckEditorObj();
        }
        oEditor.InsertHtml($(me).html());
    }

    $(function () {


        bindWinResize();
    });
    function doResize() {
        InitDivH(1, new Array($("div.left"), $("div.right")));
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="lrlayout">
     <div class="left" style="width:180px;height:650px;">
       <ul>
       <asp:Literal ID="litFiedls" runat="server"></asp:Literal>
       <li onclick="initForm(this);">
       
       <input id="InputString" value="文字" type="text" readonly disabled />
       </li>
       </ul>
     </div>
     <div class="right" style="margin-left:182px;height:650px; text-align:center;">
        <div class="tool"></div>
        <div style="margin:auto;">
         <FCKV2:FCKeditor ID="txtHTML" runat="server" Width="700" Height="600px" ToolbarSet="FormDesign"></FCKV2:FCKeditor>
        </div>
        <div class="tool">
        <p><span><asp:Button ID="btnSave" runat="server" Text="保存" 
                onclick="btnSave_Click" /></span></p>
        </div>
     </div>
</div>
</asp:Content>

