<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="V_CRM_CUSTTOMERManage" CodeFile="CUSTTOMERManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
     <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        manager.initPageSizeEvt("txtPageNum");

        //dhtmlx.skin = "dhx_skyblue";

        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="V_CRM_CUSTTOMER.Cus_ID">
               <dt><%=CRM_CUST.Attribute.Cus_ID.ZhName%>：</dt><!--Cus_ID-->
               <dd><span>
                
                    <input id="txtCus_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.CompanyName">
               <dt><%=CRM_CUSTOMER.Attribute.CompanyName.ZhName%>：</dt><!--CompanyName-->
               <dd><span>
                
                    <input id="txtCompanyName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.CompanyAddress">
               <dt><%=CRM_CUSTOMER.Attribute.CompanyAddress.ZhName%>：</dt><!--CompanyAddress-->
               <dd><span>
                
                    <input id="txtCompanyAddress" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.ShopName">
               <dt><%=CRM_CUST.Attribute.ShopName.ZhName%>：</dt><!--ShopName-->
               <dd><span>
                
                    <input id="txtShopName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.ShopNameURL">
               <dt><%=CRM_CUSTOMER.Attribute.ShopNameURL.ZhName%>：</dt><!--ShopNameURL-->
               <dd><span>
                
                    <input id="txtShopNameURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.CustSex">
               <dt><%=CRM_CUSTOMER.Attribute.CustSex.ZhName%>：</dt><!--CustSex-->
               <dd><span>
                
                    <input id="txtCustSex" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.Birthday">
               <dt><%=CRM_CUSTOMER.Attribute.Birthday.ZhName%>：</dt><!--Birthday-->
               <dd><span>
               
                    <input id="txtBirthday" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.WangWangId">
               <dt><%=CRM_CUSTOMER.Attribute.WangWangId.ZhName%>：</dt><!--WangWangId-->
               <dd><span>
                
                    <input id="txtWangWangId" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.CustQQ">
               <dt><%=CRM_CUSTOMER.Attribute.CustQQ.ZhName%>：</dt><!--CustQQ-->
               <dd><span>
                
                    <input id="txtCustQQ" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.LastEditors">
               <dt><%=CRM_CUSTOMER.Attribute.LastEditors.ZhName%>：</dt><!--LastEditors-->
               <dd><span>
                
                    <input id="txtLastEditors" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.Cus_Name">
               <dt><%=CRM_CUST.Attribute.Cus_Name.ZhName%>：</dt><!--Cus_Name-->
               <dd><span>
                
                    <input id="txtCus_Name" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.Job">
               <dt><%=CRM_CUST.Attribute.Job.ZhName%>：</dt><!--Job-->
               <dd><span>
               
                    <input id="txtJob" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.RelationTxt">
               <dt><%=CRM_CUST.Attribute.RelationTxt.ZhName%>：</dt><!--RelationTxt-->
               <dd><span>
                
                    <input id="txtRelationTxt" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.Recorder">
               <dt><%=CRM_CUST.Attribute.Recorder.ZhName%>：</dt><!--Recorder-->
               <dd><span>
                
                    <input id="txtRecorder" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.Phone">
               <dt><%=CRM_CUST.Attribute.Phone.ZhName%>：</dt><!--Phone-->
               <dd><span>
                
                    <input id="txtPhone" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.ContactName">
               <dt><%=CRM_CUST.Attribute.ContactName.ZhName%>：</dt><!--ContactName-->
               <dd><span>
                
                    <input id="txtContactName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.Email">
               <dt><%=CRM_CUST.Attribute.Email.ZhName%>：</dt><!--Email-->
               <dd><span>
                
                    <input id="txtEmail" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.Address">
               <dt><%=CRM_CUST.Attribute.Address.ZhName%>：</dt><!--Address-->
               <dd><span>
                
                    <input id="txtAddress" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.Trade">
               <dt><%=CRM_CUST.Attribute.Trade.ZhName%>：</dt><!--Trade-->
               <dd><span>
                
                    <input id="txtTrade" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.Type">
               <dt><%=CRM_CUST.Attribute.Type.ZhName%>：</dt><!--Type-->
               <dd><span>
                
                    <input id="txtType" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.State">
               <dt><%=CRM_CUST.Attribute.State.ZhName%>：</dt><!--State-->
               <dd><span>
                
                    <input id="txtState" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.IsSign">
               <dt><%=CRM_CUST.Attribute.IsSign.ZhName%>：</dt><!--IsSign-->
               <dd><span>
                
                    <input id="txtIsSign" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.AddTime">
               <dt><%=CRM_CUST.Attribute.AddTime.ZhName%>：</dt><!--AddTime-->
               <dd><span>
               
                    <input id="txtAddTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.EditTime">
               <dt><%=CRM_CUST.Attribute.EditTime.ZhName%>：</dt><!--EditTime-->
               <dd><span>
               
                    <input id="txtEditTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.LoadHighSeasTime">
               <dt><%=CRM_CUSTOMER.Attribute.LoadHighSeasTime.ZhName%>：</dt><!--LoadHighSeasTime-->
               <dd><span>
               
                    <input id="txtLoadHighSeasTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.MobPhone">
               <dt><%=CRM_CUST.Attribute.MobPhone.ZhName%>：</dt><!--MobPhone-->
               <dd><span>
                
                    <input id="txtMobPhone" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.PATH">
               <dt><%=CRM_CUST.Attribute.PATH.ZhName%>：</dt><!--PATH-->
               <dd><span>
               
                    <input id="txtPATH" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_CRM_CUSTTOMER.PNAME">
               <dt><%=CRM_CUST.Attribute.PNAME.ZhName%>：</dt><!--PNAME-->
               <dd><span>
               
                    <input id="txtPNAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl><dt></dt><dd class="btn">
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input id="btn_New" type="button" value="新建" onclick="manager.newRecord('CUSTEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="NewStaff" id="Button2" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('CUSTBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="Cus_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td><a href="CUSTTOMERManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Cus_ID.LongName%>',show:1}"><%=CRM_CUST.Attribute.Cus_ID._ZhName %></td><!--Cus_ID-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.CompanyName.LongName%>',show:1}"><%=CRM_CUSTOMER.Attribute.CompanyName._ZhName%></td><!--CompanyName-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.CompanyAddress.LongName%>',show:1}"><%=CRM_CUSTOMER.Attribute.CompanyAddress._ZhName%></td><!--CompanyAddress-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.ShopName.LongName%>',show:1}"><%=CRM_CUST.Attribute.ShopName._ZhName%></td><!--ShopName-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.ShopNameURL.LongName%>',show:1}"><%=CRM_CUSTOMER.Attribute.ShopNameURL._ZhName%></td><!--ShopNameURL-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.CustSex.LongName%>',show:0}"><%=CRM_CUSTOMER.Attribute.CustSex._ZhName%></td><!--CustSex-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Birthday.LongName%>',show:0}"><%=CRM_CUSTOMER.Attribute.Birthday._ZhName%></td><!--Birthday-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.WangWangId.LongName%>',show:0}"><%=CRM_CUSTOMER.Attribute.WangWangId._ZhName%></td><!--WangWangId-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.CustQQ.LongName%>',show:0}"><%=CRM_CUSTOMER.Attribute.CustQQ._ZhName%></td><!--CustQQ-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.LastEditors.LongName%>',show:0}"><%=CRM_CUSTOMER.Attribute.LastEditors._ZhName%></td><!--LastEditors-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Cus_Name.LongName%>',show:0}"><%=CRM_CUST.Attribute.Cus_Name._ZhName%></td><!--Cus_Name-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Job.LongName%>',show:0}"><%=CRM_CUST.Attribute.Job._ZhName%></td><!--Job-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.RelationTxt.LongName%>',show:0}"><%=CRM_CUST.Attribute.RelationTxt._ZhName%></td><!--RelationTxt-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Recorder.LongName%>',show:0}"><%=CRM_CUST.Attribute.Recorder._ZhName%></td><!--Recorder-->
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Phone.LongName%>',show:0}"><%=CRM_CUST.Attribute.Phone._ZhName%></td><!--Phone-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.ContactName.LongName%>',show:0}"><%=CRM_CUST.Attribute.ContactName._ZhName%></td><!--ContactName-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Email.LongName%>',show:0}"><%=CRM_CUST.Attribute.Email._ZhName%></td><!--Email-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Address.LongName%>',show:0}"><%=CRM_CUST.Attribute.Address._ZhName%></td><!--Address-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Trade.LongName%>',show:0}"><%=CRM_CUST.Attribute.Trade._ZhName%></td><!--Trade-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.Type.LongName%>',show:0}"><%=CRM_CUST.Attribute.Type._ZhName%></td><!--Type-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.State.LongName%>',show:0}"><%=CRM_CUST.Attribute.State._ZhName%></td><!--State-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.IsSign.LongName%>',show:0}"><%=CRM_CUST.Attribute.IsSign._ZhName%></td><!--IsSign-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.AddTime.LongName%>',show:0}"><%=CRM_CUST.Attribute.AddTime._ZhName%></td><!--AddTime-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.EditTime.LongName%>',show:0}"><%=CRM_CUST.Attribute.EditTime._ZhName%></td><!--EditTime-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.LoadHighSeasTime.LongName%>',show:0}"><%=CRM_CUSTOMER.Attribute.LoadHighSeasTime._ZhName%></td><!--LoadHighSeasTime-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.MobPhone.LongName%>',show:0}"><%=CRM_CUST.Attribute.MobPhone._ZhName%></td><!--MobPhone-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.PATH.LongName%>',show:0}"><%=CRM_CUST.Attribute.PATH._ZhName%></td><!--PATH-->
                    
                    
                    <td data="{colname:'<%=V_CRM_CUSTTOMER.Attribute.PNAME.LongName%>',show:0}"><%=CRM_CUST.Attribute.PNAME._ZhName%></td><!--PNAME-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((V_CRM_CUSTTOMER)Container.DataItem).Cus_ID%>" /></td>
                    <td><%#showLeftLinks(((V_CRM_CUSTTOMER)Container.DataItem).PATH, ((V_CRM_CUSTTOMER)Container.DataItem).PNAME, Container.ItemIndex)%></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).Cus_ID %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).CompanyName %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).CompanyAddress %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).ShopName %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).ShopNameURL %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).CustSex %></td>
                    
                    
                    <td><%#(((V_CRM_CUSTTOMER)Container.DataItem).Birthday == DateTime.MinValue) ? "" : ((V_CRM_CUSTTOMER)Container.DataItem).Birthday.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).WangWangId %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).CustQQ %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).LastEditors %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).Cus_Name %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((V_CRM_CUSTTOMER)Container.DataItem).Job) %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((V_CRM_CUSTTOMER)Container.DataItem).RelationTxt) %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).Recorder %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).Phone %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).ContactName %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).Email %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).Address %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).Trade %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).Type %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).State %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).IsSign %></td>
                    
                    
                    <td><%#(((V_CRM_CUSTTOMER)Container.DataItem).AddTime == DateTime.MinValue) ? "" : ((V_CRM_CUSTTOMER)Container.DataItem).AddTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((V_CRM_CUSTTOMER)Container.DataItem).EditTime == DateTime.MinValue) ? "" : ((V_CRM_CUSTTOMER)Container.DataItem).EditTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((V_CRM_CUSTTOMER)Container.DataItem).LoadHighSeasTime == DateTime.MinValue) ? "" : ((V_CRM_CUSTTOMER)Container.DataItem).LoadHighSeasTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).MobPhone %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).PATH %></td>
                    
                    
                    <td><%#((V_CRM_CUSTTOMER)Container.DataItem).PNAME %></td>
                    
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
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>