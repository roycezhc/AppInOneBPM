<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_tabSel.aspx.cs" Inherits="Ec_tabSel" %>
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
               <dt><%=Ec_tab.Attribute.Tabid.ZhName %>：</dt><!--Tabid-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Name">
               <dt><%=Ec_tab.Attribute.Name.ZhName %>：</dt><!--模块名-->
               <dd><span>
               
                    <input id="txtName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Presence">
               <dt><%=Ec_tab.Attribute.Presence.ZhName %>：</dt><!--Presenc-->
               <dd><span>
               
                    <input id="txtPresence" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Tabsequence">
               <dt><%=Ec_tab.Attribute.Tabsequence.ZhName %>：</dt><!--Tabsequ-->
               <dd><span>
               
                    <input id="txtTabsequence" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Tablabel">
               <dt><%=Ec_tab.Attribute.Tablabel.ZhName %>：</dt><!--选项卡标签-->
               <dd><span>
               
                    <input id="txtTablabel" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Modifiedby">
               <dt><%=Ec_tab.Attribute.Modifiedby.ZhName %>：</dt><!--Modifie-->
               <dd><span>
               
                    <input id="txtModifiedby" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Modifiedtime">
               <dt><%=Ec_tab.Attribute.Modifiedtime.ZhName %>：</dt><!--修改时间-->
               <dd><span>
               
                    <input id="txtModifiedtime" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Customized">
               <dt><%=Ec_tab.Attribute.Customized.ZhName %>：</dt><!--定制-->
               <dd><span>
               
                    <input id="txtCustomized" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Reportable">
               <dt><%=Ec_tab.Attribute.Reportable.ZhName %>：</dt><!--Reporta-->
               <dd><span>
               
                    <input id="txtReportable" type="text" runat="server" />
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
                    
                    
                    <td><%=Ec_tab.Attribute.Tabid._ZhName %></td><!--Tabid-->
                    
                    
                    <td><%=Ec_tab.Attribute.Name._ZhName %></td><!--模块名-->
                    
                    
                    <td><%=Ec_tab.Attribute.Presence._ZhName %></td><!--Presenc-->
                    
                    
                    <td><%=Ec_tab.Attribute.Tabsequence._ZhName %></td><!--Tabsequ-->
                    
                    
                    <td><%=Ec_tab.Attribute.Tablabel._ZhName %></td><!--选项卡标签-->
                    
                    
                    <td><%=Ec_tab.Attribute.Modifiedby._ZhName %></td><!--Modifie-->
                    
                    
                    <td><%=Ec_tab.Attribute.Modifiedtime._ZhName %></td><!--修改时间-->
                    
                    
                    <td><%=Ec_tab.Attribute.Customized._ZhName %></td><!--定制-->
                    
                    
                    <td><%=Ec_tab.Attribute.Reportable._ZhName %></td><!--Reporta-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((Ec_tab)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Name %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Presence %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Tabsequence %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Tablabel %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Modifiedby %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Modifiedtime %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Customized %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Reportable %></td>
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

