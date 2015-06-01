<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="TF_TABLEManage.aspx.cs" Inherits="TF_TABLEManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.hide_DL();
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
        <%=initValue %>
        $('#txtTB_NAME').val('name1');        
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<input id="hidVal" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server" EnableViewState="false"></asp:Literal></div>
   <div class="topfind"><!--需要隐去时，用 style="display:none;"-->
        <asp:Literal ID="Lit_Finder" runat="server" EnableViewState="false">
            <!--循环1-->
                    <dl colname="{首字母大写表名}.{首字母大写字段名}">
                    <dt>{字段中文名}：</dt><dd>
                   <!--Switch-->
                        <!--Case InputString--><!--文字-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:0,min:0,max:50,need:0}"/></span>
                        <!--Case CheckBoxList--><!--复选列表框-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case FileUpImage--><!--图片上传-->
<span><input id="{CtrlNAME}" name="{CtrlNAME}" type="file" style="width:150px;height:18px;" exdfile=".jpg|.gif|.png|.jpeg|.bmp|.ico" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case FileUpUpDoc--><!--文档上传-->
<span><input name="{CtrlNAME}" type="file" style="width:150px;" exdfile=".txt|.doc|.docx|.xls|.ppt|.rar|.zip" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case HTML--><!--HTML内容-->
<span><textarea cols="80" rows="6" name="{CtrlNAME}" ck="{type:0,min:0,max:3600,need:0}">{VALUE}</textarea></span>
                        
                        <!--Case InputDate--><!--日期-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:3,need:0}" onclick="setday(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDateTime--><!--日期时间-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:3,need:0}" onclick="setdatetime(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDecimal--><!--数字-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:1,min:0,max:99999999,need:0}" {CAL_FORMULA}/></span>
                        
                        <!--Case InputNumber--><!--整数-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:2,min:0,max:99999999,need:0}" {CAL_FORMULA}/></span>
                        
                        <!--Case OpenSelDept--><!--选择部门-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{CtrlNAME}" value="{VALUE}" />
<input class="sel" type="button" onclick="selDept(this);" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelExistsRec--><!--选择本表记录-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{CtrlNAME}" value="{VALUE}" />
<input class="sel" type="button" onclick="selExistsRec(this,'{SEL_TB_INFO}');" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelStaff--><!--选择员工-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{CtrlNAME}" value="{VALUE}" />
<input class="sel" type="button" onclick="selStaff(this);" value="" style="float:left;" /></span>
                        
                        <!--Case RadioBoxList--><!--单选列表框-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case SelectDrop--><!--下拉列表-->
<span><select name="{首字母大写字段名}"><!--options--></select></span>
                        
                        <!--Case Text--><!--大文本内容-->
<span><textarea cols="80" rows="6" name="{CtrlNAME}" ck="{type:0,min:0,max:3000,need:0}">{VALUE}</textarea></span>
                        
                    <!--EndSwitch-->
                    </dd>
                 </dl>
            <!--结束循环1-->
       </asp:Literal>
           <dl class="btn"><dd>
                <%--<span><input name="btnFind" type="submit" value="查询"  /></span>--%>
                <asp:Button ID="btnFind" Text="查询" runat="server" onclick="btnFind_Click" />
                <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
           <asp:Literal ID="Lit_FinderButton" runat="server" EnableViewState="false"> 
           <!--循环2-->
                <!--权限控制的按钮-->
           <!--结束循环2-->
           </asp:Literal> 
           </dd></dl>
       <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><b>视图:</b></li><li><a href="?tab=all">所有</a></li>
            <asp:Literal ID="Lit_View" runat="server" EnableViewState="false">
            
            <!--循环2-->
            <li>条件1视图</li>
            <li>条件2视图</li>
            <li>条件3视图</li>
            <li>条件4视图</li>
            <!--结束循环2-->
            
            </asp:Literal> 

            <li>
            <select><option value="">创建视图</option><option value="">编辑视图</option><option value="">复制视图</option>
            <option value="">删除视图</option>
            <option value="">调整视图顺序</option></select>
            </li>
        </ul>
        <ol>
            
        </ol>
    </div>

    <div class="tool">    
        <asp:Literal ID="Lit_ToolLeftButton" runat="server" EnableViewState="false">        
            <ul>
               <li><a> 查看范围: </a></li>
               <li><select><option value="">所有数据</option><option value="" selected>我创建的数据</option><option value="">下属的数据</option>
                <option value="">"***人"的数据</option></select></li>
            <!--循环2-->
                <li><span><input power="newTF_TABLE" id="btn_New" type="button" value="新建" onclick="manager.newRecord('TF_TABLEEdit.aspx');" /></span></li>
                <li><span><input power="editTF_TABLE" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('TF_TABLEEdit.aspx');" /></span></li>
    <%--            <li><span class="btn"><input power="newTF_TABLE" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
                <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('TF_TABLEBack.aspx');" /></span></li>
                <li><span>                
                    <select><option value="">批量修改</option><option value="">批量删除</option><option value="">修改负责人</option>
                    <option value="">合并数据</option>
                    <option value="">批量发短信</option>
                    <option value="">批量发邮件</option>
                    </select>
                </span></li>
            <!--结束循环2-->
            </ul>
   </asp:Literal>         
            <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" name="txtPageSize" type="text" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="btnSetPageSize" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
      </div>
    
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
            <!-- Table Headers -->
               <asp:Literal ID="Lit_ListHeader" runat="server" EnableViewState="false">
                <tr keyname="TB_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                <!--循环3-->
                <td data="{colname:'[{首字母大写表名}.{首字母大写字段名}.LongName]',show:1}">{字段中文名}</td>
                <!--结束循环3-->                
                </tr>
                    </asp:Literal>                    
            </thead>   
            <!-- Table Contents -->
             <asp:Literal ID="Lit_RepList" runat="server" EnableViewState="false">         
            <tbody>             
             <!--循环1-->
                <tr>
                    <td class="first"><input type="checkbox" value="[{首字母大写表名}.{第一列首字母大写字段名}]" /></td>               
               <!--循环4-->
                   <%--<td><%#showLeftLinks([TF_TABLE.PATH], [TF_TABLE.PNAME], ItemIndex)%></td>--%>
                   <!--Switch-->
                     <!--Case InputString--><!--文字-->
                    <td>{字段值}</td>

                    <!--Case SelectDrop--><!--下拉列表-->
                    <td>{字段值}</td>

                    <!--Case Text--><!--大文本内容-->
                     <td>{字段值}</td>
                    <!--EndSwitch-->
                <!--结束循环4-->
            </tr>
            <!--结束循环1-->   
            </tbody>            
            </asp:Literal>
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