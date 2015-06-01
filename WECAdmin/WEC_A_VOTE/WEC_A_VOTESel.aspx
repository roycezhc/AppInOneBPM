<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_A_VOTESel.aspx.cs" Inherits="WEC_A_VOTESel" %>
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
               <dt><%=WEC_A_VOTE.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AID">
               <dt><%=WEC_A_VOTE.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WEC_A_VOTE.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WEC_A_VOTE.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="KEYWORD">
               <dt><%=WEC_A_VOTE.Attribute.KEYWORD.ZhName %>：</dt><!--关键词-->
               <dd><span>
               
                    <textarea id="txtKEYWORD" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="TITLE">
               <dt><%=WEC_A_VOTE.Attribute.TITLE.ZhName %>：</dt><!--投票标题-->
               <dd><span>
               
                    <textarea id="txtTITLE" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PICURL">
               <dt><%=WEC_A_VOTE.Attribute.PICURL.ZhName %>：</dt><!--投票图片-->
               <dd><span>
               
                    <input id="txtPICURL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="INSTRUCTION">
               <dt><%=WEC_A_VOTE.Attribute.INSTRUCTION.ZhName %>：</dt><!--投票说明-->
               <dd><span>
               
                    <textarea id="txtINSTRUCTION" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PIC_SHOW">
               <dt><%=WEC_A_VOTE.Attribute.PIC_SHOW.ZhName %>：</dt><!--图片显示-->
               <dd><span>
               
                    <select id="txtPIC_SHOW" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="IS_RADIO">
               <dt><%=WEC_A_VOTE.Attribute.IS_RADIO.ZhName %>：</dt><!--是否多选-->
               <dd><span>
               
                    <select id="txtIS_RADIO" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="SELECT_NUM">
               <dt><%=WEC_A_VOTE.Attribute.SELECT_NUM.ZhName %>：</dt><!--多选数量-->
               <dd><span>
               
                    <input id="txtSELECT_NUM" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TIME">
               <dt><%=WEC_A_VOTE.Attribute.TIME.ZhName %>：</dt><!--时间设置-->
               <dd><span>
               
                    <input id="txtTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="RESULT">
               <dt><%=WEC_A_VOTE.Attribute.RESULT.ZhName %>：</dt><!--投票结果-->
               <dd><span>
               
                    <input id="txtRESULT" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SHARE">
               <dt><%=WEC_A_VOTE.Attribute.SHARE.ZhName %>：</dt><!--是否分享-->
               <dd><span>
               
                    <select id="txtSHARE" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="KIND">
               <dt><%=WEC_A_VOTE.Attribute.KIND.ZhName %>：</dt><!--类别-->
               <dd><span>
               
                    <select id="txtKIND" runat="server" >
                    </select>
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
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.AID._ZhName %></td><!--公众号编号-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.KEYWORD._ZhName %></td><!--关键词-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.TITLE._ZhName %></td><!--投票标题-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.PICURL._ZhName %></td><!--投票图片-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.INSTRUCTION._ZhName %></td><!--投票说明-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.PIC_SHOW._ZhName %></td><!--图片显示-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.IS_RADIO._ZhName %></td><!--是否多选-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.SELECT_NUM._ZhName %></td><!--多选数量-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.TIME._ZhName %></td><!--时间设置-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.RESULT._ZhName %></td><!--投票结果-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.SHARE._ZhName %></td><!--是否分享-->
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.KIND._ZhName %></td><!--类别-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).AID %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.STATUS, ((WEC_A_VOTE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).ADDTIME %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).KEYWORD) %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).TITLE) %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).PICURL %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).INSTRUCTION) %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.PIC_SHOW, ((WEC_A_VOTE)Container.DataItem).PIC_SHOW)%></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.IS_RADIO, ((WEC_A_VOTE)Container.DataItem).IS_RADIO)%></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).SELECT_NUM %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).TIME %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).RESULT %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.SHARE, ((WEC_A_VOTE)Container.DataItem).SHARE)%></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.KIND, ((WEC_A_VOTE)Container.DataItem).KIND)%></td>
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

