<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMN_ITEMSel" CodeFile="ITEMSel.aspx.cs" %>
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
         
            <dl colname="ITEM_ID">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.ITEM_ID.ZhName %>：</dt><!--ITEM_ID-->
               <dd><span>
                
                    <input id="txtITEM_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FORM_ID">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.FORM_ID.ZhName %>：</dt><!--FORM_ID-->
               <dd><span>
                
                    <input id="txtFORM_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="COLUMN_ID">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.COLUMN_ID.ZhName %>：</dt><!--COLUMN_ID-->
               <dd><span>
                
                    <input id="txtCOLUMN_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="VALUE">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.VALUE.ZhName %>：</dt><!--选项值-->
               <dd><span>
                
                    <input id="txtVALUE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TEXT">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.TEXT.ZhName %>：</dt><!--选项名-->
               <dd><span>
                
                    <input id="txtTEXT" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DROP_REAL">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.DROP_REAL.ZhName %>：</dt><!--联动下拉框信息-->
               <dd><span>
               
                    <textarea id="txtDROP_REAL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="COL_HIDE">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.COL_HIDE.ZhName %>：</dt><!--显示隐藏列信息-->
               <dd><span>
               
                    <textarea id="txtCOL_HIDE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
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
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.ITEM_ID._ZhName %></td><!--ITEM_ID-->
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.FORM_ID._ZhName %></td><!--FORM_ID-->
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.COLUMN_ID._ZhName %></td><!--COLUMN_ID-->
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.VALUE._ZhName %></td><!--选项值-->
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.TEXT._ZhName %></td><!--选项名-->
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.DROP_REAL._ZhName %></td><!--联动下拉框信息-->
                    
                    
                    <td><%=TF_F_COLUMN_ITEM.Attribute.COL_HIDE._ZhName %></td><!--显示隐藏列信息-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).ITEM_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).FORM_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).COLUMN_ID %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).VALUE %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).TEXT %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).DROP_REAL %></td>
                    
                    
                    <td><%#((TF_F_COLUMN_ITEM)Container.DataItem).COL_HIDE %></td>
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

