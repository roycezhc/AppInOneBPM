/************************************************************

  Copyright (c) 2008，ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:22
  Description:    数据表A8Sys_LoginUser_Online对应的业务逻辑层A8Sys_LoginUser_Online
  Version:         2.1.0.0
 
 * 对此文件的更改可能会导致不正确的行为，并且如果
     重新生成代码，这些更改将会丢失。您可以扩展该类
 * 实现自己的 A8Sys_LoginUser_Online_Entity:A8Sys_LoginUser_Online
 * 
************************************************************/
/************************************************************
SQL代码：
select _id,UserCode,FullName,Flag,CreateDate,ModifyDate,ETypeID,SysID,Lim,PassWord,IpAddr,IpMax,DID,SID,DTypeID,STypeID,EID,_TimeStamp,Version,Spell,AbbrName,Comment,OffSet,ConString,TimeFlag,UserSessionStr from A8Sys_LoginUser_Online
delete from A8Sys_LoginUser_Online
INSERT INTO A8Sys_LoginUser_Online (_id,UserCode,FullName,Flag,CreateDate,ModifyDate,ETypeID,SysID,Lim,PassWord,IpAddr,IpMax,DID,SID,DTypeID,STypeID,EID,_TimeStamp,Version,Spell,AbbrName,Comment,OffSet,ConString,TimeFlag,UserSessionStr)
     VALUES
           ('','','','','','','','','','','','','','','','','','','','','','','','','','')
UPDATE {首字母大写列名} SET ...
变量赋值代码：
        valObj._id = "";
        valObj.UserCode = "";
        valObj.FullName = "";
        valObj.Flag = "";
        valObj.CreateDate = "";
        valObj.ModifyDate = "";
        valObj.ETypeID = "";
        valObj.SysID = "";
        valObj.Lim = "";
        valObj.PassWord = "";
        valObj.IpAddr = "";
        valObj.IpMax = "";
        valObj.DID = "";
        valObj.SID = "";
        valObj.DTypeID = "";
        valObj.STypeID = "";
        valObj.EID = "";
        valObj._TimeStamp = "";
        valObj.Version = "";
        valObj.Spell = "";
        valObj.AbbrName = "";
        valObj.Comment = "";
        valObj.OffSet = "";
        valObj.ConString = "";
        valObj.TimeFlag = "";
        valObj.UserSessionStr = ""; 
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
    /// <para>登录在线用户</para>
    /// <para>与A8Sys_LoginUser_Online数据表对应的实体对象。</para>
    /// <para>增加一个数据列的方法是：在"类字段"节增加一个bool标识位，与"Attribute"属性 </para>
    /// </summary>    
    [Serializable]
    public class A8Sys_LoginUser_Online : ITableImplement
    {
        /// <summary>登录在线用户 工厂方法</summary>
        public static A8Sys_LoginUser_Online Factory()
        {
            return new A8Sys_LoginUser_Online();
        }
		#region 类字段清单 列属性用于生成视图层时的一致性检查
        #region 类字段清单1
        
        /// <summary> _id Attribute_IsNotNull_IDENTITY </summary>
        public Guid __id
        {            
            get { return this._id; }
            set { this._id = value; }
        }
        
        /// <summary> UserCode Attribute </summary>
        public string _UserCode
        {            
            get { return this.UserCode; }
            set { this.UserCode = value; }
        }
        
        /// <summary> FullName Attribute </summary>
        public string _FullName
        {            
            get { return this.FullName; }
            set { this.FullName = value; }
        }
        
        /// <summary> Flag Attribute </summary>
        public int _Flag
        {            
            get { return this.Flag; }
            set { this.Flag = value; }
        }
        
        /// <summary> CreateDate Attribute </summary>
        public DateTime _CreateDate
        {            
            get { return this.CreateDate; }
            set { this.CreateDate = value; }
        }
        
        /// <summary> ModifyDate Attribute </summary>
        public DateTime _ModifyDate
        {            
            get { return this.ModifyDate; }
            set { this.ModifyDate = value; }
        }
        
        /// <summary> ETypeID Attribute </summary>
        public string _ETypeID
        {            
            get { return this.ETypeID; }
            set { this.ETypeID = value; }
        }
        
        /// <summary> SysID Attribute_IsNotNull </summary>
        public int _SysID
        {            
            get { return this.SysID; }
            set { this.SysID = value; }
        }
        
        /// <summary> Lim Attribute_IsNotNull </summary>
        public string _Lim
        {            
            get { return this.Lim; }
            set { this.Lim = value; }
        }
        
        /// <summary> PassWord Attribute_IsNotNull </summary>
        public string _PassWord
        {            
            get { return this.PassWord; }
            set { this.PassWord = value; }
        }
        
        /// <summary> IpAddr Attribute_IsNotNull </summary>
        public string _IpAddr
        {            
            get { return this.IpAddr; }
            set { this.IpAddr = value; }
        }
        
        /// <summary> IpMax Attribute_IsNotNull </summary>
        public string _IpMax
        {            
            get { return this.IpMax; }
            set { this.IpMax = value; }
        }
        
        /// <summary> DID Attribute_IDENTITY </summary>
        public Guid _DID
        {            
            get { return this.DID; }
            set { this.DID = value; }
        }
        
        /// <summary> SID Attribute_IDENTITY </summary>
        public Guid _SID
        {            
            get { return this.SID; }
            set { this.SID = value; }
        }
        
        /// <summary> DTypeID Attribute </summary>
        public string _DTypeID
        {            
            get { return this.DTypeID; }
            set { this.DTypeID = value; }
        }
        
        /// <summary> STypeID Attribute </summary>
        public string _STypeID
        {            
            get { return this.STypeID; }
            set { this.STypeID = value; }
        }
        
        /// <summary> EID Attribute_IDENTITY </summary>
        public Guid _EID
        {            
            get { return this.EID; }
            set { this.EID = value; }
        }
        
        /// <summary> _TimeStamp Attribute </summary>
        public string __TimeStamp
        {            
            get { return this._TimeStamp; }
            set { this._TimeStamp = value; }
        }
        
        /// <summary> Version Attribute </summary>
        public int _Version
        {            
            get { return this.Version; }
            set { this.Version = value; }
        }
        
        /// <summary> Spell Attribute_IsNotNull </summary>
        public string _Spell
        {            
            get { return this.Spell; }
            set { this.Spell = value; }
        }
        
        /// <summary> AbbrName Attribute_IsNotNull </summary>
        public string _AbbrName
        {            
            get { return this.AbbrName; }
            set { this.AbbrName = value; }
        }
        
        /// <summary> Comment Attribute_IsNotNull </summary>
        public string _Comment
        {            
            get { return this.Comment; }
            set { this.Comment = value; }
        }
        
        /// <summary> OffSet Attribute_IsNotNull </summary>
        public string _OffSet
        {            
            get { return this.OffSet; }
            set { this.OffSet = value; }
        }
        
        /// <summary> ConString Attribute </summary>
        public string _ConString
        {            
            get { return this.ConString; }
            set { this.ConString = value; }
        }
        
        /// <summary> TimeFlag Attribute </summary>
        public DateTime _TimeFlag
        {            
            get { return this.TimeFlag; }
            set { this.TimeFlag = value; }
        }
        
        /// <summary> UserSessionStr Attribute </summary>
        public string _UserSessionStr
        {            
            get { return this.UserSessionStr; }
            set { this.UserSessionStr = value; }
        }
        #endregion
        #region 类字段清单2
        
        /// <summary> _id，推荐使用 "_"符号开头 </summary>
        public Guid _id
        {
            get { return this.m__id; }
            set //private 
            {
                if (!_id_initialized || m__id != value)
                {
                    this.m__id = value;
                }
                _id_initialized = true;
            }
        }
        
        /// <summary> UserCode，推荐使用 "_"符号开头 </summary>
        public string UserCode
        {
            get { return this.m_usercode; }
            set //
            {
                if (!usercode_initialized || m_usercode != value)
                {
                    this.m_usercode = value;
                }
                usercode_initialized = true;
            }
        }
        
        /// <summary> FullName，推荐使用 "_"符号开头 </summary>
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
        
        /// <summary> Flag，推荐使用 "_"符号开头 </summary>
        public int Flag
        {
            get { return this.m_flag; }
            set //
            {
                if (!flag_initialized || m_flag != value)
                {
                    this.m_flag = value;
                }
                flag_initialized = true;
            }
        }
        
        /// <summary> CreateDate，推荐使用 "_"符号开头 </summary>
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
        
        /// <summary> ModifyDate，推荐使用 "_"符号开头 </summary>
        public DateTime ModifyDate
        {
            get { return this.m_modifydate; }
            set //
            {
                if (!modifydate_initialized || m_modifydate != value)
                {
                    this.m_modifydate = value;
                }
                modifydate_initialized = true;
            }
        }
        
        /// <summary> ETypeID，推荐使用 "_"符号开头 </summary>
        public string ETypeID
        {
            get { return this.m_etypeid; }
            set //
            {
                if (!etypeid_initialized || m_etypeid != value)
                {
                    this.m_etypeid = value;
                }
                etypeid_initialized = true;
            }
        }
        
        /// <summary> SysID，推荐使用 "_"符号开头 </summary>
        public int SysID
        {
            get { return this.m_sysid; }
            set //
            {
                if (!sysid_initialized || m_sysid != value)
                {
                    this.m_sysid = value;
                }
                sysid_initialized = true;
            }
        }
        
        /// <summary> Lim，推荐使用 "_"符号开头 </summary>
        public string Lim
        {
            get { return this.m_lim; }
            set //
            {
                if (!lim_initialized || m_lim != value)
                {
                    this.m_lim = value;
                }
                lim_initialized = true;
            }
        }
        
        /// <summary> PassWord，推荐使用 "_"符号开头 </summary>
        public string PassWord
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
        
        /// <summary> IpAddr，推荐使用 "_"符号开头 </summary>
        public string IpAddr
        {
            get { return this.m_ipaddr; }
            set //
            {
                if (!ipaddr_initialized || m_ipaddr != value)
                {
                    this.m_ipaddr = value;
                }
                ipaddr_initialized = true;
            }
        }
        
        /// <summary> IpMax，推荐使用 "_"符号开头 </summary>
        public string IpMax
        {
            get { return this.m_ipmax; }
            set //
            {
                if (!ipmax_initialized || m_ipmax != value)
                {
                    this.m_ipmax = value;
                }
                ipmax_initialized = true;
            }
        }
        
        /// <summary> DID，推荐使用 "_"符号开头 </summary>
        public Guid DID
        {
            get { return this.m_did; }
            set //private 
            {
                if (!did_initialized || m_did != value)
                {
                    this.m_did = value;
                }
                did_initialized = true;
            }
        }
        
        /// <summary> SID，推荐使用 "_"符号开头 </summary>
        public Guid SID
        {
            get { return this.m_sid; }
            set //private 
            {
                if (!sid_initialized || m_sid != value)
                {
                    this.m_sid = value;
                }
                sid_initialized = true;
            }
        }
        
        /// <summary> DTypeID，推荐使用 "_"符号开头 </summary>
        public string DTypeID
        {
            get { return this.m_dtypeid; }
            set //
            {
                if (!dtypeid_initialized || m_dtypeid != value)
                {
                    this.m_dtypeid = value;
                }
                dtypeid_initialized = true;
            }
        }
        
        /// <summary> STypeID，推荐使用 "_"符号开头 </summary>
        public string STypeID
        {
            get { return this.m_stypeid; }
            set //
            {
                if (!stypeid_initialized || m_stypeid != value)
                {
                    this.m_stypeid = value;
                }
                stypeid_initialized = true;
            }
        }
        
        /// <summary> EID，推荐使用 "_"符号开头 </summary>
        public Guid EID
        {
            get { return this.m_eid; }
            set //private 
            {
                if (!eid_initialized || m_eid != value)
                {
                    this.m_eid = value;
                }
                eid_initialized = true;
            }
        }
        
        /// <summary> _TimeStamp，推荐使用 "_"符号开头 </summary>
        public string _TimeStamp
        {
            get { return this.m__timestamp; }
            set //
            {
                if (!_timestamp_initialized || m__timestamp != value)
                {
                    this.m__timestamp = value;
                }
                _timestamp_initialized = true;
            }
        }
        
        /// <summary> Version，推荐使用 "_"符号开头 </summary>
        public int Version
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
        
        /// <summary> Spell，推荐使用 "_"符号开头 </summary>
        public string Spell
        {
            get { return this.m_spell; }
            set //
            {
                if (!spell_initialized || m_spell != value)
                {
                    this.m_spell = value;
                }
                spell_initialized = true;
            }
        }
        
        /// <summary> AbbrName，推荐使用 "_"符号开头 </summary>
        public string AbbrName
        {
            get { return this.m_abbrname; }
            set //
            {
                if (!abbrname_initialized || m_abbrname != value)
                {
                    this.m_abbrname = value;
                }
                abbrname_initialized = true;
            }
        }
        
        /// <summary> Comment，推荐使用 "_"符号开头 </summary>
        public string Comment
        {
            get { return this.m_comment; }
            set //
            {
                if (!comment_initialized || m_comment != value)
                {
                    this.m_comment = value;
                }
                comment_initialized = true;
            }
        }
        
        /// <summary> OffSet，推荐使用 "_"符号开头 </summary>
        public string OffSet
        {
            get { return this.m_offset; }
            set //
            {
                if (!offset_initialized || m_offset != value)
                {
                    this.m_offset = value;
                }
                offset_initialized = true;
            }
        }
        
        /// <summary> ConString，推荐使用 "_"符号开头 </summary>
        public string ConString
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
        
        /// <summary> TimeFlag，推荐使用 "_"符号开头 </summary>
        public DateTime TimeFlag
        {
            get { return this.m_timeflag; }
            set //
            {
                if (!timeflag_initialized || m_timeflag != value)
                {
                    this.m_timeflag = value;
                }
                timeflag_initialized = true;
            }
        }
        
        /// <summary> UserSessionStr，推荐使用 "_"符号开头 </summary>
        public string UserSessionStr
        {
            get { return this.m_usersessionstr; }
            set //
            {
                if (!usersessionstr_initialized || m_usersessionstr != value)
                {
                    this.m_usersessionstr = value;
                }
                usersessionstr_initialized = true;
            }
        }    
        #endregion
        #region Attribute清单 辅助设计
        /// <summary>
        /// {列属性-结构属性}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>_id</summary>
            public static AttributeItem _id =  new AttributeItem("[A8Sys_LoginUser_Online].[_id]", typeof(Guid), 16);
            
            /// <summary>UserCode</summary>
            public static AttributeItem UserCode =  new AttributeItem("[A8Sys_LoginUser_Online].[UserCode]", typeof(string), 60);
            
            /// <summary>FullName</summary>
            public static AttributeItem FullName =  new AttributeItem("[A8Sys_LoginUser_Online].[FullName]", typeof(string), 100);
            
            /// <summary>Flag</summary>
            public static AttributeItem Flag =  new AttributeItem("[A8Sys_LoginUser_Online].[Flag]", typeof(int), 2147483647);
            
            /// <summary>CreateDate</summary>
            public static AttributeItem CreateDate =  new AttributeItem("[A8Sys_LoginUser_Online].[CreateDate]", typeof(DateTime), 100);
            
            /// <summary>ModifyDate</summary>
            public static AttributeItem ModifyDate =  new AttributeItem("[A8Sys_LoginUser_Online].[ModifyDate]", typeof(DateTime), 100);
            
            /// <summary>ETypeID</summary>
            public static AttributeItem ETypeID =  new AttributeItem("[A8Sys_LoginUser_Online].[ETypeID]", typeof(string), 100);
            
            /// <summary>SysID</summary>
            public static AttributeItem SysID =  new AttributeItem("[A8Sys_LoginUser_Online].[SysID]", typeof(int), 2147483647);
            
            /// <summary>Lim</summary>
            public static AttributeItem Lim =  new AttributeItem("[A8Sys_LoginUser_Online].[Lim]", typeof(string), 200);
            
            /// <summary>PassWord</summary>
            public static AttributeItem PassWord =  new AttributeItem("[A8Sys_LoginUser_Online].[PassWord]", typeof(string), 255);
            
            /// <summary>IpAddr</summary>
            public static AttributeItem IpAddr =  new AttributeItem("[A8Sys_LoginUser_Online].[IpAddr]", typeof(string), 60);
            
            /// <summary>IpMax</summary>
            public static AttributeItem IpMax =  new AttributeItem("[A8Sys_LoginUser_Online].[IpMax]", typeof(string), 60);
            
            /// <summary>DID</summary>
            public static AttributeItem DID =  new AttributeItem("[A8Sys_LoginUser_Online].[DID]", typeof(Guid), 16);
            
            /// <summary>SID</summary>
            public static AttributeItem SID =  new AttributeItem("[A8Sys_LoginUser_Online].[SID]", typeof(Guid), 16);
            
            /// <summary>DTypeID</summary>
            public static AttributeItem DTypeID =  new AttributeItem("[A8Sys_LoginUser_Online].[DTypeID]", typeof(string), 100);
            
            /// <summary>STypeID</summary>
            public static AttributeItem STypeID =  new AttributeItem("[A8Sys_LoginUser_Online].[STypeID]", typeof(string), 100);
            
            /// <summary>EID</summary>
            public static AttributeItem EID =  new AttributeItem("[A8Sys_LoginUser_Online].[EID]", typeof(Guid), 16);
            
            /// <summary>_TimeStamp</summary>
            public static AttributeItem _TimeStamp =  new AttributeItem("[A8Sys_LoginUser_Online].[_TimeStamp]", typeof(string), 60);
            
            /// <summary>Version</summary>
            public static AttributeItem Version =  new AttributeItem("[A8Sys_LoginUser_Online].[Version]", typeof(int), 2147483647);
            
            /// <summary>Spell</summary>
            public static AttributeItem Spell =  new AttributeItem("[A8Sys_LoginUser_Online].[Spell]", typeof(string), 60);
            
            /// <summary>AbbrName</summary>
            public static AttributeItem AbbrName =  new AttributeItem("[A8Sys_LoginUser_Online].[AbbrName]", typeof(string), 60);
            
            /// <summary>Comment</summary>
            public static AttributeItem Comment =  new AttributeItem("[A8Sys_LoginUser_Online].[Comment]", typeof(string), 400);
            
            /// <summary>OffSet</summary>
            public static AttributeItem OffSet =  new AttributeItem("[A8Sys_LoginUser_Online].[OffSet]", typeof(string), 255);
            
            /// <summary>ConString</summary>
            public static AttributeItem ConString =  new AttributeItem("[A8Sys_LoginUser_Online].[ConString]", typeof(string), 600);
            
            /// <summary>TimeFlag</summary>
            public static AttributeItem TimeFlag =  new AttributeItem("[A8Sys_LoginUser_Online].[TimeFlag]", typeof(DateTime), 100);
            
            /// <summary>UserSessionStr</summary>
            public static AttributeItem UserSessionStr =  new AttributeItem("[A8Sys_LoginUser_Online].[UserSessionStr]", typeof(string), 100);
        }
        #endregion
        #region bool清单 辅助设计
        
        private Guid m__id;
        /// <summary></summary>
        protected bool _id_initialized = false;
        
        private string m_usercode;
        /// <summary></summary>
        protected bool usercode_initialized = false;
        
        private string m_fullname;
        /// <summary></summary>
        protected bool fullname_initialized = false;
        
        private int m_flag;
        /// <summary></summary>
        protected bool flag_initialized = false;
        
        private DateTime m_createdate;
        /// <summary></summary>
        protected bool createdate_initialized = false;
        
        private DateTime m_modifydate;
        /// <summary></summary>
        protected bool modifydate_initialized = false;
        
        private string m_etypeid;
        /// <summary></summary>
        protected bool etypeid_initialized = false;
        
        private int m_sysid;
        /// <summary></summary>
        protected bool sysid_initialized = false;
        
        private string m_lim;
        /// <summary></summary>
        protected bool lim_initialized = false;
        
        private string m_password;
        /// <summary></summary>
        protected bool password_initialized = false;
        
        private string m_ipaddr;
        /// <summary></summary>
        protected bool ipaddr_initialized = false;
        
        private string m_ipmax;
        /// <summary></summary>
        protected bool ipmax_initialized = false;
        
        private Guid m_did;
        /// <summary></summary>
        protected bool did_initialized = false;
        
        private Guid m_sid;
        /// <summary></summary>
        protected bool sid_initialized = false;
        
        private string m_dtypeid;
        /// <summary></summary>
        protected bool dtypeid_initialized = false;
        
        private string m_stypeid;
        /// <summary></summary>
        protected bool stypeid_initialized = false;
        
        private Guid m_eid;
        /// <summary></summary>
        protected bool eid_initialized = false;
        
        private string m__timestamp;
        /// <summary></summary>
        protected bool _timestamp_initialized = false;
        
        private int m_version;
        /// <summary></summary>
        protected bool version_initialized = false;
        
        private string m_spell;
        /// <summary></summary>
        protected bool spell_initialized = false;
        
        private string m_abbrname;
        /// <summary></summary>
        protected bool abbrname_initialized = false;
        
        private string m_comment;
        /// <summary></summary>
        protected bool comment_initialized = false;
        
        private string m_offset;
        /// <summary></summary>
        protected bool offset_initialized = false;
        
        private string m_constring;
        /// <summary></summary>
        protected bool constring_initialized = false;
        
        private DateTime m_timeflag;
        /// <summary></summary>
        protected bool timeflag_initialized = false;
        
        private string m_usersessionstr;
        /// <summary></summary>
        protected bool usersessionstr_initialized = false;
        #endregion

        #endregion 类字段
        
		#region 获得与设置属性列与值，以及操作属性的部分方法

        /// <summary>
        /// 实体名 登录在线用户
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "A8Sys_LoginUser_Online";
        }
        
        /// <summary>
        /// 设置自动载入所有列
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this._id_initialized = IsLoadAllAttributes;this.usercode_initialized = IsLoadAllAttributes;this.fullname_initialized = IsLoadAllAttributes;this.flag_initialized = IsLoadAllAttributes;this.createdate_initialized = IsLoadAllAttributes;this.modifydate_initialized = IsLoadAllAttributes;this.etypeid_initialized = IsLoadAllAttributes;this.sysid_initialized = IsLoadAllAttributes;this.lim_initialized = IsLoadAllAttributes;this.password_initialized = IsLoadAllAttributes;this.ipaddr_initialized = IsLoadAllAttributes;this.ipmax_initialized = IsLoadAllAttributes;this.did_initialized = IsLoadAllAttributes;this.sid_initialized = IsLoadAllAttributes;this.dtypeid_initialized = IsLoadAllAttributes;this.stypeid_initialized = IsLoadAllAttributes;this.eid_initialized = IsLoadAllAttributes;this._timestamp_initialized = IsLoadAllAttributes;this.version_initialized = IsLoadAllAttributes;this.spell_initialized = IsLoadAllAttributes;this.abbrname_initialized = IsLoadAllAttributes;this.comment_initialized = IsLoadAllAttributes;this.offset_initialized = IsLoadAllAttributes;this.constring_initialized = IsLoadAllAttributes;this.timeflag_initialized = IsLoadAllAttributes;this.usersessionstr_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			A8Sys_LoginUser_Online value = new A8Sys_LoginUser_Online();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"_id"))
				value._id_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"UserCode"))
				value.usercode_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FullName"))
				value.fullname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Flag"))
				value.flag_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"CreateDate"))
				value.createdate_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ModifyDate"))
				value.modifydate_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ETypeID"))
				value.etypeid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SysID"))
				value.sysid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Lim"))
				value.lim_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"PassWord"))
				value.password_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IpAddr"))
				value.ipaddr_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IpMax"))
				value.ipmax_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DID"))
				value.did_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SID"))
				value.sid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DTypeID"))
				value.dtypeid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"STypeID"))
				value.stypeid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"EID"))
				value.eid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"_TimeStamp"))
				value._timestamp_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Version"))
				value.version_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Spell"))
				value.spell_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"AbbrName"))
				value.abbrname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Comment"))
				value.comment_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"OffSet"))
				value.offset_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ConString"))
				value.constring_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"TimeFlag"))
				value.timeflag_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"UserSessionStr"))
				value.usersessionstr_initialized = true;
            
			return value;
		}
        #endregion
        
        #region 实现ICloneable 成员
        /// <summary>登录在线用户</summary>
        public new A8Sys_LoginUser_Online Clone()
        {
            return (A8Sys_LoginUser_Online)this.MemberwiseClone(); //浅复制
        }
        #endregion
        
        #region 构造函数 获得实例
        /// <summary>登录在线用户 构造函数</summary>
        static A8Sys_LoginUser_Online()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>登录在线用户 构造函数</summary>
        public A8Sys_LoginUser_Online() { }
        /// <summary>
        /// 登录在线用户 是否载入所有属性
        /// </summary>
        /// <param name="IsLoadAllAttributes">是否全部初始化为true</param>
        public A8Sys_LoginUser_Online(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>登录在线用户 实现分表功能，修改表名</summary>
        //public A8Sys_LoginUser_Online(string tableName):base(tableName) { }
        /// <summary>登录在线用户 实现分表功能，自定义实例的初始化</summary>
        //public A8Sys_LoginUser_Online(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>登录在线用户 实现快捷功能</summary>
        //public A8Sys_LoginUser_Online(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>登录在线用户 请注意，这里当表中仅存在一个字段的时候，将可能与构造函数 new Table(string tableName)冲突</summary>
        public A8Sys_LoginUser_Online(Guid _id, string usercode, string fullname, int flag, DateTime createdate, DateTime modifydate, string etypeid, int sysid, string lim, string password, string ipaddr, string ipmax, Guid did, Guid sid, string dtypeid, string stypeid, Guid eid, string _timestamp, int version, string spell, string abbrname, string comment, string offset, string constring, DateTime timeflag, string usersessionstr)
        {
            
            this._id = _id;
            
            this.UserCode = usercode;
            
            this.FullName = fullname;
            
            this.Flag = flag;
            
            this.CreateDate = createdate;
            
            this.ModifyDate = modifydate;
            
            this.ETypeID = etypeid;
            
            this.SysID = sysid;
            
            this.Lim = lim;
            
            this.PassWord = password;
            
            this.IpAddr = ipaddr;
            
            this.IpMax = ipmax;
            
            this.DID = did;
            
            this.SID = sid;
            
            this.DTypeID = dtypeid;
            
            this.STypeID = stypeid;
            
            this.EID = eid;
            
            this._TimeStamp = _timestamp;
            
            this.Version = version;
            
            this.Spell = spell;
            
            this.AbbrName = abbrname;
            
            this.Comment = comment;
            
            this.OffSet = offset;
            
            this.ConString = constring;
            
            this.TimeFlag = timeflag;
            
            this.UserSessionStr = usersessionstr;
        }
        /// <summary>登录在线用户 从视图（多表）内获取本表</summary>
        public static A8Sys_LoginUser_Online FromIView(IView view)
        {
            return (A8Sys_LoginUser_Online)IView.GetITable(view, "A8Sys_LoginUser_Online");
        }
        /// <summary>登录在线用户 获得一个实例</summary>
        public static A8Sys_LoginUser_Online GetOneInstance()
        {
            A8Sys_LoginUser_Online value = new A8Sys_LoginUser_Online();
            return value;
        }
        #endregion
		
        #region 2.2 新增的列属性操作方法

        /// <summary>通过属性 获得字段值</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "_id":
			        return _id;
			    			
			    case "UserCode":
			        return UserCode;
			    			
			    case "FullName":
			        return FullName;
			    			
			    case "Flag":
			        return Flag;
			    			
			    case "CreateDate":
			        return CreateDate;
			    			
			    case "ModifyDate":
			        return ModifyDate;
			    			
			    case "ETypeID":
			        return ETypeID;
			    			
			    case "SysID":
			        return SysID;
			    			
			    case "Lim":
			        return Lim;
			    			
			    case "PassWord":
			        return PassWord;
			    			
			    case "IpAddr":
			        return IpAddr;
			    			
			    case "IpMax":
			        return IpMax;
			    			
			    case "DID":
			        return DID;
			    			
			    case "SID":
			        return SID;
			    			
			    case "DTypeID":
			        return DTypeID;
			    			
			    case "STypeID":
			        return STypeID;
			    			
			    case "EID":
			        return EID;
			    			
			    case "_TimeStamp":
			        return _TimeStamp;
			    			
			    case "Version":
			        return Version;
			    			
			    case "Spell":
			        return Spell;
			    			
			    case "AbbrName":
			        return AbbrName;
			    			
			    case "Comment":
			        return Comment;
			    			
			    case "OffSet":
			        return OffSet;
			    			
			    case "ConString":
			        return ConString;
			    			
			    case "TimeFlag":
			        return TimeFlag;
			    			
			    case "UserSessionStr":
			        return UserSessionStr;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>通过属性 设置字段值</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "_id":
			        this._id = (Guid)(AttributeValue);
                    return true;
			    			
			    case "UserCode":
			        this.UserCode = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FullName":
			        this.FullName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Flag":
			        this.Flag = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "CreateDate":
			        this.CreateDate = Convert.ToDateTime(AttributeValue);
                    return true;
			    			
			    case "ModifyDate":
			        this.ModifyDate = Convert.ToDateTime(AttributeValue);
                    return true;
			    			
			    case "ETypeID":
			        this.ETypeID = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SysID":
			        this.SysID = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "Lim":
			        this.Lim = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "PassWord":
			        this.PassWord = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IpAddr":
			        this.IpAddr = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IpMax":
			        this.IpMax = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "DID":
			        this.DID = (Guid)(AttributeValue);
                    return true;
			    			
			    case "SID":
			        this.SID = (Guid)(AttributeValue);
                    return true;
			    			
			    case "DTypeID":
			        this.DTypeID = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "STypeID":
			        this.STypeID = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "EID":
			        this.EID = (Guid)(AttributeValue);
                    return true;
			    			
			    case "_TimeStamp":
			        this._TimeStamp = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Version":
			        this.Version = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "Spell":
			        this.Spell = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "AbbrName":
			        this.AbbrName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Comment":
			        this.Comment = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "OffSet":
			        this.OffSet = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "ConString":
			        this.ConString = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "TimeFlag":
			        this.TimeFlag = Convert.ToDateTime(AttributeValue);
                    return true;
			    			
			    case "UserSessionStr":
			        this.UserSessionStr = Convert.ToString(AttributeValue);
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
				case "_id":
					return _id_initialized;
				
				case "UserCode":
					return usercode_initialized;
				
				case "FullName":
					return fullname_initialized;
				
				case "Flag":
					return flag_initialized;
				
				case "CreateDate":
					return createdate_initialized;
				
				case "ModifyDate":
					return modifydate_initialized;
				
				case "ETypeID":
					return etypeid_initialized;
				
				case "SysID":
					return sysid_initialized;
				
				case "Lim":
					return lim_initialized;
				
				case "PassWord":
					return password_initialized;
				
				case "IpAddr":
					return ipaddr_initialized;
				
				case "IpMax":
					return ipmax_initialized;
				
				case "DID":
					return did_initialized;
				
				case "SID":
					return sid_initialized;
				
				case "DTypeID":
					return dtypeid_initialized;
				
				case "STypeID":
					return stypeid_initialized;
				
				case "EID":
					return eid_initialized;
				
				case "_TimeStamp":
					return _timestamp_initialized;
				
				case "Version":
					return version_initialized;
				
				case "Spell":
					return spell_initialized;
				
				case "AbbrName":
					return abbrname_initialized;
				
				case "Comment":
					return comment_initialized;
				
				case "OffSet":
					return offset_initialized;
				
				case "ConString":
					return constring_initialized;
				
				case "TimeFlag":
					return timeflag_initialized;
				
				case "UserSessionStr":
					return usersessionstr_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>通过属性 设置属性的初始化布尔值</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "_id":
					_id_initialized = ret;
					return true;
				
				case "UserCode":
					usercode_initialized = ret;
					return true;
				
				case "FullName":
					fullname_initialized = ret;
					return true;
				
				case "Flag":
					flag_initialized = ret;
					return true;
				
				case "CreateDate":
					createdate_initialized = ret;
					return true;
				
				case "ModifyDate":
					modifydate_initialized = ret;
					return true;
				
				case "ETypeID":
					etypeid_initialized = ret;
					return true;
				
				case "SysID":
					sysid_initialized = ret;
					return true;
				
				case "Lim":
					lim_initialized = ret;
					return true;
				
				case "PassWord":
					password_initialized = ret;
					return true;
				
				case "IpAddr":
					ipaddr_initialized = ret;
					return true;
				
				case "IpMax":
					ipmax_initialized = ret;
					return true;
				
				case "DID":
					did_initialized = ret;
					return true;
				
				case "SID":
					sid_initialized = ret;
					return true;
				
				case "DTypeID":
					dtypeid_initialized = ret;
					return true;
				
				case "STypeID":
					stypeid_initialized = ret;
					return true;
				
				case "EID":
					eid_initialized = ret;
					return true;
				
				case "_TimeStamp":
					_timestamp_initialized = ret;
					return true;
				
				case "Version":
					version_initialized = ret;
					return true;
				
				case "Spell":
					spell_initialized = ret;
					return true;
				
				case "AbbrName":
					abbrname_initialized = ret;
					return true;
				
				case "Comment":
					comment_initialized = ret;
					return true;
				
				case "OffSet":
					offset_initialized = ret;
					return true;
				
				case "ConString":
					constring_initialized = ret;
					return true;
				
				case "TimeFlag":
					timeflag_initialized = ret;
					return true;
				
				case "UserSessionStr":
					usersessionstr_initialized = ret;
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

			
			if (_id_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute._id;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(_id);
                }
			}
			
			if (usercode_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.UserCode;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(UserCode);
                }
			}
			
			if (fullname_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.FullName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FullName);
                }
			}
			
			if (flag_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.Flag;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Flag);
                }
			}
			
			if (createdate_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.CreateDate;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(CreateDate);
                }
			}
			
			if (modifydate_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.ModifyDate;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ModifyDate);
                }
			}
			
			if (etypeid_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.ETypeID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ETypeID);
                }
			}
			
			if (sysid_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.SysID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SysID);
                }
			}
			
			if (lim_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.Lim;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Lim);
                }
			}
			
			if (password_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.PassWord;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(PassWord);
                }
			}
			
			if (ipaddr_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.IpAddr;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IpAddr);
                }
			}
			
			if (ipmax_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.IpMax;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IpMax);
                }
			}
			
			if (did_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.DID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DID);
                }
			}
			
			if (sid_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.SID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SID);
                }
			}
			
			if (dtypeid_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.DTypeID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DTypeID);
                }
			}
			
			if (stypeid_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.STypeID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(STypeID);
                }
			}
			
			if (eid_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.EID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(EID);
                }
			}
			
			if (_timestamp_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute._TimeStamp;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(_TimeStamp);
                }
			}
			
			if (version_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.Version;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Version);
                }
			}
			
			if (spell_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.Spell;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Spell);
                }
			}
			
			if (abbrname_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.AbbrName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(AbbrName);
                }
			}
			
			if (comment_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.Comment;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Comment);
                }
			}
			
			if (offset_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.OffSet;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(OffSet);
                }
			}
			
			if (constring_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.ConString;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ConString);
                }
			}
			
			if (timeflag_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.TimeFlag;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(TimeFlag);
                }
			}
			
			if (usersessionstr_initialized)
			{
                AttributeItem attr = A8Sys_LoginUser_Online.Attribute.UserSessionStr;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(UserSessionStr);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}