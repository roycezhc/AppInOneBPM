<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_GUSETBOOKSels.aspx.cs" Inherits="SYS_GUSETBOOKSels" %>
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
         
            <dl colname="ID">
               <dt><%=SYS_GUSETBOOK.Attribute.ID.ZhName %>：</dt><!--ID-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TYPE">
               <dt><%=SYS_GUSETBOOK.Attribute.TYPE.ZhName %>：</dt><!--类型-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="MEMO">
               <dt><%=SYS_GUSETBOOK.Attribute.MEMO.ZhName %>：</dt><!--内容-->
               <dd><span>
               
                    <input id="txtMEMO" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="EMAIL">
               <dt><%=SYS_GUSETBOOK.Attribute.EMAIL.ZhName %>：</dt><!--邮箱-->
               <dd><span>
               
                    <input id="txtEMAIL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MOBIL">
               <dt><%=SYS_GUSETBOOK.Attribute.MOBIL.ZhName %>：</dt><!--手机号码-->
               <dd><span>
               
                    <input id="txtMOBIL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=SYS_GUSETBOOK.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="ANSWER">
               <dt><%=SYS_GUSETBOOK.Attribute.ANSWER.ZhName %>：</dt><!--回复-->
               <dd><span>
               
                    <input id="txtANSWER" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="USERNAME">
               <dt><%=SYS_GUSETBOOK.Attribute.USERNAME.ZhName %>：</dt><!--姓名-->
               <dd><span>
               
                    <input id="txtUSERNAME" type="text" runat="server"/>
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
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.ID._ZhName %><!--ID--></td>
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.TYPE._ZhName %><!--类型--></td>
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.MEMO._ZhName %><!--内容--></td>
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.EMAIL._ZhName %><!--邮箱--></td>
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.MOBIL._ZhName %><!--手机号码--></td>
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.ADDTIME._ZhName %><!--添加时间--></td>
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.ANSWER._ZhName %><!--回复--></td>
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.USERNAME._ZhName %><!--姓名--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((SYS_GUSETBOOK)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).ID %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(SYS_GUSETBOOK.Attribute.TYPE, ((SYS_GUSETBOOK)Container.DataItem).TYPE)%></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).MEMO %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).MOBIL %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).ANSWER %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).USERNAME %></td>
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
