<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="IM_PURORDEREdit" CodeFile="PURORDEREdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Register src="../../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<%@ Register src="../../UCtrl/Sels/wucSelSTORAGE.ascx" tagname="wucSelSTORAGE" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
<script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });


       function addRow(me) {
           var bodyObj = $(me).parent().parent().parent().next();
           var newTR = bodyObj.find("tr:first").clone();
           bodyObj.append(newTR);
       }

       function delRow(me) {
           $(me).parent().parent().remove();
       }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li class="hide"><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>
<div class="form">
    <div class="bill">
        <div>
           <dl>
               <dt><%=IM_PURORDER.Attribute.PORD_ID.ZhName %>：</dt><%--ID--%>
               <dd>
                    <input id="txtPORD_ID" type="text" runat="server"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.PORD_NO.ZhName %>：</dt><%--单据编号--%>
               <dd>
                
                    <input id="txtPORD_NO" type="text" runat="server" ck="{need:0,len:20,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.C_DATE.ZhName %>：</dt><%--单据日期--%>
               <dd>
               
                    <input id="txtC_DATE" type="text" readonly="readonly" onclick="setTime(this)" runat="server" ck="{need:0,len:100,type:3}" />
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.ORG_ID.ZhName %>：</dt><%--机构ID--%>
               <dd>
                   <selORG:wucSelORG ID="txtORG_ID" runat="server" />
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.DEPT_ID.ZhName %>：</dt><%--部门ID--%>
               <dd>
                <uc1:wucSelDept ID="txtDEPT_ID" runat="server" />
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.SUP_ID.ZhName %>：</dt><%--供应商ID--%>
               <dd>
                
                    <input id="txtSUP_ID" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.PERSON_HID.ZhName %>：</dt><%--经手人ID--%>
               <dd>
                <selStaff:wucSelStaff ID="txtPERSON_HID" runat="server" />
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.TS_NO.ZhName %>：</dt><%--运单号--%>
               <dd>
                
                    <input id="txtTS_NO" type="text" runat="server" ck="{need:0,len:20,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.GOODES_NUM.ZhName %>：</dt><%--货物数量--%>
               <dd>
                
                    <input id="txtGOODES_NUM" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.ARRIVAL_DATE.ZhName %>：</dt><%--到货日期--%>
               <dd>
               
                    <input id="txtARRIVAL_DATE" type="text" readonly="readonly" onclick="setTime(this)" runat="server" ck="{need:0,len:100,type:3}" />
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.PACKAGE_TYPE.ZhName %>：</dt><%--包装方式--%>
               <dd>
                
                    <input id="txtPACKAGE_TYPE" type="text" runat="server" ck="{need:0,len:5,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.TS_DEPT.ZhName %>：</dt><%--承运单位--%>
               <dd>
                
                    <input id="txtTS_DEPT" type="text" runat="server" ck="{need:0,len:250,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.PHONE.ZhName %>：</dt><%--电话--%>
               <dd>
                
                    <input id="txtPHONE" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.COST_PEICE_FLAG.ZhName %>：</dt><%--成本价采购--%>
               <dd>
                
                    <input id="txtCOST_PEICE_FLAG" type="text" runat="server" ck="{need:0,len:2,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.STOR_ID.ZhName %>：</dt><%--STOR_ID--%>
               <dd>
                <uc2:wucSelSTORAGE ID="txtSTOR_ID" runat="server" />
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.DEDUCTION_RATE.ZhName %>：</dt><%--扣率--%>
               <dd>
                
                    <input id="txtDEDUCTION_RATE" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.TAX_RATE.ZhName %>：</dt><%--TAX_RATE--%>
               <dd>
                
                    <input id="txtTAX_RATE" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.CREATER.ZhName %>：</dt><%--CREATER--%>
               <dd>
                
                    <input id="txtCREATER" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.CHECKER.ZhName %>：</dt><%--CHECKER--%>
               <dd>
                
                    <input id="txtCHECKER" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.NOTE.ZhName %>：</dt><%--备注--%>
               <dd>
               
                    <textarea id="txtNOTE" class="smalltextarea" cols="1" rows="1" style="height:20px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" />
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.REMARK.ZhName %>：</dt><%--摘要--%>
               <dd>
               
                    <textarea id="txtREMARK" class="smalltextarea" cols="1" rows="1" style="height:20px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" />
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.EXP1.ZhName %>：</dt><%--自定义1--%>
               <dd>
                
                    <input id="txtEXP1" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.EXP2.ZhName %>：</dt><%--自定义2--%>
               <dd>
                
                    <input id="txtEXP2" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_PURORDER.Attribute.EXP3.ZhName %>：</dt><%--自定义3--%>
               <dd>
                
                    <input id="txtEXP3" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
               </dd>
           </dl><h6></h6>
       </div>
        <div class="tblist">
        <table>
		    <thead>
			    <tr>
                    <th class="first"></th>
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.PDETAIL_ID.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.PDETAIL_ID._ZhName %></th><!--明细ID-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.PORD_ID.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.PORD_ID._ZhName %></th><!--采购单ID-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.STOR_ID.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.STOR_ID._ZhName %></th><!--仓库ID-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.PRO_ID.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.PRO_ID._ZhName %></th><!--商品ID-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.OUT_NO.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.OUT_NO._ZhName %></th><!--外部编号-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.NUM.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.NUM._ZhName %></th><!--数量-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.UNIT_EXD.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.UNIT_EXD._ZhName %></th><!--辅单价-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.CRATIO.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.CRATIO._ZhName %></th><!--换算比率-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.NUM_EXD.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.NUM_EXD._ZhName %></th><!--辅数量-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.CRESULT.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.CRESULT._ZhName %></th><!--换算结果-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.SUM_MONEY.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.SUM_MONEY._ZhName %></th><!--金额-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.DRATE.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.DRATE._ZhName %></th><!--扣率-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.DISC_UP.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.DISC_UP._ZhName %></th><!--折后单价-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.DISC_MONEY.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.DISC_MONEY._ZhName %></th><!--折后金额-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.TAX_RATE.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.TAX_RATE._ZhName %></th><!--税率-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.TAX_PRICE.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.TAX_PRICE._ZhName %></th><!--TAX_PRICE-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.TAX_MONEY.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.TAX_MONEY._ZhName %></th><!--税价合计金额-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.TAX.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.TAX._ZhName %></th><!--税额-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.RECEIVE_NUM.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.RECEIVE_NUM._ZhName %></th><!--收货数量-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.EXD1.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.EXD1._ZhName %></th><!--自定义字段1-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.EXD2.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.EXD2._ZhName %></th><!--自定义字段1-->
                    <th data="{colname:'<%=IM_PURDETAIL.Attribute.EXD3.LongName%>',show:1}"><%=IM_PURDETAIL.Attribute.EXD3._ZhName %></th><!--自定义字段1-->
                    <th class="btn"><input id="btnNewRow" type="button" value="" onclick="addRow(this);" /></th>
                </tr>
		    </thead>
		    <tbody id="bodyDetail">
                <tr>
                  <td>1</td>
                  <td><input name="PDETAIL_ID" type="text" /></td>
                  <td><input name="PORD_ID" type="text" /></td>
                  <td><input name="txt_STOR_ID" type="text" ondblclick="selSTORAGE(this);" readonly="readonly" /><input name="STOR_ID" type="hidden" /></td>
                  <td><input name="PRO_ID" type="text" /><input name="hid_PRO_ID" type="hidden" /></td>
                  <td><input name="OUT_NO" type="text" /></td>
                  <td><input name="NUM" type="text" /></td>
                  <td><input name="UNIT_EXD" type="text" /></td>
                  <td><input name="CRATIO" type="text" /></td>
                  <td><input name="NUM_EXD" type="text" /></td>
                  <td><input name="CRESULT" type="text" /></td>
                  <td><input name="SUM_MONEY" type="text" /></td>
                  <td><input name="DRATE" type="text" /></td>
                  <td><input name="DISC_UP" type="text" /></td>
                  <td><input name="DISC_MONEY" type="text" /></td>
                  <td><input name="TAX_RATE" type="text" /></td>
                  <td><input name="TAX_PRICE" type="text" /></td>
                  <td><input name="TAX_MONEY" type="text" /></td>
                  <td><input name="TAX" type="text" /></td>
                  <td><input name="RECEIVE_NUM" type="text" /></td>
                  <td><input name="EXD1" type="text" /></td>
                  <td><input name="EXD2" type="text" /></td>
                  <td><input name="EXD3" type="text" /></td>
                  <td class="btn"><input type="button" value="" onclick="delRow(this);" /></td>
                </tr>
                <tr>
                  <td>1</td>
                  <td><input name="PDETAIL_ID" type="text" /></td>
                  <td><input name="PORD_ID" type="text" /></td>
                  <td><input name="txt_STOR_ID" type="text" ondblclick="selSTORAGE(this);" readonly="readonly" /><input name="STOR_ID" type="hidden" /></td>
                  <td><input name="PRO_ID" type="text" /><input name="hid_PRO_ID" type="hidden" /></td>
                  <td><input name="OUT_NO" type="text" /></td>
                  <td><input name="NUM" type="text" /></td>
                  <td><input name="UNIT_EXD" type="text" /></td>
                  <td><input name="CRATIO" type="text" /></td>
                  <td><input name="NUM_EXD" type="text" /></td>
                  <td><input name="CRESULT" type="text" /></td>
                  <td><input name="SUM_MONEY" type="text" /></td>
                  <td><input name="DRATE" type="text" /></td>
                  <td><input name="DISC_UP" type="text" /></td>
                  <td><input name="DISC_MONEY" type="text" /></td>
                  <td><input name="TAX_RATE" type="text" /></td>
                  <td><input name="TAX_PRICE" type="text" /></td>
                  <td><input name="TAX_MONEY" type="text" /></td>
                  <td><input name="TAX" type="text" /></td>
                  <td><input name="RECEIVE_NUM" type="text" /></td>
                  <td><input name="EXD1" type="text" /></td>
                  <td><input name="EXD2" type="text" /></td>
                  <td><input name="EXD3" type="text" /></td>
                  <td class="btn"><input type="button" value="" onclick="delRow(this);" /></td>
                </tr>
                <tr>
                  <td>1</td>
                  <td><input name="PDETAIL_ID" type="text" /></td>
                  <td><input name="PORD_ID" type="text" /></td>
                  <td><input name="txt_STOR_ID" type="text" ondblclick="selSTORAGE(this);" readonly="readonly" /><input name="STOR_ID" type="hidden" /></td>
                  <td><input name="PRO_ID" type="text" /><input name="hid_PRO_ID" type="hidden" /></td>
                  <td><input name="OUT_NO" type="text" /></td>
                  <td><input name="NUM" type="text" /></td>
                  <td><input name="UNIT_EXD" type="text" /></td>
                  <td><input name="CRATIO" type="text" /></td>
                  <td><input name="NUM_EXD" type="text" /></td>
                  <td><input name="CRESULT" type="text" /></td>
                  <td><input name="SUM_MONEY" type="text" /></td>
                  <td><input name="DRATE" type="text" /></td>
                  <td><input name="DISC_UP" type="text" /></td>
                  <td><input name="DISC_MONEY" type="text" /></td>
                  <td><input name="TAX_RATE" type="text" /></td>
                  <td><input name="TAX_PRICE" type="text" /></td>
                  <td><input name="TAX_MONEY" type="text" /></td>
                  <td><input name="TAX" type="text" /></td>
                  <td><input name="RECEIVE_NUM" type="text" /></td>
                  <td><input name="EXD1" type="text" /></td>
                  <td><input name="EXD2" type="text" /></td>
                  <td><input name="EXD3" type="text" /></td>
                  <td class="btn"><input type="button" value="" onclick="delRow(this);" /></td>
                </tr>
		    </tbody>
	    </table>
        </div>
    </div>
       
    <script type="text/javascript">
//        var gridObj = $(".billdetail");
//        gridObj.flexigrid({
//            usepager: false,
//            title: '',
//            useRp: false,
//            rp: 15,
//            showTableToggleBtn: false,
//            //width: 700,
//            height: 200,
//            resizable: false,
//            striped: false,
//            hideOnSubmit: false,
//            showToggleBtn: false,
//            minColToggle: 1,
//            nowrap: false,
//            autoload: false,
//            onToggleCol: false,
//            moveCol: false,
//            onDragCol: false
//        });

        function addRow(me) {
            var trs = $("#bodyDetail").children();
            var tr = $(trs[trs.length - 1]);
            var newTR = tr.clone();
            newTR.attr("id","___tr");
            $("#bodyDetail").append(newTR);

        }
    </script>
    </div>
   <div class="tool">
     <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li class="hide"><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>