<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="APP_STATISTICSSel.aspx.cs" Inherits="APP_STATISTICSSel" %>
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
               <dt><%=APP_STATISTICS.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_ID' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="AF_ADDTIME">
               <dt><%=APP_STATISTICS.Attribute.AF_ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_AF_ADDTIME' type='text' readonly='readonly' onclick='setTime(this)' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="IP">
               <dt><%=APP_STATISTICS.Attribute.IP.ZhName %>：</dt><!--IP-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_IP' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="LONG">
               <dt><%=APP_STATISTICS.Attribute.LONG.ZhName %>：</dt><!--经度-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_LONG' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="LAT">
               <dt><%=APP_STATISTICS.Attribute.LAT.ZhName %>：</dt><!--纬度-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_LAT' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="DEVICE_SYS">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_SYS.ZhName %>：</dt><!--设备系统-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_DEVICE_SYS' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="VER_CODE">
               <dt><%=APP_STATISTICS.Attribute.VER_CODE.ZhName %>：</dt><!--应用版本号-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_VER_CODE' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="DEVICE_MODEL">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_MODEL.ZhName %>：</dt><!--设备型号-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_DEVICE_MODEL' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="STAFF_ID">
               <dt><%=APP_STATISTICS.Attribute.STAFF_ID.ZhName %>：</dt><!--员工编号-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_STAFF_ID' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="DEVICE_ID">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_ID.ZhName %>：</dt><!--设备ID-->
               <dd><span>
               
                    <textarea id='txtAPP_STATISTICS_DEVICE_ID' cols='1' rows='1' style='height:80px;width:450px;overflow:hidden;' 
                            runat='server'  />
               </span></dd>
        </dl>
         
            <dl colname="VER_NAME">
               <dt><%=APP_STATISTICS.Attribute.VER_NAME.ZhName %>：</dt><!--应用版本名-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_VER_NAME' type='text' runat='server' />
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
                    
                    
                    <td><%=APP_STATISTICS.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.AF_ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.IP._ZhName %></td><!--IP-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.LONG._ZhName %></td><!--经度-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.LAT._ZhName %></td><!--纬度-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.DEVICE_SYS._ZhName %></td><!--设备系统-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.VER_CODE._ZhName %></td><!--应用版本号-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.DEVICE_MODEL._ZhName %></td><!--设备型号-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.STAFF_ID._ZhName %></td><!--员工编号-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.DEVICE_ID._ZhName %></td><!--设备ID-->
                    
                    
                    <td><%=APP_STATISTICS.Attribute.VER_NAME._ZhName %></td><!--应用版本名-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).ID %></td>
                    
                    
                    <td><%#(((APP_STATISTICS)Container.DataItem).AF_ADDTIME == DateTime.MinValue) ? "" : ((APP_STATISTICS)Container.DataItem).AF_ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).IP %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).LONG %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).LAT %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).DEVICE_SYS %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).VER_CODE %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).DEVICE_MODEL %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).STAFF_ID %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((APP_STATISTICS)Container.DataItem).DEVICE_ID) %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).VER_NAME %></td>
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

