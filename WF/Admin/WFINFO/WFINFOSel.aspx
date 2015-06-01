<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_INFOSel" CodeFile="WFINFOSel.aspx.cs" %>
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
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="WFCID">
               <dt><%=WF_INFO.Attribute.WFID.ZhName %>：</dt><!--分类ID-->
               <dd><span>
                
                    <input id="txtWFCID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="WFCNAME">
               <dt><%=WF_INFO.Attribute.WFCNAME.ZhName %>：</dt><!--流程分类名-->
               <dd><span>
                
                    <input id="txtWFCNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WF_INFO.Attribute.ADDTIME.ZhName %>：</dt><!--创建时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EDITIME">
               <dt><%=WF_INFO.Attribute.EDITIME.ZhName %>：</dt><!--修改时间-->
               <dd><span>
               
                    <input id="txtEDITIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WF_INFO.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="USE_LIMIT">
               <dt><%=WF_INFO.Attribute.USE_LIMIT.ZhName %>：</dt><!--是否限制提交-->
               <dd><span>
               
                    <select id="txtUSE_LIMIT" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="NOTE">
               <dt><%=WF_INFO.Attribute.NOTE.ZhName %>：</dt><!--备注-->
               <dd><span>
                
                    <input id="txtNOTE" type="text" runat="server" />
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
                    
                    
                    <td><%=WF_INFO.Attribute.WFID._ZhName %></td><!--分类ID-->
                    
                    
                    <td><%=WF_INFO.Attribute.WFCNAME._ZhName %></td><!--流程分类名-->
                    
                    
                    <td><%=WF_INFO.Attribute.ADDTIME._ZhName %></td><!--创建时间-->
                    
                    
                    <td><%=WF_INFO.Attribute.EDITIME._ZhName %></td><!--修改时间-->
                    
                    
                    <td><%=WF_INFO.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td><%=WF_INFO.Attribute.USE_LIMIT._ZhName %></td><!--是否限制提交-->
                    
                    <td><%=WF_INFO.Attribute.NOTE._ZhName %></td><!--备注-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WF_INFO)Container.DataItem).WFID %></td>
                    
                    
                    <td><%#((WF_INFO)Container.DataItem).WFCNAME %></td>
                    
                    
                    <td><%#(((WF_INFO)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WF_INFO)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((WF_INFO)Container.DataItem).EDITIME == DateTime.MinValue) ? "" : ((WF_INFO)Container.DataItem).EDITIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#FormHelper.GetText(WF_INFO.Attribute.STATUS, ((WF_INFO)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#FormHelper.GetText(WF_INFO.Attribute.USE_LIMIT, ((WF_INFO)Container.DataItem).USE_LIMIT)%></td>

                    <td><%#((WF_INFO)Container.DataItem).NOTE %></td>
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

