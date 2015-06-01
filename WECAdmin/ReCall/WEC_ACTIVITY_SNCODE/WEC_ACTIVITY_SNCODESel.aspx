<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITY_SNCODESel.aspx.cs" Inherits="WEC_ACTIVITY_SNCODESel" %>
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
         
            <dl colname="ID">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SN_CODE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SN_CODE.ZhName %>：</dt><!--SN码-->
               <dd><span>
               
                    <input id="txtSN_CODE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AWARD_TYPE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE.ZhName %>：</dt><!--奖品类别-->
               <dd><span>
               
                    <input id="txtAWARD_TYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="PHONE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.PHONE.ZhName %>：</dt><!--领取者手机号-->
               <dd><span>
               
                    <input id="txtPHONE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="WX_CODE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.WX_CODE.ZhName %>：</dt><!--领取者微信码-->
               <dd><span>
               
                    <input id="txtWX_CODE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ZJ_TIME">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME.ZhName %>：</dt><!--中奖时间-->
               <dd><span>
               
                    <input id="txtZJ_TIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SY_TIME">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SY_TIME.ZhName %>：</dt><!--使用时间-->
               <dd><span>
               
                    <input id="txtSY_TIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="A_ID">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.A_ID.ZhName %>：</dt><!--活动ID-->
               <dd><span>
               
                    <input id="txtA_ID" type="text" runat="server" />
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
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.SN_CODE._ZhName %></td><!--SN码-->
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE._ZhName %></td><!--奖品类别-->
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.PHONE._ZhName %></td><!--领取者手机号-->
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.WX_CODE._ZhName %></td><!--领取者微信码-->
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME._ZhName %></td><!--中奖时间-->
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.SY_TIME._ZhName %></td><!--使用时间-->
                    
                    
                    <td><%=WEC_ACTIVITY_SNCODE.Attribute.A_ID._ZhName %></td><!--活动ID-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).SN_CODE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).AWARD_TYPE %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_ACTIVITY_SNCODE.Attribute.STATUS, ((WEC_ACTIVITY_SNCODE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).PHONE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).WX_CODE %></td>
                    
                    
                    <td><%#(((WEC_ACTIVITY_SNCODE)Container.DataItem).ZJ_TIME == DateTime.MinValue) ? "" : ((WEC_ACTIVITY_SNCODE)Container.DataItem).ZJ_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((WEC_ACTIVITY_SNCODE)Container.DataItem).SY_TIME == DateTime.MinValue) ? "" : ((WEC_ACTIVITY_SNCODE)Container.DataItem).SY_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).A_ID %></td>
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

