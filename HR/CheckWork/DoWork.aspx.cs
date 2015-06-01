using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.AppInOne.Common;
using System.IO;
using System.Data.OleDb;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using System.Data;

public partial class CheckWork_DoWork : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string doType = Request["dotype"];
        string fileName = Server.UrlDecode(Request["filename"]);
        if (string.IsNullOrEmpty(doType) || string.IsNullOrEmpty(fileName))
        {
            Response.Write("");
            Response.End();
            return;
        }

        string thisPath = Page.MapPath(Page.AppRelativeVirtualPath);
        thisPath = thisPath.Substring(0, thisPath.LastIndexOf('\\'));
        thisPath += "\\uploads\\" + fileName;
        fileName = thisPath;
        if (!File.Exists(fileName))
        {
            Response.Write("操作失败！没有找到文件！");
            Response.End();
            return;
        }
        if (doType == "delete")
        {
            try
            {
                FileInfo fi = new FileInfo(fileName);
                if (fi.Attributes.ToString().IndexOf("ReadOnly") != -1)
                    fi.Attributes = FileAttributes.Normal; 
                File.Delete(fileName);
            }
            catch(Exception ex)
            {
                Response.Write("删除失败！原因如下:\r\n----------\r\n" + ex.Message);
                Response.End();
                return;
            }
            Response.Write("删除成功！");
            Response.End();
            return;
        }
        else if (doType == "updatecheck")
        {
            string fangan = Request["fangan"];
            string stime = Request["stime"];
            string etime = Request["etime"];
            OleDbConnection conn2 = GetDataBase(fileName, "", "");
            if (conn2 == null)
            {
                Response.Write("同步考勤记录失败，上传的数据库文件与方案不匹配！");
                Response.End();
                return;
            }
            
            try
            {
                UpdateCheck(conn2, fangan, stime, etime);
                conn2.Close(); 
            }
            catch (Exception ex)
            {
                Response.Write("同步考勤记录失败，同步期间发生错误，错误内容如下:\r\n----------\r\n" + ex.Message);
                Response.End();
            }
            finally
            {
                if (conn2 != null)
                    try
                    {
                        conn2.Close();
                    }
                    catch { }
            }
        }
        else if (doType == "updatestff")
        {
            string fangan = Request["fangan"];
            OleDbConnection conn2 = GetDataBase(fileName, "", "");
            if (conn2 == null)
            {
                Response.Write("同步员工信息失败，上传的数据库文件与方案不匹配！");
                Response.End();
                return;
            }

            try
            {
                UpdateStff(conn2, fangan);
                conn2.Close();
            }
            catch (Exception ex)
            {
                Response.Write("同步员工信息失败，同步期间发生错误，错误内容如下:\r\n----------\r\n" + ex.Message);
                Response.End();
            }
            finally
            {
                if(conn2 != null)
                    try
                    {
                        conn2.Close();
                    }
                    catch { }
            }
        }
        Response.End();
    }

    private DataTable CreatDefaultFangAnTable(string fangan)
    {
        DataTable tab = new DataTable(fangan);
        tab.Columns.Add("*USERINFO");
        tab.Columns.Add("*CHECKINOUT");
        HR_CK_USERINFO hruser = new HR_CK_USERINFO();
        foreach (AttributeItem ai in hruser.af_AttributeItemList)
        {
            if (ai.FieldName == "ID" || ai.FieldName == "PHOTO")
                continue;
            tab.Columns.Add("USERINFO_" + ai.FieldName);
        }
        HR_CHECKINOUT hrcheck = new HR_CHECKINOUT();
        foreach (AttributeItem ai in hrcheck.af_AttributeItemList)
        {
            if (ai.FieldName == "ID" || ai.FieldName == "PHOTO")
                continue;
            tab.Columns.Add("CHECKINOUT_" + ai.FieldName);
        }

        DataRow dr = tab.NewRow();
        dr["*USERINFO"] = "USERINFO";
        dr["*CHECKINOUT"] = "CHECKINOUT";
        foreach (AttributeItem ai in hruser.af_AttributeItemList)
        {
            if (ai.FieldName == "ID" || ai.FieldName == "PHOTO")
                continue;
            if (ai.FieldName == "STAFF_ID")
                dr["USERINFO_" + ai.FieldName] = "USERID";
            else
                dr["USERINFO_" + ai.FieldName] = ai.FieldName;
        }
        foreach (AttributeItem ai in hrcheck.af_AttributeItemList)
        {
            if (ai.FieldName == "ID" || ai.FieldName == "PHOTO")
                continue;
            if (ai.FieldName == "STAFF_ID")
                dr["CHECKINOUT_" + ai.FieldName] = "USERID";
            else
            dr["CHECKINOUT_" + ai.FieldName] = ai.FieldName;
        }

        tab.Rows.Add(dr);

        return tab;
    }

    private DataTable GetFangan(string fangan)
    {
        DataTable faTab = null;
        if (fangan == "默认方案")
        {
            faTab = CreatDefaultFangAnTable(fangan);
        }
        else
        { }
        return faTab;
    }

    private Dictionary<string, string> GetFieldsByFangAn(string fangan, string tableName)
    {
        DataTable faTab = GetFangan(fangan);
        if (faTab == null || faTab.Rows.Count < 1 || faTab.Columns.Count < 3)
            return new Dictionary<string, string>();
        else
        {
            Dictionary<string, string> fields = new Dictionary<string, string>();
            foreach (DataColumn dc in faTab.Columns)
            {
                string val = Convert.ToString(faTab.Rows[0][dc]);
                int inx = dc.ColumnName.IndexOf(tableName);
                if (inx < 0 || inx > 1)
                    continue;
                fields.Add(dc.ColumnName, val);
            }
            return fields;
        }
    }

    private void UpdateStff(OleDbConnection conn2, string fangan)
    {
        if (conn2 == null)
            return;
        Dictionary<string, string> userFields = GetFieldsByFangAn(fangan, "USERINFO");
        if (!userFields.ContainsKey("*USERINFO"))
        {
            Response.Write("同步方案不完整，请修改方案！");
            Response.End();
            return;
        }
        string sql = "select ";
        foreach (string field in userFields.Keys)
        {
            if (field.Contains("*"))
                continue;
            sql += " " + userFields[field] + ",";
        }
        sql = sql.TrimEnd(',');
        sql += " from " + userFields["*USERINFO"];
        OleDbCommand com = new OleDbCommand(sql, conn2);
        OleDbDataReader dr = com.ExecuteReader();
        HR_CK_USERINFO hruser = new HR_CK_USERINFO();
        List<HR_CK_USERINFO> hrusers = new List<HR_CK_USERINFO>();
        Dictionary<string, HR_CK_USERINFO> userDic = new Dictionary<string, HR_CK_USERINFO>();
        List<HR_CK_USERINFO> chongfuUser = new List<HR_CK_USERINFO>();
        while (dr.Read())
        {
            try
            {
                hruser = new HR_CK_USERINFO();
                foreach (AttributeItem ai in hruser.af_AttributeItemList)
                {
                    if (userFields.ContainsKey("USERINFO_" + ai.FieldName))
                    {
                        object val = dr[userFields["USERINFO_" + ai.FieldName]];
                        if (val != null && !string.IsNullOrEmpty(val.ToString()))
                            hruser.SetValue(ai, val.ToString().Replace("?粀", "").Replace("\0", "").Replace("?", "").Replace("粀", ""));
                    }
                }
                hruser.Remove(new AttributeItem[] { HR_CK_USERINFO.Attribute.STAFF_ID });
                if (!userDic.ContainsKey(hruser.NAME))
                    userDic.Add(hruser.NAME, hruser);
                else
                    chongfuUser.Add(hruser);
                hrusers.Add(hruser);
            }
            catch { }
        }

        foreach (HR_CK_USERINFO user in chongfuUser)
        {
            if (userDic.ContainsKey(user.NAME))
                userDic.Remove(hruser.NAME);
        }

        HR_STAFF stfVal = new HR_STAFF();
        stfVal.STAFF_NAME = "";
        stfVal.STAFF_ID = 0;
        HR_STAFF stfCon = new HR_STAFF();
        List<HR_STAFF> stfList = BLLTable<HR_STAFF>.Factory(conn).Select(stfVal, stfCon);
        Dictionary<string, HR_STAFF> stfDic = new Dictionary<string, HR_STAFF>();
        List<HR_STAFF> chongfuStf = new List<HR_STAFF>();
        foreach (HR_STAFF stf in stfList)
        {
            if (!stfDic.ContainsKey(stf.STAFF_NAME))
                stfDic.Add(stf.STAFF_NAME, stf);
            else
                chongfuStf.Add(stf);
        }

        foreach (HR_STAFF stf in chongfuStf)
        {
            if (stfDic.ContainsKey(stf.STAFF_NAME))
                stfDic.Remove(stf.STAFF_NAME);
        }

        foreach (string name in userDic.Keys)
        {
            if (stfDic.ContainsKey(name))
            {
                HR_CK_USERINFO stfidcon = new HR_CK_USERINFO();//wcp考虑优化新能
                stfidcon.STAFF_ID = stfDic[name].STAFF_ID;
                if (!BLLTable<HR_CK_USERINFO>.Exists(stfidcon))
                    userDic[name].STAFF_ID = stfDic[name].STAFF_ID;
            }
        }

        int countok = 0;
        int countfi = 0;
        int counter = 0;
        foreach (HR_CK_USERINFO user in hrusers)
        {
            try
            {
                int count = 0;
                count = BLLTable<HR_CK_USERINFO>.SaveOrUpdate(user, HR_CK_USERINFO.Attribute.USERID);
                if (count > 0) 
                    countok++;
                else
                    countfi++;
            }
            catch { counter++; }
        }

        Response.Write("同步员工信息数:" + hrusers.Count + "条" + "\n成功:" + countok + "条\n失败:" + countfi + "条\n出错:" + counter + "条");
    }

    private void UpdateCheck(OleDbConnection conn2, string fangan, string stime, string etime)
    {
        if (conn2 == null)
            return;
        Dictionary<string, string> userFields = GetFieldsByFangAn(fangan, "CHECKINOUT");
        if (!userFields.ContainsKey("*CHECKINOUT") || !userFields.ContainsKey("CHECKINOUT_CHECKTIME"))
        {
            Response.Write("同步方案不完整，请修改方案！");
            Response.End();
            return;
        }
        string sql = "select ";
        foreach (string field in userFields.Keys)
        {
            if (field.Contains("*"))
                continue;
            sql += " " + userFields[field] + ",";
        }
        sql = sql.TrimEnd(',');
        sql += " from " + userFields["*CHECKINOUT"];
        sql += " where " + userFields["CHECKINOUT_CHECKTIME"];
        sql += " between #" + stime + "# and #" + etime + "# ";
        OleDbCommand com = new OleDbCommand(sql, conn2);
        OleDbDataReader dr = com.ExecuteReader();
        HR_CHECKINOUT hrcheck = new HR_CHECKINOUT();
        List<HR_CHECKINOUT> hrchecks = new List<HR_CHECKINOUT>();
        while (dr.Read())
        {
            try
            {
                hrcheck = new HR_CHECKINOUT();
                foreach (AttributeItem ai in hrcheck.af_AttributeItemList)
                {
                    if (userFields.ContainsKey("CHECKINOUT_" + ai.FieldName))
                    {
                        object val = dr[userFields["CHECKINOUT_" + ai.FieldName]];
                        if (val != null && !string.IsNullOrEmpty(val.ToString()))
                            hrcheck.SetValue(ai, val);
                    }
                }
                hrchecks.Add(hrcheck);
            }
            catch { }
        }

        int countok = 0;
        int countfi = 0;
        int counter = 0;
        foreach (HR_CHECKINOUT check in hrchecks)
        {
            try
            {
                int count = BLLTable<HR_CHECKINOUT>.SaveOrUpdate(check, HR_CHECKINOUT.Attribute.USERID, HR_CHECKINOUT.Attribute.CHECKTIME);
                if (count > 0)
                    countok++;
                else
                    countfi++;
            }
            catch { counter++; }
        }

        Response.Write("同步考勤记录数:" + hrchecks.Count + "条" + "\n成功:" + countok + "条\n失败:" + countfi + "条\n出错:" + counter + "条");
    }

    private OleDbConnection GetDataBase(string dbName, string user, string pwd)
    {
        OleDbConnection cn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + dbName + ";");
        try
        {
            cn.Open();
        }
        catch { return null; }
        return cn;
    }
}