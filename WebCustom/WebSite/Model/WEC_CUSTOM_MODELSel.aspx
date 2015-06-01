<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CUSTOM_MODELSel.aspx.cs" Inherits="WEC_CUSTOM_MODELSel" %>
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
               <dt><%=WEC_CUSTOM_MODEL.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE">
               <dt><%=WEC_CUSTOM_MODEL.Attribute.TYPE.ZhName %>：</dt><!--类型-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="PIC_URL">
               <dt><%=WEC_CUSTOM_MODEL.Attribute.PIC_URL.ZhName %>：</dt><!--图片地址-->
               <dd><span>
               
                    <input id="txtPIC_URL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PATH">
               <dt><%=WEC_CUSTOM_MODEL.Attribute.PATH.ZhName %>：</dt><!--模版路径-->
               <dd><span>
               
                    <textarea id="txtPATH" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WEC_CUSTOM_MODEL.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WEC_CUSTOM_MODEL.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="NAME">
               <dt><%=WEC_CUSTOM_MODEL.Attribute.NAME.ZhName %>：</dt><!--标题-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server" />
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
                    
                    
                    <td><%=WEC_CUSTOM_MODEL.Attribute.ID._ZhName %></td><!--编号-->
                    
                    
                    <td><%=WEC_CUSTOM_MODEL.Attribute.TYPE._ZhName %></td><!--类型-->
                    
                    
                    <td><%=WEC_CUSTOM_MODEL.Attribute.PIC_URL._ZhName %></td><!--图片地址-->
                    
                    
                    <td><%=WEC_CUSTOM_MODEL.Attribute.PATH._ZhName %></td><!--模版路径-->
                    
                    
                    <td><%=WEC_CUSTOM_MODEL.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td><%=WEC_CUSTOM_MODEL.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td><%=WEC_CUSTOM_MODEL.Attribute.NAME._ZhName %></td><!--标题-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_CUSTOM_MODEL)Container.DataItem).ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_CUSTOM_MODEL.Attribute.TYPE, ((WEC_CUSTOM_MODEL)Container.DataItem).TYPE)%></td>
                    
                    
                    <td><%#((WEC_CUSTOM_MODEL)Container.DataItem).PIC_URL %></td>
                    
                    
                    <td><%#((WEC_CUSTOM_MODEL)Container.DataItem).PATH %></td>
                    
                    
                    <td><%#(((WEC_CUSTOM_MODEL)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_CUSTOM_MODEL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_CUSTOM_MODEL.Attribute.STATUS, ((WEC_CUSTOM_MODEL)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_CUSTOM_MODEL)Container.DataItem).NAME %></td>
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

