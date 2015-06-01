/************************************************************

  Copyright (c) 2008，ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:23
  Description:    数据表RWXsysadmin对应的业务逻辑层RWXsysadmin
  Version:         2.1.0.0
 
 * 对此文件的更改可能会导致不正确的行为，并且如果
     重新生成代码，这些更改将会丢失。您可以扩展该类
 * 实现自己的 RWXsysadmin_Entity:RWXsysadmin
 * 
************************************************************/
/************************************************************
SQL代码：
select Password,Version,LoginMode,Verification,Logoimg,Logoposition,Logosize,Logotype from RWXsysadmin
delete from RWXsysadmin
INSERT INTO RWXsysadmin (Password,Version,LoginMode,Verification,Logoimg,Logoposition,Logosize,Logotype)
     VALUES
           ('','','','','','','','')
UPDATE {首字母大写列名} SET ...
变量赋值代码：
        valObj.Password = "";
        valObj.Version = "";
        valObj.LoginMode = "";
        valObj.Verification = "";
        valObj.Logoimg = "";
        valObj.Logoposition = "";
        valObj.Logosize = "";
        valObj.Logotype = ""; 
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
    /// <para>系统定制管理</para>
    /// <para>与RWXsysadmin数据表对应的实体对象。</para>
    /// <para>增加一个数据列的方法是：在"类字段"节增加一个bool标识位，与"Attribute"属性 </para>
    /// </summary>    
    [Serializable]
    public class RWXsysadmin : ITableImplement
    {
        /// <summary>系统定制管理 工厂方法</summary>
        public static RWXsysadmin Factory()
        {
            return new RWXsysadmin();
        }
		#region 类字段清单 列属性用于生成视图层时的一致性检查
        #region 类字段清单1
        
        /// <summary> 密码 Attribute </summary>
        public string _Password
        {            
            get { return this.Password; }
            set { this.Password = value; }
        }
        
        /// <summary> 版本 Attribute </summary>
        public string _Version
        {            
            get { return this.Version; }
            set { this.Version = value; }
        }
        
        /// <summary> 登录模式 Attribute </summary>
        public int _LoginMode
        {            
            get { return this.LoginMode; }
            set { this.LoginMode = value; }
        }
        
        /// <summary> 验证模式 Attribute </summary>
        public int _Verification
        {            
            get { return this.Verification; }
            set { this.Verification = value; }
        }
        
        /// <summary> 单位Logo Attribute </summary>
        public Byte[] _Logoimg
        {            
            get { return this.Logoimg; }
            set { this.Logoimg = value; }
        }
        
        /// <summary> Logo位置 Attribute </summary>
        public string _Logoposition
        {            
            get { return this.Logoposition; }
            set { this.Logoposition = value; }
        }
        
        /// <summary> Logo大小 Attribute </summary>
        public string _Logosize
        {            
            get { return this.Logosize; }
            set { this.Logosize = value; }
        }
        
        /// <summary> Logo类型 Attribute </summary>
        public string _Logotype
        {            
            get { return this.Logotype; }
            set { this.Logotype = value; }
        }
        #endregion
        #region 类字段清单2
        
        /// <summary> 密码，推荐使用 "_"符号开头 </summary>
        public string Password
        {
            get { return this.m_password; }
            set //
            {
                if (!password_initialized || m_password != value)
                {
                    this.m_password = value;
                }
                password_initialized = true;
            }
        }
        
        /// <summary> 版本，推荐使用 "_"符号开头 </summary>
        public string Version
        {
            get { return this.m_version; }
            set //
            {
                if (!version_initialized || m_version != value)
                {
                    this.m_version = value;
                }
                version_initialized = true;
            }
        }
        
        /// <summary> 登录模式，推荐使用 "_"符号开头 </summary>
        public int LoginMode
        {
            get { return this.m_loginmode; }
            set //
            {
                if (!loginmode_initialized || m_loginmode != value)
                {
                    this.m_loginmode = value;
                }
                loginmode_initialized = true;
            }
        }
        
        /// <summary> 验证模式，推荐使用 "_"符号开头 </summary>
        public int Verification
        {
            get { return this.m_verification; }
            set //
            {
                if (!verification_initialized || m_verification != value)
                {
                    this.m_verification = value;
                }
                verification_initialized = true;
            }
        }
        
        /// <summary> 单位Logo，推荐使用 "_"符号开头 </summary>
        public Byte[] Logoimg
        {
            get { return this.m_logoimg; }
            set //
            {
                if (!logoimg_initialized || m_logoimg != value)
                {
                    this.m_logoimg = value;
                }
                logoimg_initialized = true;
            }
        }
        
        /// <summary> Logo位置，推荐使用 "_"符号开头 </summary>
        public string Logoposition
        {
            get { return this.m_logoposition; }
            set //
            {
                if (!logoposition_initialized || m_logoposition != value)
                {
                    this.m_logoposition = value;
                }
                logoposition_initialized = true;
            }
        }
        
        /// <summary> Logo大小，推荐使用 "_"符号开头 </summary>
        public string Logosize
        {
            get { return this.m_logosize; }
            set //
            {
                if (!logosize_initialized || m_logosize != value)
                {
                    this.m_logosize = value;
                }
                logosize_initialized = true;
            }
        }
        
        /// <summary> Logo类型，推荐使用 "_"符号开头 </summary>
        public string Logotype
        {
            get { return this.m_logotype; }
            set //
            {
                if (!logotype_initialized || m_logotype != value)
                {
                    this.m_logotype = value;
                }
                logotype_initialized = true;
            }
        }    
        #endregion
        #region Attribute清单 辅助设计
        /// <summary>
        /// {列属性-结构属性}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>密码</summary>
            public static AttributeItem Password =  new AttributeItem("[RWXsysadmin].[Password]", typeof(string), 100);
            
            /// <summary>版本</summary>
            public static AttributeItem Version =  new AttributeItem("[RWXsysadmin].[Version]", typeof(string), 100);
            
            /// <summary>登录模式</summary>
            public static AttributeItem LoginMode =  new AttributeItem("[RWXsysadmin].[LoginMode]", typeof(int), 2147483647);
            
            /// <summary>验证模式</summary>
            public static AttributeItem Verification =  new AttributeItem("[RWXsysadmin].[Verification]", typeof(int), 2147483647);
            
            /// <summary>单位Logo</summary>
            public static AttributeItem Logoimg =  new AttributeItem("[RWXsysadmin].[Logoimg]", typeof(Byte[]), 16);
            
            /// <summary>Logo位置</summary>
            public static AttributeItem Logoposition =  new AttributeItem("[RWXsysadmin].[Logoposition]", typeof(string), 8000);
            
            /// <summary>Logo大小</summary>
            public static AttributeItem Logosize =  new AttributeItem("[RWXsysadmin].[Logosize]", typeof(string), 8000);
            
            /// <summary>Logo类型</summary>
            public static AttributeItem Logotype =  new AttributeItem("[RWXsysadmin].[Logotype]", typeof(string), 8000);
        }
        #endregion
        #region bool清单 辅助设计
        
        private string m_password;
        /// <summary></summary>
        protected bool password_initialized = false;
        
        private string m_version;
        /// <summary></summary>
        protected bool version_initialized = false;
        
        private int m_loginmode;
        /// <summary></summary>
        protected bool loginmode_initialized = false;
        
        private int m_verification;
        /// <summary></summary>
        protected bool verification_initialized = false;
        
        private Byte[] m_logoimg;
        /// <summary></summary>
        protected bool logoimg_initialized = false;
        
        private string m_logoposition;
        /// <summary></summary>
        protected bool logoposition_initialized = false;
        
        private string m_logosize;
        /// <summary></summary>
        protected bool logosize_initialized = false;
        
        private string m_logotype;
        /// <summary></summary>
        protected bool logotype_initialized = false;
        #endregion

        #endregion 类字段
        
		#region 获得与设置属性列与值，以及操作属性的部分方法

        /// <summary>
        /// 实体名 系统定制管理
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "RWXsysadmin";
        }
        
        /// <summary>
        /// 设置自动载入所有列
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.password_initialized = IsLoadAllAttributes;this.version_initialized = IsLoadAllAttributes;this.loginmode_initialized = IsLoadAllAttributes;this.verification_initialized = IsLoadAllAttributes;this.logoimg_initialized = IsLoadAllAttributes;this.logoposition_initialized = IsLoadAllAttributes;this.logosize_initialized = IsLoadAllAttributes;this.logotype_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			RWXsysadmin value = new RWXsysadmin();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"Password"))
				value.password_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Version"))
				value.version_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"LoginMode"))
				value.loginmode_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Verification"))
				value.verification_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Logoimg"))
				value.logoimg_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Logoposition"))
				value.logoposition_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Logosize"))
				value.logosize_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Logotype"))
				value.logotype_initialized = true;
            
			return value;
		}
        #endregion
        
        #region 实现ICloneable 成员
        /// <summary>系统定制管理</summary>
        public new RWXsysadmin Clone()
        {
            return (RWXsysadmin)this.MemberwiseClone(); //浅复制
        }
        #endregion
        
        #region 构造函数 获得实例
        /// <summary>系统定制管理 构造函数</summary>
        static RWXsysadmin()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>系统定制管理 构造函数</summary>
        public RWXsysadmin() { }
        /// <summary>
        /// 系统定制管理 是否载入所有属性
        /// </summary>
        /// <param name="IsLoadAllAttributes">是否全部初始化为true</param>
        public RWXsysadmin(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>系统定制管理 实现分表功能，修改表名</summary>
        //public RWXsysadmin(string tableName):base(tableName) { }
        /// <summary>系统定制管理 实现分表功能，自定义实例的初始化</summary>
        //public RWXsysadmin(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>系统定制管理 实现快捷功能</summary>
        //public RWXsysadmin(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>系统定制管理 请注意，这里当表中仅存在一个字段的时候，将可能与构造函数 new Table(string tableName)冲突</summary>
        public RWXsysadmin(string password, string version, int loginmode, int verification, Byte[] logoimg, string logoposition, string logosize, string logotype)
        {
            
            this.Password = password;
            
            this.Version = version;
            
            this.LoginMode = loginmode;
            
            this.Verification = verification;
            
            this.Logoimg = logoimg;
            
            this.Logoposition = logoposition;
            
            this.Logosize = logosize;
            
            this.Logotype = logotype;
        }
        /// <summary>系统定制管理 从视图（多表）内获取本表</summary>
        public static RWXsysadmin FromIView(IView view)
        {
            return (RWXsysadmin)IView.GetITable(view, "RWXsysadmin");
        }
        /// <summary>系统定制管理 获得一个实例</summary>
        public static RWXsysadmin GetOneInstance()
        {
            RWXsysadmin value = new RWXsysadmin();
            return value;
        }
        #endregion
		
        #region 2.2 新增的列属性操作方法

        /// <summary>通过属性 获得字段值</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "Password":
			        return Password;
			    			
			    case "Version":
			        return Version;
			    			
			    case "LoginMode":
			        return LoginMode;
			    			
			    case "Verification":
			        return Verification;
			    			
			    case "Logoimg":
			        return Logoimg;
			    			
			    case "Logoposition":
			        return Logoposition;
			    			
			    case "Logosize":
			        return Logosize;
			    			
			    case "Logotype":
			        return Logotype;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>通过属性 设置字段值</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "Password":
			        this.Password = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Version":
			        this.Version = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "LoginMode":
			        this.LoginMode = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "Verification":
			        this.Verification = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "Logoimg":
			        this.Logoimg = (byte[])(AttributeValue);
                    return true;
			    			
			    case "Logoposition":
			        this.Logoposition = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Logosize":
			        this.Logosize = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Logotype":
			        this.Logotype = Convert.ToString(AttributeValue);
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
				case "Password":
					return password_initialized;
				
				case "Version":
					return version_initialized;
				
				case "LoginMode":
					return loginmode_initialized;
				
				case "Verification":
					return verification_initialized;
				
				case "Logoimg":
					return logoimg_initialized;
				
				case "Logoposition":
					return logoposition_initialized;
				
				case "Logosize":
					return logosize_initialized;
				
				case "Logotype":
					return logotype_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>通过属性 设置属性的初始化布尔值</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "Password":
					password_initialized = ret;
					return true;
				
				case "Version":
					version_initialized = ret;
					return true;
				
				case "LoginMode":
					loginmode_initialized = ret;
					return true;
				
				case "Verification":
					verification_initialized = ret;
					return true;
				
				case "Logoimg":
					logoimg_initialized = ret;
					return true;
				
				case "Logoposition":
					logoposition_initialized = ret;
					return true;
				
				case "Logosize":
					logosize_initialized = ret;
					return true;
				
				case "Logotype":
					logotype_initialized = ret;
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

			
			if (password_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Password;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Password);
                }
			}
			
			if (version_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Version;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Version);
                }
			}
			
			if (loginmode_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.LoginMode;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(LoginMode);
                }
			}
			
			if (verification_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Verification;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Verification);
                }
			}
			
			if (logoimg_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Logoimg;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Logoimg);
                }
			}
			
			if (logoposition_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Logoposition;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Logoposition);
                }
			}
			
			if (logosize_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Logosize;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Logosize);
                }
			}
			
			if (logotype_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Logotype;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Logotype);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}