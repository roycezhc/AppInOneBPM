<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_blocksSel.aspx.cs" Inherits="Ec_blocksSel" %>
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
         
            <dl colname="Blockid">
               <dt><%=Ec_blocks.Attribute.Blockid.ZhName %>：</dt><!--Blockid-->
               <dd><span>
               
                    <input id="txtBlockid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Tabid">
               <dt><%=Ec_blocks.Attribute.Tabid.ZhName %>：</dt><!--模块id-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Blocklabel">
               <dt><%=Ec_blocks.Attribute.Blocklabel.ZhName %>：</dt><!--显示区域名称-->
               <dd><span>
               
                    <input id="txtBlocklabel" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Sequence">
               <dt><%=Ec_blocks.Attribute.Sequence.ZhName %>：</dt><!--显示顺序-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Show_title">
               <dt><%=Ec_blocks.Attribute.Show_title.ZhName %>：</dt><!--标题-->
               <dd><span>
               
                    <input id="txtShow_title" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Visible">
               <dt><%=Ec_blocks.Attribute.Visible.ZhName %>：</dt><!--是否可见-->
               <dd><span>
               
                    <input id="txtVisible" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Create_view">
               <dt><%=Ec_blocks.Attribute.Create_view.ZhName %>：</dt><!--Create_-->
               <dd><span>
               
                    <input id="txtCreate_view" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Edit_view">
               <dt><%=Ec_blocks.Attribute.Edit_view.ZhName %>：</dt><!--Edit_vi-->
               <dd><span>
               
                    <input id="txtEdit_view" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Detail_view">
               <dt><%=Ec_blocks.Attribute.Detail_view.ZhName %>：</dt><!--Detail_-->
               <dd><span>
               
                    <input id="txtDetail_view" type="text" runat="server" />
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
                    
                    
                    <td><%=Ec_blocks.Attribute.Blockid._ZhName %></td><!--Blockid-->
                    
                    
                    <td><%=Ec_blocks.Attribute.Tabid._ZhName %></td><!--模块id-->
                    
                    
                    <td><%=Ec_blocks.Attribute.Blocklabel._ZhName %></td><!--显示区域名称-->
                    
                    
                    <td><%=Ec_blocks.Attribute.Sequence._ZhName %></td><!--显示顺序-->
                    
                    
                    <td><%=Ec_blocks.Attribute.Show_title._ZhName %></td><!--标题-->
                    
                    
                    <td><%=Ec_blocks.Attribute.Visible._ZhName %></td><!--是否可见-->
                    
                    
                    <td><%=Ec_blocks.Attribute.Create_view._ZhName %></td><!--Create_-->
                    
                    
                    <td><%=Ec_blocks.Attribute.Edit_view._ZhName %></td><!--Edit_vi-->
                    
                    
                    <td><%=Ec_blocks.Attribute.Detail_view._ZhName %></td><!--Detail_-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((Ec_blocks)Container.DataItem).Blockid %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Blocklabel %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Sequence %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Show_title %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Visible %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Create_view %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Edit_view %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Detail_view %></td>
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

