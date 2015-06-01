<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTOMERSel" CodeFile="CUSTOMERSel.aspx.cs" %>
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
         
            <dl colname="CompanyName">
               <dt><%=CRM_CUSTOMER.Attribute.CompanyName.ZhName %>：</dt><!--公司名称-->
               <dd><span>
                
                    <input id="txtCompanyName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CompanyAddress">
               <dt><%=CRM_CUSTOMER.Attribute.CompanyAddress.ZhName %>：</dt><!--公司地址-->
               <dd><span>
                
                    <input id="txtCompanyAddress" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ShopName">
               <dt><%=CRM_CUSTOMER.Attribute.ShopName.ZhName %>：</dt><!--网店名称-->
               <dd><span>
                
                    <input id="txtShopName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ShopNameURL">
               <dt><%=CRM_CUSTOMER.Attribute.ShopNameURL.ZhName %>：</dt><!--网店网址-->
               <dd><span>
                
                    <input id="txtShopNameURL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CustSex">
               <dt><%=CRM_CUSTOMER.Attribute.CustSex.ZhName %>：</dt><!--性别-->
               <dd><span>
                
                    <input id="txtCustSex" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Birthday">
               <dt><%=CRM_CUSTOMER.Attribute.Birthday.ZhName %>：</dt><!--生日-->
               <dd><span>
               
                    <input id="txtBirthday" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="WangWangId">
               <dt><%=CRM_CUSTOMER.Attribute.WangWangId.ZhName %>：</dt><!--旺旺ID-->
               <dd><span>
                
                    <input id="txtWangWangId" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CustQQ">
               <dt><%=CRM_CUSTOMER.Attribute.CustQQ.ZhName %>：</dt><!--QQ号码-->
               <dd><span>
                
                    <input id="txtCustQQ" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LastEditors">
               <dt><%=CRM_CUSTOMER.Attribute.LastEditors.ZhName %>：</dt><!--最后编辑者-->
               <dd><span>
                
                    <input id="txtLastEditors" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LoadHighSeasTime">
               <dt><%=CRM_CUSTOMER.Attribute.LoadHighSeasTime.ZhName %>：</dt><!--加入公海时间-->
               <dd><span>
               
                    <input id="txtLoadHighSeasTime" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Cus_Id">
               <dt><%=CRM_CUSTOMER.Attribute.Cus_Id.ZhName %>：</dt><!--客户编码-->
               <dd><span>
                
                    <input id="txtCus_Id" type="text" runat="server" />
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
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.CompanyName._ZhName %></td><!--公司名称-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.CompanyAddress._ZhName %></td><!--公司地址-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.ShopName._ZhName %></td><!--网店名称-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.ShopNameURL._ZhName %></td><!--网店网址-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.CustSex._ZhName %></td><!--性别-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.Birthday._ZhName %></td><!--生日-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.WangWangId._ZhName %></td><!--旺旺ID-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.CustQQ._ZhName %></td><!--QQ号码-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.LastEditors._ZhName %></td><!--最后编辑者-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.LoadHighSeasTime._ZhName %></td><!--加入公海时间-->
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.Cus_Id._ZhName %></td><!--客户编码-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).CompanyName %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).CompanyAddress %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).ShopName %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).ShopNameURL %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).CustSex %></td>
                    
                    
                    <td><%#(((CRM_CUSTOMER)Container.DataItem).Birthday == DateTime.MinValue) ? "" : ((CRM_CUSTOMER)Container.DataItem).Birthday.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).WangWangId %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).CustQQ %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).LastEditors %></td>
                    
                    
                    <td><%#(((CRM_CUSTOMER)Container.DataItem).LoadHighSeasTime == DateTime.MinValue) ? "" : ((CRM_CUSTOMER)Container.DataItem).LoadHighSeasTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).Cus_Id %></td>
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

