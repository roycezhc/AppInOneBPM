<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_PART_STRUSel" CodeFile="KM_PART_STRUSel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <script src="../../Lib/Mdl/manage.js" type="text/javascript"></script>
    <script type="text/javascript">
        var selectedID = "";
        var selinfo = "";
        $(function () {
            var trs = $("#tbody-rows").find("tr");
            for (var i = 0; i < trs.length; i++) {
                var trObj = $(trs[i]);
                trObj.bind("click", trObj, function (e) {
                    selThis(e.data, trs);
                });
                trObj.bind("dblclick", trObj, function (e) { //作为选择窗体时生效，双击直接选中行，并关闭窗体
                    selThis(e.data, trs);
                    selok();
                });
            }
        });

        /*选中并返回*/
        function selok() {
            if (selinfo == "") {
                alert('请至少选择一个');
                return;
            }
            if (window.opener != null) {
                if (opener.getSelInfo(selinfo)) {
                    opener.getSelInfo(selinfo);
                    window.opener = null;
                    window.open('', '_self');
                    window.close();
                }
            } else {
                if (window.location.search.indexOf("ifr=") != -1) {
                    if (parent.getSelInfo) {
                        parent.getSelInfo(selinfo);
                    }
                    if (parent.closeIfrWin) {
                        parent.closeIfrWin();
                    }
                } else {
                    window.returnValue = selinfo; //返回一个JSON格式的字符串。 alert(window.returnValue);
                    window.close();
                }
            }
        }

        function selThis(el, trs) {
            var tds = el.children();
            selectedID = $(tds[0]).text();
            selinfo = "({ID:'" + selectedID + "',Name:'" + $(tds[1]).text() + "'})"; //选中td第一格
            //alert(selinfo);
            trs.removeClass("sel");
            el.addClass("sel");
        }        
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
  </div>
  <div class="topnav">
      <dl>
      <dt><a onclick="openNextArea(this);"></a><b>查询</b></dt>
      <dd><span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span></dd>
      <span><input id="btnSelOK" type="button" onclick="selok();" style="width:60px;" value="确定选择" /></span>
      </dl>
   </div>
   <div class="topfind hide"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_ID.ZhName %>：</dt><!--PART_ID-->
               <dd><span>
                
                    <input id="txtPART_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_NAME.ZhName %>：</dt><!--PART_NAME-->
               <dd><span>
                
                    <input id="txtPART_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.K_PART_ID.ZhName %>：</dt><!--K_PART_ID-->
               <dd><span>
                
                    <input id="txtK_PART_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_CONTENT.ZhName %>：</dt><!--PART_CONTENT-->
               <dd><span>
               
                    <textarea id="txtPART_CONTENT" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_CLASS_ID.ZhName %>：</dt><!--PART_CLASS_ID-->
               <dd><span>
                
                    <input id="txtPART_CLASS_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_EA_SIGN.ZhName %>：</dt><!--PART_EA_SIGN-->
               <dd><span>
                
                    <input id="txtPART_EA_SIGN" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_AUTHOR.ZhName %>：</dt><!--PART_AUTHOR-->
               <dd><span>
                
                    <input id="txtPART_AUTHOR" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_IS_READ.ZhName %>：</dt><!--PART_IS_READ-->
               <dd><span>
                
                    <input id="txtPART_IS_READ" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.SORT_NO.ZhName %>：</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.IDPATH.ZhName %>：</dt><!--IDPATH-->
               <dd><span>
               
                    <textarea id="txtIDPATH" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.KNAME.ZhName %>：</dt><!--KNAME-->
               <dd><span>
               
                    <textarea id="txtKNAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.SNAME.ZhName %>：</dt><!--SNAME-->
               <dd><span>
                
                    <input id="txtSNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.RNAME.ZhName %>：</dt><!--RNAME-->
               <dd><span>
                
                    <input id="txtRNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.SUB_NUM.ZhName %>：</dt><!--SUB_NUM-->
               <dd><span>
                
                    <input id="txtSUB_NUM" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.SUBOBJECT_NUM.ZhName %>：</dt><!--SUBOBJECT_NUM-->
               <dd><span>
                
                    <input id="txtSUBOBJECT_NUM" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.USE_FLAG.ZhName %>：</dt><!--USE_FLAG-->
               <dd><span>
                
                    <input id="txtUSE_FLAG" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP1.ZhName %>：</dt><!--EXP1-->
               <dd><span>
                
                    <input id="txtEXP1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP2.ZhName %>：</dt><!--EXP2-->
               <dd><span>
                
                    <input id="txtEXP2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP3.ZhName %>：</dt><!--EXP3-->
               <dd><span>
                
                    <input id="txtEXP3" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP4.ZhName %>：</dt><!--EXP4-->
               <dd><span>
                
                    <input id="txtEXP4" type="text" runat="server" />
               </span></dd>
        </dl>
    </div> 

        <div class="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_ID._ZhName %></td><!--PART_ID-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_NAME._ZhName %></td><!--PART_NAME-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.K_PART_ID._ZhName %></td><!--K_PART_ID-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_CONTENT._ZhName %></td><!--PART_CONTENT-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_CLASS_ID._ZhName %></td><!--PART_CLASS_ID-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_EA_SIGN._ZhName %></td><!--PART_EA_SIGN-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_AUTHOR._ZhName %></td><!--PART_AUTHOR-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.PART_IS_READ._ZhName %></td><!--PART_IS_READ-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.IDPATH._ZhName %></td><!--IDPATH-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.KNAME._ZhName %></td><!--KNAME-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.SNAME._ZhName %></td><!--SNAME-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.RNAME._ZhName %></td><!--RNAME-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.SUB_NUM._ZhName %></td><!--SUB_NUM-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.SUBOBJECT_NUM._ZhName %></td><!--SUBOBJECT_NUM-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.USE_FLAG._ZhName %></td><!--USE_FLAG-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.EXP1._ZhName %></td><!--EXP1-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.EXP2._ZhName %></td><!--EXP2-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.EXP3._ZhName %></td><!--EXP3-->
                    
                    
                    <td><%=KM_PART_STRU.Attribute.EXP4._ZhName %></td><!--EXP4-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_ID %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_NAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).K_PART_ID %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((KM_PART_STRU)Container.DataItem).PART_CONTENT) %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_CLASS_ID %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_EA_SIGN %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_AUTHOR %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_IS_READ %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).IDPATH %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).KNAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SNAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).RNAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SUB_NUM %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SUBOBJECT_NUM %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).USE_FLAG %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP1 %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP2 %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP3 %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP4 %></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        <div class="pages">
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

