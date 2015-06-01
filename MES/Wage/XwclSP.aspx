<%@ Page Language="C#" AutoEventWireup="true" CodeFile="XwclSP.aspx.cs" Inherits="Wage_XwclSP" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <table cellpadding="0" cellspacing="0" style="margin-bottom: 8px">
    <div>  
      <td style="padding-right: 4px">
        <dx:ASPxButton runat="server" ID="btnWSP" Text="未审批数据" UseSubmitBehavior="false" 
              AutoPostBack="false" OnClick="btnWSP_Click"/> 
        </dx:ASPxButton>
      </td>
      <td style="padding-right: 4px">
        <dx:ASPxButton runat="server" ID="btnYSP" Text="已审批数据" UseSubmitBehavior="false" 
              AutoPostBack="false" OnClick="btnYSP_Click"/> 
        </dx:ASPxButton>
      </td>
    </div>
    </table>
       <table cellpadding="0" cellspacing="0" style="margin-bottom: 16px">
    <div>
  </div>
    </table>
    <div>
     <dx:ASPxGridView ID="gridRGZ" ClientInstanceName="gridRGZ" runat="server"   Width="100%" AutoGenerateColumns="False"
         OnHtmlDataCellPrepared="gridRGZ_HtmlDataCellPrepared">
      <Settings ShowGroupPanel="True" ShowFooter="True"   />
      

       <Columns>
            <dx:GridViewDataColumn FieldName="GXID" Caption="工序ID" VisibleIndex="1" GroupIndex="0" />
            <dx:GridViewDataColumn FieldName="GXMC" Caption="工序" VisibleIndex="2" />
            <dx:GridViewDataColumn FieldName="CZRQ" Caption="生产日期" VisibleIndex="3" />
            <dx:GridViewDataColumn FieldName="ZYBZID" Caption="作业班组ID" Visible=false/>
            <dx:GridViewDataColumn FieldName="ZYBZMC" Caption="作业班组名称" VisibleIndex="5" />
            <dx:GridViewDataColumn FieldName="CQRS" Caption="出勤人数" VisibleIndex="6" />
            <dx:GridViewDataColumn FieldName="SCZYDID" Caption="生产作业单ID" VisibleIndex="7" />
            <dx:GridViewDataColumn FieldName="KHMC" Caption="客户" VisibleIndex="8" />
            <dx:GridViewDataColumn FieldName="CPID" Caption="产品ID" VisibleIndex="9" />
            <dx:GridViewDataColumn FieldName="CQBZCL" Caption="班组产量" VisibleIndex="10" />
            <dx:GridViewDataColumn FieldName="KHID" Caption="客户ID" VisibleIndex="11" />
            <dx:GridViewDataColumn FieldName="SAPRemark" Caption="产品描述" VisibleIndex="12" />
            <dx:GridViewDataColumn FieldName="JLID" Caption="ID" Visible=false />
            <dx:GridViewDataColumn FieldName="SPZT" Caption="审批状态" VisibleIndex="14" />
        </Columns>
         
         <%-- <TotalSummary>
            <dx:ASPxSummaryItem FieldName="GRCZSL" SummaryType="Sum" DisplayFormat="操作数量:{0}" />
            <dx:ASPxSummaryItem FieldName="GRHGSL" SummaryType="Sum" DisplayFormat="合格数量:{0}" />;
             <dx:ASPxSummaryItem FieldName="GRHGBS" SummaryType="Sum" DisplayFormat="合格表数:{0}" />
            <dx:ASPxSummaryItem FieldName="JE" SummaryType="Sum" DisplayFormat="合计(元):{0}"/>
          </TotalSummary>--%>
      
         <GroupSummary>
            <dx:ASPxSummaryItem FieldName="GXMC" SummaryType="Max" DisplayFormat="工序:{0}" />
<%--            <dx:ASPxSummaryItem FieldName="SCZYDID" SummaryType="Count" DisplayFormat="生产作业单记录数:{0}" />
            <dx:ASPxSummaryItem FieldName="JE" SummaryType="Sum"  DisplayFormat="合计(元):{0}" />--%>
            
         </GroupSummary>
          
      <Settings ShowGroupPanel="True" ShowFooter="True"></Settings>
      <SettingsPager PageSize="15" /> 
     <%-- <ClientSideEvents Init="grid_Init" />  --%>
          
     </dx:ASPxGridView>
    </div>
    </form>
</body>
</html>
