using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Text.RegularExpressions;
using System.Web;
using AgileFrame.Orm.PersistenceLayer.Model;
using System.Collections.Generic;
using System.Text;

namespace AgileFrame.Core
{
    /// <summary>
    /// 
    /// </summary>
    public class Gengerate
    {
        static Dictionary<string, Dictionary<string, List<string>>> strTagsList = new Dictionary<string, Dictionary<string, List<string>>>();
        static Dictionary<string, Regex> regList = new Dictionary<string, Regex>();
        /// <summary>
        /// 有一个起始标签，可以有多个结束标签
        /// </summary>
        public static void InitStartEndTag()
        {
            Dictionary<string, List<string>> strTags = null;
            string strStartTag = null;
            string strEndTag = null;

            strStartTag = "<!--Repeat{";
            strEndTag = "<!--EndRepeat-->";
            strTags = new Dictionary<string, List<string>>();
            strTags.Add(strStartTag, new List<string>()); strTags[strStartTag].Add(strEndTag);
            strTagsList.Add("Repeat", strTags);
            regList.Add("Repeat", new Regex("<!--Repeat(.*)EndRepeat-->", RegexOptions.IgnoreCase));

            strStartTag = "<!--Switch-->";
            strEndTag = "<!--EndSwitch-->";
            strTags = new Dictionary<string, List<string>>();
            strTags.Add(strStartTag, new List<string>()); strTags[strStartTag].Add(strEndTag);
            strTagsList.Add("Switch", strTags);
            regList.Add("Switch", new Regex("<!--Switch(.*)EndSwitch-->", RegexOptions.IgnoreCase));

            strStartTag = "<!--Case{";
            strEndTag = "<!--EndCase-->";
            strTags = new Dictionary<string, List<string>>();
            strTags.Add(strStartTag, new List<string>()); strTags[strStartTag].Add(strEndTag);
            strTagsList.Add("Case", strTags);
            regList.Add("Case", new Regex("<!--Case(.*)EndCase-->", RegexOptions.IgnoreCase));//// 声明控件的正则表达式
        }
        static Gengerate()
        {
            InitStartEndTag();
        }
        public static Gengerate Factory()
        {
            return new Gengerate();
        }
        public string GengerateListHtml(string template, List<TF_TABLE> listObj)
        {
            // 生成列表页
            Match mRepeat = regRepeat.Match(template);
            while (mRepeat.Success)
            {
                // 替换Repeat控件
                template = template.Replace(mRepeat.Value, GengerateRepeat2(mRepeat.Value));
                mRepeat = mRepeat.NextMatch();
            }
            return template;
        }
        Regex regRepeat = new Regex("<!--Repeat(.*)EndRepeat-->", RegexOptions.IgnoreCase);
        public string GengerateHtml(string template, TF_TABLE valObj, TF_TABLE condObj)
        {
            // 生成列表页
            Match mRepeat = regRepeat.Match(template);
            while (mRepeat.Success)
            {
                // 替换Repeat控件
                template = template.Replace(mRepeat.Value, GengerateRepeat2(mRepeat.Value));
                mRepeat = mRepeat.NextMatch();
            }
            return template;
        }

        public void GengerateHtml()
        {
            // 声明替换的正则表达式
            Regex regReplaceBlank = new Regex(">(\\s+)<", RegexOptions.IgnoreCase);
            Regex regReplaceLine = new Regex("\\s\\n", RegexOptions.IgnoreCase);
            // 声明模板文件源码字符串
            string strList = regReplaceBlank.Replace(regReplaceLine.Replace(File.ReadAllText(strRoot + "Static.htm", System.Text.Encoding.UTF8), ""), "><");
            string strDetail = regReplaceBlank.Replace(regReplaceLine.Replace(File.ReadAllText(strRoot + "StaticDetail.htm", System.Text.Encoding.UTF8), ""), "><");
            string strList2 = GengerateList_Finder_Html2(strList);
            // 生成StaticMain.htm
            File.WriteAllText(strRoot + "StaticMain.htm", strList2, System.Text.Encoding.UTF8);

            Gengerate_Detail_Html2(strDetail);
        }
        

        private Dictionary<string, Dictionary<string, HtmlCache>> strHtml = new Dictionary<string, Dictionary<string, HtmlCache>>();

        public class HtmlCache
        {
            public List<string> types = new List<string>();
            public List<int> heads = new List<int>();
            public List<int> ends = new List<int>();
            public List<string> oneTables = new List<string>();
            public List<string> templateStatic = new List<string>();
            public List<string> innerTemplateList = new List<string>();


        }
        public string DetailHtml(string template, TF_TABLE valObj, TF_TABLE condObj)
        {
            StringBuilder sb = new StringBuilder();

            List<string> types = new List<string>();
            List<int> heads = new List<int>();
            List<int> ends = new List<int>();
            List<string> templateStatic = new List<string>();
            List<string> innerTemplateList = new List<string>();
           
            //对全局进行解析，循环外
            Parse(template, "Repeat", ref types, ref heads, ref ends, ref templateStatic, ref innerTemplateList);
            if (heads.Count == 0) return template;

            int head = heads[0];
            int end = ends[0];
            sb.Append(template.Substring(0, heads[0]));

            for (int i = 0; i < heads.Count; i++)
            {
                end = ends[i];
                if (i > 0)
                    sb.Append(template.Substring(end, head));

                head = heads[i];

                string oneTable = innerTemplateList[i];
                //对oneTable进行解析
                List<AttributeItem> listObj = valObj.af_GetAttributes();
                for (int j = 0; j < listObj.Count; j++)
                {
                    AttributeItem attr = listObj[j];

                    List<string> types1 = new List<string>();
                    List<int> heads1 = new List<int>();
                    List<int> ends1 = new List<int>();
                    List<string> oneTables1 = new List<string>();
                    List<string> templateStatic1 = new List<string>();
                    List<string> innerTemplateList1 = new List<string>();

                    Parse(template, "Switch", ref types1, ref heads1, ref ends1, ref templateStatic1, ref innerTemplateList1);

                    List<string> types2 = new List<string>();
                    List<int> heads2 = new List<int>();
                    List<int> ends2 = new List<int>();
                    List<string> oneTables2 = new List<string>();
                    List<string> templateStatic2 = new List<string>();
                    List<string> innerTemplateList2 = new List<string>();

                    Parse(innerTemplateList1[0], "Case", ref types2, ref heads2, ref ends2, ref templateStatic2, ref innerTemplateList2);

                    string oneField1 = getCtrlHtml(attr.FieldAnotherName);
                    //                    

                    sb.Append(oneField1);

                }
                sb.Append(oneTable);
            }
            return sb.ToString();
        }
        public string getCtrlHtml(string ctrlType)
        {
            switch (ctrlType)
            {
                case "InputString":
                    break;
            }
            return "";
        }
        public string ListHtml(string template, List<TF_TABLE> listObj)
        {
            return "";
        }

        public bool getHtmlCache(string template, string tag, ref List<string> types, ref List<int> heads, ref List<int> ends
            , ref List<string> templateStatic, ref List<string> innerTemplateList)
        {
            Dictionary<string, HtmlCache> out1 = null;
            if (strHtml.TryGetValue(template, out out1))
            {
                HtmlCache out2 = null;
                if (strHtml[template].TryGetValue(tag, out out2))
                    return true;
            }
            return false;
        }
        public bool setHtmlCache(string template, string tag, ref List<string> types, ref List<int> heads, ref List<int> ends
            , ref List<string> templateStatic, ref List<string> innerTemplateList)
        {
            if (!strHtml.ContainsKey(template))
            {
                strHtml.Add(template, new Dictionary<string, HtmlCache>());
            }
            if (!strHtml[template].ContainsKey(tag))
            {
                HtmlCache cache = new HtmlCache();
                cache.types = types;
                cache.heads = heads;
                cache.ends = ends;
                cache.templateStatic = templateStatic;
                cache.innerTemplateList = innerTemplateList;

                strHtml[template].Add(tag, cache);
                return true;
            }
            return false;
        }
        /// <summary>
        /// text = Parse(text, Repeat, ref string type)  source 含有
        /// 
        /// 测试用脚本<!--Repeat{Finder}-->内容<!--EndRepeat-->结束内容
        /// </summary>
        private bool Parse(string template, string tag, ref List<string> types, ref List<int> heads, ref List<int> ends
            , ref List<string> templateStatic, ref List<string> innerTemplateList)
        {
            types = new List<string>(); heads = new List<int>(); ends = new List<int>();
            templateStatic = new List<string>(); innerTemplateList = new List<string>();

            if (getHtmlCache(template, tag, ref  types, ref  heads, ref  ends, ref templateStatic, ref innerTemplateList))
            {
                return true;
            }
            // 声明替换的正则表达式
            Regex regReplaceBlank = new Regex(">(\\s+)<", RegexOptions.IgnoreCase);
            Regex regReplaceLine = new Regex("\\s\\n", RegexOptions.IgnoreCase);
            // 声明模板文件源码字符串
            template = regReplaceBlank.Replace(regReplaceLine.Replace(template, ""), "><");

            Dictionary<string, List<string>> strTags = new Dictionary<string, List<string>>();
            strTagsList.TryGetValue(tag, out strTags);
            if (strTags.Count == 0) return false;
            string strStartTag = null; List<string> strEndTags = null;
            //if (strEndTags == null || strEndTags.Count == 0) return false;
            if (!regList.ContainsKey(tag)) return false;

            innerTemplateList = new List<string>();
            types = new List<string>();
            int i = 0;
            Match mRepeat = regList[tag].Match(template);
            int head = 0; int end = 0;
            while (mRepeat.Success)
            {
                i++;
                head = mRepeat.Index;

                if (i == 1)
                    templateStatic.Add(template.Substring(0, head));
                else
                    templateStatic.Add(template.Substring(end, head));

                end = mRepeat.Index + mRepeat.Length;
                heads.Add(head); ends.Add(end);

                string tagTemplate = mRepeat.Value;

                foreach (string key in strTags.Keys)
                {
                    strStartTag = key;
                    break;
                }
                strEndTags = strTags[strStartTag];

                string newSource = null;

                bool isSuccess = false;
                string type = null;
                //foreach (string strEndTag in strEndTags)
                string strEndTag = strEndTags[0];
                {
                    // 替换title的正则表达式，用于提取控件{}内的字符串 //sql查询                    
                    if (strStartTag.IndexOf("{") != -1)
                    {
                        Regex regReplaceTitle = new Regex("<!--(\\w{3,7}){(.*)}-->", RegexOptions.IgnoreCase);
                        // 提取strSql，并将source的值去掉标签部分
                        Match mType = regReplaceTitle.Match(tagTemplate);

                        if (mType.Success)
                        {
                            isSuccess = true;
                            type = mType.Value.Replace(strStartTag, "").Replace("}-->", "");
                            newSource = tagTemplate.Substring(mType.Index + mType.Length).Replace(strEndTag, "");
                        }
                        //异常了
                    }
                    else
                    {
                        newSource = tagTemplate.Replace(strStartTag, "").Replace(strEndTag, "");
                    }
                }
                types.Add(type);
                innerTemplateList.Add(newSource);
            }
            setHtmlCache(template, tag, ref  types, ref  heads, ref  ends, ref templateStatic, ref innerTemplateList);
            return true;
        }
        // 取根目录
        string strRoot = HttpContext.Current.Request.PhysicalApplicationPath;
        public string GengerateList_Finder_Html2(string template)
        {            
            // 生成列表页
            Match mRepeat = regRepeat.Match(template);
            while (mRepeat.Success)
            { 
                // 替换Repeat控件
                template = template.Replace(mRepeat.Value, GengerateRepeat2(mRepeat.Value));
                mRepeat = mRepeat.NextMatch();
            }
            return template;
        }
         
        public void GengerateListHtml(string template)
        {

        }
        // 生成详细页
        public void Gengerate_Detail_Html2(string template)
        {            
            // 获取数据源
            DataSet ds = new DataSet();// OpOleDb.GetDataSet(OpOleDb.connStr, "select * from Test", null);

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                // 声明一个新的字符串，用来替换数据标签并最终生成文件
                string strTmpDetail = template;

                // 循环替换标签
                foreach (DataColumn dc in ds.Tables[0].Columns)
                {
                    strTmpDetail = strTmpDetail.Replace("{" + dc.ColumnName + "}", dr[dc.ColumnName].ToString());
                }

                // 生成文件
                File.WriteAllText(strRoot + "StaticDetail_" + dr["Id"].ToString() + ".htm", strTmpDetail, System.Text.Encoding.UTF8);
            }
        }
        private string GengerateRepeat2(string source)
        {            
            string html = "";

            // 声明strStratTag和strEndTag
            string strStartTag = "<!--Repeat{";
            string strEndTag = "<!--Repeat End-->";
            string strTag = "";

            // 替换title的正则表达式，用于提取控件{}内的sql查询字符串
            Regex regReplaceTitle = new Regex("<!--(\\w{3,7}){(.*)}-->", RegexOptions.IgnoreCase);

            // 提取strSql，并将source的值去掉标签部分
            Match mTitle = regReplaceTitle.Match(source);
            if (mTitle.Success)
            {
                strTag = mTitle.Value.Replace(strStartTag, "").Replace("}-->", "");
                source = source.Replace(mTitle.Value, "").Replace(strEndTag, "");
            }

            // 取数据源
            if (strTag != "")
            {
                DataSet ds = new DataSet();// OpOleDb.GetDataSet(OpOleDb.connStr, strSql, null);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        { 
                            // 声明一个临时字符串，用于保存替换过后的值
                            string strTmp = source;

                            // 循环替换临时字符串中的数据标签
                            foreach (DataColumn dc in ds.Tables[0].Columns)
                            {
                                strTmp = strTmp.Replace("{" + dc.ColumnName + "}",dr[dc.ColumnName].ToString());
                            }

                            // 将替换过数据标签的字符串添加到需要返回的字符串中
                            html += strTmp;
                        }
                    }
                }
                else
                {
                    html = "暂无数据！";
                }
            }
            else
            {
                html = "该控件没有配置Sql查询字符串！";
            }

            return html;
        }

        public Regex regType { get; set; }
    }
}
