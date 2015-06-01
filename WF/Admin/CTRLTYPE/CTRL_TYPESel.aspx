<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_CTRL_TYPESel" CodeFile="CTRL_TYPESel.aspx.cs" %>
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
   <div class="topfindl"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="CTRL_TYPE">
               <dt><%=TF_CTRL_TYPE.Attribute.CTRL_TYPE.ZhName %>：</dt><!--CTRL_TYPE-->
               <dd><span>
                
                    <input id="txtCTRL_TYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="P_CTRL_TYPE">
               <dt><%=TF_CTRL_TYPE.Attribute.P_CTRL_TYPE.ZhName %>：</dt><!--P_CTRL_TYPE-->
               <dd><span>
                
                    <input id="txtP_CTRL_TYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CTRL_NAME">
               <dt><%=TF_CTRL_TYPE.Attribute.CTRL_NAME.ZhName %>：</dt><!--类型名-->
               <dd><span>
                
                    <input id="txtCTRL_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EL_HTML">
               <dt><%=TF_CTRL_TYPE.Attribute.EL_HTML.ZhName %>：</dt><!--EL_HTML-->
               <dd><span>
               
                    <textarea id="txtEL_HTML" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="SORT_NO">
               <dt><%=TF_CTRL_TYPE.Attribute.SORT_NO.ZhName %>：</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="JS_CODE">
               <dt><%=TF_CTRL_TYPE.Attribute.JS_CODE.ZhName %>：</dt><!--JS_CODE-->
               <dd><span>
               
                    <textarea id="txtJS_CODE" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
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
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.CTRL_TYPE._ZhName %></td><!--CTRL_TYPE-->
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.P_CTRL_TYPE._ZhName %></td><!--P_CTRL_TYPE-->
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.CTRL_NAME._ZhName %></td><!--类型名-->
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.EL_HTML._ZhName %></td><!--EL_HTML-->
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    
                    
                    <td><%=TF_CTRL_TYPE.Attribute.JS_CODE._ZhName %></td><!--JS_CODE-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).P_CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).CTRL_NAME %></td>
                    
                    
                     <td><%#((TF_CTRL_TYPE)Container.DataItem).EL_HTML %></td>
                    
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).SORT_NO %></td>
                    
                    
                     <td><%#((TF_CTRL_TYPE)Container.DataItem).JS_CODE %></td>
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

