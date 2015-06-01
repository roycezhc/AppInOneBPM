<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="NewTemplate.aspx.cs" Inherits="Module_Admin_TF_TABLE_Default" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>

   <div class="topfindl"><!--需要隐去时，用 style="display:none;"-->
        <asp:Literal ID="Repeater" runat="server">
               <af:switch>
                    <af:default />
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="text"  /></span></dd></dl>
                    <af:smalltextarea />
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="text"  /></span></dd></dl>
                    <af:textarea />
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="text"  /></span></dd></dl>
                    <af:select /><af:select_enum />
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><select id="txt首字母大写表名"  ></span></dd></dl>
                    <af:select />
                    <af:select_fk />
                    <af:select_user />
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="text"  />
                        <input class="sel" onclick="sel_首字母大写关联表名();" value=" " type="button" />
                        <!--增加该脚本到 /Lib/JScript/Seljs.js,增加该页 /SelectObj/Sel/{首字母大写关联表名}_Sel.aspx-->
                        </span></dd></dl>
                    <af:checkbox />
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="checkbox"  class="ckb" /></span></dd></dl>
                    <af:radio />
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="radio"  class="ckb" /></span></dd></dl>
                    <af:datetime />
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="text" readonly="readonly" onclick="setday(this)"  /></span></dd></dl>
                    <af:datetime_bake /> 
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="text" readonly="readonly" onclick="setday(this)"  /></span></dd></dl>
                    <af:upload /> 
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="text"  /></span></dd></dl>
                    <af:password /> 
                    <dl colname="首字母大写表名.首字母大写表名"><dt>首字母大写列中文名：</dt>
                        <dd><span><input id="txt首字母大写表名" type="password" ></span></dd></dl>
                </af:switch>
         </asp:Literal>
    </div>
   
    <div class="path-url hide">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>