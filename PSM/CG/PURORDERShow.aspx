<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="IM_PURORDERShow" CodeFile="PURORDERShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=IM_PURORDER.Attribute.PORD_ID.ZhName %>：</dt><%--ID--%>
               <dd>
                
                    <asp:Label id="txtPORD_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.PORD_NO.ZhName %>：</dt><%--单据编号--%>
               <dd>
                
                    <asp:Label id="txtPORD_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.C_DATE.ZhName %>：</dt><%--单据日期--%>
               <dd>
               
                    <asp:Label id="txtC_DATE" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.ORG_ID.ZhName %>：</dt><%--机构ID--%>
               <dd>
                
                    <asp:Label id="txtORG_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.DEPT_ID.ZhName %>：</dt><%--部门ID--%>
               <dd>
                
                    <asp:Label id="txtDEPT_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.SUP_ID.ZhName %>：</dt><%--供应商ID--%>
               <dd>
                
                    <asp:Label id="txtSUP_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.PERSON_HID.ZhName %>：</dt><%--经手人ID--%>
               <dd>
                
                    <asp:Label id="txtPERSON_HID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.TS_NO.ZhName %>：</dt><%--运单号--%>
               <dd>
                
                    <asp:Label id="txtTS_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.GOODES_NUM.ZhName %>：</dt><%--货物数量--%>
               <dd>
                
                    <asp:Label id="txtGOODES_NUM" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.ARRIVAL_DATE.ZhName %>：</dt><%--到货日期--%>
               <dd>
               
                    <asp:Label id="txtARRIVAL_DATE" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.PACKAGE_TYPE.ZhName %>：</dt><%--包装方式--%>
               <dd>
                
                    <asp:Label id="txtPACKAGE_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.TS_DEPT.ZhName %>：</dt><%--承运单位--%>
               <dd>
                
                    <asp:Label id="txtTS_DEPT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.PHONE.ZhName %>：</dt><%--电话--%>
               <dd>
                
                    <asp:Label id="txtPHONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.COST_PEICE_FLAG.ZhName %>：</dt><%--成本价采购--%>
               <dd>
                
                    <asp:Label id="txtCOST_PEICE_FLAG" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.STOR_ID.ZhName %>：</dt><%--STOR_ID--%>
               <dd>
                
                    <asp:Label id="txtSTOR_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.DEDUCTION_RATE.ZhName %>：</dt><%--扣率--%>
               <dd>
                
                    <asp:Label id="txtDEDUCTION_RATE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.TAX_RATE.ZhName %>：</dt><%--TAX_RATE--%>
               <dd>
                
                    <asp:Label id="txtTAX_RATE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.CREATER.ZhName %>：</dt><%--CREATER--%>
               <dd>
                
                    <asp:Label id="txtCREATER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.CHECKER.ZhName %>：</dt><%--CHECKER--%>
               <dd>
                
                    <asp:Label id="txtCHECKER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.NOTE.ZhName %>：</dt><%--备注--%>
               <dd>
               
                    <asp:Label id="txtNOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.REMARK.ZhName %>：</dt><%--摘要--%>
               <dd>
               
                    <asp:Label id="txtREMARK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.EXP1.ZhName %>：</dt><%--自定义1--%>
               <dd>
                
                    <asp:Label id="txtEXP1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.EXP2.ZhName %>：</dt><%--自定义2--%>
               <dd>
                
                    <asp:Label id="txtEXP2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=IM_PURORDER.Attribute.EXP3.ZhName %>：</dt><%--自定义3--%>
               <dd>
                
                    <asp:Label id="txtEXP3" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>