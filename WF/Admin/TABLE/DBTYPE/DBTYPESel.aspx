<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_FIELD_DBTYPESel2" CodeFile="DBTYPESel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script type="text/javascript">$(function () { Sel_Load(); });</script>
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows();
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
         
            <dl colname="TYPE_ID">
               <dt><%=TF_FIELD_DBTYPE.Attribute.TYPE_ID.ZhName %>：</dt><!--TYPE_ID-->
               <dd><span>
                
                    <input id="txtTYPE_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE_NAME">
               <dt><%=TF_FIELD_DBTYPE.Attribute.TYPE_NAME.ZhName %>：</dt><!--TYPE_NAME-->
               <dd><span>
                
                    <input id="txtTYPE_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DB_TYPE">
               <dt><%=TF_FIELD_DBTYPE.Attribute.DB_TYPE.ZhName %>：</dt><!--DB_TYPE-->
               <dd><span>
                
                    <input id="txtDB_TYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CTRL_TYPES">
               <dt><%=TF_FIELD_DBTYPE.Attribute.CTRL_TYPES.ZhName %>：</dt><!--CTRL_TYPES-->
               <dd><span>
               
                    <textarea id="txtCTRL_TYPES" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
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
                    
                    
                    <td><%=TF_FIELD_DBTYPE.Attribute.TYPE_ID._ZhName %></td><!--TYPE_ID-->
                    
                    
                    <td><%=TF_FIELD_DBTYPE.Attribute.TYPE_NAME._ZhName %></td><!--TYPE_NAME-->
                    
                    
                    <td><%=TF_FIELD_DBTYPE.Attribute.DB_TYPE._ZhName %></td><!--DB_TYPE-->
                    
                    
                    <td><%=TF_FIELD_DBTYPE.Attribute.CTRL_TYPES._ZhName %></td><!--CTRL_TYPES-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((TF_FIELD_DBTYPE)Container.DataItem).TYPE_ID %></td>
                    
                    
                    <td><%#((TF_FIELD_DBTYPE)Container.DataItem).TYPE_NAME %></td>
                    
                    
                    <td><%#((TF_FIELD_DBTYPE)Container.DataItem).DB_TYPE %></td>
                    
                    
                     <td><%#((TF_FIELD_DBTYPE)Container.DataItem).CTRL_TYPES %></td>
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

