<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ygz.aspx.cs" Inherits="Wage_Ygz" %>
<%@ Register Assembly="DevExpress.Web.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.1.Export, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <table cellpadding="0" cellspacing="0" style="margin-bottom: 16px">
    <div>
      <td style="padding-right: 4px">
          <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="统计月份">
          </dx:ASPxLabel>
      </td>
       <td style="padding-right: 16px">
        <dx:ASPxDateEdit ID="dateedtTJYF" runat="server"  ClientInstanceName="sDate" EditFormatString="yyyy-MM" >
        </dx:ASPxDateEdit>
      </td>
       
      <td style="padding-right: 4px">
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="员工:"/>
      </td>
       <td style="padding-right: 16px">
           <dx:ASPxTextBox ID="txtYG" runat="server" Width="150px">
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

    
       <dx:ASPxCheckBox ID="chkSingleExpanded" runat="server" Text="一次只展开一行"
        AutoPostBack="true" OnCheckedChanged="chkSingleExpanded_CheckedChanged" />
       <br />
    
    </div>
    </table>

     <dx:ASPxGridView ID="gridYGZ" ClientInstanceName="gridYGZ" runat="server"   Width="100%" AutoGenerateColumns="False"
          OnCustomCallback="gridYGZ_CustomCallback" >
      <Settings ShowGroupPanel="True" ShowFooter="True"   />
      

       <Columns>
     <%--    <dx:GridViewBandColumn  Caption= "月工资汇总" VisibleIndex="10">--%>
                     
                    <dx:GridViewDataColumn Caption="生产日期" FieldName="SCYF" VisibleIndex="0">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="员工编号" FieldName="YGBH" VisibleIndex="1">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="员工姓名" FieldName="YGXM" VisibleIndex="2">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="出勤天数" FieldName="CQTS" VisibleIndex="3">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataTextColumn Caption="计件工资(元)" FieldName="JJGZ" 
                        UnboundType="Decimal" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="奖(元)" FieldName="JIANG" UnboundType="Decimal" 
                        VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="罚(元)" FieldName="FA" UnboundType="Decimal" 
                        VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="职务补贴(元)" FieldName="ZWBT" 
                        UnboundType="Decimal" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn Caption="职务" FieldName="ZHIWU" VisibleIndex="8">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn Caption="厂务工资(元)" FieldName="CWGZ" VisibleIndex="9">
                    </dx:GridViewDataColumn>
                      <dx:GridViewDataTextColumn Caption="合计(元)" FieldName="JE" UnboundType="Decimal" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
           
        <%--        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />--%>
       <%--  </dx:GridViewBandColumn>--%>
       </Columns> 
             
   
      
     <TotalSummary>
        <dx:ASPxSummaryItem FieldName="YGBH" SummaryType="Count" DisplayFormat="人数:{0}" />
        <dx:ASPxSummaryItem FieldName="JE" SummaryType="Sum" DisplayFormat="合计:{0:c}"/>
     </TotalSummary>

      <Templates>
            <DetailRow>
                <b> <%# Eval("YGXM")%></b> <b>
                        <%# Eval("SCYF")%></b><b>
                        计件工资明细</b>
                <br />
                <br />
                <dx:ASPxGridView ID="detailYgzmx" ClientInstanceName="detailYgzmx" runat="server" Width="100%" 
                DataSourceID="YgzmxDataSource" OnBeforePerformDataSelect="detailYgzmx_DataSelect" OnHtmlDataCellPrepared="detailYgzmx_HtmlDataCellPrepared">
                    <Columns>
                        <dx:GridViewDataColumn FieldName="SCZYDID" Caption="生产作业单" VisibleIndex="1" />
                        <dx:GridViewDataColumn FieldName="GXID" Caption="工序" VisibleIndex="2" />
                        <dx:GridViewDataColumn FieldName="KHMC" Caption="客户信息" VisibleIndex="3" />
                        <dx:GridViewDataColumn FieldName="GRCL" Caption="个人产量" VisibleIndex="4" />
                        <dx:GridViewDataColumn FieldName="JJGZ" Caption="计件工资" VisibleIndex="5"  />
                        <dx:GridViewDataColumn FieldName="XH" Caption="型号" VisibleIndex="6" />
                        <dx:GridViewDataColumn FieldName="SAPRemark" Caption="产品描述" VisibleIndex="7" />
                    </Columns>
                    <Settings ShowFooter="True" />
                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="SCZYDID" SummaryType="Count"  DisplayFormat="记录数:{0}" />
                        <dx:ASPxSummaryItem FieldName="GRCL" SummaryType="Sum"  DisplayFormat="个人产量:{0}" />
                        <dx:ASPxSummaryItem FieldName="JJGZ" SummaryType="Sum"  DisplayFormat="计件工资:{0:c}"/> 
                    </TotalSummary> 
                </dx:ASPxGridView>
            </DetailRow>
       </Templates>

    
          
     <SettingsDetail ShowDetailRow="true" />
     <Settings ShowGroupPanel="false" ShowFooter="True"></Settings>
     </dx:ASPxGridView>
     <dx:ASPxGridViewExporter ID="gridExport" runat="server" GridViewID="gridYGZ"/>

    <asp:ObjectDataSource ID="YgzmxDataSource" runat="server" SelectMethod="GetYgzmx" TypeName="Site.Wage_Helper">
        <SelectParameters>
            <asp:SessionParameter Name="ygbh" SessionField="YGBH" Type="string" />
            <asp:SessionParameter Name="scyf" SessionField="SCYF" Type="string" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
