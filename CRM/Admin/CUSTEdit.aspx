<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTEdit" CodeFile="CUSTEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=CRM_CUST.Attribute.Cus_ID.ZhName %>：</dt><%--客户编号--%>
               <dd><span>
                
                    <input id="txtCus_ID" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.Cus_Name.ZhName %>：</dt><%--客户名称--%>
               <dd><span>
                
                    <input id="txtCus_Name" type="text" runat="server" ck="{need:0,len:150,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.Job.ZhName %>：</dt><%--客户职位--%>
               <dd><span>
               
                    <textarea id="txtJob" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:750,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.RelationTxt.ZhName %>：</dt><%--客户关系描述--%>
               <dd><span>
               
                    <FCKV2:FCKeditor ID="txtRelationTxt" runat="server" Height="250" Width="400" ToolbarSet="Basic" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.Recorder.ZhName %>：</dt><%--创建人--%>
               <dd><span>
                
                    <input id="txtRecorder" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.MobPhone.ZhName %>：</dt><%--手机--%>
               <dd><span>
                
                    <input id="txtMobPhone" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.Phone.ZhName %>：</dt><%--联系电话--%>
               <dd><span>
                
                    <input id="txtPhone" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.ContactName.ZhName %>：</dt><%--联系人姓名--%>
               <dd><span>
                
                    <input id="txtContactName" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.ShopName.ZhName %>：</dt><%--网店名称--%>
               <dd><span>
                
                    <input id="txtShopName" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.ShopAddr.ZhName %>：</dt><%--网店地址--%>
               <dd><span>
                
                    <input id="txtShopAddr" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.QQ.ZhName %>：</dt><%--QQ号码--%>
               <dd><span>
                
                    <input id="txtQQ" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.WW.ZhName %>：</dt><%--旺旺号码--%>
               <dd><span>
                
                    <input id="txtWW" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.Email.ZhName %>：</dt><%--邮件地址--%>
               <dd><span>
                
                    <input id="txtEmail" type="text" runat="server" ck="{need:0,len:150,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.Address.ZhName %>：</dt><%--详细地址--%>
               <dd><span>
                
                    <input id="txtAddress" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.Trade.ZhName %>：</dt><%--行业--%>
               <dd><span>
                
                    <input id="txtTrade" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.Type.ZhName %>：</dt><%--类别--%>
               <dd><span>
                
                    <input id="txtType" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.State.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtState" runat="server" ck="{need:0,len:2147483647,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.IsSign.ZhName %>：</dt><%--是否签约--%>
               <dd><span>
               
                    <select id="txtIsSign" runat="server" ck="{need:0,len:2147483647,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.AddTime.ZhName %>：</dt><%--录入时间--%>
               <dd><span>
               
                    <input id="txtAddTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.EditTime.ZhName %>：</dt><%--修改时间--%>
               <dd><span>
               
                    <input id="txtEditTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.PATH.ZhName %>：</dt><%--PATH--%>
               <dd><span>
               
                    <textarea id="txtPATH" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUST.Attribute.PNAME.ZhName %>：</dt><%--PNAME--%>
               <dd><span>
               
                    <textarea id="txtPNAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>