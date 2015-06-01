/************************************************************

  Copyright (c) 2008，ybkj_zlg
  Author:               Created Time: 2014/4/30 10:46:38
  Description:    数据表Ec_DescClass对应的业务逻辑层Ec_DescClass
  Version:         2.1.0.0
 
 * 对此文件的更改可能会导致不正确的行为，并且如果
     重新生成代码，这些更改将会丢失。您可以扩展该类
 * 实现自己的 Ec_DescClass_Entity:Ec_DescClass
 * 
************************************************************/
/************************************************************
SQL代码：
select DescClassID,TbName,FieldName,Inner,FindField,IsEnable,CtrlTypeDic,Block,IDENTITY,IsReadOnly,IsToolTip,IsVisable,IsQuickSearch,IsAdvSearch,IsTab,SourceField,OutSource_ChaZhao,OutSource_ExtField,OutSource_MingXi,OutSource_Tree,OutSource_Many2Many from Ec_DescClass
delete from Ec_DescClass
INSERT INTO Ec_DescClass (DescClassID,TbName,FieldName,Inner,FindField,IsEnable,CtrlTypeDic,Block,IDENTITY,IsReadOnly,IsToolTip,IsVisable,IsQuickSearch,IsAdvSearch,IsTab,SourceField,OutSource_ChaZhao,OutSource_ExtField,OutSource_MingXi,OutSource_Tree,OutSource_Many2Many)
     VALUES
           ('','','','','','','','','','','','','','','','','','','','','')
UPDATE Ec_DescClass SET ...
变量赋值代码：
        valObj.DescClassID = "";
        valObj.TbName = "";
        valObj.FieldName = "";
        valObj.Inner = "";
        valObj.FindField = "";
        valObj.IsEnable = "";
        valObj.CtrlTypeDic = "";
        valObj.Block = "";
        valObj.IDENTITY = "";
        valObj.IsReadOnly = "";
        valObj.IsToolTip = "";
        valObj.IsVisable = "";
        valObj.IsQuickSearch = "";
        valObj.IsAdvSearch = "";
        valObj.IsTab = "";
        valObj.SourceField = "";
        valObj.OutSource_ChaZhao = "";
        valObj.OutSource_ExtField = "";
        valObj.OutSource_MingXi = "";
        valObj.OutSource_Tree = "";
        valObj.OutSource_Many2Many = ""; 
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
    /// <para>注释:[IDField-{DescClassID:0}][NameField-{TableName:0}][IsTab-{SYS:系统模块}]</para>
    /// <para>与Ec_DescClass数据表对应的实体对象。</para>
    /// <para>增加一个数据列的方法是：在"类字段"节增加一个bool标识位，与"Attribute"属性 </para>
    /// </summary>    
    [Serializable]
    public class Ec_DescClass : ITableImplement
    {
        /// <summary>工厂方法  </summary>
        public static Ec_DescClass Factory()
        {
            return new Ec_DescClass();
        }
		#region 类字段清单 列属性用于生成视图层时的一致性检查
        #region 类字段清单1
        
        /// <summary> [CtrlTypeDic-{InputString}] Attribute </summary>
        public decimal _DescClassID
        {            
            get { return this.DescClassID; }
            set { this.DescClassID = value; }
        }
        
        /// <summary> 表名:[CtrlTypeDic-{InputString}] Attribute </summary>
        public string _TbName
        {            
            get { return this.TbName; }
            set { this.TbName = value; }
        }
        
        /// <summary> 字段名:[CtrlTypeDic-{InputString}] Attribute_IsNotNull </summary>
        public string _FieldName
        {            
            get { return this.FieldName; }
            set { this.FieldName = value; }
        }
        
        /// <summary> 内部表:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _Inner
        {            
            get { return this.Inner; }
            set { this.Inner = value; }
        }
        
        /// <summary> 查找字段:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _FindField
        {            
            get { return this.FindField; }
            set { this.FindField = value; }
        }
        
        /// <summary> 是否启用:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _IsEnable
        {            
            get { return this.IsEnable; }
            set { this.IsEnable = value; }
        }
        
        /// <summary> 控件类型:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _CtrlTypeDic
        {            
            get { return this.CtrlTypeDic; }
            set { this.CtrlTypeDic = value; }
        }
        
        /// <summary> 布局类型:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _Block
        {            
            get { return this.Block; }
            set { this.Block = value; }
        }
        
        /// <summary> 是否自增:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _IDENTITY
        {            
            get { return this.IDENTITY; }
            set { this.IDENTITY = value; }
        }
        
        /// <summary> 是否只读:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _IsReadOnly
        {            
            get { return this.IsReadOnly; }
            set { this.IsReadOnly = value; }
        }
        
        /// <summary> 提醒:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _IsToolTip
        {            
            get { return this.IsToolTip; }
            set { this.IsToolTip = value; }
        }
        
        /// <summary> 是否可见:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _IsVisable
        {            
            get { return this.IsVisable; }
            set { this.IsVisable = value; }
        }
        
        /// <summary> 是否快速查询字段:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _IsQuickSearch
        {            
            get { return this.IsQuickSearch; }
            set { this.IsQuickSearch = value; }
        }
        
        /// <summary> 是否高级查询字段:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _IsAdvSearch
        {            
            get { return this.IsAdvSearch; }
            set { this.IsAdvSearch = value; }
        }
        
        /// <summary> 是否模块:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _IsTab
        {            
            get { return this.IsTab; }
            set { this.IsTab = value; }
        }
        
        /// <summary> 源字段:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _SourceField
        {            
            get { return this.SourceField; }
            set { this.SourceField = value; }
        }
        
        /// <summary> 查找字段:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _OutSource_ChaZhao
        {            
            get { return this.OutSource_ChaZhao; }
            set { this.OutSource_ChaZhao = value; }
        }
        
        /// <summary> 查找字段-扩展信息:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _OutSource_ExtField
        {            
            get { return this.OutSource_ExtField; }
            set { this.OutSource_ExtField = value; }
        }
        
        /// <summary> 查找字段-明细:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _OutSource_MingXi
        {            
            get { return this.OutSource_MingXi; }
            set { this.OutSource_MingXi = value; }
        }
        
        /// <summary> 查找字段-树结构:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _OutSource_Tree
        {            
            get { return this.OutSource_Tree; }
            set { this.OutSource_Tree = value; }
        }
        
        /// <summary> 查找字段-多对多:[CtrlTypeDic-{Text}] Attribute_IsNotNull </summary>
        public string _OutSource_Many2Many
        {            
            get { return this.OutSource_Many2Many; }
            set { this.OutSource_Many2Many = value; }
        }
        #endregion
        #region 类字段清单2
        
        /// <summary> [CtrlTypeDic-{InputString}]，推荐使用 "_"符号开头 </summary>
        public decimal DescClassID
        {
            get { return this.m_descclassid; }
            set //
            {
                if (!descclassid_initialized || m_descclassid != value)
                {
                    this.m_descclassid = value;
                }
                descclassid_initialized = true;
            }
        }
        
        /// <summary> 表名:[CtrlTypeDic-{InputString}]，推荐使用 "_"符号开头 </summary>
        public string TbName
        {
            get { return this.m_tbname; }
            set //
            {
                if (!tbname_initialized || m_tbname != value)
                {
                    this.m_tbname = value;
                }
                tbname_initialized = true;
            }
        }
        
        /// <summary> 字段名:[CtrlTypeDic-{InputString}]，推荐使用 "_"符号开头 </summary>
        public string FieldName
        {
            get { return this.m_fieldname; }
            set //
            {
                if (!fieldname_initialized || m_fieldname != value)
                {
                    this.m_fieldname = value;
                }
                fieldname_initialized = true;
            }
        }
        
        /// <summary> 内部表:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string Inner
        {
            get { return this.m_inner; }
            set //
            {
                if (!inner_initialized || m_inner != value)
                {
                    this.m_inner = value;
                }
                inner_initialized = true;
            }
        }
        
        /// <summary> 查找字段:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string FindField
        {
            get { return this.m_findfield; }
            set //
            {
                if (!findfield_initialized || m_findfield != value)
                {
                    this.m_findfield = value;
                }
                findfield_initialized = true;
            }
        }
        
        /// <summary> 是否启用:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string IsEnable
        {
            get { return this.m_isenable; }
            set //
            {
                if (!isenable_initialized || m_isenable != value)
                {
                    this.m_isenable = value;
                }
                isenable_initialized = true;
            }
        }
        
        /// <summary> 控件类型:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string CtrlTypeDic
        {
            get { return this.m_ctrltypedic; }
            set //
            {
                if (!ctrltypedic_initialized || m_ctrltypedic != value)
                {
                    this.m_ctrltypedic = value;
                }
                ctrltypedic_initialized = true;
            }
        }
        
        /// <summary> 布局类型:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string Block
        {
            get { return this.m_block; }
            set //
            {
                if (!block_initialized || m_block != value)
                {
                    this.m_block = value;
                }
                block_initialized = true;
            }
        }
        
        /// <summary> 是否自增:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string IDENTITY
        {
            get { return this.m_identity; }
            set //
            {
                if (!identity_initialized || m_identity != value)
                {
                    this.m_identity = value;
                }
                identity_initialized = true;
            }
        }
        
        /// <summary> 是否只读:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string IsReadOnly
        {
            get { return this.m_isreadonly; }
            set //
            {
                if (!isreadonly_initialized || m_isreadonly != value)
                {
                    this.m_isreadonly = value;
                }
                isreadonly_initialized = true;
            }
        }
        
        /// <summary> 提醒:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string IsToolTip
        {
            get { return this.m_istooltip; }
            set //
            {
                if (!istooltip_initialized || m_istooltip != value)
                {
                    this.m_istooltip = value;
                }
                istooltip_initialized = true;
            }
        }
        
        /// <summary> 是否可见:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string IsVisable
        {
            get { return this.m_isvisable; }
            set //
            {
                if (!isvisable_initialized || m_isvisable != value)
                {
                    this.m_isvisable = value;
                }
                isvisable_initialized = true;
            }
        }
        
        /// <summary> 是否快速查询字段:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string IsQuickSearch
        {
            get { return this.m_isquicksearch; }
            set //
            {
                if (!isquicksearch_initialized || m_isquicksearch != value)
                {
                    this.m_isquicksearch = value;
                }
                isquicksearch_initialized = true;
            }
        }
        
        /// <summary> 是否高级查询字段:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string IsAdvSearch
        {
            get { return this.m_isadvsearch; }
            set //
            {
                if (!isadvsearch_initialized || m_isadvsearch != value)
                {
                    this.m_isadvsearch = value;
                }
                isadvsearch_initialized = true;
            }
        }
        
        /// <summary> 是否模块:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string IsTab
        {
            get { return this.m_istab; }
            set //
            {
                if (!istab_initialized || m_istab != value)
                {
                    this.m_istab = value;
                }
                istab_initialized = true;
            }
        }
        
        /// <summary> 源字段:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string SourceField
        {
            get { return this.m_sourcefield; }
            set //
            {
                if (!sourcefield_initialized || m_sourcefield != value)
                {
                    this.m_sourcefield = value;
                }
                sourcefield_initialized = true;
            }
        }
        
        /// <summary> 查找字段:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string OutSource_ChaZhao
        {
            get { return this.m_outsource_chazhao; }
            set //
            {
                if (!outsource_chazhao_initialized || m_outsource_chazhao != value)
                {
                    this.m_outsource_chazhao = value;
                }
                outsource_chazhao_initialized = true;
            }
        }
        
        /// <summary> 查找字段-扩展信息:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string OutSource_ExtField
        {
            get { return this.m_outsource_extfield; }
            set //
            {
                if (!outsource_extfield_initialized || m_outsource_extfield != value)
                {
                    this.m_outsource_extfield = value;
                }
                outsource_extfield_initialized = true;
            }
        }
        
        /// <summary> 查找字段-明细:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string OutSource_MingXi
        {
            get { return this.m_outsource_mingxi; }
            set //
            {
                if (!outsource_mingxi_initialized || m_outsource_mingxi != value)
                {
                    this.m_outsource_mingxi = value;
                }
                outsource_mingxi_initialized = true;
            }
        }
        
        /// <summary> 查找字段-树结构:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string OutSource_Tree
        {
            get { return this.m_outsource_tree; }
            set //
            {
                if (!outsource_tree_initialized || m_outsource_tree != value)
                {
                    this.m_outsource_tree = value;
                }
                outsource_tree_initialized = true;
            }
        }
        
        /// <summary> 查找字段-多对多:[CtrlTypeDic-{Text}]，推荐使用 "_"符号开头 </summary>
        public string OutSource_Many2Many
        {
            get { return this.m_outsource_many2many; }
            set //
            {
                if (!outsource_many2many_initialized || m_outsource_many2many != value)
                {
                    this.m_outsource_many2many = value;
                }
                outsource_many2many_initialized = true;
            }
        }    
        #endregion
        #region Attribute清单 辅助设计
        /// <summary>
        /// {字段属性-结构属性}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>[CtrlTypeDic-{InputString}]</summary>
            public static AttributeItem DescClassID =  new AttributeItem("[Ec_DescClass].[DescClassID]", typeof(decimal), 18);
            
            /// <summary>表名:[CtrlTypeDic-{InputString}]</summary>
            public static AttributeItem TbName =  new AttributeItem("[Ec_DescClass].[TbName]", typeof(string), 50);
            
            /// <summary>字段名:[CtrlTypeDic-{InputString}]</summary>
            public static AttributeItem FieldName =  new AttributeItem("[Ec_DescClass].[FieldName]", typeof(string), 50);
            
            /// <summary>内部表:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem Inner =  new AttributeItem("[Ec_DescClass].[Inner]", typeof(string), 500);
            
            /// <summary>查找字段:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem FindField =  new AttributeItem("[Ec_DescClass].[FindField]", typeof(string), 500);
            
            /// <summary>是否启用:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem IsEnable =  new AttributeItem("[Ec_DescClass].[IsEnable]", typeof(string), 500);
            
            /// <summary>控件类型:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem CtrlTypeDic =  new AttributeItem("[Ec_DescClass].[CtrlTypeDic]", typeof(string), 500);
            
            /// <summary>布局类型:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem Block =  new AttributeItem("[Ec_DescClass].[Block]", typeof(string), 500);
            
            /// <summary>是否自增:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem IDENTITY =  new AttributeItem("[Ec_DescClass].[IDENTITY]", typeof(string), 500);
            
            /// <summary>是否只读:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem IsReadOnly =  new AttributeItem("[Ec_DescClass].[IsReadOnly]", typeof(string), 500);
            
            /// <summary>提醒:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem IsToolTip =  new AttributeItem("[Ec_DescClass].[IsToolTip]", typeof(string), 500);
            
            /// <summary>是否可见:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem IsVisable =  new AttributeItem("[Ec_DescClass].[IsVisable]", typeof(string), 500);
            
            /// <summary>是否快速查询字段:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem IsQuickSearch =  new AttributeItem("[Ec_DescClass].[IsQuickSearch]", typeof(string), 500);
            
            /// <summary>是否高级查询字段:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem IsAdvSearch =  new AttributeItem("[Ec_DescClass].[IsAdvSearch]", typeof(string), 500);
            
            /// <summary>是否模块:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem IsTab =  new AttributeItem("[Ec_DescClass].[IsTab]", typeof(string), 500);
            
            /// <summary>源字段:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem SourceField =  new AttributeItem("[Ec_DescClass].[SourceField]", typeof(string), 500);
            
            /// <summary>查找字段:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem OutSource_ChaZhao =  new AttributeItem("[Ec_DescClass].[OutSource_ChaZhao]", typeof(string), 500);
            
            /// <summary>查找字段-扩展信息:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem OutSource_ExtField =  new AttributeItem("[Ec_DescClass].[OutSource_ExtField]", typeof(string), 500);
            
            /// <summary>查找字段-明细:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem OutSource_MingXi =  new AttributeItem("[Ec_DescClass].[OutSource_MingXi]", typeof(string), 500);
            
            /// <summary>查找字段-树结构:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem OutSource_Tree =  new AttributeItem("[Ec_DescClass].[OutSource_Tree]", typeof(string), 500);
            
            /// <summary>查找字段-多对多:[CtrlTypeDic-{Text}]</summary>
            public static AttributeItem OutSource_Many2Many =  new AttributeItem("[Ec_DescClass].[OutSource_Many2Many]", typeof(string), 500);
        }
        #endregion
        #region bool清单 辅助设计
        
        private decimal m_descclassid;
        /// <summary></summary>
        protected bool descclassid_initialized = false;
        
        private string m_tbname;
        /// <summary></summary>
        protected bool tbname_initialized = false;
        
        private string m_fieldname;
        /// <summary></summary>
        protected bool fieldname_initialized = false;
        
        private string m_inner;
        /// <summary></summary>
        protected bool inner_initialized = false;
        
        private string m_findfield;
        /// <summary></summary>
        protected bool findfield_initialized = false;
        
        private string m_isenable;
        /// <summary></summary>
        protected bool isenable_initialized = false;
        
        private string m_ctrltypedic;
        /// <summary></summary>
        protected bool ctrltypedic_initialized = false;
        
        private string m_block;
        /// <summary></summary>
        protected bool block_initialized = false;
        
        private string m_identity;
        /// <summary></summary>
        protected bool identity_initialized = false;
        
        private string m_isreadonly;
        /// <summary></summary>
        protected bool isreadonly_initialized = false;
        
        private string m_istooltip;
        /// <summary></summary>
        protected bool istooltip_initialized = false;
        
        private string m_isvisable;
        /// <summary></summary>
        protected bool isvisable_initialized = false;
        
        private string m_isquicksearch;
        /// <summary></summary>
        protected bool isquicksearch_initialized = false;
        
        private string m_isadvsearch;
        /// <summary></summary>
        protected bool isadvsearch_initialized = false;
        
        private string m_istab;
        /// <summary></summary>
        protected bool istab_initialized = false;
        
        private string m_sourcefield;
        /// <summary></summary>
        protected bool sourcefield_initialized = false;
        
        private string m_outsource_chazhao;
        /// <summary></summary>
        protected bool outsource_chazhao_initialized = false;
        
        private string m_outsource_extfield;
        /// <summary></summary>
        protected bool outsource_extfield_initialized = false;
        
        private string m_outsource_mingxi;
        /// <summary></summary>
        protected bool outsource_mingxi_initialized = false;
        
        private string m_outsource_tree;
        /// <summary></summary>
        protected bool outsource_tree_initialized = false;
        
        private string m_outsource_many2many;
        /// <summary></summary>
        protected bool outsource_many2many_initialized = false;
        #endregion

        #endregion 类字段
        
		#region 获得与设置属性列与值，以及操作属性的部分方法

        /// <summary>
        /// 实体名 
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "Ec_DescClass";
        }
        
        /// <summary>
        /// 设置自动载入所有列
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.descclassid_initialized = IsLoadAllAttributes;this.tbname_initialized = IsLoadAllAttributes;this.fieldname_initialized = IsLoadAllAttributes;this.inner_initialized = IsLoadAllAttributes;this.findfield_initialized = IsLoadAllAttributes;this.isenable_initialized = IsLoadAllAttributes;this.ctrltypedic_initialized = IsLoadAllAttributes;this.block_initialized = IsLoadAllAttributes;this.identity_initialized = IsLoadAllAttributes;this.isreadonly_initialized = IsLoadAllAttributes;this.istooltip_initialized = IsLoadAllAttributes;this.isvisable_initialized = IsLoadAllAttributes;this.isquicksearch_initialized = IsLoadAllAttributes;this.isadvsearch_initialized = IsLoadAllAttributes;this.istab_initialized = IsLoadAllAttributes;this.sourcefield_initialized = IsLoadAllAttributes;this.outsource_chazhao_initialized = IsLoadAllAttributes;this.outsource_extfield_initialized = IsLoadAllAttributes;this.outsource_mingxi_initialized = IsLoadAllAttributes;this.outsource_tree_initialized = IsLoadAllAttributes;this.outsource_many2many_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			Ec_DescClass value = new Ec_DescClass();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"DescClassID"))
				value.descclassid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"TbName"))
				value.tbname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FieldName"))
				value.fieldname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Inner"))
				value.inner_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FindField"))
				value.findfield_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IsEnable"))
				value.isenable_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"CtrlTypeDic"))
				value.ctrltypedic_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Block"))
				value.block_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IDENTITY"))
				value.identity_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IsReadOnly"))
				value.isreadonly_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IsToolTip"))
				value.istooltip_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IsVisable"))
				value.isvisable_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IsQuickSearch"))
				value.isquicksearch_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IsAdvSearch"))
				value.isadvsearch_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"IsTab"))
				value.istab_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SourceField"))
				value.sourcefield_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"OutSource_ChaZhao"))
				value.outsource_chazhao_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"OutSource_ExtField"))
				value.outsource_extfield_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"OutSource_MingXi"))
				value.outsource_mingxi_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"OutSource_Tree"))
				value.outsource_tree_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"OutSource_Many2Many"))
				value.outsource_many2many_initialized = true;
            
			return value;
		}
        #endregion
        
        #region 实现ICloneable 成员
        /// <summary></summary>
        public new Ec_DescClass Clone()
        {
            return (Ec_DescClass)this.MemberwiseClone(); //浅复制
        }
        #endregion
        
        #region 构造函数 获得实例
        /// <summary>构造函数  </summary>
        static Ec_DescClass()
        {
            //if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>构造函数  </summary>
        public Ec_DescClass() { }
        /// <summary>
        /// 是否载入所有属性  
        /// </summary>
        /// <param name="IsLoadAllAttributes">是否全部初始化为true</param>
        public Ec_DescClass(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>实现分表功能，修改表名  </summary>
        //public Ec_DescClass(string tableName):base(tableName) { }
        /// <summary>实现分表功能，自定义实例的初始化  </summary>
        //public Ec_DescClass(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>实现快捷功能  </summary>
        //public Ec_DescClass(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>请注意，这里当表中仅存在一个字段的时候，将可能与构造函数 new Table(string tableName)冲突  </summary>
        public Ec_DescClass(decimal descclassid1, string tbname1, string fieldname1, string inner1, string findfield1, string isenable1, string ctrltypedic1, string block1, string identity1, string isreadonly1, string istooltip1, string isvisable1, string isquicksearch1, string isadvsearch1, string istab1, string sourcefield1, string outsource_chazhao1, string outsource_extfield1, string outsource_mingxi1, string outsource_tree1, string outsource_many2many1)
        {
            
            this.DescClassID = descclassid1;
            
            this.TbName = tbname1;
            
            this.FieldName = fieldname1;
            
            this.Inner = inner1;
            
            this.FindField = findfield1;
            
            this.IsEnable = isenable1;
            
            this.CtrlTypeDic = ctrltypedic1;
            
            this.Block = block1;
            
            this.IDENTITY = identity1;
            
            this.IsReadOnly = isreadonly1;
            
            this.IsToolTip = istooltip1;
            
            this.IsVisable = isvisable1;
            
            this.IsQuickSearch = isquicksearch1;
            
            this.IsAdvSearch = isadvsearch1;
            
            this.IsTab = istab1;
            
            this.SourceField = sourcefield1;
            
            this.OutSource_ChaZhao = outsource_chazhao1;
            
            this.OutSource_ExtField = outsource_extfield1;
            
            this.OutSource_MingXi = outsource_mingxi1;
            
            this.OutSource_Tree = outsource_tree1;
            
            this.OutSource_Many2Many = outsource_many2many1;
        }
        /// <summary>从视图（多表）内获取本表  </summary>
        public static Ec_DescClass FromIView(IView view)
        {
            return (Ec_DescClass)IView.GetITable(view, "Ec_DescClass");
        }
        /// <summary>获得一个实例  </summary>
        public static Ec_DescClass GetOneInstance()
        {
            Ec_DescClass value = new Ec_DescClass();
            return value;
        }
        /// <summary>获取单一实例==BLLTable.GetRowData(); </summary>
        public Ec_DescClass Retrieve()
        {
            BLLTable<Ec_DescClass>.GetRowData(this);
            return this;
        }
        #endregion
		
        #region 2.2 新增的列属性操作方法

        /// <summary>通过属性 获得字段值</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "DescClassID":
			        return DescClassID;
			    			
			    case "TbName":
			        return TbName;
			    			
			    case "FieldName":
			        return FieldName;
			    			
			    case "Inner":
			        return Inner;
			    			
			    case "FindField":
			        return FindField;
			    			
			    case "IsEnable":
			        return IsEnable;
			    			
			    case "CtrlTypeDic":
			        return CtrlTypeDic;
			    			
			    case "Block":
			        return Block;
			    			
			    case "IDENTITY":
			        return IDENTITY;
			    			
			    case "IsReadOnly":
			        return IsReadOnly;
			    			
			    case "IsToolTip":
			        return IsToolTip;
			    			
			    case "IsVisable":
			        return IsVisable;
			    			
			    case "IsQuickSearch":
			        return IsQuickSearch;
			    			
			    case "IsAdvSearch":
			        return IsAdvSearch;
			    			
			    case "IsTab":
			        return IsTab;
			    			
			    case "SourceField":
			        return SourceField;
			    			
			    case "OutSource_ChaZhao":
			        return OutSource_ChaZhao;
			    			
			    case "OutSource_ExtField":
			        return OutSource_ExtField;
			    			
			    case "OutSource_MingXi":
			        return OutSource_MingXi;
			    			
			    case "OutSource_Tree":
			        return OutSource_Tree;
			    			
			    case "OutSource_Many2Many":
			        return OutSource_Many2Many;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>通过属性 设置字段值</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "DescClassID":
			        this.DescClassID = Convert.ToDecimal(AttributeValue);
                    return true;
			    			
			    case "TbName":
			        this.TbName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FieldName":
			        this.FieldName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Inner":
			        this.Inner = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "FindField":
			        this.FindField = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IsEnable":
			        this.IsEnable = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "CtrlTypeDic":
			        this.CtrlTypeDic = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Block":
			        this.Block = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IDENTITY":
			        this.IDENTITY = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IsReadOnly":
			        this.IsReadOnly = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IsToolTip":
			        this.IsToolTip = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IsVisable":
			        this.IsVisable = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IsQuickSearch":
			        this.IsQuickSearch = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IsAdvSearch":
			        this.IsAdvSearch = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "IsTab":
			        this.IsTab = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SourceField":
			        this.SourceField = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "OutSource_ChaZhao":
			        this.OutSource_ChaZhao = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "OutSource_ExtField":
			        this.OutSource_ExtField = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "OutSource_MingXi":
			        this.OutSource_MingXi = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "OutSource_Tree":
			        this.OutSource_Tree = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "OutSource_Many2Many":
			        this.OutSource_Many2Many = Convert.ToString(AttributeValue);
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
				case "DescClassID":
					return descclassid_initialized;
				
				case "TbName":
					return tbname_initialized;
				
				case "FieldName":
					return fieldname_initialized;
				
				case "Inner":
					return inner_initialized;
				
				case "FindField":
					return findfield_initialized;
				
				case "IsEnable":
					return isenable_initialized;
				
				case "CtrlTypeDic":
					return ctrltypedic_initialized;
				
				case "Block":
					return block_initialized;
				
				case "IDENTITY":
					return identity_initialized;
				
				case "IsReadOnly":
					return isreadonly_initialized;
				
				case "IsToolTip":
					return istooltip_initialized;
				
				case "IsVisable":
					return isvisable_initialized;
				
				case "IsQuickSearch":
					return isquicksearch_initialized;
				
				case "IsAdvSearch":
					return isadvsearch_initialized;
				
				case "IsTab":
					return istab_initialized;
				
				case "SourceField":
					return sourcefield_initialized;
				
				case "OutSource_ChaZhao":
					return outsource_chazhao_initialized;
				
				case "OutSource_ExtField":
					return outsource_extfield_initialized;
				
				case "OutSource_MingXi":
					return outsource_mingxi_initialized;
				
				case "OutSource_Tree":
					return outsource_tree_initialized;
				
				case "OutSource_Many2Many":
					return outsource_many2many_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>通过属性 设置属性的初始化布尔值</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "DescClassID":
					descclassid_initialized = ret;
					return true;
				
				case "TbName":
					tbname_initialized = ret;
					return true;
				
				case "FieldName":
					fieldname_initialized = ret;
					return true;
				
				case "Inner":
					inner_initialized = ret;
					return true;
				
				case "FindField":
					findfield_initialized = ret;
					return true;
				
				case "IsEnable":
					isenable_initialized = ret;
					return true;
				
				case "CtrlTypeDic":
					ctrltypedic_initialized = ret;
					return true;
				
				case "Block":
					block_initialized = ret;
					return true;
				
				case "IDENTITY":
					identity_initialized = ret;
					return true;
				
				case "IsReadOnly":
					isreadonly_initialized = ret;
					return true;
				
				case "IsToolTip":
					istooltip_initialized = ret;
					return true;
				
				case "IsVisable":
					isvisable_initialized = ret;
					return true;
				
				case "IsQuickSearch":
					isquicksearch_initialized = ret;
					return true;
				
				case "IsAdvSearch":
					isadvsearch_initialized = ret;
					return true;
				
				case "IsTab":
					istab_initialized = ret;
					return true;
				
				case "SourceField":
					sourcefield_initialized = ret;
					return true;
				
				case "OutSource_ChaZhao":
					outsource_chazhao_initialized = ret;
					return true;
				
				case "OutSource_ExtField":
					outsource_extfield_initialized = ret;
					return true;
				
				case "OutSource_MingXi":
					outsource_mingxi_initialized = ret;
					return true;
				
				case "OutSource_Tree":
					outsource_tree_initialized = ret;
					return true;
				
				case "OutSource_Many2Many":
					outsource_many2many_initialized = ret;
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

			
			if (descclassid_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.DescClassID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DescClassID);
                }
			}
			
			if (tbname_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.TbName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(TbName);
                }
			}
			
			if (fieldname_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.FieldName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FieldName);
                }
			}
			
			if (inner_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.Inner;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Inner);
                }
			}
			
			if (findfield_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.FindField;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FindField);
                }
			}
			
			if (isenable_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.IsEnable;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IsEnable);
                }
			}
			
			if (ctrltypedic_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.CtrlTypeDic;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(CtrlTypeDic);
                }
			}
			
			if (block_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.Block;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Block);
                }
			}
			
			if (identity_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.IDENTITY;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IDENTITY);
                }
			}
			
			if (isreadonly_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.IsReadOnly;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IsReadOnly);
                }
			}
			
			if (istooltip_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.IsToolTip;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IsToolTip);
                }
			}
			
			if (isvisable_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.IsVisable;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IsVisable);
                }
			}
			
			if (isquicksearch_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.IsQuickSearch;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IsQuickSearch);
                }
			}
			
			if (isadvsearch_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.IsAdvSearch;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IsAdvSearch);
                }
			}
			
			if (istab_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.IsTab;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(IsTab);
                }
			}
			
			if (sourcefield_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.SourceField;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SourceField);
                }
			}
			
			if (outsource_chazhao_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.OutSource_ChaZhao;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(OutSource_ChaZhao);
                }
			}
			
			if (outsource_extfield_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.OutSource_ExtField;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(OutSource_ExtField);
                }
			}
			
			if (outsource_mingxi_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.OutSource_MingXi;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(OutSource_MingXi);
                }
			}
			
			if (outsource_tree_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.OutSource_Tree;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(OutSource_Tree);
                }
			}
			
			if (outsource_many2many_initialized)
			{
                AttributeItem attr = Ec_DescClass.Attribute.OutSource_Many2Many;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(OutSource_Many2Many);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}