<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLSel" CodeFile="COLSel.aspx.cs" %>
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
         
            <dl colname="COL_ID">
               <dt><%=SYS_BILL_COL.Attribute.COL_ID.ZhName %>：</dt><!--表单列ID-->
               <dd><span>
                
                    <input id="txtCOL_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="BILL_ID">
               <dt><%=SYS_BILL_COL.Attribute.BILL_ID.ZhName %>：</dt><!--所属表单ID-->
               <dd><span>
                
                    <input id="txtBILL_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TABLE_NAME">
               <dt><%=SYS_BILL_COL.Attribute.TABLE_NAME.ZhName %>：</dt><!--列所属表-->
               <dd><span>
                
                    <input id="txtTABLE_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="COL_NAME">
               <dt><%=SYS_BILL_COL.Attribute.COL_NAME.ZhName %>：</dt><!--列明-->
               <dd><span>
                
                    <input id="txtCOL_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="COL_NOTE">
               <dt><%=SYS_BILL_COL.Attribute.COL_NOTE.ZhName %>：</dt><!--列默认名-->
               <dd><span>
                
                    <input id="txtCOL_NOTE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DATA_TYPE">
               <dt><%=SYS_BILL_COL.Attribute.DATA_TYPE.ZhName %>：</dt><!--数据类型-->
               <dd><span>
                
                    <input id="txtDATA_TYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DATA_LEN">
               <dt><%=SYS_BILL_COL.Attribute.DATA_LEN.ZhName %>：</dt><!--数据长度-->
               <dd><span>
                
                    <input id="txtDATA_LEN" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DATA_ACC">
               <dt><%=SYS_BILL_COL.Attribute.DATA_ACC.ZhName %>：</dt><!--数据精度-->
               <dd><span>
                
                    <input id="txtDATA_ACC" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="IS_AUTO">
               <dt><%=SYS_BILL_COL.Attribute.IS_AUTO.ZhName %>：</dt><!--是否是数字递增字段-->
               <dd><span>
                
                    <input id="txtIS_AUTO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SORT_NO">
               <dt><%=SYS_BILL_COL.Attribute.SORT_NO.ZhName %>：</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="COL_SHOW">
               <dt><%=SYS_BILL_COL.Attribute.FK_SHOW.ZhName%>：</dt><!--用于显示信息的列名-->
               <dd><span>
                
                    <input id="txtCOL_SHOW" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DISPLAY_NAME">
               <dt><%=SYS_BILL_COL.Attribute.DISPLAY_NAME.ZhName %>：</dt><!--列自定义显示名-->
               <dd><span>
                
                    <input id="txtDISPLAY_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TITLE">
               <dt><%=SYS_BILL_COL.Attribute.TITLE.ZhName %>：</dt><!--提示标题-->
               <dd><span>
                
                    <input id="txtTITLE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DVAL">
               <dt><%=SYS_BILL_COL.Attribute.DVAL.ZhName %>：</dt><!--默认值-->
               <dd><span>
                
                    <input id="txtDVAL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="BILL_ROW_FORMULAR">
               <dt><%=SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR.ZhName %>：</dt><!--行之间计算关系公式，比容总金额＝某子表单列的和-->
               <dd><span>
               
                    <textarea id="txtBILL_ROW_FORMULAR" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="BILL_COL_FORMULAR">
               <dt><%=SYS_BILL_COL.Attribute.BILL_COL_FORMULAR.ZhName %>：</dt><!--列之间计算公式，比如金额＝单价*数量-->
               <dd><span>
               
                    <textarea id="txtBILL_COL_FORMULAR" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="BILL_ISHEADER">
               <dt><%=SYS_BILL_COL.Attribute.BILL_ISHEADER.ZhName %>：</dt><!--是否显示在表头-->
               <dd><span>
                
                    <input id="txtBILL_ISHEADER" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="BILL_HERDERWIDTH">
               <dt><%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH.ZhName %>：</dt><!--单据表头宽度-->
               <dd><span>
                
                    <input id="txtBILL_HERDERWIDTH" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FORM_CHECKTYPE">
               <dt><%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE.ZhName %>：</dt><!--验证数据类型-->
               <dd><span>
                
                    <input id="txtFORM_CHECKTYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FORM_CTRL_ID">
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRL_ID.ZhName %>：</dt><!--列表单控件类型-->
               <dd><span>
                
                    <input id="txtFORM_CTRL_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FORM_SHOW">
               <dt><%=SYS_BILL_COL.Attribute.FORM_SHOW.ZhName %>：</dt><!--需要有表单界面输入-->
               <dd><span>
                
                    <input id="txtFORM_SHOW" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FORM_NEED">
               <dt><%=SYS_BILL_COL.Attribute.FORM_NEED.ZhName %>：</dt><!--是否必填-->
               <dd><span>
                
                    <input id="txtFORM_NEED" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FORM_MIN">
               <dt><%=SYS_BILL_COL.Attribute.FORM_MIN.ZhName %>：</dt><!--最小值-->
               <dd><span>
                
                    <input id="txtFORM_MIN" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FORM_MAX">
               <dt><%=SYS_BILL_COL.Attribute.FORM_MAX.ZhName %>：</dt><!--最大值-->
               <dd><span>
                
                    <input id="txtFORM_MAX" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FORM_ONEROW">
               <dt><%=SYS_BILL_COL.Attribute.FORM_ONEROW.ZhName %>：</dt><!--显示在整行-->
               <dd><span>
                
                    <input id="txtFORM_ONEROW" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FORM_CTRLWIDTH">
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH.ZhName %>：</dt><!--控件宽度-->
               <dd><span>
                
                    <input id="txtFORM_CTRLWIDTH" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SEARCH_INBILL">
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_INBILL.ZhName %>：</dt><!--表单列表里条件-->
               <dd><span>
                
                    <input id="txtSEARCH_INBILL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SEARCH_TYPE">
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_TYPE.ZhName %>：</dt><!--查询数据类型-->
               <dd><span>
                
                    <input id="txtSEARCH_TYPE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SEARCH_FORMULAR">
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR.ZhName %>：</dt><!--查询公式-->
               <dd><span>
                
                    <input id="txtSEARCH_FORMULAR" type="text" runat="server" />
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
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.COL_ID._ZhName %></td><!--表单列ID-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.BILL_ID._ZhName %></td><!--所属表单ID-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.TABLE_NAME._ZhName %></td><!--列所属表-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.COL_NAME._ZhName %></td><!--列明-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.COL_NOTE._ZhName %></td><!--列默认名-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.DATA_TYPE._ZhName %></td><!--数据类型-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.DATA_LEN._ZhName %></td><!--数据长度-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.DATA_ACC._ZhName %></td><!--数据精度-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.IS_AUTO._ZhName %></td><!--是否是数字递增字段-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.FK_SHOW._ZhName%></td><!--用于显示信息的列名-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.DISPLAY_NAME._ZhName %></td><!--列自定义显示名-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.TITLE._ZhName %></td><!--提示标题-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.DVAL._ZhName %></td><!--默认值-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR._ZhName %></td><!--行之间计算关系公式，比容总金额＝某子表单列的和-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.BILL_COL_FORMULAR._ZhName %></td><!--列之间计算公式，比如金额＝单价*数量-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.BILL_ISHEADER._ZhName %></td><!--是否显示在表头-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH._ZhName %></td><!--单据表头宽度-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE._ZhName %></td><!--验证数据类型-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.FORM_CTRL_ID._ZhName %></td><!--列表单控件类型-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.FORM_SHOW._ZhName %></td><!--需要有表单界面输入-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.FORM_NEED._ZhName %></td><!--是否必填-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.FORM_MIN._ZhName %></td><!--最小值-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.FORM_MAX._ZhName %></td><!--最大值-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.FORM_ONEROW._ZhName %></td><!--显示在整行-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH._ZhName %></td><!--控件宽度-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.SEARCH_INBILL._ZhName %></td><!--表单列表里条件-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.SEARCH_TYPE._ZhName %></td><!--查询数据类型-->
                    
                    
                    <td><%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR._ZhName %></td><!--查询公式-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).COL_ID %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).BILL_ID %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).TABLE_NAME %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).COL_NAME %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).COL_NOTE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DATA_TYPE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DATA_LEN %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DATA_ACC %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).IS_AUTO %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FK_SHOW%></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DISPLAY_NAME %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).DVAL %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((SYS_BILL_COL)Container.DataItem).BILL_ROW_FORMULAR) %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((SYS_BILL_COL)Container.DataItem).BILL_COL_FORMULAR) %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).BILL_ISHEADER %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).BILL_HERDERWIDTH %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_CHECKTYPE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_CTRL_ID %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_SHOW %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_NEED %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_MIN %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_MAX %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_ONEROW %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).FORM_CTRLWIDTH %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).SEARCH_INBILL %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).SEARCH_TYPE %></td>
                    
                    
                    <td><%#((SYS_BILL_COL)Container.DataItem).SEARCH_FORMULAR %></td>
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

