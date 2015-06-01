<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_entitynameSel.aspx.cs" Inherits="Ec_entitynameSel" %>
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
         
            <dl colname="Tabid">
               <dt><%=Ec_entityname.Attribute.Tabid.ZhName %>：</dt><!--Tabid-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Modulename">
               <dt><%=Ec_entityname.Attribute.Modulename.ZhName %>：</dt><!--IsTab英文-->
               <dd><span>
               
                    <input id="txtModulename" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Tablename">
               <dt><%=Ec_entityname.Attribute.Tablename.ZhName %>：</dt><!--表名-->
               <dd><span>
               
                    <input id="txtTablename" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Fieldname">
               <dt><%=Ec_entityname.Attribute.Fieldname.ZhName %>：</dt><!--表NAME-->
               <dd><span>
               
                    <input id="txtFieldname" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Entityidfield">
               <dt><%=Ec_entityname.Attribute.Entityidfield.ZhName %>：</dt><!--表ID-->
               <dd><span>
               
                    <input id="txtEntityidfield" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Remarks">
               <dt><%=Ec_entityname.Attribute.Remarks.ZhName %>：</dt><!--IsTab中文-->
               <dd><span>
               
                    <input id="txtRemarks" type="text" runat="server" />
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
                    
                    
                    <td><%=Ec_entityname.Attribute.Tabid._ZhName %></td><!--Tabid-->
                    
                    
                    <td><%=Ec_entityname.Attribute.Modulename._ZhName %></td><!--IsTab英文-->
                    
                    
                    <td><%=Ec_entityname.Attribute.Tablename._ZhName %></td><!--表名-->
                    
                    
                    <td><%=Ec_entityname.Attribute.Fieldname._ZhName %></td><!--表NAME-->
                    
                    
                    <td><%=Ec_entityname.Attribute.Entityidfield._ZhName %></td><!--表ID-->
                    
                    
                    <td><%=Ec_entityname.Attribute.Remarks._ZhName %></td><!--IsTab中文-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((Ec_entityname)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Modulename %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Tablename %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Fieldname %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Entityidfield %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Remarks %></td>
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

