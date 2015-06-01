<%@ Page Language="C#" Title="权限配置" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SystemManage_Role_mdlPowerSelect" CodeFile="PowerSet.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
 <script src="../../Lib/JScript/CkTreeSel.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/myTabs.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/myVTabs.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        Chx.CkTreeSel.Paras.tvID = "tvModule";
        Chx.CkTreeSel.Paras.UnCheckedParent = false;
        Chx.CkTreeSel.initEvents();

//        var aaa = eval("[{a:0},{a:1}]");
//        alert(typeof (aaa));
//        var sss = "[{a:0},{a:1}]";
//        alert(typeof (sss));
    });

    function vTabClick(tabObj,contObj) {
        var ifrObj = contObj.find("iframe");
        var src = ifrObj.attr("src");
        //if (src == undefined || src == "") {
            ifrObj.attr("src", contObj.attr("data")+"&r="+Math.random());
        //}
        }

        function tabClick(tabObj) {
            if (tabObj.text() == "操作权限") {
                $("#li_oprPowerSubmit").show();
            } else {
                $("#li_oprPowerSubmit").hide();
            }
        }
</script>

<style type="text/css">
    .tabs ol{ text-align:center;}
   .tabs ol li{width:98%;margin:auto;}
   .tabs .vtabs ul{width:auto;position:static;}
   .tabs .vtabs ul li{margin:0;border:none;float:none;display:block;min-height:20px;_min-height:20px;}
   .tabs .vtabs ul li a{padding:0;font-weight:normal;}
   .tabs .vtabs ul li.show{margin:0;}
   .tabs .vtabs ol{clear:none;width:auto;}
   .tabs .vtabs ol li{width:auto;min-height:200px;_min-height:200px;}
   
   .vtabs{width:100%;height:500px;}
   .vtabs ul{margin:0;padding:0;float:left;height:100%;border:solid 1px #009; }
   .vtabs ul li{margin:0;padding:0;width:80px;height:auto;line-height:25px;text-align:center;border:none;}
   .vtabs ul li a{display:inline-block;width:78px;height:100%; cursor:pointer;color:#321;border:solid 1px #321;background:#def;}
   .vtabs ul li.show a{color:#def;border:solid 1px #def;background:#321;font-weight:bold;}
   
   .vtabs ol{margin:0;padding:0;margin-left:85px;height:500px;}
   .vtabs ol li{margin:0;padding:0;width:auto;display:none;height:100%;line-height:25px;border:solid 1px #999;}
   .vtabs ol li.show{display:block;margin:0;}
   
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div class="warn">
        <asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tabs">
      <ul><li class="show"><a>操作权限</a></li><li><a>数据权限</a></li></ul>
      <ol>
        <li class="show" style=" text-align:left; overflow:auto;">
         <table>
            <tr>
            <asp:Repeater ID="repModule" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <td style=" vertical-align:top;">
                   <div style="height:500px;width:150px; overflow:auto;">
                    <input id="hidMDLID" type="hidden" value="<%#((SYS_MODULE)Container.DataItem).MDL_ID %>" runat="server"/>
                  <asp:TreeView ID="tvModule" runat="server" ShowCheckBoxes="All" ExpandDepth="1" RootNodeStyle-Font-Bold="true">
                  </asp:TreeView>
                  </div>
                </td>
                </ItemTemplate>
                </asp:Repeater>
            </tr>
            </table>
        </li>
        <li>
           <div class="vtabs">
              <ul>
              <li class="show"><a>机构范围</a></li>
              <li><a>部门范围</a></li>
              <li><a>仓库范围</a></li>
              </ul>
              <ol>
                 <li class="show" data="../DataPower/DP_ORG.aspx?<%=paraStr %>"><iframe frameborder="0" src="../DataPower/DP_ORG.aspx?<%=paraStr %>" scrolling="auto" style="width:99%;height:100%;"></iframe></li>
                 <li data="../DataPower/DP_Dept.aspx?<%=paraStr %>"><iframe frameborder="0" src="" scrolling="auto" style="width:99%;height:100%;"></iframe></li>
                 <li data="../DataPower/DP_STORAGE.aspx?<%=paraStr %>"><iframe frameborder="0" src="" scrolling="auto" style="width:99%;height:100%;"></iframe></li>
              </ol>
           </div>
        </li>
      </ol>
    </div>
    <div class="tool">
      <ol><li id="li_oprPowerSubmit"><span><asp:Button ID="btnOK" runat="server" Text="确定提交" onclick="btnOK_Click" /></span></li></ol>
    </div>
</asp:Content>
