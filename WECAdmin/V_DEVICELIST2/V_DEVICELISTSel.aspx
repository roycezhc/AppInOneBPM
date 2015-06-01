<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="V_DEVICELISTSel.aspx.cs" Inherits="V_DEVICELISTSel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
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
               <dt><%=V_DEVICELIST.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_ID' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="USER_ID">
               <dt><%=V_DEVICELIST.Attribute.USER_ID.ZhName %>：</dt><!--用户编号-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_USER_ID' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="DEVICE_ID">
               <dt><%=V_DEVICELIST.Attribute.DEVICE_ID.ZhName %>：</dt><!--TOKEN_I-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_DEVICE_ID' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="KIND">
               <dt><%=V_DEVICELIST.Attribute.KIND.ZhName %>：</dt><!--类型-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_KIND' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="DEBUG">
               <dt><%=V_DEVICELIST.Attribute.DEBUG.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_DEBUG' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=V_DEVICELIST.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_STATUS' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="AF_ADDTIEM">
               <dt><%=V_DEVICELIST.Attribute.AF_ADDTIEM.ZhName %>：</dt><!--AF_ADDT-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_AF_ADDTIEM' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="AF_EDITTIME">
               <dt><%=V_DEVICELIST.Attribute.AF_EDITTIME.ZhName %>：</dt><!--AF_EDIT-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_AF_EDITTIME' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="TOKEN_ID">
               <dt><%=V_DEVICELIST.Attribute.TOKEN_ID.ZhName %>：</dt><!--TOKEN_I-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_TOKEN_ID' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="STAFF_NAME">
               <dt><%=V_DEVICELIST.Attribute.STAFF_NAME.ZhName %>：</dt><!--员工姓名-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_STAFF_NAME' type='text' runat='server' />
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
                    
                    
                    <td><%=V_DEVICELIST.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td><%=V_DEVICELIST.Attribute.USER_ID._ZhName %></td><!--用户编号-->
                    
                    
                    <td><%=V_DEVICELIST.Attribute.DEVICE_ID._ZhName %></td><!--TOKEN_I-->
                    
                    
                    <td><%=V_DEVICELIST.Attribute.KIND._ZhName %></td><!--类型-->
                    
                    
                    <td><%=V_DEVICELIST.Attribute.DEBUG._ZhName %></td><!--状态-->
                    
                    
                    <td><%=V_DEVICELIST.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td><%=V_DEVICELIST.Attribute.AF_ADDTIEM._ZhName %></td><!--AF_ADDT-->
                    
                    
                    <td><%=V_DEVICELIST.Attribute.AF_EDITTIME._ZhName %></td><!--AF_EDIT-->
                    
                    
                    <td><%=V_DEVICELIST.Attribute.TOKEN_ID._ZhName %></td><!--TOKEN_I-->
                    
                    
                    <td><%=V_DEVICELIST.Attribute.STAFF_NAME._ZhName %></td><!--员工姓名-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).USER_ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).DEVICE_ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).KIND %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).DEBUG %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).STATUS %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).AF_ADDTIEM %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).AF_EDITTIME %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).TOKEN_ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).STAFF_NAME %></td>
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

