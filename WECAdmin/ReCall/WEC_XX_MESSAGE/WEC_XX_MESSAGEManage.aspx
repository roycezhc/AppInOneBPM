<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_XX_MESSAGEManage.aspx.cs" Inherits="WEC_XX_MESSAGEManage" %>
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
        $("#display_search").click(function () {
            $(".topfind").toggleClass("hide");   if($("#display_search").val()=="显示查询")$("#display_search").val("隐藏查询");else $("#display_search").val("显示查询"); 
        });
//        setInterval(function () {
//            location.reload();

//        }, 100000);

        //        $("a").click(function () {
        //            console.log(this.);
        //            //window.open("WEC_XX_MESSAGEEdit.aspx", "", "width=600,height=600,position=absolute,left=" + Math.ceil((window.screen.width - 600) / 2) + ",top=" + Math.ceil((window.screen.height - 600) / 2) + "");
        //            
        //        });

    });

    function responseUser(openid,username) {
        window.open("WEC_XX_MESSAGEEdit.aspx?openid="+openid+"&username="+username, "", "width=600,height=600,position=absolute,left=" + Math.ceil((window.screen.width - 600) / 2) + ",top=" + Math.ceil((window.screen.height - 600) / 2) + "");
        //alert(openid);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind hide" ><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="V_WEC_XX_MESSAGE.ID">
               <dt><%=WEC_XX_MESSAGE.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.OPENID">
               <dt><%=WEC_XX_MESSAGE.Attribute.OPENID.ZhName %>：</dt><!--微信ID-->
               <dd><span>
               
                    <input id="txtOPENID" type="text" runat="server"  ck="{len:100,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.TYPE">
               <dt><%=WEC_XX_MESSAGE.Attribute.TYPE.ZhName %>：</dt><!--消息类型-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.S_CONTENT">
               <dt><%=WEC_XX_MESSAGE.Attribute.S_CONTENT.ZhName %>：</dt><!--消息内容(nv-->
               <dd><span>
               
                    <input id="txtS_CONTENT" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.ADDTIME">
               <dt><%=WEC_XX_MESSAGE.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.ISCOLLECT">
               <dt><%=WEC_XX_MESSAGE.Attribute.ISCOLLECT.ZhName %>：</dt><!--是否收藏-->
               <dd><span>
               
                    <input id="txtISCOLLECT" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.LATITUDE">
               <dt><%=WEC_XX_MESSAGE.Attribute.LATITUDE.ZhName %>：</dt><!--纬度-->
               <dd><span>
               
                    <input id="txtLATITUDE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.LONGITUDE">
               <dt><%=WEC_XX_MESSAGE.Attribute.LONGITUDE.ZhName %>：</dt><!--经度-->
               <dd><span>
               
                    <input id="txtLONGITUDE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_XX_MESSAGE.PRECISION">
               <dt><%=WEC_XX_MESSAGE.Attribute.PRECISION.ZhName %>：</dt><!--精度-->
               <dd><span>
               
                    <input id="txtPRECISION" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.CITY">
               <dt><%=WEC_XX_MESSAGE.Attribute.CITY.ZhName %>：</dt><!--用户所在城市-->
               <dd><span>
               
                    <input id="txtCITY" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.PROVINCE">
               <dt><%=WEC_XX_MESSAGE.Attribute.PROVINCE.ZhName %>：</dt><!--用户所在省-->
               <dd><span>
               
                    <input id="txtPROVINCE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.COUNTRY">
               <dt><%=WEC_XX_MESSAGE.Attribute.COUNTRY.ZhName %>：</dt><!--用户所在国家-->
               <dd><span>
               
                    <input id="txtCOUNTRY" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.HEADIMGURL">
               <dt>用户头像：</dt><!--用户头像，最后-->
               <dd><span>
               
                    <input id="txtHEADIMGURL" type="text" runat="server"  ck="{len:200,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.CHANNELID">
               <dt><%=WEC_XX_MESSAGE.Attribute.CHANNELID.ZhName %>：</dt><!--渠道-->
               <dd><span>
               
                    <input id="txtCHANNELID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_WEC_XX_MESSAGE.AID">
               <dt><%=WEC_XX_MESSAGE.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
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
            <li><span><input power="newV_WEC_XX_MESSAGE" id="btn_New" type="button" value="新建"  /></span></li>
            <li><span><input power="editV_WEC_XX_MESSAGE" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('V_WEC_XX_MESSAGEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newV_WEC_XX_MESSAGE" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('V_WEC_XX_MESSAGEBack.aspx');" /></span></li>
            <li><span><input type="button" value="显示查询" id="display_search"/></span></li>
           
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
                    
                    
                    <td data="{colname:'<%=V_WEC_XX_MESSAGE.Attribute.ID.LongName%>',show:1}"><%=WEC_XX_MESSAGE.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td data="{colname:'<%=V_WEC_XX_MESSAGE.Attribute.USERNAME.LongName%>',show:1}">用户名</td><!--用户名-->
                    
                     <td data="{colname:'<%=V_WEC_XX_MESSAGE.Attribute.HEADIMGURL.LongName%>',show:1}">用户头像</td><!--用户头像，最后-->
                    
                    <td data="{colname:'<%=V_WEC_XX_MESSAGE.Attribute.TYPE.LongName%>',show:1}"><%=WEC_XX_MESSAGE.Attribute.TYPE._ZhName %></td><!--消息类型-->
                    
                    
                    <td data="{colname:'<%=V_WEC_XX_MESSAGE.Attribute.S_CONTENT.LongName%>',show:1}">消息内容</td><!--消息内容(nv-->
                    
                    
                    <td data="{colname:'<%=V_WEC_XX_MESSAGE.Attribute.ADDTIME.LongName%>',show:1}">消息时间</td><!--添加时间-->
                    
                    
                  
                    
                   
                    <td >操作</td>
                    
                    
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((V_WEC_XX_MESSAGE)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((V_WEC_XX_MESSAGE)Container.DataItem).PATH, ((V_WEC_XX_MESSAGE)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((V_WEC_XX_MESSAGE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((V_WEC_XX_MESSAGE)Container.DataItem).USERNAME %></td>
                    
                    <td><img src="<%#((V_WEC_XX_MESSAGE)Container.DataItem).HEADIMGURL %>" style="width:40px;height:40px;"/></td>
                    
                    <td><%#FormHelper.GetText(WEC_XX_MESSAGE.Attribute.TYPE, ((V_WEC_XX_MESSAGE)Container.DataItem).TYPE)%></td>
                    
                    
                     <td><%#HtmlHelper.GetSummary(((V_WEC_XX_MESSAGE)Container.DataItem).S_CONTENT) %></td>
                    
                    
                    <td><%#(((V_WEC_XX_MESSAGE)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((V_WEC_XX_MESSAGE)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                  
                    
                    
                    
                    <td><a href="javascript:;" onclick="responseUser('<%#((V_WEC_XX_MESSAGE)Container.DataItem).OPENID%>','<%#((V_WEC_XX_MESSAGE)Container.DataItem).USERNAME%>')">回复</a></td>
                    
                    
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