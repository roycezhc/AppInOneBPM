<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="APP_STATISTICSManage.aspx.cs" Inherits="APP_STATISTICSManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->
        
         
            <dl colname="APP_STATISTICS.ID">
               <dt><%=APP_STATISTICS.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_ID" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.AF_ADDTIME">
               <dt><%=APP_STATISTICS.Attribute.AF_ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_AF_ADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.IP">
               <dt><%=APP_STATISTICS.Attribute.IP.ZhName %>：</dt><!--IP-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_IP" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.LONG">
               <dt><%=APP_STATISTICS.Attribute.LONG.ZhName %>：</dt><!--经度-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_LONG" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.LAT">
               <dt><%=APP_STATISTICS.Attribute.LAT.ZhName %>：</dt><!--纬度-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_LAT" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.DEVICE_SYS">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_SYS.ZhName %>：</dt><!--设备系统-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_DEVICE_SYS" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.VER_CODE">
               <dt><%=APP_STATISTICS.Attribute.VER_CODE.ZhName %>：</dt><!--应用版本号-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_VER_CODE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.DEVICE_MODEL">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_MODEL.ZhName %>：</dt><!--设备型号-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_DEVICE_MODEL" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.STAFF_ID">
               <dt><%=APP_STATISTICS.Attribute.STAFF_ID.ZhName %>：</dt><!--员工编号-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_STAFF_ID" type="text" runat="server"  ck="{len:8,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.DEVICE_ID">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_ID.ZhName %>：</dt><!--设备ID-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_DEVICE_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="APP_STATISTICS.VER_NAME">
               <dt><%=APP_STATISTICS.Attribute.VER_NAME.ZhName %>：</dt><!--应用版本名-->
               <dd><span>
               
                    <input id="txtAPP_STATISTICS_VER_NAME" type="text" runat="server"  ck="{len:10,type:0}" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newAPP_STATISTICS" id="btn_New" type="button" value="新建" onclick="manager.newRecord('APP_STATISTICSEdit.aspx');" /></span></li>
            <li><span><input power="editAPP_STATISTICS" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('APP_STATISTICSEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newAPP_STATISTICS" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('APP_STATISTICSBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%--<td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.ID.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.AF_ADDTIME.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.AF_ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.IP.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.IP._ZhName %></td><!--IP-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.LONG.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.LONG._ZhName %></td><!--经度-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.LAT.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.LAT._ZhName %></td><!--纬度-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.DEVICE_SYS.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.DEVICE_SYS._ZhName %></td><!--设备系统-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.VER_CODE.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.VER_CODE._ZhName %></td><!--应用版本号-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.DEVICE_MODEL.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.DEVICE_MODEL._ZhName %></td><!--设备型号-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.STAFF_ID.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.STAFF_ID._ZhName %></td><!--员工编号-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.DEVICE_ID.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.DEVICE_ID._ZhName %></td><!--设备ID-->
                    
                    
                    <td data="{colname:'<%=APP_STATISTICS.Attribute.VER_NAME.LongName%>',show:1}"><%=APP_STATISTICS.Attribute.VER_NAME._ZhName %></td><!--应用版本名-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((APP_STATISTICS)Container.DataItem).ID%>" /></td>
                    <%-- <td>
                    <%#GetHtml(((APP_STATISTICS)Container.DataItem), new APP_STATISTICS(),
                        APP_STATISTICS.Attribute.ID, APP_STATISTICS.Attribute.ID)%>                    
                    </td>--%>
                   <%-- <td><%#showLeftLinks(((APP_STATISTICS)Container.DataItem).PATH, ((APP_STATISTICS)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).ID %></td>
                    
                    
                    <td><%#(((APP_STATISTICS)Container.DataItem).AF_ADDTIME == DateTime.MinValue) ? "" : ((APP_STATISTICS)Container.DataItem).AF_ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).IP %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).LONG %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).LAT %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).DEVICE_SYS %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).VER_CODE %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).DEVICE_MODEL %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).STAFF_ID %></td>
                    
                    
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
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>