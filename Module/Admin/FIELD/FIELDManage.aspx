<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TB_FIELDManage2" CodeFile="FIELDManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script type="text/javascript">
      function load_DivShowHide() {
          //打开收起
          var divs = $("div.grp");
          var aObjs = divs.find("a");
          for (var a = 0; a < aObjs.length; a++) {
              var aObj = $(aObjs[a]);
              //              var tps = aObj.attr("showtypes")
              //              var hidObj;
              //              if (tps != undefined) {
              //                  hidObj = $(tps)[0];
              //              }              
              aObj.bind("click", aObj, function (e) {
                  hidObj = e.data.parent().parent().parent().next(); //这里有变化
                  var txt = e.data.text();
                  if (txt == "展开") {
                      hidObj.show(); e.data.text("收起");

                  } else {
                      hidObj.hide(); e.data.text("展开");
                  }
              });

              aObj.parent().parent().bind("dblclick", aObj, function (e) {
                  hidObj = e.data.parent().parent().parent().next(); //这里有变化
                  var txt = e.data.text();
                  if (txt == "展开") {
                      hidObj.show(); e.data.text("收起");

                  } else {
                      hidObj.hide(); e.data.text("展开");
                  }
              });
          }
      }
  </script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        load_DivShowHide();
        manager.initBodyRows();
        manager.initFindDL();
//        //manager.initPageSizeEvt("txtPageNum");
//        bindWinResize(50);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav grp">
    <dl><dt><b>字段列表 <font color="blue"><%=title%></font>
        <asp:Button ID="btnSyn" runat="server" Text="数据源同步" onclick="btnSyn_Click"/>
            </b></dt><dd><a>收起</a></dd></dl>
   </div>
   <div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="topfind hide"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="TF_TB_FIELD.FIELD_NAME">
               <dt><%=TF_TB_FIELD.Attribute.FIELD_NAME.ZhName %>：</dt><!--字段名-->
               <dd><span>
                
                    <input id="txtFIELD_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TB_FIELD.FIELD_TYPE">
               <dt><%=TF_TB_FIELD.Attribute.DB_TYPE.ZhName %>：</dt><!--字段类型-->
               <dd><span>
               
                    <select id="txtFIELD_TYPE" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
            <dl colname="TF_TB_FIELD.IS_NULL">
               <dt><%=TF_TB_FIELD.Attribute.IS_NULL.ZhName %>：</dt><!--IS_NULL-->
               <dd><span>
                
                    <input id="txtIS_NULL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TB_FIELD.NOTE">
               <dt>描述：</dt><!--中文名-->
               <dd><span>
                
                    <input id="txtNOTE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dt></dt><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
       <%-- <ul id="ulBtns" runat="server">
            <li><span><input power="newTF_TB_FIELD" id="btn_New" type="button" value="新建" onclick="manager.newRecord('TF_TB_FIELDEdit.aspx');" /></span></li>
            <li><span><input power="editTF_TB_FIELD" id="btn_Edit" type="button" value="修改" onclick="manager.editRecord('TF_TB_FIELDEdit.aspx');" /></span></li>
            <li><span><input power="delTF_TB_FIELD" id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('TF_TB_FIELDBack.aspx');" /></span></li>
        </ul>--%>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="FIELD_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.SORT_NO.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.SORT_NO._ZhName %></td><!--序号-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.FIELD_ID.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.FIELD_ID._ZhName %></td><!--ID-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.FIELD_NAME.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.FIELD_NAME._ZhName %></td><!--字段名-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.NOTE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.NOTE._ZhName %></td><!--中文名-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.DB_TYPE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.DB_TYPE._ZhName %></td><!--字段类型-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.IS_NULL.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.IS_NULL._ZhName %></td><!--IS_NULL-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.DEFAULT_VAL.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.DEFAULT_VAL._ZhName %></td><!--默认值-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.CTRL_TYPE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.CTRL_TYPE._ZhName %></td><!--默认控件类型-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_TB_FIELD)Container.DataItem).FIELD_ID%>" /></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).SORT_NO %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_ID %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_NAME %><%#checkDB(((TF_TB_FIELD)Container.DataItem),tbObj)%></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).NOTE %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DB_TYPE %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).IS_NULL==1?"允许":"不允许" %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DEFAULT_VAL %></td>
                    <td><%#dicCtrlType[((TF_TB_FIELD)Container.DataItem).CTRL_TYPE]%></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
    </div>
    <div class="titnav grp">
     <dl><dt><b>默认字段</b></dt><dd><a>展开</a></dd></dl>
    </div>
    <div class="hide">
     <div class="tblist hide2">
         <table cellpadding="0" cellspacing="0">
            <thead>
                <tr keyname="FIELD_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.SORT_NO.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.SORT_NO._ZhName %></td><!--序号-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.FIELD_ID.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.FIELD_ID._ZhName %></td><!--ID-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.FIELD_NAME.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.FIELD_NAME._ZhName %></td><!--字段名-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.NOTE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.NOTE._ZhName %></td><!--中文名-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.DB_TYPE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.DB_TYPE._ZhName %></td><!--字段类型-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.IS_NULL.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.IS_NULL._ZhName %></td><!--IS_NULL-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.DEFAULT_VAL.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.DEFAULT_VAL._ZhName %></td><!--默认值-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.CTRL_TYPE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.CTRL_TYPE._ZhName %></td><!--默认控件类型-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repDefault" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_TB_FIELD)Container.DataItem).FIELD_ID%>" /></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).SORT_NO %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_ID %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_NAME %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).NOTE %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DB_TYPE %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).IS_NULL==1?"允许":"不允许" %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DEFAULT_VAL %></td>
                    <td><%#dicCtrlType[((TF_TB_FIELD)Container.DataItem).CTRL_TYPE]%></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    </div>
    <div class="titnav grp">
     <dl><dt><b>考勤接口配置</b></dt><dd><a>展开</a></dd></dl>
    </div>
      <div class="hide">
         <div class="tblist" style="height:80px;">
             <table cellpadding="0" cellspacing="0">
                <thead>
                    <tr>
                    <th class="first">&nbsp;</th>
                    <th>表名</th>
                    <th>员工编号</th>
                  <%--  <th>考勤大类</th>--%>
                    <th>考勤类型</th>
                    <th>抵消工作开始时间</th>
                    <th>抵消工作结束时间</th>
                    <th>工作开始时间</th>
                    <th>工作结束时间</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repFangAn" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                    <tr>
                        <td class="first">&nbsp;</td>
                        <td><input name="txtTableName" type="text" value="<%#Eval("*TableName")%>" /></td>
                        <td><input name="txtUserId" type="text" value="<%#Eval("UserId")%>" /></td>
                       <%-- <td><input name="txtTYPE" type="text" value="<%#Eval("TYPE")%>" /></td>--%>
                        <td><input name="txtCheckOWA" type="text" value="<%#Eval("CheckOWA")%>" /></td>
                        <td><input name="txtUnWorkStartTime" type="text" value="<%#Eval("UnWorkStartTime")%>" /></td>
                        <td><input name="txtUnWorkEndTime" type="text" value="<%#Eval("UnWorkEndTime")%>" /></td>
                        <td><input name="txtOnWorkStartTime" type="text" value="<%#Eval("OnWorkStartTime")%>" /></td>
                        <td><input name="txtOnWorkEndTime" type="text" value="<%#Eval("OnWorkEndTime")%>" /></td>
                    </tr>
                    </ItemTemplate>
                    </asp:Repeater>
                </tbody>
             </table>
        </div>
        <div class="tool" style="height:80px;">
            <span><asp:Button ID="btnSaveFangAn" runat="server" Text="保存接口方案" 
                 onclick="btnSaveFangAn_Click" /></span>
        </div>
    </div>
</div>
</asp:Content>