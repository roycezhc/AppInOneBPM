<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="IM_PURORDERManage" CodeFile="PURORDERManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>

<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="PORD_ID">
               <dt><%=IM_PURORDER.Attribute.PORD_ID.ZhName %>：</dt><!--ID-->
               <dd><span>
                
                    <input id="txtPORD_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="PORD_NO">
               <dt><%=IM_PURORDER.Attribute.PORD_NO.ZhName %>：</dt><!--单据编号-->
               <dd><span>
                
                    <input id="txtPORD_NO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="C_DATE">
               <dt><%=IM_PURORDER.Attribute.C_DATE.ZhName %>：</dt><!--单据日期-->
               <dd><span>
               
                    <input id="txtC_DATE" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="ORG_ID">
               <dt><%=IM_PURORDER.Attribute.ORG_ID.ZhName %>：</dt><!--机构ID-->
               <dd><span>
                
                    <input id="txtORG_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="DEPT_ID">
               <dt><%=IM_PURORDER.Attribute.DEPT_ID.ZhName %>：</dt><!--部门ID-->
               <dd><span>
                
                    <input id="txtDEPT_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SUP_ID">
               <dt><%=IM_PURORDER.Attribute.SUP_ID.ZhName %>：</dt><!--供应商ID-->
               <dd><span>
                
                    <input id="txtSUP_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="PERSON_HID">
               <dt><%=IM_PURORDER.Attribute.PERSON_HID.ZhName %>：</dt><!--经手人ID-->
               <dd><span>
                
                    <input id="txtPERSON_HID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TS_NO">
               <dt><%=IM_PURORDER.Attribute.TS_NO.ZhName %>：</dt><!--运单号-->
               <dd><span>
                
                    <input id="txtTS_NO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="GOODES_NUM">
               <dt><%=IM_PURORDER.Attribute.GOODES_NUM.ZhName %>：</dt><!--货物数量-->
               <dd><span>
                
                    <input id="txtGOODES_NUM" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="ARRIVAL_DATE">
               <dt><%=IM_PURORDER.Attribute.ARRIVAL_DATE.ZhName %>：</dt><!--到货日期-->
               <dd><span>
               
                    <input id="txtARRIVAL_DATE" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="PACKAGE_TYPE">
               <dt><%=IM_PURORDER.Attribute.PACKAGE_TYPE.ZhName %>：</dt><!--包装方式-->
               <dd><span>
                
                    <input id="txtPACKAGE_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TS_DEPT">
               <dt><%=IM_PURORDER.Attribute.TS_DEPT.ZhName %>：</dt><!--承运单位-->
               <dd><span>
                
                    <input id="txtTS_DEPT" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="PHONE">
               <dt><%=IM_PURORDER.Attribute.PHONE.ZhName %>：</dt><!--电话-->
               <dd><span>
                
                    <input id="txtPHONE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="COST_PEICE_FLAG">
               <dt><%=IM_PURORDER.Attribute.COST_PEICE_FLAG.ZhName %>：</dt><!--成本价采购-->
               <dd><span>
                
                    <input id="txtCOST_PEICE_FLAG" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="STOR_ID">
               <dt><%=IM_PURORDER.Attribute.STOR_ID.ZhName %>：</dt><!--STOR_ID-->
               <dd><span>
                
                    <input id="txtSTOR_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="DEDUCTION_RATE">
               <dt><%=IM_PURORDER.Attribute.DEDUCTION_RATE.ZhName %>：</dt><!--扣率-->
               <dd><span>
                
                    <input id="txtDEDUCTION_RATE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TAX_RATE">
               <dt><%=IM_PURORDER.Attribute.TAX_RATE.ZhName %>：</dt><!--TAX_RATE-->
               <dd><span>
                
                    <input id="txtTAX_RATE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CREATER">
               <dt><%=IM_PURORDER.Attribute.CREATER.ZhName %>：</dt><!--CREATER-->
               <dd><span>
                
                    <input id="txtCREATER" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CHECKER">
               <dt><%=IM_PURORDER.Attribute.CHECKER.ZhName %>：</dt><!--CHECKER-->
               <dd><span>
                
                    <input id="txtCHECKER" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="NOTE">
               <dt><%=IM_PURORDER.Attribute.NOTE.ZhName %>：</dt><!--备注-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="REMARK">
               <dt><%=IM_PURORDER.Attribute.REMARK.ZhName %>：</dt><!--摘要-->
               <dd><span>
               
                    <input id="txtREMARK" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="EXP1">
               <dt><%=IM_PURORDER.Attribute.EXP1.ZhName %>：</dt><!--自定义1-->
               <dd><span>
                
                    <input id="txtEXP1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="EXP2">
               <dt><%=IM_PURORDER.Attribute.EXP2.ZhName %>：</dt><!--自定义2-->
               <dd><span>
                
                    <input id="txtEXP2" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="EXP3">
               <dt><%=IM_PURORDER.Attribute.EXP3.ZhName %>：</dt><!--自定义3-->
               <dd><span>
                
                    <input id="txtEXP3" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl><dt>&nbsp;</dt><dd class="btn">
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);" /></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input id="btn_New" type="button" value="新建" onclick="manager.newRecord('PURORDEREdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="NewStaff" id="Button2" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('PURORDERBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageNum" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageNum_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="PORD_ID">
                    <td class="first"><input type="checkbox" onclick="selAll(this);" /></td>
                    <td><a href="PURORDERManage.aspx" id="a_top" runat="server"><b>/顶级</b></a></td>
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.PORD_ID.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.PORD_ID._ZhName %></td><!--ID-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.PORD_NO.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.PORD_NO._ZhName %></td><!--单据编号-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.C_DATE.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.C_DATE._ZhName %></td><!--单据日期-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.ORG_ID.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.ORG_ID._ZhName %></td><!--机构ID-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.DEPT_ID.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.DEPT_ID._ZhName %></td><!--部门ID-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.SUP_ID.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.SUP_ID._ZhName %></td><!--供应商ID-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.PERSON_HID.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.PERSON_HID._ZhName %></td><!--经手人ID-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.TS_NO.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.TS_NO._ZhName %></td><!--运单号-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.GOODES_NUM.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.GOODES_NUM._ZhName %></td><!--货物数量-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.ARRIVAL_DATE.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.ARRIVAL_DATE._ZhName %></td><!--到货日期-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.PACKAGE_TYPE.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.PACKAGE_TYPE._ZhName %></td><!--包装方式-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.TS_DEPT.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.TS_DEPT._ZhName %></td><!--承运单位-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.PHONE.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.PHONE._ZhName %></td><!--电话-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.COST_PEICE_FLAG.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.COST_PEICE_FLAG._ZhName %></td><!--成本价采购-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.STOR_ID.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.STOR_ID._ZhName %></td><!--STOR_ID-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.DEDUCTION_RATE.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.DEDUCTION_RATE._ZhName %></td><!--扣率-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.TAX_RATE.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.TAX_RATE._ZhName %></td><!--TAX_RATE-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.CREATER.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.CREATER._ZhName %></td><!--CREATER-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.CHECKER.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.CHECKER._ZhName %></td><!--CHECKER-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.NOTE.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.NOTE._ZhName %></td><!--备注-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.REMARK.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.REMARK._ZhName %></td><!--摘要-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.EXP1.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.EXP1._ZhName %></td><!--自定义1-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.EXP2.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.EXP2._ZhName %></td><!--自定义2-->
                    
                    
                    <td data="{colname:'<%=IM_PURORDER.Attribute.EXP3.FieldName%>',show:1}"><%=IM_PURORDER.Attribute.EXP3._ZhName %></td><!--自定义3-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((IM_PURORDER)Container.DataItem).PORD_ID%>" /></td>
                    <td>&nbsp;</td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PORD_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PORD_NO %></td>
                    
                    
                    <td><%#(((IM_PURORDER)Container.DataItem).C_DATE == DateTime.MinValue) ? "" : ((IM_PURORDER)Container.DataItem).C_DATE.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).ORG_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).DEPT_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).SUP_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PERSON_HID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).TS_NO %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).GOODES_NUM %></td>
                    
                    
                    <td><%#(((IM_PURORDER)Container.DataItem).ARRIVAL_DATE == DateTime.MinValue) ? "" : ((IM_PURORDER)Container.DataItem).ARRIVAL_DATE.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PACKAGE_TYPE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).TS_DEPT %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PHONE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).COST_PEICE_FLAG %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).STOR_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).DEDUCTION_RATE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).TAX_RATE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).CREATER %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).CHECKER %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).REMARK %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).EXP1 %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).EXP2 %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).EXP3 %></td>
                    
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
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>