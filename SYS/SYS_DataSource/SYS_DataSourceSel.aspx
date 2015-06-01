<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_DATASOURCESel" CodeFile="SYS_DATASOURCESel.aspx.cs" %>
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
         
            <dl colname="ID">
               <dt><%=SYS_DATASOURCE.Attribute.ID.ZhName %>：</dt><!--自动标识-->
               <dd><span>
                
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SourceConnectString">
               <dt><%=SYS_DATASOURCE.Attribute.SourceConnectString.ZhName %>：</dt><!--数据源连接字符串-->
               <dd><span>
                
                    <input id="txtSourceConnectString" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SourceType">
               <dt><%=SYS_DATASOURCE.Attribute.SourceType.ZhName %>：</dt><!--数据源类型-->
               <dd><span>
                
                    <input id="txtSourceType" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SourceName">
               <dt><%=SYS_DATASOURCE.Attribute.SourceName.ZhName %>：</dt><!--数据源简称-->
               <dd><span>
                
                    <input id="txtSourceName" type="text" runat="server" />
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
                    
                    
                    <td><%=SYS_DATASOURCE.Attribute.ID._ZhName %></td><!--自动标识-->
                    
                    
                    <td><%=SYS_DATASOURCE.Attribute.SourceConnectString._ZhName %></td><!--数据源连接字符串-->
                    
                    
                    <td><%=SYS_DATASOURCE.Attribute.SourceType._ZhName %></td><!--数据源类型-->
                    
                    
                    <td><%=SYS_DATASOURCE.Attribute.SourceName._ZhName %></td><!--数据源简称-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).SourceConnectString %></td>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).SourceType %></td>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).SourceName %></td>
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

