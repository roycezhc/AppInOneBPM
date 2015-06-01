<%@ Page Language="C#" AutoEventWireup="true" CodeFile="YCBLL.aspx.cs" Inherits="MES_QC_YCBLL" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
 <form id="form2" runat="server">
   <table cellpadding="0" cellspacing="0" style="margin-bottom: 8px">
    <div>
      <td style="padding-right: 4px">
       <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="生产日期:"/>
      </td>
      <td style="padding-right: 8px">
        <dx:ASPxDateEdit ID="dateedtSCRQ1" runat="server"> </dx:ASPxDateEdit>
      </td>
       <td style="padding-right: 4px">
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="至"/>
      </td>
      <td style="padding-right: 16px">
        <dx:ASPxDateEdit ID="dateedtSCRQ2" runat="server" > </dx:ASPxDateEdit>
      </td>
      <td style="padding-right: 4px">
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="工序:"/>
      </td>
      <td style="padding-right: 16px">
        <dx:ASPxComboBox runat="server" ID="cbGX" ValueType="System.Int32" SelectedIndex="0">
            <Items>
              <dx:ListEditItem Text="贴片检" Value="102111" />
              <dx:ListEditItem Text="波峰焊" Value="102123" />
              <dx:ListEditItem Text="补焊" Value="102124" />
              <dx:ListEditItem Text="功能板检" Value="102126" />
              <dx:ListEditItem Text="耐压" Value="102213" />
              <dx:ListEditItem Text="老化" Value="102221" />
              <dx:ListEditItem Text="电校" Value="102311" />
              <dx:ListEditItem Text="走字" Value="102411" />
              <dx:ListEditItem Text="成品检" Value="102511" />
              <dx:ListEditItem Text="包装" Value="102611" />  
            </Items>
        </dx:ASPxComboBox>
      </td>
      <td style="padding-right: 4px">
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="相线:"/>
      </td>
      <td style="padding-right: 16px">
        <dx:ASPxComboBox runat="server" ID="cbXXLX" ValueType="System.Int32" SelectedIndex="0">
           <Items>
             <dx:ListEditItem Text="全部" Value="0" />
             <dx:ListEditItem Text="单相" Value="1" />
             <dx:ListEditItem Text="三相" Value="2" />
             <dx:ListEditItem Text="其它" Value="3" />
           </Items>
        </dx:ASPxComboBox>
      </td>
      <td style="padding-right: 4px">
        <dx:ASPxButton runat="server" ID="btnSerch" Text="查询" UseSubmitBehavior="false" AutoPostBack="false" OnClick="btnSerch_Click"/> 
      </td>
    </div>
  </table>
  <table cellpadding="0" cellspacing="0"style="margin-bottom: 16px">
    <tr>
   <%-- <td style="padding-right: 4px">
          <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="导出选择:" />
    </td>
    <td style="padding-right: 24px">
         <dx:ASPxComboBox runat="server" ID="ddlExportMode" AutoPostBack="true" OnSelectedIndexChanged="ddlExportMode_SelectedIndexChanged">
         </dx:ASPxComboBox>
    </td>       --%>
    <td style="padding-right: 4px">
         <dx:ASPxButton ID="btnXlsExport" runat="server" Text="导出XLS" UseSubmitBehavior="False" OnClick="btnXlsExport_Click" >
         </dx:ASPxButton>
    </td>
    <td style="padding-right: 4px">
         <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="导出XLSX" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" >
         </dx:ASPxButton>
    </td>
    </tr>

  </table>
    <dx:ASPxGridView ID="grid1" ClientInstanceName="grid1" runat="server"   Width="100%" KeyFieldName="CZRQ1" 
    AutoGenerateColumns="False"  OnCustomSummaryCalculate="grid1_CustomSummaryCalculate"  >
      <Settings  ShowFooter="True"   />     
       <Columns>         
            <dx:GridViewDataColumn FieldName="CZSL" Caption="操作数量" VisibleIndex="6" />
          <%--  <dx:GridViewDataColumn FieldName="SJCZBS" Caption="操作表数" VisibleIndex="7" />--%>
            <dx:GridViewDataColumn FieldName="HGBS" Caption="合格表数" VisibleIndex="8" />
            <dx:GridViewDataColumn FieldName="BHGBS" Caption="一次不合格表数" VisibleIndex="9" />
            <dx:GridViewDataColumn FieldName="YCBLL" Caption="一次不良率(‰)" VisibleIndex="10" />  
            <dx:GridViewDataColumn FieldName="TABLENAME" Visible="false"/>   
            <dx:GridViewDataColumn FieldName="M_XXLX" Visible="false"/> 
            <dx:GridViewDataColumn FieldName="CZRQ1" Visible="false"/>    
            <dx:GridViewDataColumn FieldName="CZRQ2" Visible="false"/>      
        </Columns>
        <SettingsDetail ShowDetailRow="True" ExportMode="All" />
         <Templates>
            <DetailRow>
                日期: <b>
                    <%# Eval("CZRQ1")%>至<%# Eval("CZRQ2")%></b>, 工序: <b>
                        <%# cbGX.Text %></b>
                <br /><br />
                <dx:ASPxGridView ID="grid2XH" ClientInstanceName="grid2XH" runat="server"   Width="100%" KeyFieldName="XH" ForeColor="blue"
                 DataSourceID="grid2XHDataSource" OnBeforePerformDataSelect="grid2XH_DataSelect" AutoGenerateColumns="False">
                <Columns>            
                 <dx:GridViewDataColumn FieldName="XH" Caption="型号" VisibleIndex="1" />
                 <dx:GridViewDataColumn FieldName="CZSL" Caption="操作数量" VisibleIndex="2" />
              <%--   <dx:GridViewDataColumn FieldName="SJCZBS" Caption="操作表数" VisibleIndex="7" />--%>
                 <dx:GridViewDataColumn FieldName="HGBS" Caption="合格表数" VisibleIndex="4" />
                 <dx:GridViewDataColumn FieldName="BHGBS" Caption="一次不合格表数" VisibleIndex="5" />
                 <dx:GridViewDataColumn FieldName="YCBLL" Caption="一次不良率(‰)" VisibleIndex="6" >  
                 <%-- <DataItemTemplate>
                 <%# Math.Round(((Convert.ToDecimal(Eval("BHGBS")) / Convert.ToDecimal(Eval("SJCZBS"))) * 1000), 2, MidpointRounding.AwayFromZero)%>
                 </DataItemTemplate>--%>
                 </dx:GridViewDataColumn>
                 <dx:GridViewDataColumn FieldName="TABLENAME" Visible="false"/> 
                 <dx:GridViewDataColumn FieldName="M_XXLX" Visible="false"/>  
                 <dx:GridViewDataColumn FieldName="CZRQ1"  Visible="false"/>
                 <dx:GridViewDataColumn FieldName="CZRQ2" Visible="false"/>
                </Columns>
                <SettingsDetail ShowDetailRow="True" ExportMode="All" />
         
                <Templates>
                  <DetailRow>
                     型号: <b>
                      <%# Eval("XH")%></b>
                     <br /><br />
                
                     <dx:ASPxGridView ID="grid3BZ" ClientInstanceName="grid3BZ" runat="server" Width="100%" KeyFieldName="BZID" ForeColor="green"
                      DataSourceID="grid3BZDataSource"   OnBeforePerformDataSelect="grid3BZ_DataSelect">
                     <Columns>
                       <dx:GridViewDataColumn FieldName="BZID" Caption="班组ID" Visible="false" />
                       <dx:GridViewDataColumn FieldName="JGMC" Caption="班组" VisibleIndex="1" />
                       <dx:GridViewDataColumn FieldName="CZSL" Caption="操作数量" VisibleIndex="2" />
                     <%--  <dx:GridViewDataColumn FieldName="SJCZBS" Caption="操作表数" VisibleIndex="3" />--%>
                       <dx:GridViewDataColumn FieldName="HGBS" Caption="合格表数" VisibleIndex="4" />
                       <dx:GridViewDataColumn FieldName="BHGBS" Caption="一次不合格表数" VisibleIndex="5" />
                       <dx:GridViewDataColumn FieldName="YCBLL" Caption="一次不良率(‰)" VisibleIndex="6" >    
                       <%--<DataItemTemplate>
                           <%# Math.Round(((Convert.ToDecimal(Eval("BHGBS")) / Convert.ToDecimal(Eval("SJCZBS"))) * 1000), 2, MidpointRounding.AwayFromZero)%>
                         </DataItemTemplate>--%>
                       </dx:GridViewDataColumn>
                       <dx:GridViewDataColumn FieldName="TABLENAME" Visible="false"/> 
                       <dx:GridViewDataColumn FieldName="M_XXLX" Visible="false"/>   
                       <dx:GridViewDataColumn FieldName="CZRQ1"  Visible="false"/>
                      <dx:GridViewDataColumn FieldName="CZRQ2"  Visible="false"/> 
                     </Columns>
                  
                    <SettingsDetail ShowDetailRow="True"  />
                    <Templates>
                      <DetailRow>
                          班组: <b>
                          <%# Eval("JGMC")%></b>
                         <br /><br />
                
                        <dx:ASPxGridView ID="grid4SCZYD" ClientInstanceName="grid4SCZYD" runat="server" Width="100%"  
                           DataSourceID="grid4SCZYDataSource" OnBeforePerformDataSelect="grid4SCZYD_DataSelect">
                           <Columns>
                            <dx:GridViewDataColumn FieldName="SCZYDID" Caption="生产作业单" VisibleIndex="1" />
                            <dx:GridViewDataColumn FieldName="KHMC" Caption="客户" VisibleIndex="2" />
                            <dx:GridViewDataColumn FieldName="CPID" Caption="产品ID" VisibleIndex="3" />
                            <dx:GridViewDataColumn FieldName="SAPRemark" Caption="描述" VisibleIndex="4" />
                            <dx:GridViewDataColumn FieldName="CZSL" Caption="操作数量" VisibleIndex="5" />
                           <%-- <dx:GridViewDataColumn FieldName="SJCZBS" Caption="操作表数" VisibleIndex="6" />--%>
                           <dx:GridViewDataColumn FieldName="HGBS" Caption="合格表数" VisibleIndex="7" />
                           <dx:GridViewDataColumn FieldName="BHGBS" Caption="一次不合格表数" VisibleIndex="8" />
                           <dx:GridViewDataColumn FieldName="YCBLL" Caption="一次不良率(‰)" VisibleIndex="9" >
                    <%--          <DataItemTemplate>
                                <%# Math.Round(((Convert.ToDecimal(Eval("BHGBS")) / Convert.ToDecimal(Eval("SJCZBS"))) * 1000), 2, MidpointRounding.AwayFromZero)%>
                              </DataItemTemplate>--%>
                           </dx:GridViewDataColumn>
                           <dx:GridViewDataColumn FieldName="M_XXLX" Caption="相线类型" VisibleIndex="10" />  
                          </Columns>
                       </dx:ASPxGridView>
                      </DetailRow>
                    </Templates>   
             </dx:ASPxGridView>
            </DetailRow>
         </Templates>   

     <%-- <SettingsPager PageSize="15" />      --%>
                </dx:ASPxGridView>
            </DetailRow>  
         </Templates>    
     </dx:ASPxGridView >
    
  
    <dx:ASPxGridViewExporter ID="exporter" runat="server" />
    <asp:ObjectDataSource ID="grid2XHDataSource" runat="server"  SelectMethod="GetBzzyByRQ" TypeName="Wage_Helper">
         <SelectParameters>
           <asp:SessionParameter Name="czrq1" SessionField="CZRQ1" Type="string" />
           <asp:SessionParameter Name="czrq2" SessionField="CZRQ2" Type="string" />
           <asp:SessionParameter Name="tbname" SessionField="TABLENAME" Type="string" />
           <asp:SessionParameter Name="m_xxlx" SessionField="M_XXLX" Type="string" />
         </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="grid3BZDataSource" runat="server" SelectMethod="GetBzzyByXH" TypeName="Wage_Helper">
        <SelectParameters>
           <asp:SessionParameter Name="xh" SessionField="XH" Type="string" />
           <asp:SessionParameter Name="czrq2" SessionField="CZRQ2" Type="string" />
           <asp:SessionParameter Name="czrq1" SessionField="CZRQ1" Type="string" />
           <asp:SessionParameter Name="tbname" SessionField="TABLENAME" Type="string" />
           <asp:SessionParameter Name="m_xxlx" SessionField="M_XXLX" Type="string" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="grid4SCZYDataSource" runat="server" SelectMethod="GetSczydByBZ" TypeName="Wage_Helper">
         <SelectParameters>
           <asp:SessionParameter Name="xh" SessionField="XH" Type="string" />
           <asp:SessionParameter Name="czrq1" SessionField="CZRQ1" Type="string" />
           <asp:SessionParameter Name="czrq2" SessionField="CZRQ2" Type="string" />
           <asp:SessionParameter Name="bzid" SessionField="BZID" Type="string" />
           <asp:SessionParameter Name="tbname" SessionField="TABLENAME" Type="string" />
           <asp:SessionParameter Name="m_xxlx" SessionField="M_XXLX" Type="string" />
         </SelectParameters>
    </asp:ObjectDataSource>
 </form>
</body>
</html>
