<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rcl.aspx.cs" Inherits="QC_defect_rate" %>

<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <table cellpadding="0" cellspacing="0" style="margin-bottom: 16px">
    <div>
      <td style="padding-right: 4px">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="生产日期:"/>
      </td>
      <td style="padding-right: 8px">
        <dx:ASPxDateEdit ID="dateedtSCRQ1" runat="server">
        </dx:ASPxDateEdit>
      </td>
       <td style="padding-right: 4px">
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="至"/>
      </td>
         <td style="padding-right: 16px">
        <dx:ASPxDateEdit ID="dateedtSCRQ2" runat="server" >
        </dx:ASPxDateEdit>
      </td>
      <td style="padding-right: 4px">
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="工序:"/>
      </td>
       <td style="padding-right: 16px">
        <dx:ASPxComboBox runat="server" ID="cbGX" ValueType="System.Int32" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="电校" Value="102311" />
                        <dx:ListEditItem Text="成品检" Value="102511" />
                        <dx:ListEditItem Text="包装" Value="102611" />    
                    </Items>
                 <%--   <ClientSideEvents SelectedIndexChanged="function(s) { grid.PerformCallback(s.GetValue()) }" />--%>
        </dx:ASPxComboBox>
      </td>
     <td style="padding-right: 4px">
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="相线:"/>
      </td>
      <td style="padding-right: 16px">
        <dx:ASPxComboBox runat="server" ID="cbXXLX" ValueType="System.Int32" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="全部" Value="0" />
                        <dx:ListEditItem Text="单相" Value="1" />
                        <dx:ListEditItem Text="三相" Value="2" />
                        <dx:ListEditItem Text="其它" Value="3" />
                    </Items>
                 <%--   <ClientSideEvents SelectedIndexChanged="function(s) { grid.PerformCallback(s.GetValue()) }" />--%>
        </dx:ASPxComboBox>
      </td>
      <td style="padding-right: 4px">
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="型号:"/>
      </td>
       <td style="padding-right: 16px">
           <dx:ASPxTextBox ID="txtXH" runat="server" Width="150px">
           </dx:ASPxTextBox>
      </td>
      <td style="padding-right: 4px">
        <dx:ASPxButton runat="server" ID="btnSerch" Text="查询" UseSubmitBehavior="false" 
              AutoPostBack="false" OnClick="btnSerch_Click"/> 
           <%-- <ClientSideEvents Click="function(s) { grid.PerformCallback(s.GetValue());}" />--%>
        </dx:ASPxButton>
      </td>
   
       <td style="padding-right: 16px">
         <dx:ASPxButton runat="server" ID="btnXlsExport" Text="导出" UseSubmitBehavior="false"
                    AutoPostBack="false"  OnClick="btnXlsExport_Click"/>               
         </dx:ASPxButton>
       </td>
  
       
    </div>
    </table>

     <dx:ASPxGridView ID="gridRGZ" ClientInstanceName="gridRGZ" runat="server"   Width="100%" AutoGenerateColumns="False"
          OnCustomCallback="gridRGZ_CustomCallback"  OnHtmlDataCellPrepared="gridRGZ_HtmlDataCellPrepared">
      <Settings ShowGroupPanel="True" ShowFooter="True"   />
      

       <Columns>
            <dx:GridViewDataColumn FieldName="XH" Caption="型号" VisibleIndex="12" GroupIndex="0"/>
            <dx:GridViewDataColumn FieldName="TJBZ" Caption="班组" VisibleIndex="1" GroupIndex="1" />
            <dx:GridViewDataColumn FieldName="CZRQ" Caption="日期" VisibleIndex="2" />
            <dx:GridViewDataColumn FieldName="JGMC" Caption="班组名称" VisibleIndex="3" />
            <dx:GridViewDataColumn FieldName="XXLX" Caption="相线类型" VisibleIndex="4" />
            <dx:GridViewDataColumn FieldName="SCZYDID" Caption="生产作业单" VisibleIndex="5" />
            
            <dx:GridViewDataColumn FieldName="SL" Caption="数量" VisibleIndex="6" />
         <%--   <dx:GridViewDataColumn FieldName="SJCZBS" Caption="操作表数" VisibleIndex="7" />
            <dx:GridViewDataColumn FieldName="HGSL" Caption="合格数量" VisibleIndex="8" />
            <dx:GridViewDataColumn FieldName="HGBS" Caption="合格表数" VisibleIndex="9" />
            <dx:GridViewDataColumn FieldName="BZRS" Caption="班组人数" VisibleIndex="9" />
            <dx:GridViewDataColumn FieldName="GRYXCL" Caption="个人产量" VisibleIndex="9" />
             <dx:GridViewDataColumn FieldName="ZWXS" Caption="职务系数" VisibleIndex="9" />--%>
<%--            <dx:GridViewDataTextColumn FieldName="DJ" Caption="单价(元)" VisibleIndex="10"  UnboundType="Decimal" >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="JE" Caption="金额(元)" VisibleIndex="11" UnboundType="Decimal" >--%>
 
      <%--      </dx:GridViewDataTextColumn>--%>
           
            <dx:GridViewDataColumn FieldName="KHMC" Caption="客户信息" VisibleIndex="13" />
            <dx:GridViewDataColumn FieldName="SAPRemark" Caption="产品描述" VisibleIndex="14" />
<%--            <dx:GridViewDataColumn FieldName="SJLY" Caption="数据来源" VisibleIndex="14" />
            <dx:GridViewDataColumn FieldName="SPZT" Caption="审批状态" VisibleIndex="14" />
            <dx:GridViewDataColumn FieldName="JJYXZ" Caption="计件有效值" Visible="false" />--%>
        </Columns>
         
          <TotalSummary>
            <dx:ASPxSummaryItem FieldName="SL" SummaryType="Sum" DisplayFormat="合计数量:{0}" />
<%--            <dx:ASPxSummaryItem FieldName="GRHGSL" SummaryType="Sum" DisplayFormat="合格数量:{0}" />
             <dx:ASPxSummaryItem FieldName="GRHGBS" SummaryType="Sum" DisplayFormat="合格表数:{0}" />--%>
           <%-- <dx:ASPxSummaryItem FieldName="JE" SummaryType="Sum" DisplayFormat="合计(元):{0}"/>--%>
          </TotalSummary>
      
         <GroupSummary>
          <%--  <dx:ASPxSummaryItem FieldName="YGXM" SummaryType="Max" DisplayFormat="员工姓名:{0}" />--%>
           <%-- <dx:ASPxSummaryItem FieldName="SCZYDID" SummaryType="Count" DisplayFormat="生产作业单记录数:{0}" />--%>
            <dx:ASPxSummaryItem FieldName="SL" SummaryType="Sum"  DisplayFormat="合计数量:{0}" />
            
         </GroupSummary>
          
      <Settings ShowGroupPanel="True" ShowFooter="True"></Settings>
      <SettingsPager PageSize="25" /> 
     <%-- <ClientSideEvents Init="grid_Init" />  --%>
          
     </dx:ASPxGridView>
    <dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridRGZ">
    </dx:ASPxGridViewExporter>
    </form>
</body>
</html>
