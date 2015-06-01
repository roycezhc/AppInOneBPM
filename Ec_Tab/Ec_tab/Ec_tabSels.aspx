<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_tabSels.aspx.cs" Inherits="Ec_tabSels" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows(); Sels_Load();
        });
    </script>
    <script src="../../Lib/Mdl/Sels.js" type="text/javascript"></script>
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
         
            <dl colname="Tabid">
               <dt><%=Ec_tab.Attribute.Tabid.ZhName %>：</dt><!--Tabid-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Name">
               <dt><%=Ec_tab.Attribute.Name.ZhName %>：</dt><!--模块名-->
               <dd><span>
               
                    <input id="txtName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Presence">
               <dt><%=Ec_tab.Attribute.Presence.ZhName %>：</dt><!--Presenc-->
               <dd><span>
               
                    <input id="txtPresence" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Tabsequence">
               <dt><%=Ec_tab.Attribute.Tabsequence.ZhName %>：</dt><!--Tabsequ-->
               <dd><span>
               
                    <input id="txtTabsequence" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Tablabel">
               <dt><%=Ec_tab.Attribute.Tablabel.ZhName %>：</dt><!--选项卡标签-->
               <dd><span>
               
                    <input id="txtTablabel" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Modifiedby">
               <dt><%=Ec_tab.Attribute.Modifiedby.ZhName %>：</dt><!--Modifie-->
               <dd><span>
               
                    <input id="txtModifiedby" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Modifiedtime">
               <dt><%=Ec_tab.Attribute.Modifiedtime.ZhName %>：</dt><!--修改时间-->
               <dd><span>
               
                    <input id="txtModifiedtime" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Customized">
               <dt><%=Ec_tab.Attribute.Customized.ZhName %>：</dt><!--定制-->
               <dd><span>
               
                    <input id="txtCustomized" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Reportable">
               <dt><%=Ec_tab.Attribute.Reportable.ZhName %>：</dt><!--Reporta-->
               <dd><span>
               
                    <input id="txtReportable" type="text" runat="server"/>
               </span></dd>
        </dl>     
        <dl class="btn"><dd>
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
                    
                    
                    <td><%=Ec_tab.Attribute.Tabid._ZhName %><!--Tabid--></td>
                    
                    
                    <td><%=Ec_tab.Attribute.Name._ZhName %><!--模块名--></td>
                    
                    
                    <td><%=Ec_tab.Attribute.Presence._ZhName %><!--Presenc--></td>
                    
                    
                    <td><%=Ec_tab.Attribute.Tabsequence._ZhName %><!--Tabsequ--></td>
                    
                    
                    <td><%=Ec_tab.Attribute.Tablabel._ZhName %><!--选项卡标签--></td>
                    
                    
                    <td><%=Ec_tab.Attribute.Modifiedby._ZhName %><!--Modifie--></td>
                    
                    
                    <td><%=Ec_tab.Attribute.Modifiedtime._ZhName %><!--修改时间--></td>
                    
                    
                    <td><%=Ec_tab.Attribute.Customized._ZhName %><!--定制--></td>
                    
                    
                    <td><%=Ec_tab.Attribute.Reportable._ZhName %><!--Reporta--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((Ec_tab)Container.DataItem).Tabid %>" /></td>
                     
                    
                    <td><%#((Ec_tab)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Name %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Presence %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Tabsequence %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Tablabel %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Modifiedby %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Modifiedtime %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Customized %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Reportable %></td>
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
