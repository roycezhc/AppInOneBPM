<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_TEMPUSERManage.aspx.cs" Inherits="SYS_TEMPUSERManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
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
         
            <dl colname="SYS_TEMPUSER.ID">
               <dt><%=SYS_TEMPUSER.Attribute.ID.ZhName %>：</dt><!--ID-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:8,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_TEMPUSER.NAME">
               <dt><%=SYS_TEMPUSER.Attribute.NAME.ZhName %>：</dt><!--姓名-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_TEMPUSER.CONAME">
               <dt><%=SYS_TEMPUSER.Attribute.CONAME.ZhName %>：</dt><!--单位-->
               <dd><span>
               
                    <input id="txtCONAME" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_TEMPUSER.PHONE">
               <dt><%=SYS_TEMPUSER.Attribute.PHONE.ZhName %>：</dt><!--手机号码-->
               <dd><span>
               
                    <input id="txtPHONE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_TEMPUSER.IP">
               <dt><%=SYS_TEMPUSER.Attribute.IP.ZhName %>：</dt><!--IP-->
               <dd><span>
               
                    <input id="txtIP" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_TEMPUSER.ADDTIME">
               <dt><%=SYS_TEMPUSER.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_TEMPUSER.LOGINNAME">
               <dt><%=SYS_TEMPUSER.Attribute.LOGINNAME.ZhName %>：</dt><!--登录名-->
               <dd><span>
               
                    <input id="txtLOGINNAME" type="text" runat="server"  ck="{len:20,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_TEMPUSER.PWD">
               <dt><%=SYS_TEMPUSER.Attribute.PWD.ZhName %>：</dt><!--密码-->
               <dd><span>
               
                    <input id="txtPWD" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_TEMPUSER.USER_ID">
               <dt><%=SYS_TEMPUSER.Attribute.USER_ID.ZhName %>：</dt><!--用户编号-->
               <dd><span>
               
                    <input id="txtUSER_ID" type="text" runat="server"  ck="{len:8,type:1}" />
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
            <li><span><input power="newSYS_TEMPUSER" id="btn_New" type="button" value="新建" onclick="manager.newRecord('SYS_TEMPUSEREdit.aspx');" /></span></li>
            <li><span><input power="editSYS_TEMPUSER" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('SYS_TEMPUSEREdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newSYS_TEMPUSER" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('SYS_TEMPUSERBack.aspx');" /></span></li>
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
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.ID.LongName%>',show:1}"><%=SYS_TEMPUSER.Attribute.ID._ZhName %></td><!--ID-->
                    
                    
                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.NAME.LongName%>',show:1}"><%=SYS_TEMPUSER.Attribute.NAME._ZhName %></td><!--姓名-->
                    
                    
                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.CONAME.LongName%>',show:1}"><%=SYS_TEMPUSER.Attribute.CONAME._ZhName %></td><!--单位-->
                    
                    
                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.PHONE.LongName%>',show:1}"><%=SYS_TEMPUSER.Attribute.PHONE._ZhName %></td><!--手机号码-->
                    
                    
                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.IP.LongName%>',show:1}"><%=SYS_TEMPUSER.Attribute.IP._ZhName %></td><!--IP-->
                    
                    
                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.ADDTIME.LongName%>',show:1}"><%=SYS_TEMPUSER.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.LOGINNAME.LongName%>',show:1}"><%=SYS_TEMPUSER.Attribute.LOGINNAME._ZhName %></td><!--登录名-->
                    
                    
                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.PWD.LongName%>',show:1}"><%=SYS_TEMPUSER.Attribute.PWD._ZhName %></td><!--密码-->
                    
                    
                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.USER_ID.LongName%>',show:1}"><%=SYS_TEMPUSER.Attribute.USER_ID._ZhName %></td><!--用户编号-->

                    <td data="{colname:'<%=SYS_TEMPUSER.Attribute.EMAIL.LongName%>',show:1}">qq</td><!--用户编号-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_TEMPUSER)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((SYS_TEMPUSER)Container.DataItem).PATH, ((SYS_TEMPUSER)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).CONAME %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).PHONE %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).IP %></td>
                    
                    
                    <td><%#(((SYS_TEMPUSER)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((SYS_TEMPUSER)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).LOGINNAME %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).PWD %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).USER_ID %></td>

                    <td><%#((SYS_TEMPUSER)Container.DataItem).EMAIL %></td>
                    
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