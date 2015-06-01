/************************************************************

  Copyright (c) 2008，ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:22
  Description:    数据表AutoBackUpPath对应的业务逻辑层AutoBackUpPath
  Version:         2.1.0.0
 
 * 对此文件的更改可能会导致不正确的行为，并且如果
     重新生成代码，这些更改将会丢失。您可以扩展该类
 * 实现自己的 AutoBackUpPath_Entity:AutoBackUpPath
 * 
************************************************************/
/************************************************************
SQL代码：
select PlanId,PlanName,DbName,PathInfo,ID from AutoBackUpPath
delete from AutoBackUpPath
INSERT INTO AutoBackUpPath (PlanId,PlanName,DbName,PathInfo,ID)
     VALUES
           ('','','','','')
UPDATE {首字母大写列名} SET ...
变量赋值代码：
        valObj.PlanId = "";
        valObj.PlanName = "";
        valObj.DbName = "";
        valObj.PathInfo = "";
        valObj.ID = ""; 
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
    /// <para>自动备份路径</para>
    /// <para>与AutoBackUpPath数据表对应的实体对象。</para>
    /// <para>增加一个数据列的方法是：在"类字段"节增加一个bool标识位，与"Attribute"属性 </para>
    /// </summary>    
    [Serializable]
    public class AutoBackUpPath : ITableImplement
    {
        /// <summary>自动备份路径 工厂方法</summary>
        public static AutoBackUpPath Factory()
        {
            return new AutoBackUpPath();
        }
		#region 类字段清单 列属性用于生成视图层时的一致性检查
        #region 类字段清单1
        
        /// <summary> 路径ID Attribute </summary>
        public string _PlanId
        {            
            get { return this.PlanId; }
            set { this.PlanId = value; }
        }
        
        /// <summary> 路径名 Attribute </summary>
        public string _PlanName
        {            
            get { return this.PlanName; }
            set { this.PlanName = value; }
        }
        
        /// <summary> 数据库名 Attribute </summary>
        public string _DbName
        {            
            get { return this.DbName; }
            set { this.DbName = value; }
        }
        
        /// <summary> 路径信息 Attribute </summary>
        public string _PathInfo
        {            
            get { return this.PathInfo; }
            set { this.PathInfo = value; }
        }
        
        /// <summary> ID Attribute_IsNotNull_IDENTITY </summary>
        public int _ID
        {            
            get { return this.ID; }
            set { this.ID = value; }
        }
        #endregion
        #region 类字段清单2
        
        /// <summary> 路径ID，推荐使用 "_"符号开头 </summary>
        public string PlanId
        {
            get { return this.m_planid; }
            set //
            {
                if (!planid_initialized || m_planid != value)
                {
                    this.m_planid = value;
                }
                planid_initialized = true;
            }
        }
        
        /// <summary> 路径名，推荐使用 "_"符号开头 </summary>
        public string PlanName
        {
            get { return this.m_planname; }
            set //
            {
                if (!planname_initialized || m_planname != value)
                {
                    this.m_planname = value;
                }
                planname_initialized = true;
            }
        }
        
        /// <summary> 数据库名，推荐使用 "_"符号开头 </summary>
        public string DbName
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
        
        /// <summary> 路径信息，推荐使用 "_"符号开头 </summary>
        public string PathInfo
        {
            get { return this.m_pathinfo; }
            set //
            {
                if (!pathinfo_initialized || m_pathinfo != value)
                {
                    this.m_pathinfo = value;
                }
                pathinfo_initialized = true;
            }
        }
        
        /// <summary> ID，推荐使用 "_"符号开头 </summary>
        public int ID
        {
            get { return this.m_id; }
            set //private 
            {
                if (!id_initialized || m_id != value)
                {
                    this.m_id = value;
                }
                id_initialized = true;
            }
        }    
        #endregion
        #region Attribute清单 辅助设计
        /// <summary>
        /// {列属性-结构属性}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>路径ID</summary>
            public static AttributeItem PlanId =  new AttributeItem("[AutoBackUpPath].[PlanId]", typeof(string), 200);
            
            /// <summary>路径名</summary>
            public static AttributeItem PlanName =  new AttributeItem("[AutoBackUpPath].[PlanName]", typeof(string), 200);
            
            /// <summary>数据库名</summary>
            public static AttributeItem DbName =  new AttributeItem("[AutoBackUpPath].[DbName]", typeof(string), 200);
            
            /// <summary>路径信息</summary>
            public static AttributeItem PathInfo =  new AttributeItem("[AutoBackUpPath].[PathInfo]", typeof(string), 1000);
            
            /// <summary>ID</summary>
            public static AttributeItem ID =  new AttributeItem("[AutoBackUpPath].[ID]", typeof(int), 2147483647);
        }
        #endregion
        #region bool清单 辅助设计
        
        private string m_planid;
        /// <summary></summary>
        protected bool planid_initialized = false;
        
        private string m_planname;
        /// <summary></summary>
        protected bool planname_initialized = false;
        
        private string m_dbname;
        /// <summary></summary>
        protected bool dbname_initialized = false;
        
        private string m_pathinfo;
        /// <summary></summary>
        protected bool pathinfo_initialized = false;
        
        private int m_id;
        /// <summary></summary>
        protected bool id_initialized = false;
        #endregion

        #endregion 类字段
        
		#region 获得与设置属性列与值，以及操作属性的部分方法

        /// <summary>
        /// 实体名 自动备份路径
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "AutoBackUpPath";
        }
        
        /// <summary>
        /// 设置自动载入所有列
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.planid_initialized = IsLoadAllAttributes;this.planname_initialized = IsLoadAllAttributes;this.dbname_initialized = IsLoadAllAttributes;this.pathinfo_initialized = IsLoadAllAttributes;this.id_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			AutoBackUpPath value = new AutoBackUpPath();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"PlanId"))
				value.planid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"PlanName"))
				value.planname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DbName"))
				value.dbname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"PathInfo"))
				value.pathinfo_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ID"))
				value.id_initialized = true;
            
			return value;
		}
        #endregion
        
        #region 实现ICloneable 成员
        /// <summary>自动备份路径</summary>
        public new AutoBackUpPath Clone()
        {
            return (AutoBackUpPath)this.MemberwiseClone(); //浅复制
        }
        #endregion
        
        #region 构造函数 获得实例
        /// <summary>自动备份路径 构造函数</summary>
        static AutoBackUpPath()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>自动备份路径 构造函数</summary>
        public AutoBackUpPath() { }
        /// <summary>
        /// 自动备份路径 是否载入所有属性
        /// </summary>
        /// <param name="IsLoadAllAttributes">是否全部初始化为true</param>
        public AutoBackUpPath(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>自动备份路径 实现分表功能，修改表名</summary>
        //public AutoBackUpPath(string tableName):base(tableName) { }
        /// <summary>自动备份路径 实现分表功能，自定义实例的初始化</summary>
        //public AutoBackUpPath(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>自动备份路径 实现快捷功能</summary>
        //public AutoBackUpPath(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>自动备份路径 请注意，这里当表中仅存在一个字段的时候，将可能与构造函数 new Table(string tableName)冲突</summary>
        public AutoBackUpPath(string planid, string planname, string dbname, string pathinfo, int id)
        {
            
            this.PlanId = planid;
            
            this.PlanName = planname;
            
            this.DbName = dbname;
            
            this.PathInfo = pathinfo;
            
            this.ID = id;
        }
        /// <summary>自动备份路径 从视图（多表）内获取本表</summary>
        public static AutoBackUpPath FromIView(IView view)
        {
            return (AutoBackUpPath)IView.GetITable(view, "AutoBackUpPath");
        }
        /// <summary>自动备份路径 获得一个实例</summary>
        public static AutoBackUpPath GetOneInstance()
        {
            AutoBackUpPath value = new AutoBackUpPath();
            return value;
        }
        #endregion
		
        #region 2.2 新增的列属性操作方法

        /// <summary>通过属性 获得字段值</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "PlanId":
			        return PlanId;
			    			
			    case "PlanName":
			        return PlanName;
			    			
			    case "DbName":
			        return DbName;
			    			
			    case "PathInfo":
			        return PathInfo;
			    			
			    case "ID":
			        return ID;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>通过属性 设置字段值</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "PlanId":
			        this.PlanId = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "PlanName":
			        this.PlanName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "DbName":
			        this.DbName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "PathInfo":
			        this.PathInfo = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "ID":
			        this.ID = Convert.ToInt32(AttributeValue);
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
				case "PlanId":
					return planid_initialized;
				
				case "PlanName":
					return planname_initialized;
				
				case "DbName":
					return dbname_initialized;
				
				case "PathInfo":
					return pathinfo_initialized;
				
				case "ID":
					return id_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>通过属性 设置属性的初始化布尔值</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "PlanId":
					planid_initialized = ret;
					return true;
				
				case "PlanName":
					planname_initialized = ret;
					return true;
				
				case "DbName":
					dbname_initialized = ret;
					return true;
				
				case "PathInfo":
					pathinfo_initialized = ret;
					return true;
				
				case "ID":
					id_initialized = ret;
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

			
			if (planid_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.PlanId;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(PlanId);
                }
			}
			
			if (planname_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.PlanName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(PlanName);
                }
			}
			
			if (dbname_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.DbName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DbName);
                }
			}
			
			if (pathinfo_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.PathInfo;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(PathInfo);
                }
			}
			
			if (id_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.ID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ID);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}