<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_XX_MESSAGESel.aspx.cs" Inherits="WEC_XX_MESSAGESel" %>
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
               <dt><%=WEC_XX_MESSAGE.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OPENID">
               <dt><%=WEC_XX_MESSAGE.Attribute.OPENID.ZhName %>：</dt><!--微信ID-->
               <dd><span>
               
                    <input id="txtOPENID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE">
               <dt><%=WEC_XX_MESSAGE.Attribute.TYPE.ZhName %>：</dt><!--消息类型-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="S_CONTENT">
               <dt><%=WEC_XX_MESSAGE.Attribute.S_CONTENT.ZhName %>：</dt><!--消息内容(nv-->
               <dd><span>
               
                    <textarea id="txtS_CONTENT" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WEC_XX_MESSAGE.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ISCOLLECT">
               <dt><%=WEC_XX_MESSAGE.Attribute.ISCOLLECT.ZhName %>：</dt><!--是否收藏-->
               <dd><span>
               
                    <input id="txtISCOLLECT" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LATITUDE">
               <dt><%=WEC_XX_MESSAGE.Attribute.LATITUDE.ZhName %>：</dt><!--纬度-->
               <dd><span>
               
                    <input id="txtLATITUDE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LONGITUDE">
               <dt><%=WEC_XX_MESSAGE.Attribute.LONGITUDE.ZhName %>：</dt><!--经度-->
               <dd><span>
               
                    <input id="txtLONGITUDE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PRECISION">
               <dt><%=WEC_XX_MESSAGE.Attribute.PRECISION.ZhName %>：</dt><!--精度-->
               <dd><span>
               
                    <input id="txtPRECISION" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CITY">
               <dt><%=WEC_XX_MESSAGE.Attribute.CITY.ZhName %>：</dt><!--用户所在城市-->
               <dd><span>
               
                    <input id="txtCITY" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PROVINCE">
               <dt><%=WEC_XX_MESSAGE.Attribute.PROVINCE.ZhName %>：</dt><!--用户所在省-->
               <dd><span>
               
                    <input id="txtPROVINCE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="COUNTRY">
               <dt><%=WEC_XX_MESSAGE.Attribute.COUNTRY.ZhName %>：</dt><!--用户所在国家-->
               <dd><span>
               
                    <input id="txtCOUNTRY" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="HEADIMGURL">
               <dt><%=WEC_XX_MESSAGE.Attribute.HEADIMGURL.ZhName %>：</dt><!--用户头像，最后-->
               <dd><span>
               
                    <input id="txtHEADIMGURL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CHANNELID">
               <dt><%=WEC_XX_MESSAGE.Attribute.CHANNELID.ZhName %>：</dt><!--渠道-->
               <dd><span>
               
                    <input id="txtCHANNELID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AID">
               <dt><%=WEC_XX_MESSAGE.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
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
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.OPENID._ZhName %></td><!--微信ID-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.TYPE._ZhName %></td><!--消息类型-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.S_CONTENT._ZhName %></td><!--消息内容(nv-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.ISCOLLECT._ZhName %></td><!--是否收藏-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.LATITUDE._ZhName %></td><!--纬度-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.LONGITUDE._ZhName %></td><!--经度-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.PRECISION._ZhName %></td><!--精度-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.CITY._ZhName %></td><!--用户所在城市-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.PROVINCE._ZhName %></td><!--用户所在省-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.COUNTRY._ZhName %></td><!--用户所在国家-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.HEADIMGURL._ZhName %></td><!--用户头像，最后-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.CHANNELID._ZhName %></td><!--渠道-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.AID._ZhName %></td><!--公众号编号-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).OPENID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_XX_MESSAGE.Attribute.TYPE, ((WEC_XX_MESSAGE)Container.DataItem).TYPE)%></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_XX_MESSAGE)Container.DataItem).S_CONTENT) %></td>
                    
                    
                    <td><%#(((WEC_XX_MESSAGE)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_XX_MESSAGE)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).ISCOLLECT %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).LATITUDE %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).LONGITUDE %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).PRECISION %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).CITY %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).PROVINCE %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).COUNTRY %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).HEADIMGURL %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).CHANNELID %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).AID %></td>
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

