using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;

/// <summary>
///Wage_Helper 的摘要说明
/// </summary>

    public  class Wage_Helper : BasePage
    {
        public Wage_Helper()
        {
            //
            //TODO: 在此处添加构造函数逻辑
            //
        }
        public DataTable GetYgzmx(string ygbh, string scyf)
        {
            GZ_YGZMX valYgzmx = new GZ_YGZMX();
            GZ_YGZMX conYgzmx = new GZ_YGZMX();

            string detailwhere = " SELECT * FROM GZ_YGZMX WHERE 1=1";

            if (!string.IsNullOrEmpty(scyf))
            {
                detailwhere = string.Format(" {0} and SCYF = '{1}'", detailwhere, scyf);
            }
            if (!string.IsNullOrEmpty(ygbh))
            {
                detailwhere = string.Format(" {0} and (YGBH LIKE '%{1}%' OR YGXM LIKE'%{1}%')", detailwhere, ygbh);
            }
            conn = "connMES";
            DataTable dtbYGZMX = BLLTable<GZ_YGZMX>.Factory(conn).qDataTable(detailwhere);
            return dtbYGZMX;


        }
        /// <summary>
        /// 根据工序ID获取工序名称
        /// </summary>
        /// <param name="strGxID">工序ID</param>
        public  string GetGxName(string strGxID)
        {
            string strGxName;
            GZ_GXDZB valGxdzb = new GZ_GXDZB();
            GZ_GXDZB conGxdzb = new GZ_GXDZB();
            conGxdzb.MESGXID = strGxID;
            conn = "connMES";
            valGxdzb = BLLTable<GZ_GXDZB>.Factory(conn).GetRowData(conGxdzb);
            strGxName = valGxdzb.MESGXMC;
            return strGxName;

        }
        /// <summary>
        /// 获取工序列表
        /// </summary>
        /// <param name="strwhere">查询条件</param>
        public DataTable GetGxTable(string strwhere)
        {        
            conn = "connMES";
            DataTable dtbGX = BLLTable<GZ_GXDZB>.Factory(conn).qDataTable(strwhere);
            return dtbGX;
        }
        /// <summary>
        /// 一次不良率报表 按照操作日期获取班组作业信息
        /// </summary>
        /// <param name="tablename">班组作业明细表名</param>
        /// <param name="czrq">操作日期</param>
        /// <returns></returns>
        public DataTable GetBzzyByRQ(string czrq1, string czrq2, string tbname, string m_xxlx)
        {
            GG_BZZYMX valYgzmx = new GG_BZZYMX();
            GG_BZZYMX conYgzmx = new GG_BZZYMX();

            string detailwhere = " SELECT XH,sum(CZSL)CZSL,sum(SJCZBS)SJCZBS,sum(HGBS)HGBS,sum(BHGBS)BHGBS   ";
            detailwhere = string.Format(" {0},Cast(Cast(sum(BHGBS)As decimal(18,3))/Cast(sum(CZSL)As decimal(18,3))*1000 as  decimal(18,3)) YCBLL ", detailwhere);
            detailwhere = string.Format("  {0},'{1}'as TABLENAME ,'{2}' as M_XXLX ,'{3}'as CZRQ1 ,'{4}'as CZRQ2 ", detailwhere, tbname, m_xxlx, czrq1, czrq2);
            detailwhere = string.Format("  {0} FROM {1} MX  ", detailwhere, tbname);
            detailwhere = string.Format("{0} JOIN JC_CPXX CPXX ON MX.CPID=CPXX.CPID WHERE 1=1", detailwhere);
            if (!string.IsNullOrEmpty(czrq1) && !string.IsNullOrEmpty(czrq2))
            {
                detailwhere = string.Format(" {0} and CZRQ >= '{1}' AND CZRQ <= '{2}'", detailwhere, czrq1, czrq2);
            }
            if (!string.IsNullOrEmpty(m_xxlx) && m_xxlx != "全部")
            {
                if (m_xxlx == "其它")
                {
                    detailwhere = string.Format(" {0} and ( XXLX = '{1}' OR XXLX = NULL)", detailwhere, "");
                }
                else if (m_xxlx == "三相")
                {
                    detailwhere = string.Format(" {0} and substring(XXLX,1,2) = '{1}'", detailwhere, m_xxlx);
                }
                else
                {
                    detailwhere = string.Format(" {0} and XXLX = '{1}'", detailwhere, m_xxlx);
                }
            }
            detailwhere = string.Format("{0} GROUP BY XH", detailwhere);
            conn = "connMES";
            DataTable dtbYGZMX = BLLTable<GG_BZZYMX>.Factory(conn).qDataTable(detailwhere);
            return dtbYGZMX;
        }
        /// <summary>
        /// 一次不良率报表 按照型号获取班组作业信息
        /// </summary>
        /// <param name="tablename">班组作业明细表名</param>
        /// <param name="czrq">操作日期</param>
        /// <param name="xh">型号</param>
        /// <param name="strwhere">查询条件</param>
        /// <returns></returns>
        public DataTable GetBzzyByXH(string czrq1, string czrq2, string xh, string tbname, string m_xxlx)
        {
            GG_BZZYMX valYgzmx = new GG_BZZYMX();
            GG_BZZYMX conYgzmx = new GG_BZZYMX();

            string detailwhere = " SELECT XH,BZID,JGMC,sum(CZSL)CZSL,sum(SJCZBS)SJCZBS,sum(HGBS)HGBS,sum(BHGBS)BHGBS ";
            detailwhere = string.Format(" {0},Cast(Cast(sum(BHGBS)As decimal(18,3))/Cast(sum(CZSL)As decimal(18,3))*1000 as  decimal(18,3)) YCBLL ", detailwhere);
            detailwhere = string.Format("  {0},'{1}'as TABLENAME ,'{2}' as M_XXLX ,'{3}'as CZRQ1 ,'{4}'as CZRQ2 ", detailwhere, tbname, m_xxlx, czrq1, czrq2);
            detailwhere = string.Format("  {0} FROM {1} MX  ", detailwhere, tbname);
            detailwhere = string.Format("{0} JOIN JC_CPXX CPXX ON MX.CPID=CPXX.CPID ", detailwhere);
            detailwhere = string.Format("{0} JOIN JC_ZZJG ZZJG ON MX.BZID=ZZJG.JGID WHERE 1=1", detailwhere);
            if (!string.IsNullOrEmpty(czrq1) && !string.IsNullOrEmpty(czrq2))
            {
                detailwhere = string.Format(" {0} and CZRQ >= '{1}' AND CZRQ <= '{2}'", detailwhere, czrq1, czrq2);
            }
            if (!string.IsNullOrEmpty(xh))
            {
                detailwhere = string.Format(" {0} and XH='{1}'", detailwhere, xh);
            }
            if (!string.IsNullOrEmpty(m_xxlx) && m_xxlx != "全部")
            {
                if (m_xxlx == "其它")
                {
                    detailwhere = string.Format(" {0} and ( XXLX = '{1}' OR XXLX = NULL)", detailwhere, "");
                }
                else if (m_xxlx == "三相")
                {
                    detailwhere = string.Format(" {0} and substring(XXLX,1,2) = '{1}'", detailwhere, m_xxlx);
                }
                else
                {
                    detailwhere = string.Format(" {0} and XXLX = '{1}'", detailwhere, m_xxlx);
                }
            }
            detailwhere = string.Format("{0} GROUP BY XH,BZID,JGMC", detailwhere);
            conn = "connMES";
            DataTable dtbYGZMX = BLLTable<GG_BZZYMX>.Factory(conn).qDataTable(detailwhere);
            return dtbYGZMX;


        }
        /// <summary>
        /// 一次不良率报表 在班组作业明细表中按照班组获取作业单
        /// </summary>
        /// <param name="tablename">班组作业明细表名</param>
        /// <param name="czrq">操作日期</param>
        /// <param name="xh">型号</param>
        /// <param name="strwhere">查询条件</param>
        /// <returns></returns>
        public DataTable GetSczydByBZ(string bzid, string xh, string czrq1, string czrq2, string tbname, string m_xxlx)
        {
            GG_BZZYMX valYgzmx = new GG_BZZYMX();
            GG_BZZYMX conYgzmx = new GG_BZZYMX();

            string detailwhere = " SELECT SCZYDID,KHMC,MX.CPID,SAPRemark,CZSL,SJCZBS,HGBS,BHGBS  ";
            detailwhere = string.Format(" {0},Cast(Cast((BHGBS)As decimal(18,3))/Cast((CZSL)As decimal(18,3))*1000 as  decimal(18,3)) YCBLL ", detailwhere);
            detailwhere = string.Format("  {0},'{1}'as TABLENAME ,XXLX as M_XXLX ", detailwhere, tbname);
            detailwhere = string.Format("  {0} FROM {1} MX  ", detailwhere, tbname);
            detailwhere = string.Format("{0} JOIN JC_CPXX CPXX ON MX.CPID=CPXX.CPID", detailwhere);
            detailwhere = string.Format("{0} JOIN JC_KHXX KHXX ON MX.KHID=KHXX.KHID WHERE 1=1", detailwhere);

            if (!string.IsNullOrEmpty(czrq1) && !string.IsNullOrEmpty(czrq2))
            {
                detailwhere = string.Format(" {0} and CZRQ >= '{1}' AND CZRQ <= '{2}'", detailwhere, czrq1, czrq2);
            }
            if (!string.IsNullOrEmpty(xh))
            {
                detailwhere = string.Format(" {0} and XH='{1}'", detailwhere, xh);
            }
            if (!string.IsNullOrEmpty(bzid))
            {
                detailwhere = string.Format(" {0} and BZID='{1}'", detailwhere, bzid);
            }
            if (!string.IsNullOrEmpty(m_xxlx) && m_xxlx != "全部")
            {
                if (m_xxlx == "其它")
                {
                    detailwhere = string.Format(" {0} and ( XXLX = '{1}' OR XXLX = NULL)", detailwhere, "");
                }
                else if (m_xxlx == "三相")
                {
                    detailwhere = string.Format(" {0} and substring(XXLX,1,2) = '{1}'", detailwhere, m_xxlx);
                }
                else
                {
                    detailwhere = string.Format(" {0} and XXLX = '{1}'", detailwhere, m_xxlx);
                }
            }
            //detailwhere = string.Format("{0} GROUP BY SCZYDID,KHMC,XXLX", detailwhere);
            conn = "connMES";
            DataTable dtbYGZMX = BLLTable<GG_BZZYMX>.Factory(conn).qDataTable(detailwhere);
            return dtbYGZMX;


        }
        /// <summary>
        /// 根据工序ID获取班组明细
        /// </summary>
        /// <param name="strGxID">工序ID</param>
        public static string GetBzMxTableName(string strGxID)
        {
            string strTableName;
            switch (strGxID)
            {
                case "102112":     //贴片
                    strTableName = "TP_BZZYMX";
                    break;
                case "102111":     //贴片检
                    strTableName = "TPJ_BZZYMX";
                    break;
                case "102123":    //波峰焊
                    strTableName = "BFH_BZZYMX";
                    break;
                case "102124":    //功耗检测,补焊
                    strTableName = "FCT_BZZYMX";
                    break;
                case "102125":    //清洗
                    strTableName = "QX_BZZYMX";
                    break;
                case "102126":    //功能板检
                    strTableName = "BJ_BZZYMX";
                    break;
                case "102127":    //多功能板检
                    strTableName = "DGNBJ_BZZYMX";
                    break;
                case "102129":
                    strTableName = "TJ_BZZYMX";
                    break;
                case "102211":    //组装
                    strTableName = "ZZH_BZZYMX";
                    break;
                case "102212":    //返修
                    strTableName = "FG_BZZYMX";
                    break;
                case "102213":    //耐压
                    strTableName = "NY_BZZYMX";
                    break;
                case "102221":    //老化
                    strTableName = "LH_BZZYMX";
                    break;
                case "102311":    //电校
                    strTableName = "JB_BZZYMX";
                    break;
                case "102411":    //走字
                    strTableName = "ZZ_BZZYMX";
                    break;
                case "102511":    //成品检
                    strTableName = "CPJ_BZZYMX";
                    break;
                case "102611":    //包装
                    strTableName = "BZ_BZZYMX";
                    break;
                case "102712":    //客户维修
                    strTableName = "WX_BZZYMX";
                    break;
                default:
                    strTableName = "";
                    break;
            }
            return strTableName;
        }

    }
