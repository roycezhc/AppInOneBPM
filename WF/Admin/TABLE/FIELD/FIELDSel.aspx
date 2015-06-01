<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TB_FIELDSel2" CodeFile="FIELDSel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
        <script src="../../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script type="text/javascript">$(function () { Sel_Load(); });</script>
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows();
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

    function setSelInfo(tds, index) {
        selInfo = "({ID:'" + selectedID + "',Name:'" + $(tds[index + 1]).text() + "',Code:'" + $(tds[index + 2]).text() + "'})"; //选中td第一格
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b>数据表字段选择</b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        

            <dl colname="FIELD_NAME">
               <dt><%=TF_TB_FIELD.Attribute.FIELD_NAME.ZhName %>：</dt><!--字段名-->
               <dd><span>
                
                    <input id="txtFIELD_NAME" type="text" runat="server" />
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
                    
                    <td class="first"></td><!--序号-->
                    <td><%=TF_TB_FIELD.Attribute.FIELD_ID._ZhName %></td><!--ID-->
                    <td><%=TF_TB_FIELD.Attribute.NOTE._ZhName %></td><!--中文名-->
                    <td><%=TF_TB_FIELD.Attribute.TYPE_CODE._ZhName %></td><!--字段名-->
                    <td><%=TF_TB_FIELD.Attribute.FIELD_NAME._ZhName %></td><!--字段名-->
                    <td><%=TF_TB_FIELD.Attribute.IS_NULL._ZhName %></td><!--IS_NULL-->
                    <td><%=TF_TB_FIELD.Attribute.CTRL_TYPE._ZhName %></td><!--默认控件类型-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                     <td class="first"></td>
                     <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_ID %></td>
                     <td><%#((TF_TB_FIELD)Container.DataItem).NOTE %></td>
                     <td><%#((TF_TB_FIELD)Container.DataItem).TYPE_CODE%></td>
                     <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_NAME %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).IS_NULL %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).CTRL_TYPE %></td>
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

