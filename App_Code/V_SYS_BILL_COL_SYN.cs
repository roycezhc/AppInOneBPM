/************************************************************

  Copyright (c) 2008，ybkj_zlg
  Author:               Created Time: 2013/04/11 16:07:01
  Description:    数据表V_SYS_BILL_COL_SYN对应的业务逻辑层V_SYS_BILL_COL_SYN
  Version:         2.1.0.0
 
 * 对此文件的更改可能会导致不正确的行为，并且如果
     重新生成代码，这些更改将会丢失。您可以扩展该类
 * 实现自己的 V_SYS_BILL_COL_SYN_Entity:V_SYS_BILL_COL_SYN
 * 
************************************************************/
/************************************************************
SQL代码：
select COL_SYNID,BILL_ID,COL_ID,DB_SRC,TABLE_NAME,COL_NAME,COL_NOTE,DATA_TYPE,DATA_LEN,DATA_ACC,IS_AUTO,ISPK,DVAL,PK_VALCODE,ISFK,SORT_NO,FK_NAME,FK_SHOW,DISPLAY_NAME,TITLE,BILL_ROW_FORMULAR,BILL_COL_FORMULAR,BILL_ISHEADER,BILL_HERDERWIDTH,FORM_CHECKTYPE,BILL_AFTREDTL,FORM_CTRL_ID,FORM_SHOW,FORM_NEED,FORM_MIN,FORM_MAX,FORM_ONEROW,SEARCH_INBILL,FORM_CTRLWIDTH,SEARCH_TYPE,SEARCH_FORMULAR,STATUS,SEL_TB_COL,IS_COL_EXISTS,BILL_NAME,BILL_TYPE,BILL_SQL,ADDTIME,EDITIME,ADDER,Expr1,P_BILL_ID,BILL_STATUS,CONN_SOURCE,IS_TABLE_EXISTS,KEYS from V_SYS_BILL_COL_SYN
delete from V_SYS_BILL_COL_SYN
INSERT INTO V_SYS_BILL_COL_SYN (COL_SYNID,BILL_ID,COL_ID,DB_SRC,TABLE_NAME,COL_NAME,COL_NOTE,DATA_TYPE,DATA_LEN,DATA_ACC,IS_AUTO,ISPK,DVAL,PK_VALCODE,ISFK,SORT_NO,FK_NAME,FK_SHOW,DISPLAY_NAME,TITLE,BILL_ROW_FORMULAR,BILL_COL_FORMULAR,BILL_ISHEADER,BILL_HERDERWIDTH,FORM_CHECKTYPE,BILL_AFTREDTL,FORM_CTRL_ID,FORM_SHOW,FORM_NEED,FORM_MIN,FORM_MAX,FORM_ONEROW,SEARCH_INBILL,FORM_CTRLWIDTH,SEARCH_TYPE,SEARCH_FORMULAR,STATUS,SEL_TB_COL,IS_COL_EXISTS,BILL_NAME,BILL_TYPE,BILL_SQL,ADDTIME,EDITIME,ADDER,Expr1,P_BILL_ID,BILL_STATUS,CONN_SOURCE,IS_TABLE_EXISTS,KEYS)
     VALUES
           ('','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','')
UPDATE {首字母大写列名} SET ...
变量赋值代码：
        valObj.COL_SYNID = "";
        valObj.BILL_ID = "";
        valObj.COL_ID = "";
        valObj.DB_SRC = "";
        valObj.TABLE_NAME = "";
        valObj.COL_NAME = "";
        valObj.COL_NOTE = "";
        valObj.DATA_TYPE = "";
        valObj.DATA_LEN = "";
        valObj.DATA_ACC = "";
        valObj.IS_AUTO = "";
        valObj.ISPK = "";
        valObj.DVAL = "";
        valObj.PK_VALCODE = "";
        valObj.ISFK = "";
        valObj.SORT_NO = "";
        valObj.FK_NAME = "";
        valObj.FK_SHOW = "";
        valObj.DISPLAY_NAME = "";
        valObj.TITLE = "";
        valObj.BILL_ROW_FORMULAR = "";
        valObj.BILL_COL_FORMULAR = "";
        valObj.BILL_ISHEADER = "";
        valObj.BILL_HERDERWIDTH = "";
        valObj.FORM_CHECKTYPE = "";
        valObj.BILL_AFTREDTL = "";
        valObj.FORM_CTRL_ID = "";
        valObj.FORM_SHOW = "";
        valObj.FORM_NEED = "";
        valObj.FORM_MIN = "";
        valObj.FORM_MAX = "";
        valObj.FORM_ONEROW = "";
        valObj.SEARCH_INBILL = "";
        valObj.FORM_CTRLWIDTH = "";
        valObj.SEARCH_TYPE = "";
        valObj.SEARCH_FORMULAR = "";
        valObj.STATUS = "";
        valObj.SEL_TB_COL = "";
        valObj.IS_COL_EXISTS = "";
        valObj.BILL_NAME = "";
        valObj.BILL_TYPE = "";
        valObj.BILL_SQL = "";
        valObj.ADDTIME = "";
        valObj.EDITIME = "";
        valObj.ADDER = "";
        valObj.Expr1 = "";
        valObj.P_BILL_ID = "";
        valObj.BILL_STATUS = "";
        valObj.CONN_SOURCE = "";
        valObj.IS_TABLE_EXISTS = "";
        valObj.KEYS = ""; 
 * ************************************************************/
using System;
using System.Data;
using System.Collections.Generic;
using System.Collections;
using System.Reflection;
using AgileFrame.Orm.PersistenceLayer.DAL.Base;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Core;

namespace AgileFrame.Orm.PersistenceLayer.Model
{
    /// <summary>
    /// <para>V_SYS_BILL_COL_SYN</para>
    /// <para>与V_SYS_BILL_COL_SYN数据表对应的实体对象。</para>
    /// <para>增加一个数据列的方法是：在"类字段"节增加一个bool标识位，与"Attribute"属性 </para>
    /// </summary>    
    [Serializable]
    public class V_SYS_BILL_COL_SYN : ITableImplement
    {
        /// <summary>V_SYS_BILL_COL_SYN 工厂方法</summary>
        public static V_SYS_BILL_COL_SYN Factory()
        {
            return new V_SYS_BILL_COL_SYN();
        }
		#region 类字段清单 列属性用于生成视图层时的一致性检查
        #region 类字段清单1
        
        /// <summary> COL_SYNID Attribute_IsNotNull </summary>
        public int _COL_SYNID
        {            
            get { return this.COL_SYNID; }
            set { this.COL_SYNID = value; }
        }
        
        /// <summary> BILL_ID Attribute </summary>
        public int _BILL_ID
        {            
            get { return this.BILL_ID; }
            set { this.BILL_ID = value; }
        }
        
        /// <summary> COL_ID Attribute </summary>
        public int _COL_ID
        {            
            get { return this.COL_ID; }
            set { this.COL_ID = value; }
        }
        
        /// <summary> DB_SRC Attribute </summary>
        public string _DB_SRC
        {            
            get { return this.DB_SRC; }
            set { this.DB_SRC = value; }
        }
        
        /// <summary> TABLE_NAME Attribute </summary>
        public string _TABLE_NAME
        {            
            get { return this.TABLE_NAME; }
            set { this.TABLE_NAME = value; }
        }
        
        /// <summary> COL_NAME Attribute </summary>
        public string _COL_NAME
        {            
            get { return this.COL_NAME; }
            set { this.COL_NAME = value; }
        }
        
        /// <summary> COL_NOTE Attribute </summary>
        public string _COL_NOTE
        {            
            get { return this.COL_NOTE; }
            set { this.COL_NOTE = value; }
        }
        
        /// <summary> DATA_TYPE Attribute </summary>
        public string _DATA_TYPE
        {            
            get { return this.DATA_TYPE; }
            set { this.DATA_TYPE = value; }
        }
        
        /// <summary> DATA_LEN Attribute </summary>
        public int _DATA_LEN
        {            
            get { return this.DATA_LEN; }
            set { this.DATA_LEN = value; }
        }
        
        /// <summary> DATA_ACC Attribute </summary>
        public int _DATA_ACC
        {            
            get { return this.DATA_ACC; }
            set { this.DATA_ACC = value; }
        }
        
        /// <summary> IS_AUTO Attribute </summary>
        public string _IS_AUTO
        {            
            get { return this.IS_AUTO; }
            set { this.IS_AUTO = value; }
        }
        
        /// <summary> ISPK Attribute </summary>
        public string _ISPK
        {            
            get { return this.ISPK; }
            set { this.ISPK = value; }
        }
        
        /// <summary> DVAL Attribute </summary>
        public string _DVAL
        {            
            get { return this.DVAL; }
            set { this.DVAL = value; }
        }
        
        /// <summary> PK_VALCODE Attribute </summary>
        public string _PK_VALCODE
        {            
            get { return this.PK_VALCODE; }
            set { this.PK_VALCODE = value; }
        }
        
        /// <summary> ISFK Attribute </summary>
        public string _ISFK
        {            
            get { return this.ISFK; }
            set { this.ISFK = value; }
        }
        
        /// <summary> SORT_NO Attribute </summary>
        public int _SORT_NO
        {            
            get { return this.SORT_NO; }
            set { this.SORT_NO = value; }
        }
        
        /// <summary> FK_NAME Attribute </summary>
        public string _FK_NAME
        {            
            get { return this.FK_NAME; }
            set { this.FK_NAME = value; }
        }
        
        /// <summary> FK_SHOW Attribute </summary>
        public string _FK_SHOW
        {            
            get { return this.FK_SHOW; }
            set { this.FK_SHOW = value; }
        }
        
        /// <summary> DISPLAY_NAME Attribute </summary>
        public string _DISPLAY_NAME
        {            
            get { return this.DISPLAY_NAME; }
            set { this.DISPLAY_NAME = value; }
        }
        
        /// <summary> TITLE Attribute </summary>
        public string _TITLE
        {            
            get { return this.TITLE; }
            set { this.TITLE = value; }
        }
        
        /// <summary> BILL_ROW_FORMULAR Attribute </summary>
        public string _BILL_ROW_FORMULAR
        {            
            get { return this.BILL_ROW_FORMULAR; }
            set { this.BILL_ROW_FORMULAR = value; }
        }
        
        /// <summary> BILL_COL_FORMULAR Attribute </summary>
        public string _BILL_COL_FORMULAR
        {            
            get { return this.BILL_COL_FORMULAR; }
            set { this.BILL_COL_FORMULAR = value; }
        }
        
        /// <summary> BILL_ISHEADER Attribute </summary>
        public string _BILL_ISHEADER
        {            
            get { return this.BILL_ISHEADER; }
            set { this.BILL_ISHEADER = value; }
        }
        
        /// <summary> BILL_HERDERWIDTH Attribute </summary>
        public int _BILL_HERDERWIDTH
        {            
            get { return this.BILL_HERDERWIDTH; }
            set { this.BILL_HERDERWIDTH = value; }
        }
        
        /// <summary> FORM_CHECKTYPE Attribute </summary>
        public string _FORM_CHECKTYPE
        {            
            get { return this.FORM_CHECKTYPE; }
            set { this.FORM_CHECKTYPE = value; }
        }
        
        /// <summary> BILL_AFTREDTL Attribute </summary>
        public string _BILL_AFTREDTL
        {            
            get { return this.BILL_AFTREDTL; }
            set { this.BILL_AFTREDTL = value; }
        }
        
        /// <summary> FORM_CTRL_ID Attribute </summary>
        public int _FORM_CTRL_ID
        {            
            get { return this.FORM_CTRL_ID; }
            set { this.FORM_CTRL_ID = value; }
        }
        
        /// <summary> FORM_SHOW Attribute </summary>
        public string _FORM_SHOW
        {            
            get { return this.FORM_SHOW; }
            set { this.FORM_SHOW = value; }
        }
        
        /// <summary> FORM_NEED Attribute </summary>
        public string _FORM_NEED
        {            
            get { return this.FORM_NEED; }
            set { this.FORM_NEED = value; }
        }
        
        /// <summary> FORM_MIN Attribute </summary>
        public string _FORM_MIN
        {            
            get { return this.FORM_MIN; }
            set { this.FORM_MIN = value; }
        }
        
        /// <summary> FORM_MAX Attribute </summary>
        public string _FORM_MAX
        {            
            get { return this.FORM_MAX; }
            set { this.FORM_MAX = value; }
        }
        
        /// <summary> FORM_ONEROW Attribute </summary>
        public string _FORM_ONEROW
        {            
            get { return this.FORM_ONEROW; }
            set { this.FORM_ONEROW = value; }
        }
        
        /// <summary> SEARCH_INBILL Attribute </summary>
        public string _SEARCH_INBILL
        {            
            get { return this.SEARCH_INBILL; }
            set { this.SEARCH_INBILL = value; }
        }
        
        /// <summary> FORM_CTRLWIDTH Attribute </summary>
        public int _FORM_CTRLWIDTH
        {            
            get { return this.FORM_CTRLWIDTH; }
            set { this.FORM_CTRLWIDTH = value; }
        }
        
        /// <summary> SEARCH_TYPE Attribute </summary>
        public string _SEARCH_TYPE
        {            
            get { return this.SEARCH_TYPE; }
            set { this.SEARCH_TYPE = value; }
        }
        
        /// <summary> SEARCH_FORMULAR Attribute </summary>
        public string _SEARCH_FORMULAR
        {            
            get { return this.SEARCH_FORMULAR; }
            set { this.SEARCH_FORMULAR = value; }
        }
        
        /// <summary> STATUS Attribute </summary>
        public string _STATUS
        {            
            get { return this.STATUS; }
            set { this.STATUS = value; }
        }
        
        /// <summary> SEL_TB_COL Attribute </summary>
        public string _SEL_TB_COL
        {            
            get { return this.SEL_TB_COL; }
            set { this.SEL_TB_COL = value; }
        }
        
        /// <summary> IS_COL_EXISTS Attribute </summary>
        public string _IS_COL_EXISTS
        {            
            get { return this.IS_COL_EXISTS; }
            set { this.IS_COL_EXISTS = value; }
        }
        
        /// <summary> BILL_NAME Attribute </summary>
        public string _BILL_NAME
        {            
            get { return this.BILL_NAME; }
            set { this.BILL_NAME = value; }
        }
        
        /// <summary> BILL_TYPE Attribute </summary>
        public string _BILL_TYPE
        {            
            get { return this.BILL_TYPE; }
            set { this.BILL_TYPE = value; }
        }
        
        /// <summary> BILL_SQL Attribute </summary>
        public string _BILL_SQL
        {            
            get { return this.BILL_SQL; }
            set { this.BILL_SQL = value; }
        }
        
        /// <summary> ADDTIME Attribute </summary>
        public DateTime _ADDTIME
        {            
            get { return this.ADDTIME; }
            set { this.ADDTIME = value; }
        }
        
        /// <summary> EDITIME Attribute </summary>
        public DateTime _EDITIME
        {            
            get { return this.EDITIME; }
            set { this.EDITIME = value; }
        }
        
        /// <summary> ADDER Attribute </summary>
        public string _ADDER
        {            
            get { return this.ADDER; }
            set { this.ADDER = value; }
        }
        
        /// <summary> Expr1 Attribute </summary>
        public string _Expr1
        {            
            get { return this.Expr1; }
            set { this.Expr1 = value; }
        }
        
        /// <summary> P_BILL_ID Attribute </summary>
        public int _P_BILL_ID
        {            
            get { return this.P_BILL_ID; }
            set { this.P_BILL_ID = value; }
        }
        
        /// <summary> BILL_STATUS Attribute </summary>
        public string _BILL_STATUS
        {            
            get { return this.BILL_STATUS; }
            set { this.BILL_STATUS = value; }
        }
        
        /// <summary> CONN_SOURCE Attribute </summary>
        public string _CONN_SOURCE
        {            
            get { return this.CONN_SOURCE; }
            set { this.CONN_SOURCE = value; }
        }
        
        /// <summary> IS_TABLE_EXISTS Attribute </summary>
        public string _IS_TABLE_EXISTS
        {            
            get { return this.IS_TABLE_EXISTS; }
            set { this.IS_TABLE_EXISTS = value; }
        }
        
        /// <summary> KEYS Attribute </summary>
        public string _KEYS
        {            
            get { return this.KEYS; }
            set { this.KEYS = value; }
        }
        #endregion
        #region 类字段清单2
        
        /// <summary> COL_SYNID，推荐使用 "_"符号开头 </summary>
        public int COL_SYNID
        {
            get { return this.m_col_synid; }
            set //
            {
                if (!col_synid_initialized || m_col_synid != value)
                {
                    this.m_col_synid = value;
                }
                col_synid_initialized = true;
            }
        }
        
        /// <summary> BILL_ID，推荐使用 "_"符号开头 </summary>
        public int BILL_ID
        {
            get { return this.m_bill_id; }
            set //
            {
                if (!bill_id_initialized || m_bill_id != value)
                {
                    this.m_bill_id = value;
                }
                bill_id_initialized = true;
            }
        }
        
        /// <summary> COL_ID，推荐使用 "_"符号开头 </summary>
        public int COL_ID
        {
            get { return this.m_col_id; }
            set //
            {
                if (!col_id_initialized || m_col_id != value)
                {
                    this.m_col_id = value;
                }
                col_id_initialized = true;
            }
        }
        
        /// <summary> DB_SRC，推荐使用 "_"符号开头 </summary>
        public string DB_SRC
        {
            get { return this.m_db_src; }
            set //
            {
                if (!db_src_initialized || m_db_src != value)
                {
                    this.m_db_src = value;
                }
                db_src_initialized = true;
            }
        }
        
        /// <summary> TABLE_NAME，推荐使用 "_"符号开头 </summary>
        public string TABLE_NAME
        {
            get { return this.m_table_name; }
            set //
            {
                if (!table_name_initialized || m_table_name != value)
                {
                    this.m_table_name = value;
                }
                table_name_initialized = true;
            }
        }
        
        /// <summary> COL_NAME，推荐使用 "_"符号开头 </summary>
        public string COL_NAME
        {
            get { return this.m_col_name; }
            set //
            {
                if (!col_name_initialized || m_col_name != value)
                {
                    this.m_col_name = value;
                }
                col_name_initialized = true;
            }
        }
        
        /// <summary> COL_NOTE，推荐使用 "_"符号开头 </summary>
        public string COL_NOTE
        {
            get { return this.m_col_note; }
            set //
            {
                if (!col_note_initialized || m_col_note != value)
                {
                    this.m_col_note = value;
                }
                col_note_initialized = true;
            }
        }
        
        /// <summary> DATA_TYPE，推荐使用 "_"符号开头 </summary>
        public string DATA_TYPE
        {
            get { return this.m_data_type; }
            set //
            {
                if (!data_type_initialized || m_data_type != value)
                {
                    this.m_data_type = value;
                }
                data_type_initialized = true;
            }
        }
        
        /// <summary> DATA_LEN，推荐使用 "_"符号开头 </summary>
        public int DATA_LEN
        {
            get { return this.m_data_len; }
            set //
            {
                if (!data_len_initialized || m_data_len != value)
                {
                    this.m_data_len = value;
                }
                data_len_initialized = true;
            }
        }
        
        /// <summary> DATA_ACC，推荐使用 "_"符号开头 </summary>
        public int DATA_ACC
        {
            get { return this.m_data_acc; }
            set //
            {
                if (!data_acc_initialized || m_data_acc != value)
                {
                    this.m_data_acc = value;
                }
                data_acc_initialized = true;
            }
        }
        
        /// <summary> IS_AUTO，推荐使用 "_"符号开头 </summary>
        public string IS_AUTO
        {
            get { return this.m_is_auto; }
            set //
            {
                if (!is_auto_initialized || m_is_auto != value)
                {
                    this.m_is_auto = value;
                }
                is_auto_initialized = true;
            }
        }
        
        /// <summary> ISPK，推荐使用 "_"符号开头 </summary>
        public string ISPK
        {
            get { return this.m_ispk; }
            set //
            {
                if (!ispk_initialized || m_ispk != value)
                {
                    this.m_ispk = value;
                }
                ispk_initialized = true;
            }
        }
        
        /// <summary> DVAL，推荐使用 "_"符号开头 </summary>
        public string DVAL
        {
            get { return this.m_dval; }
            set //
            {
                if (!dval_initialized || m_dval != value)
                {
                    this.m_dval = value;
                }
                dval_initialized = true;
            }
        }
        
        /// <summary> PK_VALCODE，推荐使用 "_"符号开头 </summary>
        public string PK_VALCODE
        {
            get { return this.m_pk_valcode; }
            set //
            {
                if (!pk_valcode_initialized || m_pk_valcode != value)
                {
                    this.m_pk_valcode = value;
                }
                pk_valcode_initialized = true;
            }
        }
        
        /// <summary> ISFK，推荐使用 "_"符号开头 </summary>
        public string ISFK
        {
            get { return this.m_isfk; }
            set //
            {
                if (!isfk_initialized || m_isfk != value)
                {
                    this.m_isfk = value;
                }
                isfk_initialized = true;
            }
        }
        
        /// <summary> SORT_NO，推荐使用 "_"符号开头 </summary>
        public int SORT_NO
        {
            get { return this.m_sort_no; }
            set //
            {
                if (!sort_no_initialized || m_sort_no != value)
                {
                    this.m_sort_no = value;
                }
                sort_no_initialized = true;
            }
        }
        
        /// <summary> FK_NAME，推荐使用 "_"符号开头 </summary>
        public string FK_NAME
        {
            get { return this.m_fk_name; }
            set //
            {
                if (!fk_name_initialized || m_fk_name != value)
                {
                    this.m_fk_name = value;
                }
                fk_name_initialized = true;
            }
        }
        
        /// <summary> FK_SHOW，推荐使用 "_"符号开头 </summary>
        public string FK_SHOW
        {
            get { return this.m_fk_show; }
            set //
            {
                if (!fk_show_initialized || m_fk_show != value)
                {
                    this.m_fk_show = value;
                }
                fk_show_initialized = true;
            }
        }
        
        /// <summary> DISPLAY_NAME，推荐使用 "_"符号开头 </summary>
        public string DISPLAY_NAME
        {
            get { return this.m_display_name; }
            set //
            {
                if (!display_name_initialized || m_display_name != value)
                {
                    this.m_display_name = value;
                }
                display_name_initialized = true;
            }
        }
        
        /// <summary> TITLE，推荐使用 "_"符号开头 </summary>
        public string TITLE
        {
            get { return this.m_title; }
            set //
            {
                if (!title_initialized || m_title != value)
                {
                    this.m_title = value;
                }
                title_initialized = true;
            }
        }
        
        /// <summary> BILL_ROW_FORMULAR，推荐使用 "_"符号开头 </summary>
        public string BILL_ROW_FORMULAR
        {
            get { return this.m_bill_row_formular; }
            set //
            {
                if (!bill_row_formular_initialized || m_bill_row_formular != value)
                {
                    this.m_bill_row_formular = value;
                }
                bill_row_formular_initialized = true;
            }
        }
        
        /// <summary> BILL_COL_FORMULAR，推荐使用 "_"符号开头 </summary>
        public string BILL_COL_FORMULAR
        {
            get { return this.m_bill_col_formular; }
            set //
            {
                if (!bill_col_formular_initialized || m_bill_col_formular != value)
                {
                    this.m_bill_col_formular = value;
                }
                bill_col_formular_initialized = true;
            }
        }
        
        /// <summary> BILL_ISHEADER，推荐使用 "_"符号开头 </summary>
        public string BILL_ISHEADER
        {
            get { return this.m_bill_isheader; }
            set //
            {
                if (!bill_isheader_initialized || m_bill_isheader != value)
                {
                    this.m_bill_isheader = value;
                }
                bill_isheader_initialized = true;
            }
        }
        
        /// <summary> BILL_HERDERWIDTH，推荐使用 "_"符号开头 </summary>
        public int BILL_HERDERWIDTH
        {
            get { return this.m_bill_herderwidth; }
            set //
            {
                if (!bill_herderwidth_initialized || m_bill_herderwidth != value)
                {
                    this.m_bill_herderwidth = value;
                }
                bill_herderwidth_initialized = true;
            }
        }
        
        /// <summary> FORM_CHECKTYPE，推荐使用 "_"符号开头 </summary>
        public string FORM_CHECKTYPE
        {
            get { return this.m_form_checktype; }
            set //
            {
                if (!form_checktype_initialized || m_form_checktype != value)
                {
                    this.m_form_checktype = value;
                }
                form_checktype_initialized = true;
            }
        }
        
        /// <summary> BILL_AFTREDTL，推荐使用 "_"符号开头 </summary>
        public string BILL_AFTREDTL
        {
            get { return this.m_bill_aftredtl; }
            set //
            {
                if (!bill_aftredtl_initialized || m_bill_aftredtl != value)
                {
                    this.m_bill_aftredtl = value;
                }
                bill_aftredtl_initialized = true;
            }
        }
        
        /// <summary> FORM_CTRL_ID，推荐使用 "_"符号开头 </summary>
        public int FORM_CTRL_ID
        {
            get { return this.m_form_ctrl_id; }
            set //
            {
                if (!form_ctrl_id_initialized || m_form_ctrl_id != value)
                {
                    this.m_form_ctrl_id = value;
                }
                form_ctrl_id_initialized = true;
            }
        }
        
        /// <summary> FORM_SHOW，推荐使用 "_"符号开头 </summary>
        public string FORM_SHOW
        {
            get { return this.m_form_show; }
            set //
            {
                if (!form_show_initialized || m_form_show != value)
                {
                    this.m_form_show = value;
                }
                form_show_initialized = true;
            }
        }
        
        /// <summary> FORM_NEED，推荐使用 "_"符号开头 </summary>
        public string FORM_NEED
        {
            get { return this.m_form_need; }
            set //
            {
                if (!form_need_initialized || m_form_need != value)
                {
                    this.m_form_need = value;
                }
                form_need_initialized = true;
            }
        }
        
        /// <summary> FORM_MIN，推荐使用 "_"符号开头 </summary>
        public string FORM_MIN
        {
            get { return this.m_form_min; }
            set //
            {
                if (!form_min_initialized || m_form_min != value)
                {
                    this.m_form_min = value;
                }
                form_min_initialized = true;
            }
        }
        
        /// <summary> FORM_MAX，推荐使用 "_"符号开头 </summary>
        public string FORM_MAX
        {
            get { return this.m_form_max; }
            set //
            {
                if (!form_max_initialized || m_form_max != value)
                {
                    this.m_form_max = value;
                }
                form_max_initialized = true;
            }
        }
        
        /// <summary> FORM_ONEROW，推荐使用 "_"符号开头 </summary>
        public string FORM_ONEROW
        {
            get { return this.m_form_onerow; }
            set //
            {
                if (!form_onerow_initialized || m_form_onerow != value)
                {
                    this.m_form_onerow = value;
                }
                form_onerow_initialized = true;
            }
        }
        
        /// <summary> SEARCH_INBILL，推荐使用 "_"符号开头 </summary>
        public string SEARCH_INBILL
        {
            get { return this.m_search_inbill; }
            set //
            {
                if (!search_inbill_initialized || m_search_inbill != value)
                {
                    this.m_search_inbill = value;
                }
                search_inbill_initialized = true;
            }
        }
        
        /// <summary> FORM_CTRLWIDTH，推荐使用 "_"符号开头 </summary>
        public int FORM_CTRLWIDTH
        {
            get { return this.m_form_ctrlwidth; }
            set //
            {
                if (!form_ctrlwidth_initialized || m_form_ctrlwidth != value)
                {
                    this.m_form_ctrlwidth = value;
                }
                form_ctrlwidth_initialized = true;
            }
        }
        
        /// <summary> SEARCH_TYPE，推荐使用 "_"符号开头 </summary>
        public string SEARCH_TYPE
        {
            get { return this.m_search_type; }
            set //
            {
                if (!search_type_initialized || m_search_type != value)
                {
                    this.m_search_type = value;
                }
                search_type_initialized = true;
            }
        }
        
        /// <summary> SEARCH_FORMULAR，推荐使用 "_"符号开头 </summary>
        public string SEARCH_FORMULAR
        {
            get { return this.m_search_formular; }
            set //
            {
                if (!search_formular_initialized || m_search_formular != value)
                {
                    this.m_search_formular = value;
                }
                search_formular_initialized = true;
            }
        }
        
        /// <summary> STATUS，推荐使用 "_"符号开头 </summary>
        public string STATUS
        {
            get { return this.m_status; }
            set //
            {
                if (!status_initialized || m_status != value)
                {
                    this.m_status = value;
                }
                status_initialized = true;
            }
        }
        
        /// <summary> SEL_TB_COL，推荐使用 "_"符号开头 </summary>
        public string SEL_TB_COL
        {
            get { return this.m_sel_tb_col; }
            set //
            {
                if (!sel_tb_col_initialized || m_sel_tb_col != value)
                {
                    this.m_sel_tb_col = value;
                }
                sel_tb_col_initialized = true;
            }
        }
        
        /// <summary> IS_COL_EXISTS，推荐使用 "_"符号开头 </summary>
        public string IS_COL_EXISTS
        {
            get { return this.m_is_col_exists; }
            set //
            {
                if (!is_col_exists_initialized || m_is_col_exists != value)
                {
                    this.m_is_col_exists = value;
                }
                is_col_exists_initialized = true;
            }
        }
        
        /// <summary> BILL_NAME，推荐使用 "_"符号开头 </summary>
        public string BILL_NAME
        {
            get { return this.m_bill_name; }
            set //
            {
                if (!bill_name_initialized || m_bill_name != value)
                {
                    this.m_bill_name = value;
                }
                bill_name_initialized = true;
            }
        }
        
        /// <summary> BILL_TYPE，推荐使用 "_"符号开头 </summary>
        public string BILL_TYPE
        {
            get { return this.m_bill_type; }
            set //
            {
                if (!bill_type_initialized || m_bill_type != value)
                {
                    this.m_bill_type = value;
                }
                bill_type_initialized = true;
            }
        }
        
        /// <summary> BILL_SQL，推荐使用 "_"符号开头 </summary>
        public string BILL_SQL
        {
            get { return this.m_bill_sql; }
            set //
            {
                if (!bill_sql_initialized || m_bill_sql != value)
                {
                    this.m_bill_sql = value;
                }
                bill_sql_initialized = true;
            }
        }
        
        /// <summary> ADDTIME，推荐使用 "_"符号开头 </summary>
        public DateTime ADDTIME
        {
            get { return this.m_addtime; }
            set //
            {
                if (!addtime_initialized || m_addtime != value)
                {
                    this.m_addtime = value;
                }
                addtime_initialized = true;
            }
        }
        
        /// <summary> EDITIME，推荐使用 "_"符号开头 </summary>
        public DateTime EDITIME
        {
            get { return this.m_editime; }
            set //
            {
                if (!editime_initialized || m_editime != value)
                {
                    this.m_editime = value;
                }
                editime_initialized = true;
            }
        }
        
        /// <summary> ADDER，推荐使用 "_"符号开头 </summary>
        public string ADDER
        {
            get { return this.m_adder; }
            set //
            {
                if (!adder_initialized || m_adder != value)
                {
                    this.m_adder = value;
                }
                adder_initialized = true;
            }
        }
        
        /// <summary> Expr1，推荐使用 "_"符号开头 </summary>
        public string Expr1
        {
            get { return this.m_expr1; }
            set //
            {
                if (!expr1_initialized || m_expr1 != value)
                {
                    this.m_expr1 = value;
                }
                expr1_initialized = true;
            }
        }
        
        /// <summary> P_BILL_ID，推荐使用 "_"符号开头 </summary>
        public int P_BILL_ID
        {
            get { return this.m_p_bill_id; }
            set //
            {
                if (!p_bill_id_initialized || m_p_bill_id != value)
                {
                    this.m_p_bill_id = value;
                }
                p_bill_id_initialized = true;
            }
        }
        
        /// <summary> BILL_STATUS，推荐使用 "_"符号开头 </summary>
        public string BILL_STATUS
        {
            get { return this.m_bill_status; }
            set //
            {
                if (!bill_status_initialized || m_bill_status != value)
                {
                    this.m_bill_status = value;
                }
                bill_status_initialized = true;
            }
        }
        
        /// <summary> CONN_SOURCE，推荐使用 "_"符号开头 </summary>
        public string CONN_SOURCE
        {
            get { return this.m_conn_source; }
            set //
            {
                if (!conn_source_initialized || m_conn_source != value)
                {
                    this.m_conn_source = value;
                }
                conn_source_initialized = true;
            }
        }
        
        /// <summary> IS_TABLE_EXISTS，推荐使用 "_"符号开头 </summary>
        public string IS_TABLE_EXISTS
        {
            get { return this.m_is_table_exists; }
            set //
            {
                if (!is_table_exists_initialized || m_is_table_exists != value)
                {
                    this.m_is_table_exists = value;
                }
                is_table_exists_initialized = true;
            }
        }
        
        /// <summary> KEYS，推荐使用 "_"符号开头 </summary>
        public string KEYS
        {
            get { return this.m_keys; }
            set //
            {
                if (!keys_initialized || m_keys != value)
                {
                    this.m_keys = value;
                }
                keys_initialized = true;
            }
        }    
        #endregion
        #region Attribute清单 辅助设计
        /// <summary>
        /// {列属性-结构属性}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>COL_SYNID</summary>
            public static AttributeItem COL_SYNID =  new AttributeItem("[V_SYS_BILL_COL_SYN].[COL_SYNID]", typeof(int), 2147483647);
            
            /// <summary>BILL_ID</summary>
            public static AttributeItem BILL_ID =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_ID]", typeof(int), 2147483647);
            
            /// <summary>COL_ID</summary>
            public static AttributeItem COL_ID =  new AttributeItem("[V_SYS_BILL_COL_SYN].[COL_ID]", typeof(int), 2147483647);
            
            /// <summary>DB_SRC</summary>
            public static AttributeItem DB_SRC =  new AttributeItem("[V_SYS_BILL_COL_SYN].[DB_SRC]", typeof(string), 50);
            
            /// <summary>TABLE_NAME</summary>
            public static AttributeItem TABLE_NAME =  new AttributeItem("[V_SYS_BILL_COL_SYN].[TABLE_NAME]", typeof(string), 50);
            
            /// <summary>COL_NAME</summary>
            public static AttributeItem COL_NAME =  new AttributeItem("[V_SYS_BILL_COL_SYN].[COL_NAME]", typeof(string), 50);
            
            /// <summary>COL_NOTE</summary>
            public static AttributeItem COL_NOTE =  new AttributeItem("[V_SYS_BILL_COL_SYN].[COL_NOTE]", typeof(string), 50);
            
            /// <summary>DATA_TYPE</summary>
            public static AttributeItem DATA_TYPE =  new AttributeItem("[V_SYS_BILL_COL_SYN].[DATA_TYPE]", typeof(string), 50);
            
            /// <summary>DATA_LEN</summary>
            public static AttributeItem DATA_LEN =  new AttributeItem("[V_SYS_BILL_COL_SYN].[DATA_LEN]", typeof(int), 2147483647);
            
            /// <summary>DATA_ACC</summary>
            public static AttributeItem DATA_ACC =  new AttributeItem("[V_SYS_BILL_COL_SYN].[DATA_ACC]", typeof(int), 2147483647);
            
            /// <summary>IS_AUTO</summary>
            public static AttributeItem IS_AUTO =  new AttributeItem("[V_SYS_BILL_COL_SYN].[IS_AUTO]", typeof(string), 1);
            
            /// <summary>ISPK</summary>
            public static AttributeItem ISPK =  new AttributeItem("[V_SYS_BILL_COL_SYN].[ISPK]", typeof(string), 1);
            
            /// <summary>DVAL</summary>
            public static AttributeItem DVAL =  new AttributeItem("[V_SYS_BILL_COL_SYN].[DVAL]", typeof(string), 250);
            
            /// <summary>PK_VALCODE</summary>
            public static AttributeItem PK_VALCODE =  new AttributeItem("[V_SYS_BILL_COL_SYN].[PK_VALCODE]", typeof(string), 250);
            
            /// <summary>ISFK</summary>
            public static AttributeItem ISFK =  new AttributeItem("[V_SYS_BILL_COL_SYN].[ISFK]", typeof(string), 1);
            
            /// <summary>SORT_NO</summary>
            public static AttributeItem SORT_NO =  new AttributeItem("[V_SYS_BILL_COL_SYN].[SORT_NO]", typeof(int), 2147483647);
            
            /// <summary>FK_NAME</summary>
            public static AttributeItem FK_NAME =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FK_NAME]", typeof(string), 50);
            
            /// <summary>FK_SHOW</summary>
            public static AttributeItem FK_SHOW =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FK_SHOW]", typeof(string), 50);
            
            /// <summary>DISPLAY_NAME</summary>
            public static AttributeItem DISPLAY_NAME =  new AttributeItem("[V_SYS_BILL_COL_SYN].[DISPLAY_NAME]", typeof(string), 50);
            
            /// <summary>TITLE</summary>
            public static AttributeItem TITLE =  new AttributeItem("[V_SYS_BILL_COL_SYN].[TITLE]", typeof(string), 250);
            
            /// <summary>BILL_ROW_FORMULAR</summary>
            public static AttributeItem BILL_ROW_FORMULAR =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_ROW_FORMULAR]", typeof(string), 950);
            
            /// <summary>BILL_COL_FORMULAR</summary>
            public static AttributeItem BILL_COL_FORMULAR =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_COL_FORMULAR]", typeof(string), 950);
            
            /// <summary>BILL_ISHEADER</summary>
            public static AttributeItem BILL_ISHEADER =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_ISHEADER]", typeof(string), 1);
            
            /// <summary>BILL_HERDERWIDTH</summary>
            public static AttributeItem BILL_HERDERWIDTH =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_HERDERWIDTH]", typeof(int), 2147483647);
            
            /// <summary>FORM_CHECKTYPE</summary>
            public static AttributeItem FORM_CHECKTYPE =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FORM_CHECKTYPE]", typeof(string), 50);
            
            /// <summary>BILL_AFTREDTL</summary>
            public static AttributeItem BILL_AFTREDTL =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_AFTREDTL]", typeof(string), 1);
            
            /// <summary>FORM_CTRL_ID</summary>
            public static AttributeItem FORM_CTRL_ID =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FORM_CTRL_ID]", typeof(int), 2147483647);
            
            /// <summary>FORM_SHOW</summary>
            public static AttributeItem FORM_SHOW =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FORM_SHOW]", typeof(string), 1);
            
            /// <summary>FORM_NEED</summary>
            public static AttributeItem FORM_NEED =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FORM_NEED]", typeof(string), 1);
            
            /// <summary>FORM_MIN</summary>
            public static AttributeItem FORM_MIN =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FORM_MIN]", typeof(string), 50);
            
            /// <summary>FORM_MAX</summary>
            public static AttributeItem FORM_MAX =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FORM_MAX]", typeof(string), 50);
            
            /// <summary>FORM_ONEROW</summary>
            public static AttributeItem FORM_ONEROW =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FORM_ONEROW]", typeof(string), 1);
            
            /// <summary>SEARCH_INBILL</summary>
            public static AttributeItem SEARCH_INBILL =  new AttributeItem("[V_SYS_BILL_COL_SYN].[SEARCH_INBILL]", typeof(string), 1);
            
            /// <summary>FORM_CTRLWIDTH</summary>
            public static AttributeItem FORM_CTRLWIDTH =  new AttributeItem("[V_SYS_BILL_COL_SYN].[FORM_CTRLWIDTH]", typeof(int), 2147483647);
            
            /// <summary>SEARCH_TYPE</summary>
            public static AttributeItem SEARCH_TYPE =  new AttributeItem("[V_SYS_BILL_COL_SYN].[SEARCH_TYPE]", typeof(string), 50);
            
            /// <summary>SEARCH_FORMULAR</summary>
            public static AttributeItem SEARCH_FORMULAR =  new AttributeItem("[V_SYS_BILL_COL_SYN].[SEARCH_FORMULAR]", typeof(string), 50);
            
            /// <summary>STATUS</summary>
            public static AttributeItem STATUS =  new AttributeItem("[V_SYS_BILL_COL_SYN].[STATUS]", typeof(string), 2);
            
            /// <summary>SEL_TB_COL</summary>
            public static AttributeItem SEL_TB_COL =  new AttributeItem("[V_SYS_BILL_COL_SYN].[SEL_TB_COL]", typeof(string), 150);
            
            /// <summary>IS_COL_EXISTS</summary>
            public static AttributeItem IS_COL_EXISTS =  new AttributeItem("[V_SYS_BILL_COL_SYN].[IS_COL_EXISTS]", typeof(string), 1);
            
            /// <summary>BILL_NAME</summary>
            public static AttributeItem BILL_NAME =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_NAME]", typeof(string), 150);
            
            /// <summary>BILL_TYPE</summary>
            public static AttributeItem BILL_TYPE =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_TYPE]", typeof(string), 20);
            
            /// <summary>BILL_SQL</summary>
            public static AttributeItem BILL_SQL =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_SQL]", typeof(string), 3150);
            
            /// <summary>ADDTIME</summary>
            public static AttributeItem ADDTIME =  new AttributeItem("[V_SYS_BILL_COL_SYN].[ADDTIME]", typeof(DateTime), 100);
            
            /// <summary>EDITIME</summary>
            public static AttributeItem EDITIME =  new AttributeItem("[V_SYS_BILL_COL_SYN].[EDITIME]", typeof(DateTime), 100);
            
            /// <summary>ADDER</summary>
            public static AttributeItem ADDER =  new AttributeItem("[V_SYS_BILL_COL_SYN].[ADDER]", typeof(string), 20);
            
            /// <summary>Expr1</summary>
            public static AttributeItem Expr1 =  new AttributeItem("[V_SYS_BILL_COL_SYN].[Expr1]", typeof(string), 50);
            
            /// <summary>P_BILL_ID</summary>
            public static AttributeItem P_BILL_ID =  new AttributeItem("[V_SYS_BILL_COL_SYN].[P_BILL_ID]", typeof(int), 2147483647);
            
            /// <summary>BILL_STATUS</summary>
            public static AttributeItem BILL_STATUS =  new AttributeItem("[V_SYS_BILL_COL_SYN].[BILL_STATUS]", typeof(string), 2);
            
            /// <summary>CONN_SOURCE</summary>
            public static AttributeItem CONN_SOURCE =  new AttributeItem("[V_SYS_BILL_COL_SYN].[CONN_SOURCE]", typeof(string), 750);
            
            /// <summary>IS_TABLE_EXISTS</summary>
            public static AttributeItem IS_TABLE_EXISTS =  new AttributeItem("[V_SYS_BILL_COL_SYN].[IS_TABLE_EXISTS]", typeof(string), 1);
            
            /// <summary>KEYS</summary>
            public static AttributeItem KEYS =  new AttributeItem("[V_SYS_BILL_COL_SYN].[KEYS]", typeof(string), 150);
        }
        #endregion
        #region bool清单 辅助设计
        
        private int m_col_synid;
        /// <summary></summary>
        protected bool col_synid_initialized = false;
        
        private int m_bill_id;
        /// <summary></summary>
        protected bool bill_id_initialized = false;
        
        private int m_col_id;
        /// <summary></summary>
        protected bool col_id_initialized = false;
        
        private string m_db_src;
        /// <summary></summary>
        protected bool db_src_initialized = false;
        
        private string m_table_name;
        /// <summary></summary>
        protected bool table_name_initialized = false;
        
        private string m_col_name;
        /// <summary></summary>
        protected bool col_name_initialized = false;
        
        private string m_col_note;
        /// <summary></summary>
        protected bool col_note_initialized = false;
        
        private string m_data_type;
        /// <summary></summary>
        protected bool data_type_initialized = false;
        
        private int m_data_len;
        /// <summary></summary>
        protected bool data_len_initialized = false;
        
        private int m_data_acc;
        /// <summary></summary>
        protected bool data_acc_initialized = false;
        
        private string m_is_auto;
        /// <summary></summary>
        protected bool is_auto_initialized = false;
        
        private string m_ispk;
        /// <summary></summary>
        protected bool ispk_initialized = false;
        
        private string m_dval;
        /// <summary></summary>
        protected bool dval_initialized = false;
        
        private string m_pk_valcode;
        /// <summary></summary>
        protected bool pk_valcode_initialized = false;
        
        private string m_isfk;
        /// <summary></summary>
        protected bool isfk_initialized = false;
        
        private int m_sort_no;
        /// <summary></summary>
        protected bool sort_no_initialized = false;
        
        private string m_fk_name;
        /// <summary></summary>
        protected bool fk_name_initialized = false;
        
        private string m_fk_show;
        /// <summary></summary>
        protected bool fk_show_initialized = false;
        
        private string m_display_name;
        /// <summary></summary>
        protected bool display_name_initialized = false;
        
        private string m_title;
        /// <summary></summary>
        protected bool title_initialized = false;
        
        private string m_bill_row_formular;
        /// <summary></summary>
        protected bool bill_row_formular_initialized = false;
        
        private string m_bill_col_formular;
        /// <summary></summary>
        protected bool bill_col_formular_initialized = false;
        
        private string m_bill_isheader;
        /// <summary></summary>
        protected bool bill_isheader_initialized = false;
        
        private int m_bill_herderwidth;
        /// <summary></summary>
        protected bool bill_herderwidth_initialized = false;
        
        private string m_form_checktype;
        /// <summary></summary>
        protected bool form_checktype_initialized = false;
        
        private string m_bill_aftredtl;
        /// <summary></summary>
        protected bool bill_aftredtl_initialized = false;
        
        private int m_form_ctrl_id;
        /// <summary></summary>
        protected bool form_ctrl_id_initialized = false;
        
        private string m_form_show;
        /// <summary></summary>
        protected bool form_show_initialized = false;
        
        private string m_form_need;
        /// <summary></summary>
        protected bool form_need_initialized = false;
        
        private string m_form_min;
        /// <summary></summary>
        protected bool form_min_initialized = false;
        
        private string m_form_max;
        /// <summary></summary>
        protected bool form_max_initialized = false;
        
        private string m_form_onerow;
        /// <summary></summary>
        protected bool form_onerow_initialized = false;
        
        private string m_search_inbill;
        /// <summary></summary>
        protected bool search_inbill_initialized = false;
        
        private int m_form_ctrlwidth;
        /// <summary></summary>
        protected bool form_ctrlwidth_initialized = false;
        
        private string m_search_type;
        /// <summary></summary>
        protected bool search_type_initialized = false;
        
        private string m_search_formular;
        /// <summary></summary>
        protected bool search_formular_initialized = false;
        
        private string m_status;
        /// <summary></summary>
        protected bool status_initialized = false;
        
        private string m_sel_tb_col;
        /// <summary></summary>
        protected bool sel_tb_col_initialized = false;
        
        private string m_is_col_exists;
        /// <summary></summary>
        protected bool is_col_exists_initialized = false;
        
        private string m_bill_name;
        /// <summary></summary>
        protected bool bill_name_initialized = false;
        
        private string m_bill_type;
        /// <summary></summary>
        protected bool bill_type_initialized = false;
        
        private string m_bill_sql;
        /// <summary></summary>
        protected bool bill_sql_initialized = false;
        
        private DateTime m_addtime;
        /// <summary></summary>
        protected bool addtime_initialized = false;
        
        private DateTime m_editime;
        /// <summary></summary>
        protected bool editime_initialized = false;
        
        private string m_adder;
        /// <summary></summary>
        protected bool adder_initialized = false;
        
        private string m_expr1;
        /// <summary></summary>
        protected bool expr1_initialized = false;
        
        private int m_p_bill_id;
        /// <summary></summary>
        protected bool p_bill_id_initialized = false;
        
        private string m_bill_status;
        /// <summary></summary>
        protected bool bill_status_initialized = false;
        
        private string m_conn_source;
        /// <summary></summary>
        protected bool conn_source_initialized = false;
        
        private string m_is_table_exists;
        /// <summary></summary>
        protected bool is_table_exists_initialized = false;
        
        private string m_keys;
        /// <summary></summary>
        protected bool keys_initialized = false;
        #endregion

        #endregion 类字段
        
		#region 获得与设置属性列与值，以及操作属性的部分方法

        /// <summary>
        /// 实体名 V_SYS_BILL_COL_SYN
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "V_SYS_BILL_COL_SYN";
        }
        
        /// <summary>
        /// 设置自动载入所有列
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.col_synid_initialized = IsLoadAllAttributes;this.bill_id_initialized = IsLoadAllAttributes;this.col_id_initialized = IsLoadAllAttributes;this.db_src_initialized = IsLoadAllAttributes;this.table_name_initialized = IsLoadAllAttributes;this.col_name_initialized = IsLoadAllAttributes;this.col_note_initialized = IsLoadAllAttributes;this.data_type_initialized = IsLoadAllAttributes;this.data_len_initialized = IsLoadAllAttributes;this.data_acc_initialized = IsLoadAllAttributes;this.is_auto_initialized = IsLoadAllAttributes;this.ispk_initialized = IsLoadAllAttributes;this.dval_initialized = IsLoadAllAttributes;this.pk_valcode_initialized = IsLoadAllAttributes;this.isfk_initialized = IsLoadAllAttributes;this.sort_no_initialized = IsLoadAllAttributes;this.fk_name_initialized = IsLoadAllAttributes;this.fk_show_initialized = IsLoadAllAttributes;this.display_name_initialized = IsLoadAllAttributes;this.title_initialized = IsLoadAllAttributes;this.bill_row_formular_initialized = IsLoadAllAttributes;this.bill_col_formular_initialized = IsLoadAllAttributes;this.bill_isheader_initialized = IsLoadAllAttributes;this.bill_herderwidth_initialized = IsLoadAllAttributes;this.form_checktype_initialized = IsLoadAllAttributes;this.bill_aftredtl_initialized = IsLoadAllAttributes;this.form_ctrl_id_initialized = IsLoadAllAttributes;this.form_show_initialized = IsLoadAllAttributes;this.form_need_initialized = IsLoadAllAttributes;this.form_min_initialized = IsLoadAllAttributes;this.form_max_initialized = IsLoadAllAttributes;this.form_onerow_initialized = IsLoadAllAttributes;this.search_inbill_initialized = IsLoadAllAttributes;this.form_ctrlwidth_initialized = IsLoadAllAttributes;this.search_type_initialized = IsLoadAllAttributes;this.search_formular_initialized = IsLoadAllAttributes;this.status_initialized = IsLoadAllAttributes;this.sel_tb_col_initialized = IsLoadAllAttributes;this.is_col_exists_initialized = IsLoadAllAttributes;this.bill_name_initialized = IsLoadAllAttributes;this.bill_type_initialized = IsLoadAllAttributes;this.bill_sql_initialized = IsLoadAllAttributes;this.addtime_initialized = IsLoadAllAttributes;this.editime_initialized = IsLoadAllAttributes;this.adder_initialized = IsLoadAllAttributes;this.expr1_initialized = IsLoadAllAttributes;this.p_bill_id_initialized = IsLoadAllAttributes;this.bill_status_initialized = IsLoadAllAttributes;this.conn_source_initialized = IsLoadAllAttributes;this.is_table_exists_initialized = IsLoadAllAttributes;this.keys_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			V_SYS_BILL_COL_SYN value = new V_SYS_BILL_COL_SYN();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"COL_SYNID"))
				value.col_synid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_ID"))
				value.bill_id_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"COL_ID"))
				value.col_id_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DB_SRC"))
				value.db_src_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"TABLE_NAME"))
				value.table_name_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"COL_NAME"))
				value.col_name_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"COL_NOTE"))
				value.col_note_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DATA_TYPE"))
				value.data_type_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DATA_LEN"))
				value.data_len_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DATA_ACC"))
				value.data_acc_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IS_AUTO"))
				value.is_auto_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ISPK"))
				value.ispk_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DVAL"))
				value.dval_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"PK_VALCODE"))
				value.pk_valcode_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ISFK"))
				value.isfk_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SORT_NO"))
				value.sort_no_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FK_NAME"))
				value.fk_name_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FK_SHOW"))
				value.fk_show_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DISPLAY_NAME"))
				value.display_name_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"TITLE"))
				value.title_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_ROW_FORMULAR"))
				value.bill_row_formular_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_COL_FORMULAR"))
				value.bill_col_formular_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_ISHEADER"))
				value.bill_isheader_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_HERDERWIDTH"))
				value.bill_herderwidth_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FORM_CHECKTYPE"))
				value.form_checktype_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_AFTREDTL"))
				value.bill_aftredtl_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FORM_CTRL_ID"))
				value.form_ctrl_id_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FORM_SHOW"))
				value.form_show_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FORM_NEED"))
				value.form_need_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FORM_MIN"))
				value.form_min_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FORM_MAX"))
				value.form_max_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FORM_ONEROW"))
				value.form_onerow_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SEARCH_INBILL"))
				value.search_inbill_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FORM_CTRLWIDTH"))
				value.form_ctrlwidth_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SEARCH_TYPE"))
				value.search_type_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SEARCH_FORMULAR"))
				value.search_formular_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"STATUS"))
				value.status_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SEL_TB_COL"))
				value.sel_tb_col_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IS_COL_EXISTS"))
				value.is_col_exists_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_NAME"))
				value.bill_name_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_TYPE"))
				value.bill_type_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_SQL"))
				value.bill_sql_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ADDTIME"))
				value.addtime_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"EDITIME"))
				value.editime_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ADDER"))
				value.adder_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Expr1"))
				value.expr1_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"P_BILL_ID"))
				value.p_bill_id_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"BILL_STATUS"))
				value.bill_status_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"CONN_SOURCE"))
				value.conn_source_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IS_TABLE_EXISTS"))
				value.is_table_exists_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"KEYS"))
				value.keys_initialized = true;
            
			return value;
		}
        #endregion
        
        #region 实现ICloneable 成员
        /// <summary>V_SYS_BILL_COL_SYN</summary>
        public new V_SYS_BILL_COL_SYN Clone()
        {
            return (V_SYS_BILL_COL_SYN)this.MemberwiseClone(); //浅复制
        }
        #endregion
        
        #region 构造函数 获得实例
        /// <summary>V_SYS_BILL_COL_SYN 构造函数</summary>
        static V_SYS_BILL_COL_SYN()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>V_SYS_BILL_COL_SYN 构造函数</summary>
        public V_SYS_BILL_COL_SYN() { }
        /// <summary>
        /// V_SYS_BILL_COL_SYN 是否载入所有属性
        /// </summary>
        /// <param name="IsLoadAllAttributes">是否全部初始化为true</param>
        public V_SYS_BILL_COL_SYN(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>V_SYS_BILL_COL_SYN 实现分表功能，修改表名</summary>
        public V_SYS_BILL_COL_SYN(string tableName):base(tableName) { }
        /// <summary>V_SYS_BILL_COL_SYN 实现分表功能，自定义实例的初始化</summary>
        public V_SYS_BILL_COL_SYN(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>V_SYS_BILL_COL_SYN 实现快捷功能</summary>
        public V_SYS_BILL_COL_SYN(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>V_SYS_BILL_COL_SYN 请注意，这里当表中仅存在一个字段的时候，将可能与构造函数 new Table(string tableName)冲突</summary>
        public V_SYS_BILL_COL_SYN(int col_synid, int bill_id, int col_id, string db_src, string table_name, string col_name, string col_note, string data_type, int data_len, int data_acc, string is_auto, string ispk, string dval, string pk_valcode, string isfk, int sort_no, string fk_name, string fk_show, string display_name, string title, string bill_row_formular, string bill_col_formular, string bill_isheader, int bill_herderwidth, string form_checktype, string bill_aftredtl, int form_ctrl_id, string form_show, string form_need, string form_min, string form_max, string form_onerow, string search_inbill, int form_ctrlwidth, string search_type, string search_formular, string status, string sel_tb_col, string is_col_exists, string bill_name, string bill_type, string bill_sql, DateTime addtime, DateTime editime, string adder, string expr1, int p_bill_id, string bill_status, string conn_source, string is_table_exists, string keys)
        {
            
            this.COL_SYNID = col_synid;
            
            this.BILL_ID = bill_id;
            
            this.COL_ID = col_id;
            
            this.DB_SRC = db_src;
            
            this.TABLE_NAME = table_name;
            
            this.COL_NAME = col_name;
            
            this.COL_NOTE = col_note;
            
            this.DATA_TYPE = data_type;
            
            this.DATA_LEN = data_len;
            
            this.DATA_ACC = data_acc;
            
            this.IS_AUTO = is_auto;
            
            this.ISPK = ispk;
            
            this.DVAL = dval;
            
            this.PK_VALCODE = pk_valcode;
            
            this.ISFK = isfk;
            
            this.SORT_NO = sort_no;
            
            this.FK_NAME = fk_name;
            
            this.FK_SHOW = fk_show;
            
            this.DISPLAY_NAME = display_name;
            
            this.TITLE = title;
            
            this.BILL_ROW_FORMULAR = bill_row_formular;
            
            this.BILL_COL_FORMULAR = bill_col_formular;
            
            this.BILL_ISHEADER = bill_isheader;
            
            this.BILL_HERDERWIDTH = bill_herderwidth;
            
            this.FORM_CHECKTYPE = form_checktype;
            
            this.BILL_AFTREDTL = bill_aftredtl;
            
            this.FORM_CTRL_ID = form_ctrl_id;
            
            this.FORM_SHOW = form_show;
            
            this.FORM_NEED = form_need;
            
            this.FORM_MIN = form_min;
            
            this.FORM_MAX = form_max;
            
            this.FORM_ONEROW = form_onerow;
            
            this.SEARCH_INBILL = search_inbill;
            
            this.FORM_CTRLWIDTH = form_ctrlwidth;
            
            this.SEARCH_TYPE = search_type;
            
            this.SEARCH_FORMULAR = search_formular;
            
            this.STATUS = status;
            
            this.SEL_TB_COL = sel_tb_col;
            
            this.IS_COL_EXISTS = is_col_exists;
            
            this.BILL_NAME = bill_name;
            
            this.BILL_TYPE = bill_type;
            
            this.BILL_SQL = bill_sql;
            
            this.ADDTIME = addtime;
            
            this.EDITIME = editime;
            
            this.ADDER = adder;
            
            this.Expr1 = expr1;
            
            this.P_BILL_ID = p_bill_id;
            
            this.BILL_STATUS = bill_status;
            
            this.CONN_SOURCE = conn_source;
            
            this.IS_TABLE_EXISTS = is_table_exists;
            
            this.KEYS = keys;
        }
        /// <summary>V_SYS_BILL_COL_SYN 从视图（多表）内获取本表</summary>
        public static V_SYS_BILL_COL_SYN FromIView(IView view)
        {
            return (V_SYS_BILL_COL_SYN)IView.GetITable(view, "V_SYS_BILL_COL_SYN");
        }
        /// <summary>V_SYS_BILL_COL_SYN 获得一个实例</summary>
        public static V_SYS_BILL_COL_SYN GetOneInstance()
        {
            V_SYS_BILL_COL_SYN value = new V_SYS_BILL_COL_SYN();
            return value;
        }
        #endregion
		
        #region 2.2 新增的列属性操作方法

        /// <summary>通过属性 获得字段值</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "COL_SYNID":
			        return COL_SYNID;
			    			
			    case "BILL_ID":
			        return BILL_ID;
			    			
			    case "COL_ID":
			        return COL_ID;
			    			
			    case "DB_SRC":
			        return DB_SRC;
			    			
			    case "TABLE_NAME":
			        return TABLE_NAME;
			    			
			    case "COL_NAME":
			        return COL_NAME;
			    			
			    case "COL_NOTE":
			        return COL_NOTE;
			    			
			    case "DATA_TYPE":
			        return DATA_TYPE;
			    			
			    case "DATA_LEN":
			        return DATA_LEN;
			    			
			    case "DATA_ACC":
			        return DATA_ACC;
			    			
			    case "IS_AUTO":
			        return IS_AUTO;
			    			
			    case "ISPK":
			        return ISPK;
			    			
			    case "DVAL":
			        return DVAL;
			    			
			    case "PK_VALCODE":
			        return PK_VALCODE;
			    			
			    case "ISFK":
			        return ISFK;
			    			
			    case "SORT_NO":
			        return SORT_NO;
			    			
			    case "FK_NAME":
			        return FK_NAME;
			    			
			    case "FK_SHOW":
			        return FK_SHOW;
			    			
			    case "DISPLAY_NAME":
			        return DISPLAY_NAME;
			    			
			    case "TITLE":
			        return TITLE;
			    			
			    case "BILL_ROW_FORMULAR":
			        return BILL_ROW_FORMULAR;
			    			
			    case "BILL_COL_FORMULAR":
			        return BILL_COL_FORMULAR;
			    			
			    case "BILL_ISHEADER":
			        return BILL_ISHEADER;
			    			
			    case "BILL_HERDERWIDTH":
			        return BILL_HERDERWIDTH;
			    			
			    case "FORM_CHECKTYPE":
			        return FORM_CHECKTYPE;
			    			
			    case "BILL_AFTREDTL":
			        return BILL_AFTREDTL;
			    			
			    case "FORM_CTRL_ID":
			        return FORM_CTRL_ID;
			    			
			    case "FORM_SHOW":
			        return FORM_SHOW;
			    			
			    case "FORM_NEED":
			        return FORM_NEED;
			    			
			    case "FORM_MIN":
			        return FORM_MIN;
			    			
			    case "FORM_MAX":
			        return FORM_MAX;
			    			
			    case "FORM_ONEROW":
			        return FORM_ONEROW;
			    			
			    case "SEARCH_INBILL":
			        return SEARCH_INBILL;
			    			
			    case "FORM_CTRLWIDTH":
			        return FORM_CTRLWIDTH;
			    			
			    case "SEARCH_TYPE":
			        return SEARCH_TYPE;
			    			
			    case "SEARCH_FORMULAR":
			        return SEARCH_FORMULAR;
			    			
			    case "STATUS":
			        return STATUS;
			    			
			    case "SEL_TB_COL":
			        return SEL_TB_COL;
			    			
			    case "IS_COL_EXISTS":
			        return IS_COL_EXISTS;
			    			
			    case "BILL_NAME":
			        return BILL_NAME;
			    			
			    case "BILL_TYPE":
			        return BILL_TYPE;
			    			
			    case "BILL_SQL":
			        return BILL_SQL;
			    			
			    case "ADDTIME":
			        return ADDTIME;
			    			
			    case "EDITIME":
			        return EDITIME;
			    			
			    case "ADDER":
			        return ADDER;
			    			
			    case "Expr1":
			        return Expr1;
			    			
			    case "P_BILL_ID":
			        return P_BILL_ID;
			    			
			    case "BILL_STATUS":
			        return BILL_STATUS;
			    			
			    case "CONN_SOURCE":
			        return CONN_SOURCE;
			    			
			    case "IS_TABLE_EXISTS":
			        return IS_TABLE_EXISTS;
			    			
			    case "KEYS":
			        return KEYS;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>通过属性 设置字段值</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "COL_SYNID":
			        this.COL_SYNID = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "BILL_ID":
			        this.BILL_ID = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "COL_ID":
			        this.COL_ID = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "DB_SRC":
			        this.DB_SRC = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "TABLE_NAME":
			        this.TABLE_NAME = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "COL_NAME":
			        this.COL_NAME = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "COL_NOTE":
			        this.COL_NOTE = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "DATA_TYPE":
			        this.DATA_TYPE = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "DATA_LEN":
			        this.DATA_LEN = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "DATA_ACC":
			        this.DATA_ACC = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "IS_AUTO":
			        this.IS_AUTO = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "ISPK":
			        this.ISPK = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "DVAL":
			        this.DVAL = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "PK_VALCODE":
			        this.PK_VALCODE = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "ISFK":
			        this.ISFK = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SORT_NO":
			        this.SORT_NO = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "FK_NAME":
			        this.FK_NAME = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FK_SHOW":
			        this.FK_SHOW = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "DISPLAY_NAME":
			        this.DISPLAY_NAME = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "TITLE":
			        this.TITLE = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "BILL_ROW_FORMULAR":
			        this.BILL_ROW_FORMULAR = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "BILL_COL_FORMULAR":
			        this.BILL_COL_FORMULAR = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "BILL_ISHEADER":
			        this.BILL_ISHEADER = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "BILL_HERDERWIDTH":
			        this.BILL_HERDERWIDTH = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "FORM_CHECKTYPE":
			        this.FORM_CHECKTYPE = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "BILL_AFTREDTL":
			        this.BILL_AFTREDTL = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FORM_CTRL_ID":
			        this.FORM_CTRL_ID = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "FORM_SHOW":
			        this.FORM_SHOW = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FORM_NEED":
			        this.FORM_NEED = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FORM_MIN":
			        this.FORM_MIN = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FORM_MAX":
			        this.FORM_MAX = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FORM_ONEROW":
			        this.FORM_ONEROW = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SEARCH_INBILL":
			        this.SEARCH_INBILL = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FORM_CTRLWIDTH":
			        this.FORM_CTRLWIDTH = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "SEARCH_TYPE":
			        this.SEARCH_TYPE = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SEARCH_FORMULAR":
			        this.SEARCH_FORMULAR = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "STATUS":
			        this.STATUS = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SEL_TB_COL":
			        this.SEL_TB_COL = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IS_COL_EXISTS":
			        this.IS_COL_EXISTS = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "BILL_NAME":
			        this.BILL_NAME = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "BILL_TYPE":
			        this.BILL_TYPE = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "BILL_SQL":
			        this.BILL_SQL = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "ADDTIME":
			        this.ADDTIME = Convert.ToDateTime(AttributeValue);
                    return true;
			    			
			    case "EDITIME":
			        this.EDITIME = Convert.ToDateTime(AttributeValue);
                    return true;
			    			
			    case "ADDER":
			        this.ADDER = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Expr1":
			        this.Expr1 = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "P_BILL_ID":
			        this.P_BILL_ID = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "BILL_STATUS":
			        this.BILL_STATUS = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "CONN_SOURCE":
			        this.CONN_SOURCE = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IS_TABLE_EXISTS":
			        this.IS_TABLE_EXISTS = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "KEYS":
			        this.KEYS = Convert.ToString(AttributeValue);
                    return true;
			
                default:
                    return base.SetValue(AttributeName, AttributeValue);
			}
        }
        
        /// <summary>通过属性 获取该字段是否已被初始化</summary>
        public override bool GetInitialized(AttributeItem AttributeName)
        {
			switch(AttributeName.FieldName)
			{	
				case "COL_SYNID":
					return col_synid_initialized;
				
				case "BILL_ID":
					return bill_id_initialized;
				
				case "COL_ID":
					return col_id_initialized;
				
				case "DB_SRC":
					return db_src_initialized;
				
				case "TABLE_NAME":
					return table_name_initialized;
				
				case "COL_NAME":
					return col_name_initialized;
				
				case "COL_NOTE":
					return col_note_initialized;
				
				case "DATA_TYPE":
					return data_type_initialized;
				
				case "DATA_LEN":
					return data_len_initialized;
				
				case "DATA_ACC":
					return data_acc_initialized;
				
				case "IS_AUTO":
					return is_auto_initialized;
				
				case "ISPK":
					return ispk_initialized;
				
				case "DVAL":
					return dval_initialized;
				
				case "PK_VALCODE":
					return pk_valcode_initialized;
				
				case "ISFK":
					return isfk_initialized;
				
				case "SORT_NO":
					return sort_no_initialized;
				
				case "FK_NAME":
					return fk_name_initialized;
				
				case "FK_SHOW":
					return fk_show_initialized;
				
				case "DISPLAY_NAME":
					return display_name_initialized;
				
				case "TITLE":
					return title_initialized;
				
				case "BILL_ROW_FORMULAR":
					return bill_row_formular_initialized;
				
				case "BILL_COL_FORMULAR":
					return bill_col_formular_initialized;
				
				case "BILL_ISHEADER":
					return bill_isheader_initialized;
				
				case "BILL_HERDERWIDTH":
					return bill_herderwidth_initialized;
				
				case "FORM_CHECKTYPE":
					return form_checktype_initialized;
				
				case "BILL_AFTREDTL":
					return bill_aftredtl_initialized;
				
				case "FORM_CTRL_ID":
					return form_ctrl_id_initialized;
				
				case "FORM_SHOW":
					return form_show_initialized;
				
				case "FORM_NEED":
					return form_need_initialized;
				
				case "FORM_MIN":
					return form_min_initialized;
				
				case "FORM_MAX":
					return form_max_initialized;
				
				case "FORM_ONEROW":
					return form_onerow_initialized;
				
				case "SEARCH_INBILL":
					return search_inbill_initialized;
				
				case "FORM_CTRLWIDTH":
					return form_ctrlwidth_initialized;
				
				case "SEARCH_TYPE":
					return search_type_initialized;
				
				case "SEARCH_FORMULAR":
					return search_formular_initialized;
				
				case "STATUS":
					return status_initialized;
				
				case "SEL_TB_COL":
					return sel_tb_col_initialized;
				
				case "IS_COL_EXISTS":
					return is_col_exists_initialized;
				
				case "BILL_NAME":
					return bill_name_initialized;
				
				case "BILL_TYPE":
					return bill_type_initialized;
				
				case "BILL_SQL":
					return bill_sql_initialized;
				
				case "ADDTIME":
					return addtime_initialized;
				
				case "EDITIME":
					return editime_initialized;
				
				case "ADDER":
					return adder_initialized;
				
				case "Expr1":
					return expr1_initialized;
				
				case "P_BILL_ID":
					return p_bill_id_initialized;
				
				case "BILL_STATUS":
					return bill_status_initialized;
				
				case "CONN_SOURCE":
					return conn_source_initialized;
				
				case "IS_TABLE_EXISTS":
					return is_table_exists_initialized;
				
				case "KEYS":
					return keys_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>通过属性 设置属性的初始化布尔值</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "COL_SYNID":
					col_synid_initialized = ret;
					return true;
				
				case "BILL_ID":
					bill_id_initialized = ret;
					return true;
				
				case "COL_ID":
					col_id_initialized = ret;
					return true;
				
				case "DB_SRC":
					db_src_initialized = ret;
					return true;
				
				case "TABLE_NAME":
					table_name_initialized = ret;
					return true;
				
				case "COL_NAME":
					col_name_initialized = ret;
					return true;
				
				case "COL_NOTE":
					col_note_initialized = ret;
					return true;
				
				case "DATA_TYPE":
					data_type_initialized = ret;
					return true;
				
				case "DATA_LEN":
					data_len_initialized = ret;
					return true;
				
				case "DATA_ACC":
					data_acc_initialized = ret;
					return true;
				
				case "IS_AUTO":
					is_auto_initialized = ret;
					return true;
				
				case "ISPK":
					ispk_initialized = ret;
					return true;
				
				case "DVAL":
					dval_initialized = ret;
					return true;
				
				case "PK_VALCODE":
					pk_valcode_initialized = ret;
					return true;
				
				case "ISFK":
					isfk_initialized = ret;
					return true;
				
				case "SORT_NO":
					sort_no_initialized = ret;
					return true;
				
				case "FK_NAME":
					fk_name_initialized = ret;
					return true;
				
				case "FK_SHOW":
					fk_show_initialized = ret;
					return true;
				
				case "DISPLAY_NAME":
					display_name_initialized = ret;
					return true;
				
				case "TITLE":
					title_initialized = ret;
					return true;
				
				case "BILL_ROW_FORMULAR":
					bill_row_formular_initialized = ret;
					return true;
				
				case "BILL_COL_FORMULAR":
					bill_col_formular_initialized = ret;
					return true;
				
				case "BILL_ISHEADER":
					bill_isheader_initialized = ret;
					return true;
				
				case "BILL_HERDERWIDTH":
					bill_herderwidth_initialized = ret;
					return true;
				
				case "FORM_CHECKTYPE":
					form_checktype_initialized = ret;
					return true;
				
				case "BILL_AFTREDTL":
					bill_aftredtl_initialized = ret;
					return true;
				
				case "FORM_CTRL_ID":
					form_ctrl_id_initialized = ret;
					return true;
				
				case "FORM_SHOW":
					form_show_initialized = ret;
					return true;
				
				case "FORM_NEED":
					form_need_initialized = ret;
					return true;
				
				case "FORM_MIN":
					form_min_initialized = ret;
					return true;
				
				case "FORM_MAX":
					form_max_initialized = ret;
					return true;
				
				case "FORM_ONEROW":
					form_onerow_initialized = ret;
					return true;
				
				case "SEARCH_INBILL":
					search_inbill_initialized = ret;
					return true;
				
				case "FORM_CTRLWIDTH":
					form_ctrlwidth_initialized = ret;
					return true;
				
				case "SEARCH_TYPE":
					search_type_initialized = ret;
					return true;
				
				case "SEARCH_FORMULAR":
					search_formular_initialized = ret;
					return true;
				
				case "STATUS":
					status_initialized = ret;
					return true;
				
				case "SEL_TB_COL":
					sel_tb_col_initialized = ret;
					return true;
				
				case "IS_COL_EXISTS":
					is_col_exists_initialized = ret;
					return true;
				
				case "BILL_NAME":
					bill_name_initialized = ret;
					return true;
				
				case "BILL_TYPE":
					bill_type_initialized = ret;
					return true;
				
				case "BILL_SQL":
					bill_sql_initialized = ret;
					return true;
				
				case "ADDTIME":
					addtime_initialized = ret;
					return true;
				
				case "EDITIME":
					editime_initialized = ret;
					return true;
				
				case "ADDER":
					adder_initialized = ret;
					return true;
				
				case "Expr1":
					expr1_initialized = ret;
					return true;
				
				case "P_BILL_ID":
					p_bill_id_initialized = ret;
					return true;
				
				case "BILL_STATUS":
					bill_status_initialized = ret;
					return true;
				
				case "CONN_SOURCE":
					conn_source_initialized = ret;
					return true;
				
				case "IS_TABLE_EXISTS":
					is_table_exists_initialized = ret;
					return true;
				
				case "KEYS":
					keys_initialized = ret;
					return true;
				
                default:
                    return base.SetInitialized(AttributeName, ret);
			}
        }
        #endregion


        #region 获取DataParameter PropertyInfo

        /// <summary>
        /// 获取所有被初始化过的值，获取AttributeItem
        /// 目的为获取 System.Windows.Forms.DataGridViewTextBoxColumn[] 在中间数据层采用了 自定义的 MyDataGridViewTextBoxColumn (空类继承自 DataGridViewTextBoxColumn)
        /// 这里采用了两次遍历的方法，是为了避免拆装过程，使用源代码模式的时候，不会依赖于windows.form.dll。
        /// </summary>
        /// <returns></returns>
        public override AttributeItem[] af_GetAvailableAttributeItem(ref List<object> values)
        {
            List<AttributeItem> parametersList = new List<AttributeItem>();

			
			if (col_synid_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.COL_SYNID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(COL_SYNID);
                }
			}
			
			if (bill_id_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_ID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_ID);
                }
			}
			
			if (col_id_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.COL_ID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(COL_ID);
                }
			}
			
			if (db_src_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.DB_SRC;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DB_SRC);
                }
			}
			
			if (table_name_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.TABLE_NAME;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(TABLE_NAME);
                }
			}
			
			if (col_name_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.COL_NAME;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(COL_NAME);
                }
			}
			
			if (col_note_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.COL_NOTE;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(COL_NOTE);
                }
			}
			
			if (data_type_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.DATA_TYPE;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DATA_TYPE);
                }
			}
			
			if (data_len_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.DATA_LEN;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DATA_LEN);
                }
			}
			
			if (data_acc_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.DATA_ACC;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DATA_ACC);
                }
			}
			
			if (is_auto_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.IS_AUTO;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IS_AUTO);
                }
			}
			
			if (ispk_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.ISPK;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ISPK);
                }
			}
			
			if (dval_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.DVAL;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DVAL);
                }
			}
			
			if (pk_valcode_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.PK_VALCODE;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(PK_VALCODE);
                }
			}
			
			if (isfk_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.ISFK;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ISFK);
                }
			}
			
			if (sort_no_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.SORT_NO;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SORT_NO);
                }
			}
			
			if (fk_name_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FK_NAME;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FK_NAME);
                }
			}
			
			if (fk_show_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FK_SHOW;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FK_SHOW);
                }
			}
			
			if (display_name_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.DISPLAY_NAME;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DISPLAY_NAME);
                }
			}
			
			if (title_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.TITLE;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(TITLE);
                }
			}
			
			if (bill_row_formular_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_ROW_FORMULAR;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_ROW_FORMULAR);
                }
			}
			
			if (bill_col_formular_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_COL_FORMULAR;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_COL_FORMULAR);
                }
			}
			
			if (bill_isheader_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_ISHEADER;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_ISHEADER);
                }
			}
			
			if (bill_herderwidth_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_HERDERWIDTH;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_HERDERWIDTH);
                }
			}
			
			if (form_checktype_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FORM_CHECKTYPE;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FORM_CHECKTYPE);
                }
			}
			
			if (bill_aftredtl_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_AFTREDTL;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_AFTREDTL);
                }
			}
			
			if (form_ctrl_id_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FORM_CTRL_ID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FORM_CTRL_ID);
                }
			}
			
			if (form_show_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FORM_SHOW;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FORM_SHOW);
                }
			}
			
			if (form_need_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FORM_NEED;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FORM_NEED);
                }
			}
			
			if (form_min_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FORM_MIN;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FORM_MIN);
                }
			}
			
			if (form_max_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FORM_MAX;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FORM_MAX);
                }
			}
			
			if (form_onerow_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FORM_ONEROW;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FORM_ONEROW);
                }
			}
			
			if (search_inbill_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.SEARCH_INBILL;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SEARCH_INBILL);
                }
			}
			
			if (form_ctrlwidth_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.FORM_CTRLWIDTH;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FORM_CTRLWIDTH);
                }
			}
			
			if (search_type_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.SEARCH_TYPE;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SEARCH_TYPE);
                }
			}
			
			if (search_formular_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.SEARCH_FORMULAR;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SEARCH_FORMULAR);
                }
			}
			
			if (status_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.STATUS;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(STATUS);
                }
			}
			
			if (sel_tb_col_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.SEL_TB_COL;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SEL_TB_COL);
                }
			}
			
			if (is_col_exists_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.IS_COL_EXISTS;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IS_COL_EXISTS);
                }
			}
			
			if (bill_name_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_NAME;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_NAME);
                }
			}
			
			if (bill_type_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_TYPE;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_TYPE);
                }
			}
			
			if (bill_sql_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_SQL;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_SQL);
                }
			}
			
			if (addtime_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.ADDTIME;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ADDTIME);
                }
			}
			
			if (editime_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.EDITIME;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(EDITIME);
                }
			}
			
			if (adder_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.ADDER;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ADDER);
                }
			}
			
			if (expr1_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.Expr1;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Expr1);
                }
			}
			
			if (p_bill_id_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.P_BILL_ID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(P_BILL_ID);
                }
			}
			
			if (bill_status_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.BILL_STATUS;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(BILL_STATUS);
                }
			}
			
			if (conn_source_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.CONN_SOURCE;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(CONN_SOURCE);
                }
			}
			
			if (is_table_exists_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.IS_TABLE_EXISTS;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IS_TABLE_EXISTS);
                }
			}
			
			if (keys_initialized)
			{
                AttributeItem attr = V_SYS_BILL_COL_SYN.Attribute.KEYS;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(KEYS);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}