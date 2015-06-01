using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// SapChartBase 的摘要说明
/// </summary>
public class SapChartBase : System.Web.UI.Page
{
    public List<string> colorList = new List<string>();
    public int stepNum = 10;

    protected void Page_Init(object sender, EventArgs e)
    {
        /*红：255，0，0 
橙: 255,125,0
黄：255，255，0 
绿：0，255，0 
蓝：0，0，255 
靛: 0,255,255
紫: 255,0,255*/
        colorList.Add("255,0,0");
        colorList.Add("255,125,0");
        colorList.Add("255,255,0");
        colorList.Add("0,255,0");
        colorList.Add("0,0,255");
        colorList.Add("0,255,255");
        colorList.Add("255,0,255");

    }

    public int getStepWidth(decimal max) {
        return Convert.ToInt32(max/ stepNum);
    }
}