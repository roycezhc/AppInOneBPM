<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomBlockList.aspx.cs"
    Inherits="TEMPLATE_CRM_WJ_Control_panel_Ctrl_CustomBlockList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem" %>

<table class="crm-table" width="100%" border="0" cellpadding="3" cellspacing="1">
    <tbody>
        <tr height="28px" class="windLayerHead">
            <td width="5%">
                #
            </td>
            <td width="20%">
                显示区域
            </td>
            <td width="20%">
                显示顺序
            </td>
            <td width="20%">
                工具
            </td>
        </tr>
        <% 
                
            for(int i=0;i<list.Count;i++)
            {
                %>       
        <tr>
            <td nowrap="">
                <%=i+1 %>&nbsp;
            </td>
            <td nowrap="">
                <%=list[i].Blocklabel%>&nbsp;
            </td>
            <td nowrap="">
                <%=list[i].Sequence%>&nbsp;
            </td>
            <td nowrap="">
                <i class="icon-edit pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                    cursor: pointer; font-size: 14px;" onclick="getCreateCustomBlockForm('<%=list[i].Blockid%>','<%=list[i].Blockid%>','<%=list[i].Tabid%>','<%=list[i].Blocklabel %>','<%=list[i].Sequence%>')">
                </i>
                <i class="icon-trash pure-icon-bu crm-bu-style" style="width: 50px; height: 50px;
                    cursor: pointer; font-size: 14px;" onclick="deleteCustomBlock(<%=list[i].Blockid %>,'<%=list[i].Blockid %>', '', '');">
                </i> &nbsp;
            </td>
        </tr>
        <%} %>
    </tbody>
</table>

      
     