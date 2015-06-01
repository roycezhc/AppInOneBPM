/************************************************************

  Copyright (c) 2008，ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:21
  Description:    数据表A8OnlineUserConstr对应的业务逻辑层A8OnlineUserConstr
  Version:         2.1.0.0
 
 * 对此文件的更改可能会导致不正确的行为，并且如果
     重新生成代码，这些更改将会丢失。您可以扩展该类
 * 实现自己的 A8OnlineUserConstr_Entity:A8OnlineUserConstr
 * 
************************************************************/
/************************************************************
SQL代码：
select UserSession,Constring from A8OnlineUserConstr
delete from A8OnlineUserConstr
INSERT INTO A8OnlineUserConstr (UserSession,Constring)
     VALUES
           ('','')
UPDATE {首字母大写列名} SET ...
变量赋值代码：
        valObj.UserSession = "";
        valObj.Constring = ""; 
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
    /// <para>在线用户连接监测</para>
    /// <para>与A8OnlineUserConstr数据表对应的实体对象。</para>
    /// <para>增加一个数据列的方法是：在"类字段"节增加一个bool标识位，与"Attribute"属性 </para>
    /// </summary>    
    [Serializable]
    public class A8OnlineUserConstr : ITableImplement
    {
        /// <summary>在线用户连接监测 工厂方法</summary>
        public static A8OnlineUserConstr Factory()
        {
            return new A8OnlineUserConstr();
        }
		#region 类字段清单 列属性用于生成视图层时的一致性检查
        #region 类字段清单1
        
        /// <summary> 用户会话 Attribute_IsNotNull </summary>
        public string _UserSession
        {            
            get { return this.UserSession; }
            set { this.UserSession = value; }
        }
        
        /// <summary> 连接字符串 Attribute_IsNotNull </summary>
        public string _Constring
        {            
            get { return this.Constring; }
            set { this.Constring = value; }
        }
        #endregion
        #region 类字段清单2
        
        /// <summary> 用户会话，推荐使用 "_"符号开头 </summary>
        public string UserSession
        {
            get { return this.m_usersession; }
            set //
            {
                if (!usersession_initialized || m_usersession != value)
                {
                    this.m_usersession = value;
                }
                usersession_initialized = true;
            }
        }
        
        /// <summary> 连接字符串，推荐使用 "_"符号开头 </summary>
        public string Constring
        {
            get { return this.m_constring; }
            set //
            {
                if (!constring_initialized || m_constring != value)
                {
                    this.m_constring = value;
                }
                constring_initialized = true;
            }
        }    
        #endregion
        #region Attribute清单 辅助设计
        /// <summary>
        /// {列属性-结构属性}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>用户会话</summary>
            public static AttributeItem UserSession =  new AttributeItem("[A8OnlineUserConstr].[UserSession]", typeof(string), 100);
            
            /// <summary>连接字符串</summary>
            public static AttributeItem Constring =  new AttributeItem("[A8OnlineUserConstr].[Constring]", typeof(string), 500);
        }
        #endregion
        #region bool清单 辅助设计
        
        private string m_usersession;
        /// <summary></summary>
        protected bool usersession_initialized = false;
        
        private string m_constring;
        /// <summary></summary>
        protected bool constring_initialized = false;
        #endregion

        #endregion 类字段
        
		#region 获得与设置属性列与值，以及操作属性的部分方法

        /// <summary>
        /// 实体名 在线用户连接监测
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "A8OnlineUserConstr";
        }
        
        /// <summary>
        /// 设置自动载入所有列
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.usersession_initialized = IsLoadAllAttributes;this.constring_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			A8OnlineUserConstr value = new A8OnlineUserConstr();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"UserSession"))
				value.usersession_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Constring"))
				value.constring_initialized = true;
            
			return value;
		}
        #endregion
        
        #region 实现ICloneable 成员
        /// <summary>在线用户连接监测</summary>
        public new A8OnlineUserConstr Clone()
        {
            return (A8OnlineUserConstr)this.MemberwiseClone(); //浅复制
        }
        #endregion
        
        #region 构造函数 获得实例
        /// <summary>在线用户连接监测 构造函数</summary>
        static A8OnlineUserConstr()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>在线用户连接监测 构造函数</summary>
        public A8OnlineUserConstr() { }
        /// <summary>
        /// 在线用户连接监测 是否载入所有属性
        /// </summary>
        /// <param name="IsLoadAllAttributes">是否全部初始化为true</param>
        public A8OnlineUserConstr(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>在线用户连接监测 实现分表功能，修改表名</summary>
        //public A8OnlineUserConstr(string tableName):base(tableName) { }
        /// <summary>在线用户连接监测 实现分表功能，自定义实例的初始化</summary>
        //public A8OnlineUserConstr(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>在线用户连接监测 实现快捷功能</summary>
        //public A8OnlineUserConstr(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>在线用户连接监测 请注意，这里当表中仅存在一个字段的时候，将可能与构造函数 new Table(string tableName)冲突</summary>
        public A8OnlineUserConstr(string usersession, string constring)
        {
            
            this.UserSession = usersession;
            
            this.Constring = constring;
        }
        /// <summary>在线用户连接监测 从视图（多表）内获取本表</summary>
        public static A8OnlineUserConstr FromIView(IView view)
        {
            return (A8OnlineUserConstr)IView.GetITable(view, "A8OnlineUserConstr");
        }
        /// <summary>在线用户连接监测 获得一个实例</summary>
        public static A8OnlineUserConstr GetOneInstance()
        {
            A8OnlineUserConstr value = new A8OnlineUserConstr();
            return value;
        }
        #endregion
		
        #region 2.2 新增的列属性操作方法

        /// <summary>通过属性 获得字段值</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "UserSession":
			        return UserSession;
			    			
			    case "Constring":
			        return Constring;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>通过属性 设置字段值</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "UserSession":
			        this.UserSession = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Constring":
			        this.Constring = Convert.ToString(AttributeValue);
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
				case "UserSession":
					return usersession_initialized;
				
				case "Constring":
					return constring_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>通过属性 设置属性的初始化布尔值</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "UserSession":
					usersession_initialized = ret;
					return true;
				
				case "Constring":
					constring_initialized = ret;
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

			
			if (usersession_initialized)
			{
                AttributeItem attr = A8OnlineUserConstr.Attribute.UserSession;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(UserSession);
                }
			}
			
			if (constring_initialized)
			{
                AttributeItem attr = A8OnlineUserConstr.Attribute.Constring;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Constring);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}