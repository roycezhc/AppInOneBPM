<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_USERSel" CodeFile="USERSel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <script src="../../Lib/Mdl/manage.js" type="text/javascript"></script>
    <script type="text/javascript">
        var selectedID = "";
        var selinfo = "";
        $(function () {
            var trs = $("#tbody-rows").find("tr");
            for (var i = 0; i < trs.length; i++) {
                var trObj = $(trs[i]);
                trObj.bind("click", trObj, function (e) {
                    selThis(e.data, trs);
                });
                trObj.bind("dblclick", trObj, function (e) { //作为选择窗体时生效，双击直接选中行，并关闭窗体
                    selThis(e.data, trs);
                    selok();
                });
            }
        });

        /*选中并返回*/
        function selok() {
            if (selinfo == "") {
                alert('请至少选择一个');
                return;
            }
            if (window.opener != null) {
                if (opener.getSelInfo(selinfo)) {
                    opener.getSelInfo(selinfo);
                    window.opener = null;
                    window.open('', '_self');
                    window.close();
                }
            } else {
                if (window.location.search.indexOf("ifr=") != -1) {
                    if (parent.getSelInfo) {
                        parent.getSelInfo(selinfo);
                    }
                    if (parent.closeIfrWin) {
                        parent.closeIfrWin();
                    }
                } else {
                    window.returnValue = selinfo; //返回一个JSON格式的字符串。 alert(window.returnValue);
                    window.close();
                }
            }
        }

        function selThis(el, trs) {
            var tds = el.children();
            selectedID = $(tds[0]).text();
            selinfo = "({ID:'" + selectedID + "',Name:'" + $(tds[1]).text() + "'})"; //选中td第一格
            //alert(selinfo);
            trs.removeClass("sel");
            el.addClass("sel");
        }        
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
  </div>
  <div class="topnav">
      <dl>
      <dt><a onclick="openNextArea(this);"></a><b>查询</b></dt>
      <dd><span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span></dd>
      <span><input id="btnSelOK" type="button" onclick="selok();" style="width:60px;" value="确定选择" /></span>
      </dl>
   </div>
   <div class="topfind hide"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl>
               <dt><%=SYS_USER.Attribute.USER_ID.ZhName %>：</dt><!--用户标识-->
               <dd><span>
                
                    <input id="txtUSER_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.USER_NAME.ZhName %>：</dt><!--用户名-->
               <dd><span>
                
                    <input id="txtUSER_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.PASS.ZhName %>：</dt><!--密码-->
               <dd><span>
                
                    <input id="txtPASS" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.EMAIL.ZhName %>：</dt><!--内部邮件-->
               <dd><span>
                
                    <input id="txtEMAIL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.LOGIN_IPS.ZhName %>：</dt><!--可登录IP地址集合-->
               <dd><span>
                
                    <input id="txtLOGIN_IPS" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.USE_FLAG.ZhName%>：</dt><!--状态标志-->
               <dd><span>
               
                    <select id="txtSTATE_FLAG" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.EDITTIME.ZhName%>：</dt><!--修改时间-->
               <dd><span>
               
                    <input id="txtEDITIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.ADDTIME.ZhName %>：</dt><!--录入时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.USER_TYPE.ZhName %>：</dt><!--用户类型-->
               <dd><span>
               
                    <select id="txtUSER_TYPE" runat="server" >
                    </select>
               </span></dd>
        </dl>
    </div> 

        <div class="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=SYS_USER.Attribute.USER_ID._ZhName %></td><!--用户标识-->
                    
                    
                    <td><%=SYS_USER.Attribute.USER_NAME._ZhName %></td><!--用户名-->
                    
                    
                    <td><%=SYS_USER.Attribute.PASS._ZhName %></td><!--密码-->
                    
                    
                    <td><%=SYS_USER.Attribute.EMAIL._ZhName %></td><!--内部邮件-->
                    
                    
                    <td><%=SYS_USER.Attribute.LOGIN_IPS._ZhName %></td><!--可登录IP地址集合-->
                    
                    
                    <td><%=SYS_USER.Attribute.USE_FLAG._ZhName%></td><!--状态标志-->
                    
                    
                    <td><%=SYS_USER.Attribute.EDITTIME._ZhName%></td><!--修改时间-->
                    
                    
                    <td><%=SYS_USER.Attribute.ADDTIME._ZhName %></td><!--录入时间-->
                    
                    
                    <td><%=SYS_USER.Attribute.USER_TYPE._ZhName %></td><!--用户类型-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((SYS_USER)Container.DataItem).USER_ID %></td>
                    
                    
                    <td><%#((SYS_USER)Container.DataItem).USER_NAME %></td>
                    
                    
                    <td><%#((SYS_USER)Container.DataItem).PASS %></td>
                    
                    
                    <td><%#((SYS_USER)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((SYS_USER)Container.DataItem).LOGIN_IPS %></td>
                    
                    
                    <td><%#FormHelper.GetText(SYS_USER.Attribute.USE_FLAG, ((SYS_USER)Container.DataItem).USE_FLAG)%></td>
                    
                    
                    <td><%#(((SYS_USER)Container.DataItem).EDITTIME == DateTime.MinValue) ? "" : ((SYS_USER)Container.DataItem).EDITTIME.ToString("yyyy-MM-dd HH:mm")%></td>
                    
                    
                    <td><%#(((SYS_USER)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((SYS_USER)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#FormHelper.GetText(SYS_USER.Attribute.USER_TYPE, ((SYS_USER)Container.DataItem).USER_TYPE)%></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        <div class="pages">
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

