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
    public class ITableTree
    {
        public ITableTree()
        {
        }
        public ITableImplement val = new TF_TABLE();
        public List<Relation> relations = new List<Relation>();

        public AttributeItem ID = null;
        public AttributeItem M_ID = null;
        public AttributeItem NAME = null;
        public AttributeItem NOTE = null;
        public AttributeItem SORT_NO = null;
        /// <summary>
        /// 分类属性
        /// </summary>
        public AttributeItem TYPE = null;

        public string editUrl = null;
        public string manageUrl = null;
        public string showUrl = null;

        public string backSvrUrl = null;
    }
}