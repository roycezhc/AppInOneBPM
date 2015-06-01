using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AgileFrame.Orm.PersistenceLayer.Model;

public partial class HR_CheckWork_WorkDayData : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime ndt = DateTime.Now;
        DateTime mdt = new DateTime(ndt.Year, ndt.Month, 1).AddMonths(-1);
        //txtStartTime.Value = mdt.ToString("yyyy-MM-dd");
        //txtEndTime.Value = mdt.AddMonths(1).AddSeconds(-1).ToString("yyyy-MM-dd");

        BindList(mdt, mdt.AddMonths(1).AddSeconds(-1));
    }

    private int m_HeadTdLeft = 0;
    private int m_HeadTdIndex = 0;
    private int m_HeadTdCount = 0;
    private bool m_HeadTdDayShowOver = false;
    private int m_HeadTdColspan = 0;
    public string BindHerd(RepeaterItem Container)
    {
        string td = "";
        if (Container == null)
            return td;
        DataColumn dc = Container.DataItem as DataColumn;
        if (dc == null)
            return td;
        string sty = "";
        string tit = dc.ColumnName;
        DateTime dt = DateTime.MinValue;

        m_HeadTdIndex++;
        if (tit == "序号")
        {
            m_HeadTdLeft = 5;
            sty = "style='width:40px;height:45px;position:relative;'";
            td += "<td id='xuhao' class='headtit' " + sty + ">" + "\n";
            td += "    序号" + "\n";
            td += "</td>" + "\n";
            m_HeadTdLeft += 40;
        }
        else if (tit == "姓名")
        {
            sty = "style='width:80px;height:45px;position:relative;'";
            td += "<td id='drawXiexian' class='headtit' " + sty + ">" + "\n";
            td += "    <table>" + "\n";//style='background-image:url(Uploadify/xiexian.gif)'
            td += "        <tr>" + "\n";
            td += "            <td style='text-align:right;border: 0px none #000;'>日期</td>" + "\n";
            td += "        </tr>" + "\n";
            td += "        <tr>" + "\n";
            td += "            <td style='text-align:left;border: 0px none #000;'>姓名</td>" + "\n";
            td += "        </tr>" + "\n";
            td += "    </table>" + "\n";
            td += "</td>" + "\n";
            m_HeadTdLeft += 80;
        }
        else if (tit == "全勤")
        {
            sty = "style='width:40px;height:45px;position:relative;'";
            td += "<td class='headtit' " + sty + ">" + "\n";
            td += "    " + tit + "\n";
            td += "</td>" + "\n";
            m_HeadTdLeft += 40;
        }
        else if (tit == "实际出勤")
        {
            sty = "style='width:40px;height:45px;position:relative;'";
            td += "<td class='headtit' " + sty + ">" + "\n";
            td += "    <table>" + "\n";
            td += "        <tr>" + "\n";
            td += "            <td style='border: 0px none #000;'>实际</td>" + "\n";
            td += "        </tr>" + "\n";
            td += "        <tr>" + "\n";
            td += "            <td style='border: 0px none #000;'>出勤</td>" + "\n";
            td += "        </tr>" + "\n";
            td += "    </table>" + "\n";
            td += "</td>" + "\n";
            m_HeadTdLeft += 40;
        }
        else if (DateTime.TryParse(tit, out dt))
        {
            sty = "style='text-align:left;width:25px; min-width:25px;max-width:25px;position:relative;'";
            td += "<td class='headtit' " + sty + ">" + "\n";
            td += "    <table>" + "\n";
            td += "        <tr>" + "\n";
            td += "            <td style='border: 0px none #000;border-bottom:1px solid #aad;'>" + dt.Day.ToString().PadLeft(2, '0') + "</td>" + "\n";
            td += "        </tr>" + "\n";
            td += "        <tr>" + "\n";
            td += "            <td style='border: 0px none #000;'>" + CheckInOutHelper.ChineseByEnWeek(dt) + "</td>" + "\n";
            td += "        </tr>" + "\n";
            td += "    </table>" + "\n";
            td += "</td>" + "\n";
            m_HeadTdLeft += 25;
        }
        else if (!m_HeadTdDayShowOver)
        {
            m_HeadTdColspan = m_HeadTdCount - m_HeadTdIndex + 1;
            sty = "style='width:" + (38 * 15 + 14) + "px;position:relative;'";
            td += "<td class='headtit' " + sty + ">" + "\n";
            td += "<table>" + "\n";
            td += "<tr>" + "\n";
            td += "    <td colspan=\"" + m_HeadTdColspan + "\" style='border: 0px none #000;border-bottom:1px solid #aad; text-align:left;'>出勤情况<td>" + "\n";
            td += "</tr>" + "\n";
            td += "<tr>";
            sty = "style='width:" + (tit.Length * 15 + 5) + "px; border: 0px none #000;border-right: 1px solid #aad;'";
            td += "<td " + sty + ">" + "\n";
            td += "    " + tit + "\n";
            td += "</td>" + "\n";
            m_HeadTdLeft += 38 * 15 + 14;
            m_HeadTdDayShowOver = true;
        }
        else if (m_HeadTdIndex == m_HeadTdCount)
        {
            sty = "style='width:" + (tit.Length * 15 + 5) + "px;border: 0px none #000;border-right: 1px solid #aad;'";
            td += "<td  " + sty + ">" + "\n";
            td += "    " + tit + "\n";
            td += "</td>" + "\n";
            td += "</tr>" + "\n";
            td += "</table>" + "\n";
            td += "</td>" + "\n";
        }
        else
        {
            sty = "style='width:" + (tit.Length * 15 + 5) + "px;border: 0px none #000;border-right: 1px solid #aad;'";
            td += "<td  " + sty + ">" + "\n";
            td += "    " + tit + "\n";
            td += "</td>" + "\n";
        }
        return td;
    }

    private int colIndex = 0;
    public string BindBody(RepeaterItem Container)
    {
        if (Container == null || Container.DataItem == null)
            return "";
        colIndex++;
        string sty = "";
        if (m_HeadTdCount - colIndex == m_HeadTdColspan - 1)
        {
            return "<td " + sty + "><table><tr><td>" + Container.DataItem.ToString() + "</td>";
        }
        else if (m_HeadTdCount - colIndex < m_HeadTdColspan - 1)
        {
            return "<td>" + Container.DataItem.ToString() + "</td>";
        }
        else if (m_HeadTdCount == colIndex)
        {
            colIndex = 0;
            return "<td>" + Container.DataItem.ToString() + "</td></tr></table></td>";
        }
        return "<td " + sty + ">" + Container.DataItem.ToString() + "</td>";
    }

    public string BindRow(RepeaterItem Container)
    {
        if (Container == null)
            return "";
        Repeater rep = Container.FindControl("repRow") as Repeater;
        if (rep == null)
            return "";
        DataRow dr = Container.DataItem as DataRow;
        if (dr == null || dr.ItemArray.Length < 3)
            return "";
        DateTime dt = DateTime.Now;
        rep.EnableViewState = false;
        rep.DataSource = dr.ItemArray;
        rep.DataBind();
        return "";

        //if (dr[0].ToString() == dt.Year + "-" + dt.Month.ToString().PadLeft(2, '0') + "-" + dt.Day.ToString().PadLeft(2, '0'))
        //    return " style='background-color:#5e5e5e;' ";
        //else
        //    return "";
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
        }
    }

    private void BindList(DateTime sdate, DateTime edate)
    {
        string msg = "";
        //DataTable data = CheckInOutHelper.ContrastAndReceiveTable(new V_HR_CK_USERINFO(), sdate, edate, ref msg);
        DataTable data = CheckInOutHelper.ContrastAndReceiveTable(0,"0", sdate, edate, ref msg);
        if (data == null)
            return;
        m_HeadTdCount = data.Columns.Count;
        //repHead.EnableViewState = false;
        //repHead.DataSource = data.Columns;
        //repHead.DataBind();
        //repList.EnableViewState = false;
        //repList.DataSource = data.Rows;
        //repList.DataBind();
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        DateTime ndt = DateTime.Now;
        DateTime mdt = new DateTime(ndt.Year, ndt.Month, 1);
        DateTime sdate = mdt.Date;
        DateTime edate = mdt.AddMonths(1).AddSeconds(-1);
        //DateTime.TryParse(txtStartTime.Value, out sdate);
        //DateTime.TryParse(txtEndTime.Value, out edate);
        BindList(sdate, edate);
    }
}