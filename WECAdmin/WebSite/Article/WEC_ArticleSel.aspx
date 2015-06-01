<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ArticleSel.aspx.cs" Inherits="WEC_ArticleSel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });

    function selThis_B(tds) {
        var tdObj = $(tds[0]);
        var aObj = tdObj.find("a");
        if (aObj.length > 0) {
            _selERR = "不能选择有子节点的数据！";
            _selOK = false;
        }
    }
    function selOK_B(id) {
        //alert(id);
        $("input[id$='hidSelID']").val(id);
        //alert($("input[id$='hidSelID']").val());
        __doPostBack("ctl00$cphBody$LinkButton1", "");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="ID">
               <dt><%=WEC_Article.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CID">
               <dt><%=WEC_Article.Attribute.CID.ZhName %>：</dt><!--栏目编号-->
               <dd><span>
               
                    <input id="txtCID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AID">
               <dt><%=WEC_Article.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TITLE">
               <dt><%=WEC_Article.Attribute.TITLE.ZhName %>：</dt><!--标题-->
               <dd><span>
               
                    <input id="txtTITLE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DES">
               <dt><%=WEC_Article.Attribute.DES.ZhName %>：</dt><!--描述-->
               <dd><span>
               
                    <textarea id="txtDES" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="CONTENT">
               <dt><%=WEC_Article.Attribute.CONTENT.ZhName %>：</dt><!--内容-->
               <dd><span>
               
                    <input id="txtCONTENT" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="URL">
               <dt><%=WEC_Article.Attribute.URL.ZhName %>：</dt><!--外链地址-->
               <dd><span>
               
                    <textarea id="txtURL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PIC_URL">
               <dt><%=WEC_Article.Attribute.PIC_URL.ZhName %>：</dt><!--图片地址-->
               <dd><span>
               
                    <textarea id="txtPIC_URL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="MODEL_ID">
               <dt><%=WEC_Article.Attribute.MODEL_ID.ZhName %>：</dt><!--模版编号-->
               <dd><span>
               
                    <input id="txtMODEL_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl class="btn"><dd>
         <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=WEC_Article.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td><%=WEC_Article.Attribute.CID._ZhName %></td><!--栏目编号-->
                    
                    
                    <td><%=WEC_Article.Attribute.AID._ZhName %></td><!--公众号编号-->
                    
                    
                    <td><%=WEC_Article.Attribute.TITLE._ZhName %></td><!--标题-->
                    
                    
                    <td><%=WEC_Article.Attribute.DES._ZhName %></td><!--描述-->
                    
                    
                    <td><%=WEC_Article.Attribute.CONTENT._ZhName %></td><!--内容-->
                    
                    
                    <td><%=WEC_Article.Attribute.URL._ZhName %></td><!--外链地址-->
                    
                    
                    <td><%=WEC_Article.Attribute.PIC_URL._ZhName %></td><!--图片地址-->
                    
                    
                    <td><%=WEC_Article.Attribute.MODEL_ID._ZhName %></td><!--模版编号-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_Article)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).CID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).AID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).DES %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).CONTENT %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).URL %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).PIC_URL %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).MODEL_ID %></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        <div class="path-url hide">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
        <div class="pages">
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

