<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CUSTOM_MODELSet.aspx.cs" Inherits="WECAdmin_WebSite_Model_WEC_CUSTOM_MODELSet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
 <script type="text/javascript">
    
</script>
<style type="text/css">
    body{ overflow:hidden;}
   .form{height:510px; overflow:auto;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">

<div class="main">
   <div class="titnav">
    <dl><dt><b></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>

            <div class="tabs">
         <ul><li class="show"><a>首页模版</a></li><li><a>频道模版</a></li><li><a>列表模版</a></li><li><a>详细模版</a></li><li><a>菜单模版</a></li></ul>
         <ol><li class="show">
            <div class="form">
            
            <dl>
               <dt>首页模版：</dt><%--类型--%>
               <dd><span>
               
                    <select id="txtHome" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>

           <div class="clear"></div>
           </div>
         </li>
         <li>
           <div class="form">
           
           <dl>
               <dt>频道模版：</dt><%--类型--%>
               <dd><span>
               
                    <select id="txtChannel" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>

           <div class="clear"></div>
           </div>
         </li>
         <li>
           <div class="form">
           
           <dl>
               <dt>列表模版：</dt><%--类型--%>
               <dd><span>
               
                    <select id="txtList" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>

           <div class="clear"></div>
           </div>
         </li>
         <li>
           <div class="form">
           
           <dl>
               <dt>详细模版：</dt><%--类型--%>
               <dd><span>
               
                    <select id="txtDetail" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>


           <div class="clear"></div>
           </div>
         </li>
         <li>
           <div class="form">
           
           <dl>
               <dt>菜单模版：</dt><%--类型--%>
               <dd><span>
               
                    <select id="txtMenu" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>


           <div class="clear"></div>
           </div>
         </li>         </ol>
   </div>
      <div class="bottomtool">
       <ul>
       <li><span>
              <asp:Button ID="btnOK" runat="server" lang="BtnOK" Text="确定" Width="51" 
               onclick="btnOK_Click"/>
           </span></li>
       </ul>
       </div>
</div>
</asp:Content>