/************************************************************

  Copyright (c) 2008，ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:21
  Description:    数据表A8Account对应的业务逻辑层A8Account
  Version:         2.1.0.0
 
 * 对此文件的更改可能会导致不正确的行为，并且如果
     重新生成代码，这些更改将会丢失。您可以扩展该类
 * 实现自己的 A8Account_Entity:A8Account
 * 
************************************************************/
/************************************************************
SQL代码：
select RECID,FullName,DBName,CreateDate,ShowOrder,ConnectStr from A8Account
delete from A8Account
INSERT INTO A8Account (RECID,FullName,DBName,CreateDate,ShowOrder,ConnectStr)
     VALUES
           ('','','','','','')
UPDATE {首字母大写列名} SET ...
变量赋值代码：
        valObj.RECID = "";
        valObj.FullName = "";
        valObj.DBName = "";
        valObj.CreateDate = "";
        valObj.ShowOrder = "";
        valObj.ConnectStr = ""; 
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
    /// <para>多帐套</para>
    /// <para>与A8Account数据表对应的实体对象。</para>
    /// <para>增加一个数据列的方法是：在"类字段"节增加一个bool标识位，与"Attribute"属性 </para>
    /// </summary>    
    [Serializable]
    public class A8Account : ITableImplement
    {
        /// <summary>多帐套 工厂方法</summary>
        public static A8Account Factory()
        {
            return new A8Account();
        }
		#region 类字段清单 列属性用于生成视图层时的一致性检查
        #region 类字段清单1
        
        /// <summary> RECID Attribute_IsPrimary_IsNotNull_IDENTITY </summary>
        public int _RECID
        {            
            get { return this.RECID; }
            set { this.RECID = value; }
        }
        
        /// <summary> 全称 Attribute </summary>
        public string _FullName
        {            
            get { return this.FullName; }
            set { this.FullName = value; }
        }
        
        /// <summary> 数据库名 Attribute </summary>
        public string _DBName
        {            
            get { return this.DBName; }
            set { this.DBName = value; }
        }
        
        /// <summary> 创建时间 Attribute </summary>
        public DateTime _CreateDate
        {            
            get { return this.CreateDate; }
            set { this.CreateDate = value; }
        }
        
        /// <summary> 显示顺序 Attribute </summary>
        public Byte _ShowOrder
        {            
            get { return this.ShowOrder; }
            set { this.ShowOrder = value; }
        }
        
        /// <summary> 连接字符串 Attribute </summary>
        public string _ConnectStr
        {            
            get { return this.ConnectStr; }
            set { this.ConnectStr = value; }
        }
        #endregion
        #region 类字段清单2
        
        /// <summary> RECID，推荐使用 "_"符号开头 </summary>
        public int RECID
        {
            get { return this.m_recid; }
            set //private 
            {
                if (!recid_initialized || m_recid != value)
                {
                    this.m_recid = value;
                }
                recid_initialized = true;
            }
        }
        
        /// <summary> 全称，推荐使用 "_"符号开头 </summary>
        public string FullName
        {
            get { return this.m_fullname; }
            set //
            {
                if (!fullname_initialized || m_fullname != value)
                {
                    this.m_fullname = value;
                }
                fullname_initialized = true;
            }
        }
        
        /// <summary> 数据库名，推荐使用 "_"符号开头 </summary>
        public string DBName
        {
            get { return this.m_dbname; }
            set //
            {
                if (!dbname_initialized || m_dbname != value)
                {
                    this.m_dbname = value;
                }
                dbname_initialized = true;
            }
        }
        
        /// <summary> 创建时间，推荐使用 "_"符号开头 </summary>
        public DateTime CreateDate
        {
            get { return this.m_createdate; }
            set //
            {
                if (!createdate_initialized || m_createdate != value)
                {
                    this.m_createdate = value;
                }
                createdate_initialized = true;
            }
        }
        
        /// <summary> 显示顺序，推荐使用 "_"符号开头 </summary>
        public Byte ShowOrder
        {
            get { return this.m_showorder; }
            set //
            {
                if (!showorder_initialized || m_showorder != value)
                {
                    this.m_showorder = value;
                }
                showorder_initialized = true;
            }
        }
        
        /// <summary> 连接字符串，推荐使用 "_"符号开头 </summary>
        public string ConnectStr
        {
            get { return this.m_connectstr; }
            set //
            {
                if (!connectstr_initialized || m_connectstr != value)
                {
                    this.m_connectstr = value;
                }
                connectstr_initialized = true;
            }
        }    
        #endregion
        #region Attribute清单 辅助设计
        /// <summary>
        /// {列属性-结构属性}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>RECID</summary>
            public static AttributeItem RECID =  new AttributeItem("[A8Account].[RECID]", typeof(int), 2147483647);
            
            /// <summary>全称</summary>
            public static AttributeItem FullName =  new AttributeItem("[A8Account].[FullName]", typeof(string), 100);
            
            /// <summary>数据库名</summary>
            public static AttributeItem DBName =  new AttributeItem("[A8Account].[DBName]", typeof(string), 100);
            
            /// <summary>创建时间</summary>
            public static AttributeItem CreateDate =  new AttributeItem("[A8Account].[CreateDate]", typeof(DateTime), 100);
            
            /// <summary>显示顺序</summary>
            public static AttributeItem ShowOrder =  new AttributeItem("[A8Account].[ShowOrder]", typeof(Byte), 1);
            
            /// <summary>连接字符串</summary>
            public static AttributeItem ConnectStr =  new AttributeItem("[A8Account].[ConnectStr]", typeof(string), 500);
        }
        #endregion
        #region bool清单 辅助设计
        
        private int m_recid;
        /// <summary></summary>
        protected bool recid_initialized = false;
        
        private string m_fullname;
        /// <summary></summary>
        protected bool fullname_initialized = false;
        
        private string m_dbname;
        /// <summary></summary>
        protected bool dbname_initialized = false;
        
        private DateTime m_createdate;
        /// <summary></summary>
        protected bool createdate_initialized = false;
        
        private Byte m_showorder;
        /// <summary></summary>
        protected bool showorder_initialized = false;
        
        private string m_connectstr;
        /// <summary></summary>
        protected bool connectstr_initialized = false;
        #endregion

        #endregion 类字段
        
		#region 获得与设置属性列与值，以及操作属性的部分方法

        /// <summary>
        /// 实体名 多帐套
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "A8Account";
        }
        
        /// <summary>
        /// 设置自动载入所有列
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.recid_initialized = IsLoadAllAttributes;this.fullname_initialized = IsLoadAllAttributes;this.dbname_initialized = IsLoadAllAttributes;this.createdate_initialized = IsLoadAllAttributes;this.showorder_initialized = IsLoadAllAttributes;this.connectstr_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			A8Account value = new A8Account();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"RECID"))
				value.recid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FullName"))
				value.fullname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DBName"))
				value.dbname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"CreateDate"))
				value.createdate_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ShowOrder"))
				value.showorder_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ConnectStr"))
				value.connectstr_initialized = true;
            
			return value;
		}
        #endregion
        
        #region 实现ICloneable 成员
        /// <summary>多帐套</summary>
        public new A8Account Clone()
        {
            return (A8Account)this.MemberwiseClone(); //浅复制
        }
        #endregion
        
        #region 构造函数 获得实例
        /// <summary>多帐套 构造函数</summary>
        static A8Account()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>多帐套 构造函数</summary>
        public A8Account() { }
        /// <summary>
        /// 多帐套 是否载入所有属性
        /// </summary>
        /// <param name="IsLoadAllAttributes">是否全部初始化为true</param>
        public A8Account(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>多帐套 实现分表功能，修改表名</summary>
        //public A8Account(string tableName):base(tableName) { }
        /// <summary>多帐套 实现分表功能，自定义实例的初始化</summary>
        //public A8Account(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>多帐套 实现快捷功能</summary>
        //public A8Account(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>多帐套 请注意，这里当表中仅存在一个字段的时候，将可能与构造函数 new Table(string tableName)冲突</summary>
        public A8Account(int recid, string fullname, string dbname, DateTime createdate, Byte showorder, string connectstr)
        {
            
            this.RECID = recid;
            
            this.FullName = fullname;
            
            this.DBName = dbname;
            
            this.CreateDate = createdate;
            
            this.ShowOrder = showorder;
            
            this.ConnectStr = connectstr;
        }
        /// <summary>多帐套 从视图（多表）内获取本表</summary>
        public static A8Account FromIView(IView view)
        {
            return (A8Account)IView.GetITable(view, "A8Account");
        }
        /// <summary>多帐套 获得一个实例</summary>
        public static A8Account GetOneInstance()
        {
            A8Account value = new A8Account();
            return value;
        }
       
        #endregion
		
        #region 2.2 新增的列属性操作方法

        /// <summary>通过属性 获得字段值</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "RECID":
			        return RECID;
			    			
			    case "FullName":
			        return FullName;
			    			
			    case "DBName":
			        return DBName;
			    			
			    case "CreateDate":
			        return CreateDate;
			    			
			    case "ShowOrder":
			        return ShowOrder;
			    			
			    case "ConnectStr":
			        return ConnectStr;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>通过属性 设置字段值</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "RECID":
			        this.RECID = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "FullName":
			        this.FullName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "DBName":
			        this.DBName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "CreateDate":
			        this.CreateDate = Convert.ToDateTime(AttributeValue);
                    return true;
			    			
			    case "ShowOrder":
			        this.ShowOrder = Convert.ToByte(AttributeValue);
                    return true;
			    			
			    case "ConnectStr":
			        this.ConnectStr = Convert.ToString(AttributeValue);
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
				case "RECID":
					return recid_initialized;
				
				case "FullName":
					return fullname_initialized;
				
				case "DBName":
					return dbname_initialized;
				
				case "CreateDate":
					return createdate_initialized;
				
				case "ShowOrder":
					return showorder_initialized;
				
				case "ConnectStr":
					return connectstr_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>通过属性 设置属性的初始化布尔值</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "RECID":
					recid_initialized = ret;
					return true;
				
				case "FullName":
					fullname_initialized = ret;
					return true;
				
				case "DBName":
					dbname_initialized = ret;
					return true;
				
				case "CreateDate":
					createdate_initialized = ret;
					return true;
				
				case "ShowOrder":
					showorder_initialized = ret;
					return true;
				
				case "ConnectStr":
					connectstr_initialized = ret;
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

			
			if (recid_initialized)
			{
                AttributeItem attr = A8Account.Attribute.RECID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(RECID);
                }
			}
			
			if (fullname_initialized)
			{
                AttributeItem attr = A8Account.Attribute.FullName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FullName);
                }
			}
			
			if (dbname_initialized)
			{
                AttributeItem attr = A8Account.Attribute.DBName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DBName);
                }
			}
			
			if (createdate_initialized)
			{
                AttributeItem attr = A8Account.Attribute.CreateDate;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(CreateDate);
                }
			}
			
			if (showorder_initialized)
			{
                AttributeItem attr = A8Account.Attribute.ShowOrder;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ShowOrder);
                }
			}
			
			if (connectstr_initialized)
			{
                AttributeItem attr = A8Account.Attribute.ConnectStr;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ConnectStr);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}