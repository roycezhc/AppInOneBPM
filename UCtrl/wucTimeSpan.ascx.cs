using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
public partial class UCtrl_wucTimeSpan : AgileFrame.AppInOne.Common.BaseUserControl
{

    public void SetTypeEnabled(int type)
    {
        if (type == 4) {
            selType.Disabled = true;
            selYear.Disabled = true;
            selJD.Disabled = true;
            selMonth.Disabled = true;
        }
        if (type == 3)
        {
            selType.Disabled = true;
            selYear.Disabled = true;
            selJD.Disabled = true;
        }
        if (type == 2)
        {
            selType.Disabled = true;
            selYear.Disabled = true;
        }
        if (type == 1)
        {
            selType.Disabled = true;
        }
    }
    public string selWeekInfo = "";
    /// <summary>
    /// 设置控件
    /// </summary>
    public void setSelType(DateTime begintime, int taskType)
    {
        selType.Value = Convert.ToString(taskType);

        txtBeginTime.Value = begintime.ToString("yyyy-M-d");
        txtEndTime.Value = begintime.AddDays(1).ToString("yyyy-M-d");

        selYear.Value = begintime.Year.ToString();
        selJD.Value = (begintime.Month + 2 / 3).ToString();
        selMonth.Value = begintime.Month.ToString();

        selWeek.Value = DateTimeExd.GetWeekNumInMonth(begintime).ToString();// ((begintime.Day / 7) + 1).ToString();
        //Response.Write(DateTimeExd.GetWeekNumInMonth(begintime).ToString());
        if (taskType == 0)
        {
            selType.Items.Remove("1"); selType.Items.Remove("2"); selType.Items.Remove("3"); selType.Items.Remove("4");
            selType.Items.Remove("11"); selType.Items.Remove("12");
        }
        if (taskType > 0 && taskType < 5)
        {
            selType.Items.Remove("11"); selType.Items.Remove("12"); selType.Items.Remove("0");
            if (taskType == 4) {
            
            }

        }
        if (taskType > 10)
        {
            selType.Items.Remove("0"); selType.Items.Remove("1"); selType.Items.Remove("2"); selType.Items.Remove("3"); selType.Items.Remove("4");

        }

    }

    public int getSelType()
    {
        return int.Parse(selType.Value);
    }
    /// <summary>
    /// 获取某年某月某周是第几日开始
    /// </summary>
    /// <param name="y"></param>
    /// <param name="m"></param>
    /// <param name="weekNum"></param>
    /// <returns></returns>
    int getMonthWeekFirstDay(int y, int m, int weekNum)
    {
        int day = getMonthWeekDay(y, m, weekNum);
        day = filterDay(y, m, day); 
        return day;
    }
    private int getMonthWeekDay(int y, int m, int weekNum)
    {
        DateTime d = DateTime.Parse(y + "-" + m + "-01");
        int day = 1;
        if (weekNum == 1)
        {
            return day;
        }
        else
        {
            int dw = DateTimeExd.GetWeekNum(d);//1号是星期几
            if (dw == 0)
            {
                dw = 7;
            }
            if (weekNum == 2)
            {
                day = 1 + (7 - dw) + 1;
                //day = 1 + 7 - (7 - dw);//第一周 1号+下周隔7天-（本月1号没有的几个星期）
            }
            else
            {
                //day = 1 + 7 - (7 - dw);
                day = 1 + (7 * (weekNum - 1) - dw) + 1;
            }
        }
        return day;
    }
    int getMonthWeekLastDay(int y, int m, int weekNum)
    {
        int day = getMonthWeekDay(y, m, weekNum);
        day += 6;
        if (weekNum == 1)
        {
            DateTime d = DateTime.Parse(y + "-" + m + "-01");
            int dw = d.GetWeekNum();//1号是星期几
            day = day - (dw - 1);
        }
        day = filterDay(y, m, day);
        return day;
    }
    int filterDay(int y, int m, int day)
    {
        string big = ",1,3,5,7,8,10,12,";
        if (big.IndexOf("," + m.ToString() + ",") != -1)
        {
            if (day > 31)
            {
                day = 31;
            }
        }
        else
        {
            if (m == 2)
            {
                if (DateTime.IsLeapYear(y))
                {
                    if (day > 29)
                    {
                        day = 29;
                    }
                }
                else
                {
                    if (day > 28)
                    {
                        day = 28;
                    }
                }
            }
            else
            {
                if (day > 30)
                {
                    day = 30;
                }
            }
        }
        //if (m > 12)
        //{
        //    y++;
        //}
        return day;
    }

    public string getBeginDateStr()
    {
        string str = "";
        if (selType.Value == "0")
        {
            str = txtBeginTime.Value;
        }
        if (selType.Value == "1")
        {
            str = selYear.Value + "-01-01";
        }
        if (selType.Value == "2")
        {
            if (selJD.Value == "1")
            {
                str = selYear.Value + "-01-01";
            }
            if (selJD.Value == "2")
            {
                str = selYear.Value + "-04-01";
            }
            if (selJD.Value == "3")
            {
                str = selYear.Value + "-07-01";
            }
            if (selJD.Value == "4")
            {
                str = selYear.Value + "-10-01";
            }
        }
        if (selType.Value == "3")
        {
            str = selYear.Value + "-" + selMonth.Value + "-01";
        }
        if (selType.Value == "4")
        {
            int y = int.Parse(selYear.Value);
            int m = int.Parse(selMonth.Value);
            int day = getMonthWeekFirstDay(y, m, int.Parse(selWeek.Value));

            string daystr = day > 9 ? day.ToString() : "0" + day.ToString();
            str = y + "-" + selMonth.Value + "-" + daystr;
        }
        return str;
    }
    public DateTime getBeginDate()
    {

        return DateTime.Parse(getBeginDateStr());
    }

    public string getEndDateStr()
    {
        string str = "";
        if (selType.Value == "0")
        {
            str = txtEndTime.Value;
        }
        if (selType.Value == "1")
        {
            str = selYear.Value + "-12-31";
        }
        if (selType.Value == "2")
        {
            if (selJD.Value == "1")
            {
                str = selYear.Value + "-03-31";
            }
            if (selJD.Value == "2")
            {
                str = selYear.Value + "-06-30";
            }
            if (selJD.Value == "3")
            {
                str = selYear.Value + "-09-30";
            }
            if (selJD.Value == "4")
            {
                str = selYear.Value + "-12-31";
            }
        }
        if (selType.Value == "3")
        {
            string big = ",01,03,05,07,08,10,12,";
            //string small = "04,06,09,11";
            string m = selMonth.Value;
            if (int.Parse(selMonth.Value) < 10)
            {
                m = "0" + int.Parse(selMonth.Value);
            }
            if (big.IndexOf("," + m + ",") != -1)
            {
                str = selYear.Value + "-" + m + "-31";
            }
            else
            {
                if (m == "02")
                {
                    if (DateTime.IsLeapYear(int.Parse(selYear.Value)))
                    {
                        str = selYear.Value + "-" + selMonth.Value + "-29";
                    }
                    else {
                        str = selYear.Value + "-" + selMonth.Value + "-28";
                    }
                }
                else
                {
                    str = selYear.Value + "-" + selMonth.Value + "-30";
                }
            }

        }
        if (selType.Value == "4")
        {
            int y = int.Parse(selYear.Value);
            int m = int.Parse(selMonth.Value);
            int day = getMonthWeekLastDay(y, m, int.Parse(selWeek.Value));
            //int dw = TimeHelper.GetWeek(DateTime.Parse(y + "-" + m + "-01"));
            //if (dw < 7)
            //{
            //    if (int.Parse(selWeek.Value) == 1)
            //    {
            //        day = day + 7 - dw;
            //    }
            //    else
            //    {
            //        day += 6;
            //    }
            //}
            //else
            //{
            //    day += 6;
            //}

            //string big = "01,03,05,07,08,10,12";
            //if (big.IndexOf(selMonth.Value) != -1)
            //{
            //    if (day > 31)
            //    {
            //        day =31;
            //    }
            //}
            //else
            //{
            //    if (selMonth.Value == "2")
            //    {
            //        if (day > 28)
            //        {
            //            day =28;
            //        }
            //    }
            //    else
            //    {
            //        if (day > 30)
            //        {
            //            day =30;
            //        }
            //    }
            //}
            string daystr = day > 9 ? day.ToString() : "0" + day;
            str = y + "-" + m + "-" + daystr;
        }
        return str;
    }

    public DateTime getEndDate()
    {

        return DateTime.Parse(getEndDateStr());
    }

    public bool Enabled
    {
        get {
            return !selType.Disabled;
        }
        set {
            selType.Disabled = !value;
            selYear.Disabled = !value;
            selJD.Disabled = !value;
            selMonth.Disabled = !value;
            selWeek.Disabled = !value;
        }
    }

    public void setSelType(int type)
    {        
        string selTypeStr = "";
        DateTime d = DateTime.Now;
        if (type == 4)
        {
            selTypeStr = d.Year + "|" + d.GetJiDu() + "|" + d.Month + "|" + DateTimeExd.GetWeekNumInMonth(d);
        }
        else if (type == 3)
        {
            selTypeStr = d.Year + "|" + d.GetJiDu() + "|" + d.Month + "|";
        }
        else if (type == 2)
        {
            selTypeStr = d.Year + "|" + d.GetJiDu() + "||";
        }
        else
        {
            selTypeStr = d.Year + "|||";
        }
        setSelType(type, selTypeStr);
    }

    public void setSelType(int type,string selTypeStr)
    {
        selType.Value = type.ToString();
        if (!string.IsNullOrEmpty(selTypeStr)) {
            string[] arr = selTypeStr.Split('|');//DateTime.
            selYear.Value = arr[0];
            selJD.Value=arr[1];
            selMonth.Value=arr[2];
            selWeek.Value=arr[3];
            if (arr.Length > 4)
            {
                txtBeginTime.Value = arr[4];
                txtEndTime.Value = arr[5];
            }
        }
    }
    public string getSelTypeStr()
    {
        int jd = 1;
        int mm = int.Parse(selMonth.Value);
        if (mm > 9)
        {
            jd = 4;
        }
        else if (mm > 6)
        {
            jd = 3;
        }
        else if (mm > 3)
        {
            jd = 2;
        }
        string str="";
        if (selType.Value == "0")
        {
            DateTime bd = DateTime.Parse(txtBeginTime.Value);
            jd = 1;
            if (bd.Month > 9) {
                jd = 4;
            }
            else if (bd.Month > 6)
            {
                jd = 3;
            }
            else if (bd.Month > 3)
            {
                jd = 2;
            }
            str = bd.Year + "|" + jd + "|" + bd.Month + "|" + DateTimeExd.GetWeekNumInMonth(bd) + "|" + txtBeginTime.Value + "|" + txtEndTime.Value;
        }
        if (selType.Value == "1")
        {
            str =selYear.Value+"|||";
        }
        if (selType.Value == "2")
        {
            str =selYear.Value+"|"+selJD.Value+"||";
        }
        if (selType.Value == "3")
        {
            

            str =selYear.Value+"|"+jd+"|"+selMonth.Value+"|";
        }
        if (selType.Value == "4")
        {
            str = selYear.Value + "|" + jd + "|" + selMonth.Value + "|" + selWeek.Value;
        }

        return str;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}