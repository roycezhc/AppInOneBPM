<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_PUBLICLISTSel.aspx.cs" Inherits="WEC_PUBLICLISTSel" %>
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
         
            <dl colname="AID">
               <dt><%=WEC_PUBLICLIST.Attribute.AID.ZhName %>：</dt><!--公众号ID-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="USER_ID">
               <dt><%=WEC_PUBLICLIST.Attribute.USER_ID.ZhName %>：</dt><!--用户ID-->
               <dd><span>
               
                    <input id="txtUSER_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PLC_NAME">
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_NAME.ZhName %>：</dt><!--公众号名称-->
               <dd><span>
               
                    <input id="txtPLC_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PLC_SOURCEID">
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID.ZhName %>：</dt><!--原始ID-->
               <dd><span>
               
                    <input id="txtPLC_SOURCEID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="WECHAT_ID">
               <dt><%=WEC_PUBLICLIST.Attribute.WECHAT_ID.ZhName %>：</dt><!--微信号-->
               <dd><span>
               
                    <input id="txtWECHAT_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AVATAR_URL">
               <dt><%=WEC_PUBLICLIST.Attribute.AVATAR_URL.ZhName %>：</dt><!--图片地址-->
               <dd><span>
               
                    <textarea id="txtAVATAR_URL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="API_KEY">
               <dt><%=WEC_PUBLICLIST.Attribute.API_KEY.ZhName %>：</dt><!--API地址-->
               <dd><span>
               
                    <textarea id="txtAPI_KEY" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="TOKEN">
               <dt><%=WEC_PUBLICLIST.Attribute.TOKEN.ZhName %>：</dt><!--TOKEN-->
               <dd><span>
               
                    <input id="txtTOKEN" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LOCATION">
               <dt><%=WEC_PUBLICLIST.Attribute.LOCATION.ZhName %>：</dt><!--地区-->
               <dd><span>
               
                    <input id="txtLOCATION" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EMAIL">
               <dt><%=WEC_PUBLICLIST.Attribute.EMAIL.ZhName %>：</dt><!--邮箱-->
               <dd><span>
               
                    <input id="txtEMAIL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FUNS">
               <dt><%=WEC_PUBLICLIST.Attribute.FUNS.ZhName %>：</dt><!--粉丝数-->
               <dd><span>
               
                    <input id="txtFUNS" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE">
               <dt><%=WEC_PUBLICLIST.Attribute.TYPE.ZhName %>：</dt><!--所属类型-->
               <dd><span>
               
                    <input id="txtTYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="START_DAY">
               <dt><%=WEC_PUBLICLIST.Attribute.START_DAY.ZhName %>：</dt><!--开始时间-->
               <dd><span>
               
                    <input id="txtSTART_DAY" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="END_DAY">
               <dt><%=WEC_PUBLICLIST.Attribute.END_DAY.ZhName %>：</dt><!--到期时间-->
               <dd><span>
               
                    <input id="txtEND_DAY" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WEC_PUBLICLIST.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <input id="txtSTATUS" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PACKAGE_ID">
               <dt><%=WEC_PUBLICLIST.Attribute.PACKAGE_ID.ZhName %>：</dt><!--套餐类型-->
               <dd><span>
               
                    <input id="txtPACKAGE_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="IS_NEWS">
               <dt><%=WEC_PUBLICLIST.Attribute.IS_NEWS.ZhName %>：</dt><!--关注回复类型-->
               <dd><span>
               
                    <select id="txtIS_NEWS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="DEFAULT_REPLAY">
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY.ZhName %>：</dt><!--默认无匹配回复-->
               <dd><span>
               
                    <textarea id="txtDEFAULT_REPLAY" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="DEFAULT_REPLAY_FALG">
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG.ZhName %>：</dt><!--是否开启-->
               <dd><span>
               
                    <select id="txtDEFAULT_REPLAY_FALG" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="LBS_DISTANCE">
               <dt><%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE.ZhName %>：</dt><!--默认LBS查询-->
               <dd><span>
               
                    <input id="txtLBS_DISTANCE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="APPID">
               <dt><%=WEC_PUBLICLIST.Attribute.APPID.ZhName %>：</dt><!--APPID-->
               <dd><span>
               
                    <input id="txtAPPID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="APPSESECRET">
               <dt><%=WEC_PUBLICLIST.Attribute.APPSESECRET.ZhName %>：</dt><!--APPSECR-->
               <dd><span>
               
                    <input id="txtAPPSESECRET" type="text" runat="server" />
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
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.AID._ZhName %></td><!--公众号ID-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.USER_ID._ZhName %></td><!--用户ID-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.PLC_NAME._ZhName %></td><!--公众号名称-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID._ZhName %></td><!--原始ID-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.WECHAT_ID._ZhName %></td><!--微信号-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.AVATAR_URL._ZhName %></td><!--图片地址-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.API_KEY._ZhName %></td><!--API地址-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.TOKEN._ZhName %></td><!--TOKEN-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.LOCATION._ZhName %></td><!--地区-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.EMAIL._ZhName %></td><!--邮箱-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.FUNS._ZhName %></td><!--粉丝数-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.TYPE._ZhName %></td><!--所属类型-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.START_DAY._ZhName %></td><!--开始时间-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.END_DAY._ZhName %></td><!--到期时间-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.PACKAGE_ID._ZhName %></td><!--套餐类型-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.IS_NEWS._ZhName %></td><!--关注回复类型-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY._ZhName %></td><!--默认无匹配回复-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG._ZhName %></td><!--是否开启-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE._ZhName %></td><!--默认LBS查询-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.APPID._ZhName %></td><!--APPID-->
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.APPSESECRET._ZhName %></td><!--APPSECR-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).AID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).USER_ID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).PLC_NAME %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).PLC_SOURCEID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).WECHAT_ID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).AVATAR_URL %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).API_KEY %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).TOKEN %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).LOCATION %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).FUNS %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).TYPE %></td>
                    
                    
                    <td><%#(((WEC_PUBLICLIST)Container.DataItem).START_DAY == DateTime.MinValue) ? "" : ((WEC_PUBLICLIST)Container.DataItem).START_DAY.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((WEC_PUBLICLIST)Container.DataItem).END_DAY == DateTime.MinValue) ? "" : ((WEC_PUBLICLIST)Container.DataItem).END_DAY.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).STATUS %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).PACKAGE_ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_PUBLICLIST.Attribute.IS_NEWS, ((WEC_PUBLICLIST)Container.DataItem).IS_NEWS)%></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).DEFAULT_REPLAY %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG, ((WEC_PUBLICLIST)Container.DataItem).DEFAULT_REPLAY_FALG)%></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).LBS_DISTANCE %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).APPID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).APPSESECRET %></td>
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

