<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUESTSel.aspx.cs" Inherits="WEC_REQUESTSel" %>
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
         
                <%=getFinder() %>

         <dl class="btn"><dd>
         <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=WEC_REQUEST.Attribute.TID._ZhName %></td><!--回复ID-->
                    
                    
                    <td><%=WEC_REQUEST.Attribute.AID._ZhName %></td><!--公众号ID-->
                    
                    
                    <td><%=WEC_REQUEST.Attribute.KEYWORD._ZhName %></td><!--关键字-->
                    
                    
                    <td><%=WEC_REQUEST.Attribute.MATCH_TYPE._ZhName %></td><!--匹配类型-->
                    
                    
                    <td><%=WEC_REQUEST.Attribute.MEMO._ZhName %></td><!--内容-->
                    
                    
                    <td><%=WEC_REQUEST.Attribute.KIND._ZhName %></td><!--回复类型-->
                    
                    
                    <td><%=WEC_REQUEST.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td><%=WEC_REQUEST.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).TID %></td>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).AID %></td>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).KEYWORD %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_REQUEST.Attribute.MATCH_TYPE, ((WEC_REQUEST)Container.DataItem).MATCH_TYPE)%></td>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).MEMO %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_REQUEST.Attribute.KIND, ((WEC_REQUEST)Container.DataItem).KIND)%></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_REQUEST.Attribute.STATUS, ((WEC_REQUEST)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_REQUEST)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_REQUEST)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
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

