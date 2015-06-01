<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHKWKDIVKEYVALUESel2" CodeFile="HR_CHKWKDIVKEYVALUESel.aspx.cs" %>
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
         
            <dl colname="GroupId">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId.ZhName %>：</dt><!--组ID-->
               <dd><span>
                
                    <input id="txtGroupId" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DeviceID">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID.ZhName %>：</dt><!--设备ID-->
               <dd><span>
                
                    <input id="txtDeviceID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AIOTableName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName.ZhName %>：</dt><!--AIO表名-->
               <dd><span>
                
                    <input id="txtAIOTableName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AIOKeyFieldName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName.ZhName %>：</dt><!--AIO关键字段名-->
               <dd><span>
                
                    <input id="txtAIOKeyFieldName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OtherKeyFieldName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName.ZhName %>：</dt><!--其他系统关键字段名-->
               <dd><span>
                
                    <input id="txtOtherKeyFieldName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AIOKeyValue">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue.ZhName %>：</dt><!--AIO关键字段值-->
               <dd><span>
                
                    <input id="txtAIOKeyValue" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OtherKeyValue">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue.ZhName %>：</dt><!--其他系统关键字段值-->
               <dd><span>
                
                    <input id="txtOtherKeyValue" type="text" runat="server" />
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
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId._ZhName %></td><!--组ID-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID._ZhName %></td><!--设备ID-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName._ZhName %></td><!--AIO表名-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName._ZhName %></td><!--AIO关键字段名-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName._ZhName %></td><!--其他系统关键字段名-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue._ZhName %></td><!--AIO关键字段值-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue._ZhName %></td><!--其他系统关键字段值-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).GroupId %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).DeviceID %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOTableName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOKeyFieldName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyFieldName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOKeyValue %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyValue %></td>
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

