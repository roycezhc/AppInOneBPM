<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTSels" CodeFile="CUSTSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows();
        });
    </script>
    <script type="text/javascript">$(function () { Sels_Load(); });</script>
    <style type="text/css">
    #divList tbody tr td{ cursor:pointer;}
    .lrlayout .left{border:none;}
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
 <div class="main">
    <input id="hidCondition" type="hidden" runat="server" />
    <input id="hidOld" type="hidden" runat="server" />
    <input id="hidInitIDS" type="hidden" runat="server" />
    <div class="titnav">
       <dl><dt><b><%#title %>多选</b></dt><dd></dd></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
     <div class="topfind">
         
            <dl colname="Cus_ID">
               <dt><%=CRM_CUST.Attribute.Cus_ID.ZhName %>：</dt><!--客户编号-->
               <dd><span>
                
                    <input id="txtCus_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Cus_Name">
               <dt><%=CRM_CUST.Attribute.Cus_Name.ZhName %>：</dt><!--客户名称-->
               <dd><span>
                
                    <input id="txtCus_Name" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Job">
               <dt><%=CRM_CUST.Attribute.Job.ZhName %>：</dt><!--客户职位-->
               <dd><span>
               
                    <input id="txtJob" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="RelationTxt">
               <dt><%=CRM_CUST.Attribute.RelationTxt.ZhName %>：</dt><!--客户关系描述-->
               <dd><span>
                
                    <input id="txtRelationTxt" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Recorder">
               <dt><%=CRM_CUST.Attribute.Recorder.ZhName %>：</dt><!--创建人-->
               <dd><span>
                
                    <input id="txtRecorder" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MobPhone">
               <dt><%=CRM_CUST.Attribute.MobPhone.ZhName %>：</dt><!--手机-->
               <dd><span>
                
                    <input id="txtMobPhone" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Phone">
               <dt><%=CRM_CUST.Attribute.Phone.ZhName %>：</dt><!--联系电话-->
               <dd><span>
                
                    <input id="txtPhone" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ContactName">
               <dt><%=CRM_CUST.Attribute.ContactName.ZhName %>：</dt><!--联系人姓名-->
               <dd><span>
                
                    <input id="txtContactName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ShopName">
               <dt><%=CRM_CUST.Attribute.ShopName.ZhName %>：</dt><!--网店名称-->
               <dd><span>
                
                    <input id="txtShopName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ShopAddr">
               <dt><%=CRM_CUST.Attribute.ShopAddr.ZhName %>：</dt><!--网店地址-->
               <dd><span>
                
                    <input id="txtShopAddr" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="QQ">
               <dt><%=CRM_CUST.Attribute.QQ.ZhName %>：</dt><!--QQ号码-->
               <dd><span>
                
                    <input id="txtQQ" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="WW">
               <dt><%=CRM_CUST.Attribute.WW.ZhName %>：</dt><!--旺旺号码-->
               <dd><span>
                
                    <input id="txtWW" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Email">
               <dt><%=CRM_CUST.Attribute.Email.ZhName %>：</dt><!--邮件地址-->
               <dd><span>
                
                    <input id="txtEmail" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Address">
               <dt><%=CRM_CUST.Attribute.Address.ZhName %>：</dt><!--详细地址-->
               <dd><span>
                
                    <input id="txtAddress" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Trade">
               <dt><%=CRM_CUST.Attribute.Trade.ZhName %>：</dt><!--行业-->
               <dd><span>
                
                    <input id="txtTrade" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Type">
               <dt><%=CRM_CUST.Attribute.Type.ZhName %>：</dt><!--类别-->
               <dd><span>
                
                    <input id="txtType" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="State">
               <dt><%=CRM_CUST.Attribute.State.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtState" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="IsSign">
               <dt><%=CRM_CUST.Attribute.IsSign.ZhName %>：</dt><!--是否签约-->
               <dd><span>
               
                    <select id="txtIsSign" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="AddTime">
               <dt><%=CRM_CUST.Attribute.AddTime.ZhName %>：</dt><!--录入时间-->
               <dd><span>
               
                    <input id="txtAddTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="EditTime">
               <dt><%=CRM_CUST.Attribute.EditTime.ZhName %>：</dt><!--修改时间-->
               <dd><span>
               
                    <input id="txtEditTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="PATH">
               <dt><%=CRM_CUST.Attribute.PATH.ZhName %>：</dt><!--PATH-->
               <dd><span>
               
                    <input id="txtPATH" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PNAME">
               <dt><%=CRM_CUST.Attribute.PNAME.ZhName %>：</dt><!--PNAME-->
               <dd><span>
               
                    <input id="txtPNAME" type="text" runat="server"/>
               </span></dd>
        </dl>     
        <dl><dt>&nbsp;</dt><dd class="btn">
        <a href="#" class="btn"><asp:Button ID="btnFind" runat="server" Text="查询" OnClick="btnFind_Click" /></a>
        <a href="#" class="btn"><input id="btnSelOK" type="button" value="<%=LanguageService.GetLanguageString("SureChoose", "确定选择") %>" onclick="selok();" /></a>
        <a href="#" class="btn"><input type="button" id="btnClear" value="<%=LanguageService.GetLanguageString("Clear", "清空") %>" /></a>
        </dd></dl>
        <div class="clear"></div>
    </div>    
    <div class="lrlayout">
    <div class="left" style="width:150px;height:400px;">
       <select id="selectedlist" multiple="multiple" style="color:Blue;width:100%;height:100%;">
       </select>
    </div>
    <div class="right" style="margin-left:152px;height:400px;">
    <div class="tblist" id="divList">
       <table cellpadding="0" cellspacing="0">
             <thead>
                <tr>
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "全选") %>' onclick='_selAll(this);'/><%=LanguageService.GetLanguageString("Choose", "选择") %></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Cus_ID._ZhName %><!--客户编号--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Cus_Name._ZhName %><!--客户名称--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Job._ZhName %><!--客户职位--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.RelationTxt._ZhName %><!--客户关系描述--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Recorder._ZhName %><!--创建人--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.MobPhone._ZhName %><!--手机--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Phone._ZhName %><!--联系电话--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.ContactName._ZhName %><!--联系人姓名--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.ShopName._ZhName %><!--网店名称--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.ShopAddr._ZhName %><!--网店地址--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.QQ._ZhName %><!--QQ号码--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.WW._ZhName %><!--旺旺号码--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Email._ZhName %><!--邮件地址--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Address._ZhName %><!--详细地址--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Trade._ZhName %><!--行业--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Type._ZhName %><!--类别--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.State._ZhName %><!--状态--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.IsSign._ZhName %><!--是否签约--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.AddTime._ZhName %><!--录入时间--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.EditTime._ZhName %><!--修改时间--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.PATH._ZhName %><!--PATH--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.PNAME._ZhName %><!--PNAME--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((CRM_CUST)Container.DataItem).Cus_ID %>" /></td>
                     
                    
                    <td><%#((CRM_CUST)Container.DataItem).Cus_ID %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Cus_Name %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((CRM_CUST)Container.DataItem).Job) %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((CRM_CUST)Container.DataItem).RelationTxt) %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Recorder %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).MobPhone %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Phone %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).ContactName %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).ShopName %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).ShopAddr %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).QQ %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).WW %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Email %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Address %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Trade %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Type %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(CRM_CUST.Attribute.State, ((CRM_CUST)Container.DataItem).State)%></td>
                    
                    
                    <td><%#formhelper.GetOptionText(CRM_CUST.Attribute.IsSign, ((CRM_CUST)Container.DataItem).IsSign)%></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).AddTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).EditTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).PATH %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).PNAME %></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <div class="pages">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
     </div>
     </div>
     </div>
 </div>
</asp:Content>
