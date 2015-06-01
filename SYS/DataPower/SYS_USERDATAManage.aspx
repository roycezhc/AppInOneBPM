<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_USERDATAManage" CodeFile="SYS_USERDATAManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/JScript/MyJsCore.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/manage.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {
        //alert(window.location.pathname);
        managePara.listID = "tbList";
        managePara.colselCID = "olAllColCBS";
        managePara.cookieName = "SYS_USERDATAHidCols";
        managePara.cookieOut = 12;//小时
        _initBodyRow();
        _initHeadRow();

        _initColHideByNames(getCookie(managePara.cookieName) || "", false);

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
   <div class="topnav">
      <dl>
      <dt><a onclick="openNextArea(this);"></a><b>查询</b></dt>
      <dd><span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span></dd>
      </dl>
   </div>
   <div class="topfind hide"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl>
               <dt><%=SYS_USERDATA.Attribute.USER_ID.ZhName %>：</dt><!--USER_ID-->
               <dd><span>
                
                    <input id="txtUSER_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USERDATA.Attribute.DATA_TYPE.ZhName %>：</dt><!--DATA_TYPE-->
               <dd><span>
                
                    <input id="txtDATA_TYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USERDATA.Attribute.DATA_ID.ZhName %>：</dt><!--DATA_ID-->
               <dd><span>
                
                    <input id="txtDATA_ID" type="text" runat="server" />
               </span></dd>
        </dl>
    </div>  
    <div class="topnav">
    <dl><dt><a onclick="openNextArea(this);" class="opened"></a><b>列表</b></dt>
    <dd>
        <span><input id="btn_New" type="button" value="新建" onclick="_newRecord('tbList','SYS_USERDATAEdit.aspx');" /></span>
        <span><input id="btn_Dels" type="button" value="删除" onclick="_delBySelKeyIDS('SYS_USERDATABack.aspx');" /></span>
    </dd></dl>
     <ul>
      <li class="colist"><a onclick="_hideColsSel(this);">更多列</a><ol id="olAllColCBS"></ol></li>
     <li>
      <span>每页显示</span>
        <span class="txt"><input id="txtPageNum" type="text" runat="server" style="width:30px;" /></span><span>条</span>
        <span><asp:Button ID="btnSetPageNum" runat="server" Text="设置" OnClick="btnSetPageNum_Click" /></span>
     </li>
    </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="USER_ID">
                    <td class="ckb"><input type="checkbox" onclick="selAll(this);" /></td>
                    <td class="links" style="width:110px;">
                    <a class="hide" href="SYS_USERDATAEdit.aspx?USER_ID={USER_ID}">编辑</a>
                    <a class="hide" href="SYS_USERDATABack.aspx?DelUSER_ID={USER_ID}">删除</a>
                    <a class="hide" href="SYS_USERDATAShow.aspx?USER_ID={USER_ID}">详细</a>
                    </td>
                    
                    
                    <td colname="<%=SYS_USERDATA.Attribute.USER_ID.FieldName%>"><%=SYS_USERDATA.Attribute.USER_ID._ZhName %></td><!--USER_ID-->
                    
                    
                    <td colname="<%=SYS_USERDATA.Attribute.DATA_TYPE.FieldName%>"><%=SYS_USERDATA.Attribute.DATA_TYPE._ZhName %></td><!--DATA_TYPE-->
                    
                    
                    <td colname="<%=SYS_USERDATA.Attribute.DATA_ID.FieldName%>"><%=SYS_USERDATA.Attribute.DATA_ID._ZhName %></td><!--DATA_ID-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="ckb"><input type="checkbox" value="<%#((SYS_USERDATA)Container.DataItem).USER_ID%>" /></td>
                    <td>
                    <a href="SYS_USERDATAEdit.aspx?USER_ID=<%#((SYS_USERDATA)Container.DataItem).USER_ID %>">编辑</a>
                    <a href="SYS_USERDATABack.aspx?DelUSER_ID=<%#((SYS_USERDATA)Container.DataItem).USER_ID %>">删除</a>
                    <a href="SYS_USERDATAShow.aspx?USER_ID=<%#((SYS_USERDATA)Container.DataItem).USER_ID %>">详细</a>
                    </td>
                    
                    
                    <td><%#((SYS_USERDATA)Container.DataItem).USER_ID %></td>
                    
                    
                    <td><%#((SYS_USERDATA)Container.DataItem).DATA_TYPE %></td>
                    
                    
                    <td><%#((SYS_USERDATA)Container.DataItem).DATA_ID %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>