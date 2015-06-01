<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_TEMPUSERSel.aspx.cs" Inherits="SYS_TEMPUSERSel" %>
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
               <dt><%=SYS_TEMPUSER.Attribute.ID.ZhName %>：</dt><!--ID-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="NAME">
               <dt><%=SYS_TEMPUSER.Attribute.NAME.ZhName %>：</dt><!--姓名-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CONAME">
               <dt><%=SYS_TEMPUSER.Attribute.CONAME.ZhName %>：</dt><!--单位-->
               <dd><span>
               
                    <input id="txtCONAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PHONE">
               <dt><%=SYS_TEMPUSER.Attribute.PHONE.ZhName %>：</dt><!--手机号码-->
               <dd><span>
               
                    <input id="txtPHONE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="IP">
               <dt><%=SYS_TEMPUSER.Attribute.IP.ZhName %>：</dt><!--IP-->
               <dd><span>
               
                    <input id="txtIP" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=SYS_TEMPUSER.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LOGINNAME">
               <dt><%=SYS_TEMPUSER.Attribute.LOGINNAME.ZhName %>：</dt><!--登录名-->
               <dd><span>
               
                    <input id="txtLOGINNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PWD">
               <dt><%=SYS_TEMPUSER.Attribute.PWD.ZhName %>：</dt><!--密码-->
               <dd><span>
               
                    <input id="txtPWD" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="USER_ID">
               <dt><%=SYS_TEMPUSER.Attribute.USER_ID.ZhName %>：</dt><!--用户编号-->
               <dd><span>
               
                    <input id="txtUSER_ID" type="text" runat="server" />
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
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.ID._ZhName %></td><!--ID-->
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.NAME._ZhName %></td><!--姓名-->
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.CONAME._ZhName %></td><!--单位-->
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.PHONE._ZhName %></td><!--手机号码-->
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.IP._ZhName %></td><!--IP-->
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.LOGINNAME._ZhName %></td><!--登录名-->
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.PWD._ZhName %></td><!--密码-->
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.USER_ID._ZhName %></td><!--用户编号-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).CONAME %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).PHONE %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).IP %></td>
                    
                    
                    <td><%#(((SYS_TEMPUSER)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((SYS_TEMPUSER)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).LOGINNAME %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).PWD %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).USER_ID %></td>
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

