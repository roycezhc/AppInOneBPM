<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="TF_TABLESel.aspx.cs" Inherits="TF_TABLESel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });

    function selThis_B(tds) {
        var tdObj = $(tds[0]);
        var aObj = tdObj.find("a");
        if (aObj.length > 0) {
            _selERR = "不能选择有子节点的数据！";
            _selOK = false;
        }
    }
    function selOK_B(id) {
        //alert(id);
        $("input[id$='hidSelID']").val(id);
        //alert($("input[id$='hidSelID']").val());
        __doPostBack("ctl00$cphBody$LinkButton1", "");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="TB_ID">
               <dt><%=TF_TABLE.Attribute.TB_ID.ZhName %>：</dt><!--表ID-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TB_NAME">
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>：</dt><!--表名-->
               <dd><span>
                
                    <input id="txtTB_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="WF_TB_NAME">
               <dt><%=TF_TABLE.Attribute.WF_TB_NAME.ZhName %>：</dt><!--流程表名-->
               <dd><span>
                
                    <input id="txtWF_TB_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CH_NAME">
               <dt><%=TF_TABLE.Attribute.CH_NAME.ZhName %>：</dt><!--中文名-->
               <dd><span>
                
                    <input id="txtCH_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="M_TB_ID">
               <dt><%=TF_TABLE.Attribute.M_TB_ID.ZhName %>：</dt><!--主表ID-->
               <dd><span>
                
                    <input id="txtM_TB_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SORT_NO">
               <dt><%=TF_TABLE.Attribute.SORT_NO.ZhName %>：</dt><!--序号-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TB_TYPE">
               <dt><%=TF_TABLE.Attribute.TB_TYPE.ZhName %>：</dt><!--表类型-->
               <dd><span>
               
                    <select id="txtTB_TYPE" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="NOTE">
               <dt><%=TF_TABLE.Attribute.NOTE.ZhName %>：</dt><!--备注-->
               <dd><span>
               
                    <textarea id="txtNOTE" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="CREATED">
               <dt><%=TF_TABLE.Attribute.CREATED.ZhName %>：</dt><!--创建人-->
               <dd><span>
                
                    <input id="txtCREATED" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DB_SRC">
               <dt><%=TF_TABLE.Attribute.DB_SRC.ZhName %>：</dt><!--数据源-->
               <dd><span>
                
                    <input id="txtDB_SRC" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="MENU_NAME">
               <dt><%=TF_TABLE.Attribute.MENU_NAME.ZhName %>：</dt><!--模块菜单名-->
               <dd><span>
                
                    <input id="txtMENU_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="KEY_NAME">
               <dt><%=TF_TABLE.Attribute.KEY_NAME.ZhName %>：</dt><!--主键名-->
               <dd><span>
                
                    <input id="txtKEY_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="KEY_TYPE">
               <dt><%=TF_TABLE.Attribute.KEY_TYPE.ZhName %>：</dt><!--数据类型-->
               <dd><span>
                
                    <input id="txtKEY_TYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="API_NAME">
               <dt><%=TF_TABLE.Attribute.API_NAME.ZhName %>：</dt><!--API对象名-->
               <dd><span>
                
                    <input id="txtAPI_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ALLOW_REPORT">
               <dt><%=TF_TABLE.Attribute.ALLOW_REPORT.ZhName %>：</dt><!--允许报表-->
               <dd><span>
               
                    <input id="txtALLOW_REPORT" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="ALLOW_ACTIVITY">
               <dt><%=TF_TABLE.Attribute.ALLOW_ACTIVITY.ZhName %>：</dt><!--允许活动-->
               <dd><span>
               
                    <input id="txtALLOW_ACTIVITY" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="MODIFY_HIS">
               <dt><%=TF_TABLE.Attribute.MODIFY_HIS.ZhName %>：</dt><!--跟踪字段历史-->
               <dd><span>
               
                    <input id="txtMODIFY_HIS" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="ALLOW_USER_AREA">
               <dt><%=TF_TABLE.Attribute.ALLOW_USER_AREA.ZhName %>：</dt><!--启用用户级分部-->
               <dd><span>
               
                    <input id="txtALLOW_USER_AREA" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="ALLOW_PUBLIC">
               <dt><%=TF_TABLE.Attribute.ALLOW_PUBLIC.ZhName %>：</dt><!--可用于客户入口网站 此选项使得自定义对象可通过 Salesforce 客户入口网站使用。-->
               <dd><span>
               
                    <input id="txtALLOW_PUBLIC" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="TB_NAMESPACE">
               <dt><%=TF_TABLE.Attribute.TB_NAMESPACE.ZhName %>：</dt><!--命名空间前缀-->
               <dd><span>
                
                    <input id="txtTB_NAMESPACE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="INSTALL_STAT">
               <dt><%=TF_TABLE.Attribute.INSTALL_STAT.ZhName %>：</dt><!--部署状态-->
               <dd><span>
               
                    <input id="txtINSTALL_STAT" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="ADD_NOTE_FILE">
               <dt><%=TF_TABLE.Attribute.ADD_NOTE_FILE.ZhName %>：</dt><!--添加备注和附件-->
               <dd><span>
               
                    <input id="txtADD_NOTE_FILE" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="HAS_WF">
               <dt><%=TF_TABLE.Attribute.HAS_WF.ZhName %>：</dt><!--审批功能-->
               <dd><span>
               
                    <input id="txtHAS_WF" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         <dl class="btn"><dd>
         <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_ID._ZhName %></td><!--表ID-->
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_NAME._ZhName %></td><!--表名-->
                    
                    
                    <td><%=TF_TABLE.Attribute.WF_TB_NAME._ZhName %></td><!--流程表名-->
                    
                    
                    <td><%=TF_TABLE.Attribute.CH_NAME._ZhName %></td><!--中文名-->
                    
                    
                    <td><%=TF_TABLE.Attribute.M_TB_ID._ZhName %></td><!--主表ID-->
                    
                    
                    <td><%=TF_TABLE.Attribute.SORT_NO._ZhName %></td><!--序号-->
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_TYPE._ZhName %></td><!--表类型-->
                    
                    
                    <td><%=TF_TABLE.Attribute.NOTE._ZhName %></td><!--备注-->
                    
                    
                    <td><%=TF_TABLE.Attribute.CREATED._ZhName %></td><!--创建人-->
                    
                    
                    <td><%=TF_TABLE.Attribute.DB_SRC._ZhName %></td><!--数据源-->
                    
                    
                    <td><%=TF_TABLE.Attribute.MENU_NAME._ZhName %></td><!--模块菜单名-->
                    
                    
                    <td><%=TF_TABLE.Attribute.KEY_NAME._ZhName %></td><!--主键名-->
                    
                    
                    <td><%=TF_TABLE.Attribute.KEY_TYPE._ZhName %></td><!--数据类型-->
                    
                    
                    <td><%=TF_TABLE.Attribute.API_NAME._ZhName %></td><!--API对象名-->
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_REPORT._ZhName %></td><!--允许报表-->
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_ACTIVITY._ZhName %></td><!--允许活动-->
                    
                    
                    <td><%=TF_TABLE.Attribute.MODIFY_HIS._ZhName %></td><!--跟踪字段历史-->
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_USER_AREA._ZhName %></td><!--启用用户级分部-->
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_PUBLIC._ZhName %></td><!--可用于客户入口网站 此选项使得自定义对象可通过 Salesforce 客户入口网站使用。-->
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_NAMESPACE._ZhName %></td><!--命名空间前缀-->
                    
                    
                    <td><%=TF_TABLE.Attribute.INSTALL_STAT._ZhName %></td><!--部署状态-->
                    
                    
                    <td><%=TF_TABLE.Attribute.ADD_NOTE_FILE._ZhName %></td><!--添加备注和附件-->
                    
                    
                    <td><%=TF_TABLE.Attribute.HAS_WF._ZhName %></td><!--审批功能-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).WF_TB_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).CH_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).M_TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#FormHelper.GetText(TF_TABLE.Attribute.TB_TYPE, ((TF_TABLE)Container.DataItem).TB_TYPE)%></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((TF_TABLE)Container.DataItem).NOTE) %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).CREATED %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).DB_SRC %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).MENU_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).KEY_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).KEY_TYPE %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).API_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_REPORT %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_ACTIVITY %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).MODIFY_HIS %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_USER_AREA %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_PUBLIC %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_NAMESPACE %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).INSTALL_STAT %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ADD_NOTE_FILE %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).HAS_WF %></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        <div class="path-url hide">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
        <div class="pages">
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

