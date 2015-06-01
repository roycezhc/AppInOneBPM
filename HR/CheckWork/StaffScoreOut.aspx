<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CheckWork_StaffScoreOut" CodeFile="StaffScoreOut.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <title><!--导出页--></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
<div class="tblist" id="divList" runat="server">
    <table cellpadding="0" cellspacing="0">
        <thead id="theadRow">
            <tr style="background: #dde; font-weight: 700; line-height: 25px; color: #000;">
                <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                    员工工号
                </td>
                <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                    员工姓名
                </td>
                <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                    开始时间
                </td>
                <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                    结束时间
                </td>
                <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                    任务数
                </td>
                <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                    自测平均值/已评任务数
                </td>
                <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                    直接领导打分平均值/已评任务数
                </td>
                <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                    间接领导打分平均值/已评任务数
                </td>
                <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                    完成率平均值
                </td>
            </tr>
        </thead>
        <tbody id="tbodyList">
            <asp:Repeater ID="repList" runat="server" OnItemDataBound="repList_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                            <%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[0]:"error" %>
                        </td>
                        <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                            <%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[1]:"error" %>
                        </td>
                        <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                            <%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[2]:"error" %>
                        </td>
                        <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                            <%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[3]:"error" %>
                        </td>
                        <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                            <%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[4]:"error" %>
                        </td>
                        <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                            <%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[5]:"error" %>
                        </td>
                        <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                            <%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[6]:"error" %>
                        </td>
                        <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                            <%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[7]:"error" %>
                        </td>
                        <td style="border: .5pt solid windowtext; mso-number-format: \@;">
                            <%#((List<string>)Container.DataItem).Count >= 9?((List<string>)Container.DataItem)[8]:"error" %>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</div>
</asp:Content>
