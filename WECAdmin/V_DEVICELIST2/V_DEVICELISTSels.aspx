<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="V_DEVICELISTSels.aspx.cs" Inherits="V_DEVICELISTSels" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
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
         
            <dl colname="ID">
               <dt><%=V_DEVICELIST.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_ID' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="USER_ID">
               <dt><%=V_DEVICELIST.Attribute.USER_ID.ZhName %>：</dt><!--用户编号-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_USER_ID' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="DEVICE_ID">
               <dt><%=V_DEVICELIST.Attribute.DEVICE_ID.ZhName %>：</dt><!--TOKEN_I-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_DEVICE_ID' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="KIND">
               <dt><%=V_DEVICELIST.Attribute.KIND.ZhName %>：</dt><!--类型-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_KIND' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="DEBUG">
               <dt><%=V_DEVICELIST.Attribute.DEBUG.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_DEBUG' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=V_DEVICELIST.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_STATUS' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="AF_ADDTIEM">
               <dt><%=V_DEVICELIST.Attribute.AF_ADDTIEM.ZhName %>：</dt><!--AF_ADDT-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_AF_ADDTIEM' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="AF_EDITTIME">
               <dt><%=V_DEVICELIST.Attribute.AF_EDITTIME.ZhName %>：</dt><!--AF_EDIT-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_AF_EDITTIME' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="TOKEN_ID">
               <dt><%=V_DEVICELIST.Attribute.TOKEN_ID.ZhName %>：</dt><!--TOKEN_I-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_TOKEN_ID' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="STAFF_NAME">
               <dt><%=V_DEVICELIST.Attribute.STAFF_NAME.ZhName %>：</dt><!--员工姓名-->
               <dd><span>
               
                    <input id='txtV_DEVICELIST_STAFF_NAME' type='text' runat='server'/>
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
                    
                    
                    <td><%=V_DEVICELIST.Attribute.ID._ZhName %><!--编号--></td>
                    
                    
                    <td><%=V_DEVICELIST.Attribute.USER_ID._ZhName %><!--用户编号--></td>
                    
                    
                    <td><%=V_DEVICELIST.Attribute.DEVICE_ID._ZhName %><!--TOKEN_I--></td>
                    
                    
                    <td><%=V_DEVICELIST.Attribute.KIND._ZhName %><!--类型--></td>
                    
                    
                    <td><%=V_DEVICELIST.Attribute.DEBUG._ZhName %><!--状态--></td>
                    
                    
                    <td><%=V_DEVICELIST.Attribute.STATUS._ZhName %><!--状态--></td>
                    
                    
                    <td><%=V_DEVICELIST.Attribute.AF_ADDTIEM._ZhName %><!--AF_ADDT--></td>
                    
                    
                    <td><%=V_DEVICELIST.Attribute.AF_EDITTIME._ZhName %><!--AF_EDIT--></td>
                    
                    
                    <td><%=V_DEVICELIST.Attribute.TOKEN_ID._ZhName %><!--TOKEN_I--></td>
                    
                    
                    <td><%=V_DEVICELIST.Attribute.STAFF_NAME._ZhName %><!--员工姓名--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((V_DEVICELIST)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).USER_ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).DEVICE_ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).KIND %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).DEBUG %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).STATUS %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).AF_ADDTIEM %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).AF_EDITTIME %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).TOKEN_ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).STAFF_NAME %></td>
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
