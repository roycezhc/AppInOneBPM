<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMNSel" CodeFile="COLUMNSel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
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
            <dl colname="SHOW_NAME">
               <dt><%=TF_F_COLUMN.Attribute.SHOW_NAME.ZhName %>：</dt><!--显示名称-->
               <dd><span>
                
                    <input id="txtSHOW_NAME" type="text" runat="server" />
               </span></dd>
        </dl>

         <dl><dt></dt><dd class="btn">
         <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist" style="width:400px;">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td><%=TF_F_COLUMN.Attribute.COLUMN_ID._ZhName %></td><!--COLUMN_ID-->
                    <td><%=TF_F_COLUMN.Attribute.SHOW_NAME._ZhName %></td><!--显示名称-->
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.CTRL_TYPE._ZhName %></td><!--CTRL_TYPE-->
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.MAX_VAL._ZhName %></td><!--MAX_VAL-->
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.MIN_VAL._ZhName %></td><!--MIN_VAL-->
                    
                    
                    <td><%=TF_F_COLUMN.Attribute.IS_NEED._ZhName %></td><!--IS_NEED-->

                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).COLUMN_ID %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).SHOW_NAME %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).MAX_VAL %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).MIN_VAL %></td>
                    
                    
                    <td><%#((TF_F_COLUMN)Container.DataItem).IS_NEED %></td>
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

