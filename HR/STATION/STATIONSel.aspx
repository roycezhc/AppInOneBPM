<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STATIONSel" CodeFile="STATIONSel.aspx.cs" %>
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
   <div class="topfindl"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="STATION_ID">
               <dt><%=HR_STATION.Attribute.STATION_ID.ZhName %>：</dt><!--岗位编号-->
               <dd><span>
                
                    <input id="txtSTATION_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATION_NAME">
               <dt><%=HR_STATION.Attribute.STATION_NAME.ZhName %>：</dt><!--岗位名称-->
               <dd><span>
                
                    <input id="txtSTATION_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PID">
               <dt><%=HR_STATION.Attribute.PID.ZhName %>：</dt><!--父编号-->
               <dd><span>
                
                    <input id="txtPID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PATH">
               <dt><%=HR_STATION.Attribute.PATH.ZhName %>：</dt><!--编号路径-->
               <dd><span>
                
                    <input id="txtPATH" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SUB_NUM">
               <dt><%=HR_STATION.Attribute.SUB_NUM.ZhName %>：</dt><!--子岗位个数-->
               <dd><span>
                
                    <input id="txtSUB_NUM" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SORT_NO">
               <dt><%=HR_STATION.Attribute.SORT_NO.ZhName %>：</dt><!--序号-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ORG_ID">
               <dt><%=HR_STATION.Attribute.ORG_ID.ZhName %>：</dt><!--机构ID-->
               <dd><span>
                
                    <input id="txtORG_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DEPT_ID">
               <dt><%=HR_STATION.Attribute.DEPT_ID.ZhName %>：</dt><!--部门ID-->
               <dd><span>
                
                    <input id="txtDEPT_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl><dt></dt><dd class="btn">
         <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=HR_STATION.Attribute.STATION_ID._ZhName %></td><!--岗位编号-->
                    
                    
                    <td><%=HR_STATION.Attribute.STATION_NAME._ZhName %></td><!--岗位名称-->
                    
                    
                    <td><%=HR_STATION.Attribute.PID._ZhName %></td><!--父编号-->
                    
                    
                    <td><%=HR_STATION.Attribute.PATH._ZhName %></td><!--编号路径-->
                    
                    
                    <td><%=HR_STATION.Attribute.SUB_NUM._ZhName %></td><!--子岗位个数-->
                    
                    
                    <td><%=HR_STATION.Attribute.SORT_NO._ZhName %></td><!--序号-->
                    
                    
                    <td><%=HR_STATION.Attribute.ORG_ID._ZhName %></td><!--机构ID-->
                    
                    
                    <td><%=HR_STATION.Attribute.DEPT_ID._ZhName %></td><!--部门ID-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((HR_STATION)Container.DataItem).STATION_ID %></td>
                    
                    
                    <td><%#((HR_STATION)Container.DataItem).STATION_NAME %></td>
                    
                    
                    <td><%#((HR_STATION)Container.DataItem).PID %></td>
                    
                    
                    <td><%#((HR_STATION)Container.DataItem).PATH %></td>
                    
                    
                    <td><%#((HR_STATION)Container.DataItem).SUB_NUM %></td>
                    
                    
                    <td><%#((HR_STATION)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#((HR_STATION)Container.DataItem).ORG_ID %></td>
                    
                    
                    <td><%#((HR_STATION)Container.DataItem).DEPT_ID %></td>
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

