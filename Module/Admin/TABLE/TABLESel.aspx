<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TABLESel2" CodeFile="TABLESel.aspx.cs" %>
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
    <dl><dt><b>数据表选择</b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="TB_NAME">
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>：</dt><!--表名称-->
               <dd><span>
                
                    <input id="txtTB_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CH_NAME">
               <dt><%=TF_TABLE.Attribute.CH_NAME.ZhName %>：</dt><!--中文名-->
               <dd><span>
                
                    <input id="txtCH_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TB_TYPE">
               <dt><%=TF_TABLE.Attribute.TB_TYPE.ZhName %>：</dt><!--表类型-->
               <dd><span>
               
                    <select id="txtTB_TYPE" runat="server" >
                    </select>
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
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_ID._ZhName %></td><!--表ID-->
                    
                     <td><%=TF_TABLE.Attribute.CH_NAME._ZhName %></td><!--中文名-->
                    <td><%=TF_TABLE.Attribute.TB_NAME._ZhName %></td><!--表名称-->
                  <%--  <td><%=TF_TABLE.Attribute.M_TB_ID._ZhName %></td><!--主表ID-->--%>
                    
                    
                 <%--   <td><%=TF_TABLE.Attribute.SORT_NO._ZhName %></td><!--序号-->--%>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_TYPE._ZhName %></td><!--表类型-->
                    
                    
                    <%--<td><%=TF_TABLE.Attribute.NOTE._ZhName %></td><!--NOTE-->--%>
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                    <td><%#((TF_TABLE)Container.DataItem).TB_ID %></td>
                    
                    <td><%#((TF_TABLE)Container.DataItem).CH_NAME %></td>
                    <td><%#((TF_TABLE)Container.DataItem).TB_NAME %></td>
                   <%-- <td><%#((TF_TABLE)Container.DataItem).M_TB_ID %></td>
                    <td><%#((TF_TABLE)Container.DataItem).SORT_NO %></td>--%>
                    <td><%#FormHelper.GetText(TF_TABLE.Attribute.TB_TYPE, ((TF_TABLE)Container.DataItem).TB_TYPE)%></td>
                    <%-- <td><%#((TF_TABLE)Container.DataItem).NOTE %></td>--%>
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

