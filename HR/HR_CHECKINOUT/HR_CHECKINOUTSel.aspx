<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKINOUTSel" CodeFile="HR_CHECKINOUTSel.aspx.cs" %>
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
         
            <dl colname="USERID">
               <dt><%=HR_CHECKINOUT.Attribute.USERID.ZhName %>：</dt><!--USERID-->
               <dd><span>
                
                    <input id="txtUSERID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CHECKTIME">
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTIME.ZhName %>：</dt><!--CHECKTIME-->
               <dd><span>
               
                    <input id="txtCHECKTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STAFF_ID">
               <dt><%=HR_CHECKINOUT.Attribute.STAFF_ID.ZhName %>：</dt><!--STAFF_ID-->
               <dd><span>
                
                    <input id="txtSTAFF_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CHECKTYPE">
               <dt><%=HR_CHECKINOUT.Attribute.CHECKTYPE.ZhName %>：</dt><!--CHECKTYPE-->
               <dd><span>
                
                    <input id="txtCHECKTYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="VERIFYCODE">
               <dt><%=HR_CHECKINOUT.Attribute.VERIFYCODE.ZhName %>：</dt><!--VERIFYCODE-->
               <dd><span>
                
                    <input id="txtVERIFYCODE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SENSORID">
               <dt><%=HR_CHECKINOUT.Attribute.SENSORID.ZhName %>：</dt><!--SENSORID-->
               <dd><span>
                
                    <input id="txtSENSORID" type="text" runat="server" />
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
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.USERID._ZhName %></td><!--USERID-->
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.CHECKTIME._ZhName %></td><!--CHECKTIME-->
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.STAFF_ID._ZhName %></td><!--STAFF_ID-->
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.CHECKTYPE._ZhName %></td><!--CHECKTYPE-->
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.VERIFYCODE._ZhName %></td><!--VERIFYCODE-->
                    
                    
                    <td><%=HR_CHECKINOUT.Attribute.SENSORID._ZhName %></td><!--SENSORID-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).USERID %></td>
                    
                    
                    <td><%#(((HR_CHECKINOUT)Container.DataItem).CHECKTIME == DateTime.MinValue) ? "" : ((HR_CHECKINOUT)Container.DataItem).CHECKTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).STAFF_ID %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).CHECKTYPE %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).VERIFYCODE %></td>
                    
                    
                    <td><%#((HR_CHECKINOUT)Container.DataItem).SENSORID %></td>
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

