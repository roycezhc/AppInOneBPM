<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_CHANNELlISTSel.aspx.cs" Inherits="WEC_C_CHANNELlISTSel" %>
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
               <dt><%=WEC_C_CHANNELlIST.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WEC_C_CHANNELlIST.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="NAME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NAME.ZhName %>：</dt><!--渠道名称-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="URL">
               <dt><%=WEC_C_CHANNELlIST.Attribute.URL.ZhName %>：</dt><!--渠道url-->
               <dd><span>
               
                    <textarea id="txtURL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="REMARK">
               <dt><%=WEC_C_CHANNELlIST.Attribute.REMARK.ZhName %>：</dt><!--渠道备注-->
               <dd><span>
               
                    <textarea id="txtREMARK" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="CATEGORY_ID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.ZhName %>：</dt><!--渠道分类-->
               <dd><span>
               
                    <input id="txtCATEGORY_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="QRCODE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.QRCODE.ZhName %>：</dt><!--二维码样式-->
               <dd><span>
               
                    <input id="txtQRCODE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="NOTE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NOTE.ZhName %>：</dt><!--备注信息-->
               <dd><span>
               
                    <textarea id="txtNOTE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="ADDRESS">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDRESS.ZhName %>：</dt><!--渠道所在地区-->
               <dd><span>
               
                    <textarea id="txtADDRESS" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="TYPE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.TYPE.ZhName %>：</dt><!--渠道类型-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
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
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.AID._ZhName %></td><!--公众号编号-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.NAME._ZhName %></td><!--渠道名称-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.URL._ZhName %></td><!--渠道url-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.REMARK._ZhName %></td><!--渠道备注-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID._ZhName %></td><!--渠道分类-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.QRCODE._ZhName %></td><!--二维码样式-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.NOTE._ZhName %></td><!--备注信息-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ADDRESS._ZhName %></td><!--渠道所在地区-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.TYPE._ZhName %></td><!--渠道类型-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).AID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_C_CHANNELlIST.Attribute.STATUS, ((WEC_C_CHANNELlIST)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).URL %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).REMARK %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).CATEGORY_ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).QRCODE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ADDRESS %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_C_CHANNELlIST.Attribute.TYPE, ((WEC_C_CHANNELlIST)Container.DataItem).TYPE)%></td>
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

