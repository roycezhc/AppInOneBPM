/************************************************************

  Copyright (c) 2008，ybkj_zlg
  Author:               Created Time: 2013-01-31 15:46:09
  Description:    数据表SYS_DATASOURCE对应的业务逻辑层SYS_DATASOURCE
  Version:         2.1.0.0
 
 * 对此文件的更改可能会导致不正确的行为，并且如果
     重新生成代码，这些更改将会丢失。您可以扩展该类
 * 实现自己的 SYS_DATASOURCE_Entity:SYS_DATASOURCE
 * 
************************************************************/
/************************************************************
SQL代码：
select ID,SourceConnectString,SourceType,SourceName from SYS_DATASOURCE
delete from SYS_DATASOURCE
INSERT INTO SYS_DATASOURCE (ID,SourceConnectString,SourceType,SourceName)
     VALUES
           ('','','','')
UPDATE {首字母大写列名} SET ...
变量赋值代码：
        valObj.ID = "";
        valObj.SourceConnectString = "";
        valObj.SourceType = "";
        valObj.SourceName = ""; 
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
    /// <para>数据源管理</para>
    /// <para>与SYS_DATASOURCE数据表对应的实体对象。</para>
    /// <para>增加一个数据列的方法是：在"类字段"节增加一个bool标识位，与"Attribute"属性 </para>
    /// </summary>    
    [Serializable]
    public class SYS_DATASOURCE : ITableImplement
    {
        /// <summary>数据源管理 工厂方法</summary>
        public static SYS_DATASOURCE Factory()
        {
            return new SYS_DATASOURCE();
        }
		#region 类字段清单 列属性用于生成视图层时的一致性检查
        #region 类字段清单1
        
        /// <summary> 自动标识 Attribute_IsPrimary_IsNotNull </summary>
        public string _ID
        {            
            get { return this.ID; }
            set { this.ID = value; }
        }
        
        /// <summary> 数据源连接字符串 Attribute </summary>
        public string _SourceConnectString
        {            
            get { return this.SourceConnectString; }
            set { this.SourceConnectString = value; }
        }
        
        /// <summary> 数据源类型 Attribute </summary>
        public string _SourceType
        {            
            get { return this.SourceType; }
            set { this.SourceType = value; }
        }
        
        /// <summary> 数据源简称 Attribute </summary>
        public string _SourceName
        {            
            get { return this.SourceName; }
            set { this.SourceName = value; }
        }
        #endregion
        #region 类字段清单2
        
        /// <summary> 自动标识，推荐使用 "_"符号开头 </summary>
        public string ID
        {
            get { return this.m_id; }
            set //
            {
                if (!id_initialized || m_id != value)
                {
                    this.m_id = value;
                }
                id_initialized = true;
            }
        }
        
        /// <summary> 数据源连接字符串，推荐使用 "_"符号开头 </summary>
        public string SourceConnectString
        {
            get { return this.m_sourceconnectstring; }
            set //
            {
                if (!sourceconnectstring_initialized || m_sourceconnectstring != value)
                {
                    this.m_sourceconnectstring = value;
                }
                sourceconnectstring_initialized = true;
            }
        }
        
        /// <summary> 数据源类型，推荐使用 "_"符号开头 </summary>
        public string SourceType
        {
            get { return this.m_sourcetype; }
            set //
            {
                if (!sourcetype_initialized || m_sourcetype != value)
                {
                    this.m_sourcetype = value;
                }
                sourcetype_initialized = true;
            }
        }
        
        /// <summary> 数据源简称，推荐使用 "_"符号开头 </summary>
        public string SourceName
        {
            get { return this.m_sourcename; }
            set //
            {
                if (!sourcename_initialized || m_sourcename != value)
                {
                    this.m_sourcename = value;
                }
                sourcename_initialized = true;
            }
        }    
        #endregion
        #region Attribute清单 辅助设计
        /// <summary>
        /// {列属性-结构属性}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>自动标识</summary>
            public static AttributeItem ID =  new AttributeItem("[SYS_DATASOURCE].[ID]", typeof(string), 50);
            
            /// <summary>数据源连接字符串</summary>
            public static AttributeItem SourceConnectString =  new AttributeItem("[SYS_DATASOURCE].[SourceConnectString]", typeof(string), 50);
            
            /// <summary>数据源类型</summary>
            public static AttributeItem SourceType =  new AttributeItem("[SYS_DATASOURCE].[SourceType]", typeof(string), 50);
            
            /// <summary>数据源简称</summary>
            public static AttributeItem SourceName =  new AttributeItem("[SYS_DATASOURCE].[SourceName]", typeof(string), 10);
        }
        #endregion
        #region bool清单 辅助设计
        
        private string m_id;
        /// <summary></summary>
        protected bool id_initialized = false;
        
        private string m_sourceconnectstring;
        /// <summary></summary>
        protected bool sourceconnectstring_initialized = false;
        
        private string m_sourcetype;
        /// <summary></summary>
        protected bool sourcetype_initialized = false;
        
        private string m_sourcename;
        /// <summary></summary>
        protected bool sourcename_initialized = false;
        #endregion

        #endregion 类字段
        
		#region 获得与设置属性列与值，以及操作属性的部分方法

        /// <summary>
        /// 实体名 数据源管理
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "SYS_DATASOURCE";
        }
        
        /// <summary>
        /// 设置自动载入所有列
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.id_initialized = IsLoadAllAttributes;this.sourceconnectstring_initialized = IsLoadAllAttributes;this.sourcetype_initialized = IsLoadAllAttributes;this.sourcename_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			SYS_DATASOURCE value = new SYS_DATASOURCE();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"ID"))
				value.id_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SourceConnectString"))
				value.sourceconnectstring_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SourceType"))
				value.sourcetype_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SourceName"))
				value.sourcename_initialized = true;
            
			return value;
		}
        #endregion
        
        #region 实现ICloneable 成员
        /// <summary>数据源管理</summary>
        public new SYS_DATASOURCE Clone()
        {
            return (SYS_DATASOURCE)this.MemberwiseClone(); //浅复制
        }
        #endregion
        
        #region 构造函数 获得实例
        /// <summary>数据源管理 构造函数</summary>
        static SYS_DATASOURCE()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>数据源管理 构造函数</summary>
        public SYS_DATASOURCE() { }
        /// <summary>
        /// 数据源管理 是否载入所有属性
        /// </summary>
        /// <param name="IsLoadAllAttributes">是否全部初始化为true</param>
        public SYS_DATASOURCE(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>数据源管理 实现分表功能，修改表名</summary>
        public SYS_DATASOURCE(string tableName):base(tableName) { }
        /// <summary>数据源管理 实现分表功能，自定义实例的初始化</summary>
        public SYS_DATASOURCE(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>数据源管理 实现快捷功能</summary>
        public SYS_DATASOURCE(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>数据源管理 请注意，这里当表中仅存在一个字段的时候，将可能与构造函数 new Table(string tableName)冲突</summary>
        public SYS_DATASOURCE(string id, string sourceconnectstring, string sourcetype, string sourcename)
        {
            
            this.ID = id;
            
            this.SourceConnectString = sourceconnectstring;
            
            this.SourceType = sourcetype;
            
            this.SourceName = sourcename;
        }
        /// <summary>数据源管理 从视图（多表）内获取本表</summary>
        public static SYS_DATASOURCE FromIView(IView view)
        {
            return (SYS_DATASOURCE)IView.GetITable(view, "SYS_DATASOURCE");
        }
        /// <summary>数据源管理 获得一个实例</summary>
        public static SYS_DATASOURCE GetOneInstance()
        {
            SYS_DATASOURCE value = new SYS_DATASOURCE();
            return value;
        }
        /// <summary>数据源管理 获取单一实例==BLLTable.GetRowData();</summary>
        public SYS_DATASOURCE Retrieve()
        {
            BLLTable<SYS_DATASOURCE>.Factory(conn).GetRowData(this);
            return this;
        }
        #endregion
		
        #region 2.2 新增的列属性操作方法

        /// <summary>通过属性 获得字段值</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "ID":
			        return ID;
			    			
			    case "SourceConnectString":
			        return SourceConnectString;
			    			
			    case "SourceType":
			        return SourceType;
			    			
			    case "SourceName":
			        return SourceName;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>通过属性 设置字段值</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "ID":
			        this.ID = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SourceConnectString":
			        this.SourceConnectString = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SourceType":
			        this.SourceType = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SourceName":
			        this.SourceName = Convert.ToString(AttributeValue);
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
				case "ID":
					return id_initialized;
				
				case "SourceConnectString":
					return sourceconnectstring_initialized;
				
				case "SourceType":
					return sourcetype_initialized;
				
				case "SourceName":
					return sourcename_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>通过属性 设置属性的初始化布尔值</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "ID":
					id_initialized = ret;
					return true;
				
				case "SourceConnectString":
					sourceconnectstring_initialized = ret;
					return true;
				
				case "SourceType":
					sourcetype_initialized = ret;
					return true;
				
				case "SourceName":
					sourcename_initialized = ret;
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

			
			if (id_initialized)
			{
                AttributeItem attr = SYS_DATASOURCE.Attribute.ID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ID);
                }
			}
			
			if (sourceconnectstring_initialized)
			{
                AttributeItem attr = SYS_DATASOURCE.Attribute.SourceConnectString;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SourceConnectString);
                }
			}
			
			if (sourcetype_initialized)
			{
                AttributeItem attr = SYS_DATASOURCE.Attribute.SourceType;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SourceType);
                }
			}
			
			if (sourcename_initialized)
			{
                AttributeItem attr = SYS_DATASOURCE.Attribute.SourceName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SourceName);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}