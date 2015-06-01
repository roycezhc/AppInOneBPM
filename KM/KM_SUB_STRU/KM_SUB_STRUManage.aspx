<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_SUB_STRUManage" CodeFile="KM_SUB_STRUManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/JScript/MyJsCore.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/manage.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {
        //alert(window.location.pathname);
        managePara.listID = "tbList";
        managePara.colselCID = "olAllColCBS";
        managePara.cookieName = "KM_SUB_STRUHidCols";
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
               <dt><%=KM_SUB_STRU.Attribute.SUB_ID.ZhName %>：</dt><!--SUB_ID-->
               <dd><span>
                
                    <input id="txtSUB_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_NAME.ZhName %>：</dt><!--SUB_NAME-->
               <dd><span>
                
                    <input id="txtSUB_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.K_SUB_ID.ZhName %>：</dt><!--K_SUB_ID-->
               <dd><span>
                
                    <input id="txtK_SUB_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_CONTENT.ZhName %>：</dt><!--SUB_CONTENT-->
               <dd><span>
               
                    <textarea id="txtSUB_CONTENT" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_CLASS_ID.ZhName %>：</dt><!--SUB_CLASS_ID-->
               <dd><span>
                
                    <input id="txtSUB_CLASS_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_EA_SIGN.ZhName %>：</dt><!--SUB_EA_SIGN-->
               <dd><span>
                
                    <input id="txtSUB_EA_SIGN" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_AUTHOR.ZhName %>：</dt><!--SUB_AUTHOR-->
               <dd><span>
                
                    <input id="txtSUB_AUTHOR" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_IS_READ.ZhName %>：</dt><!--SUB_IS_READ-->
               <dd><span>
                
                    <input id="txtSUB_IS_READ" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SORT_NO.ZhName %>：</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.IDPATH.ZhName %>：</dt><!--IDPATH-->
               <dd><span>
               
                    <textarea id="txtIDPATH" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.KNAME.ZhName %>：</dt><!--KNAME-->
               <dd><span>
               
                    <textarea id="txtKNAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SNAME.ZhName %>：</dt><!--SNAME-->
               <dd><span>
                
                    <input id="txtSNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.RNAME.ZhName %>：</dt><!--RNAME-->
               <dd><span>
                
                    <input id="txtRNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUB_NUM.ZhName %>：</dt><!--SUB_NUM-->
               <dd><span>
                
                    <input id="txtSUB_NUM" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.SUBOBJECT_NUM.ZhName %>：</dt><!--SUBOBJECT_NUM-->
               <dd><span>
                
                    <input id="txtSUBOBJECT_NUM" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.USE_FLAG.ZhName %>：</dt><!--USE_FLAG-->
               <dd><span>
                
                    <input id="txtUSE_FLAG" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.EXP1.ZhName %>：</dt><!--EXP1-->
               <dd><span>
                
                    <input id="txtEXP1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.EXP2.ZhName %>：</dt><!--EXP2-->
               <dd><span>
                
                    <input id="txtEXP2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.EXP3.ZhName %>：</dt><!--EXP3-->
               <dd><span>
                
                    <input id="txtEXP3" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_SUB_STRU.Attribute.EXP4.ZhName %>：</dt><!--EXP4-->
               <dd><span>
                
                    <input id="txtEXP4" type="text" runat="server" />
               </span></dd>
        </dl>
    </div>  
    <div class="topnav">
    <dl><dt><a onclick="openNextArea(this);" class="opened"></a><b>列表</b></dt>
    <dd>
        <span><input id="btn_New" type="button" value="新建" onclick="_newRecord('tbList','KM_SUB_STRUEdit.aspx');" /></span>
        <span><input id="btn_Dels" type="button" value="删除" onclick="_delBySelKeyIDS('KM_SUB_STRUBack.aspx');" /></span>
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
                <tr keyname="SUB_ID">
                    <td class="ckb"><input type="checkbox" onclick="selAll(this);" /></td>
                    <td class="links" style="width:110px;">
                    <a class="hide" href="KM_SUB_STRUEdit.aspx?SUB_ID={SUB_ID}">编辑</a>
                    <a class="hide" href="KM_SUB_STRUBack.aspx?DelSUB_ID={SUB_ID}">删除</a>
                    <a class="hide" href="KM_SUB_STRUShow.aspx?SUB_ID={SUB_ID}">详细</a>
                    </td>
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SUB_ID.FieldName%>"><%=KM_SUB_STRU.Attribute.SUB_ID._ZhName %></td><!--SUB_ID-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SUB_NAME.FieldName%>"><%=KM_SUB_STRU.Attribute.SUB_NAME._ZhName %></td><!--SUB_NAME-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.K_SUB_ID.FieldName%>"><%=KM_SUB_STRU.Attribute.K_SUB_ID._ZhName %></td><!--K_SUB_ID-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SUB_CONTENT.FieldName%>"><%=KM_SUB_STRU.Attribute.SUB_CONTENT._ZhName %></td><!--SUB_CONTENT-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SUB_CLASS_ID.FieldName%>"><%=KM_SUB_STRU.Attribute.SUB_CLASS_ID._ZhName %></td><!--SUB_CLASS_ID-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SUB_EA_SIGN.FieldName%>"><%=KM_SUB_STRU.Attribute.SUB_EA_SIGN._ZhName %></td><!--SUB_EA_SIGN-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SUB_AUTHOR.FieldName%>"><%=KM_SUB_STRU.Attribute.SUB_AUTHOR._ZhName %></td><!--SUB_AUTHOR-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SUB_IS_READ.FieldName%>"><%=KM_SUB_STRU.Attribute.SUB_IS_READ._ZhName %></td><!--SUB_IS_READ-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SORT_NO.FieldName%>"><%=KM_SUB_STRU.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.IDPATH.FieldName%>"><%=KM_SUB_STRU.Attribute.IDPATH._ZhName %></td><!--IDPATH-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.KNAME.FieldName%>"><%=KM_SUB_STRU.Attribute.KNAME._ZhName %></td><!--KNAME-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SNAME.FieldName%>"><%=KM_SUB_STRU.Attribute.SNAME._ZhName %></td><!--SNAME-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.RNAME.FieldName%>"><%=KM_SUB_STRU.Attribute.RNAME._ZhName %></td><!--RNAME-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SUB_NUM.FieldName%>"><%=KM_SUB_STRU.Attribute.SUB_NUM._ZhName %></td><!--SUB_NUM-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.SUBOBJECT_NUM.FieldName%>"><%=KM_SUB_STRU.Attribute.SUBOBJECT_NUM._ZhName %></td><!--SUBOBJECT_NUM-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.USE_FLAG.FieldName%>"><%=KM_SUB_STRU.Attribute.USE_FLAG._ZhName %></td><!--USE_FLAG-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.EXP1.FieldName%>"><%=KM_SUB_STRU.Attribute.EXP1._ZhName %></td><!--EXP1-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.EXP2.FieldName%>"><%=KM_SUB_STRU.Attribute.EXP2._ZhName %></td><!--EXP2-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.EXP3.FieldName%>"><%=KM_SUB_STRU.Attribute.EXP3._ZhName %></td><!--EXP3-->
                    
                    
                    <td colname="<%=KM_SUB_STRU.Attribute.EXP4.FieldName%>"><%=KM_SUB_STRU.Attribute.EXP4._ZhName %></td><!--EXP4-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="ckb"><input type="checkbox" value="<%#((KM_SUB_STRU)Container.DataItem).SUB_ID%>" /></td>
                    <td>
                    <a href="KM_SUB_STRUEdit.aspx?SUB_ID=<%#((KM_SUB_STRU)Container.DataItem).SUB_ID %>">编辑</a>
                    <a href="KM_SUB_STRUBack.aspx?DelSUB_ID=<%#((KM_SUB_STRU)Container.DataItem).SUB_ID %>">删除</a>
                    <a href="KM_SUB_STRUShow.aspx?SUB_ID=<%#((KM_SUB_STRU)Container.DataItem).SUB_ID %>">详细</a>
                    </td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SUB_ID %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SUB_NAME %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).K_SUB_ID %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((KM_SUB_STRU)Container.DataItem).SUB_CONTENT) %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SUB_CLASS_ID %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SUB_EA_SIGN %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SUB_AUTHOR %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SUB_IS_READ %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).IDPATH %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).KNAME %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SNAME %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).RNAME %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SUB_NUM %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).SUBOBJECT_NUM %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).USE_FLAG %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).EXP1 %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).EXP2 %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).EXP3 %></td>
                    
                    
                    <td><%#((KM_SUB_STRU)Container.DataItem).EXP4 %></td>
                    
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