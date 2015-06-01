<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STAFFManage" CodeFile="STAFFManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/Mdl/Manager.js?r=<%=new Random().Next(1000) %>" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">

    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        manager.initPageSizeEvt("txtPageNum");

        bindWinResize(45);
    });

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<%--<input id="hidColSort" type="hidden" runat="server" />
<asp:LinkButton ID="lbColSort" runat="server" CommandName="ColSort" CommandArgument="STAFF_ID|ASC" oncommand="lbColSort_Command"></asp:LinkButton>
--%> 
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind">
        <dl colname="HR_STAFF.STAFF_NO" class="hide">
               <dt><%=HR_STAFF.Attribute.STAFF_NO.ZhName %>：</dt><!--员工号-->
               <dd><span>
                
                    <input id="txtSTAFF_NO" type="text" runat="server" />
               </span></dd>
        </dl>
        <dl colname="HR_STAFF.NAME">
               <dt><%=HR_STAFF.Attribute.STAFF_NAME.ZhName%>：</dt><!--员工姓名-->
               <dd><span>
                    <input id="txtNAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        <dl colname="HR_STAFF.DEPT_ID" class="hide">
               <dt><%=HR_STAFF.Attribute.DEPT_ID.ZhName %>：</dt><!--所属部门标识-->
               <dd><span>
                
                    <input id="txtDEPT_ID" type="text" runat="server" />
               </span></dd>
        </dl>
        <dl colname="HR_STAFF.GENDER">
            <dt><%=HR_STAFF.Attribute.GENDER.ZhName %>：</dt><!--性别-->
            <dd><span>
               
                <select id="txtGENDER" runat="server" >
                </select>
            </span></dd>
        </dl>
        <dl colname="HR_STAFF.POS_NAME">
            <dt><%=HR_STAFF.Attribute.POS_NAME.ZhName %>：</dt><!--职位描述-->
            <dd><span>
                
                <input id="txtPOS_NAME" type="text" runat="server" />
            </span></dd>
        </dl>
        <dl colname="HR_STAFF.STATION_CODE" class="hide">
            <dt><%=HR_STAFF.Attribute.STATION_CODE.ZhName %>：</dt><!--岗位编码-->
            <dd><span>
                
                <input id="txtSTATION_CODE" type="text" runat="server" />
            </span></dd>
    </dl>
        <dl colname="HR_STAFF.WORK_TYPE_CODE">
            <dt><%=HR_STAFF.Attribute.WORK_TYPE_CODE.ZhName %>：</dt><!--工作分工种类-->
            <dd><span>
               
                <select id="txtWORK_TYPE_CODE" runat="server" >
                </select>
            </span></dd>
    </dl>
        <dl colname="HR_STAFF.TECH_LEVEL_CODE">
            <dt><%=HR_STAFF.Attribute.TECH_LEVEL_CODE.ZhName %>：</dt><!--技术等级-->
            <dd><span>
                
                <input id="txtTECH_LEVEL_CODE" type="text" runat="server" />
            </span></dd>
    </dl>
        <dl colname="HR_STAFF.MOBILE">
            <dt><%=HR_STAFF.Attribute.MOBILE.ZhName %>：</dt><!--手机号码-->
            <dd><span>
                
                <input id="txtMOBILE" type="text" runat="server" />
            </span></dd>
    </dl>
        <dl colname="HR_STAFF.OFFICE_TEL">
            <dt><%=HR_STAFF.Attribute.OFFICE_TEL.ZhName %>：</dt><!--办公电弧-->
            <dd><span>
                
                <input id="txtOFFICE_TEL" type="text" runat="server" />
            </span></dd>
      </dl>
        <dl colname="HR_STAFF.CERT_FLAG" class="hide"><dt><%=HR_STAFF.Attribute.CERT_FLAG.ZhName %>：</dt><!--持证标记-->
            <dd><span>
                
                <input id="txtCERT_FLAG" type="text" runat="server" />
            </span></dd>
      </dl>
        <dl colname="HR_STAFF.ON_POS_FLAG" class="hide"><dt><%=HR_STAFF.Attribute.ON_POS_FLAG.ZhName %>：</dt><!--在岗标志-->
            <dd><span>
                
                <input id="txtON_POS_FLAG" type="text" runat="server" />
            </span></dd>
    </dl>
        <dl colname="HR_STAFF.JOIN_DATE" class="hide">
            <dt><%=HR_STAFF.Attribute.JOIN_DATE.ZhName %>：</dt><!--工作日期-->
            <dd><span>
                
                <input id="txtJOIN_DATE" type="text" runat="server" />
            </span></dd>
     </dl>
        <dl colname="HR_STAFF.TITLE_CODE" class="hide"><dt><%=HR_STAFF.Attribute.TITLE_CODE.ZhName %>：</dt><!--职称编码-->
            <dd><span>
                
                <input id="txtTITLE_CODE" type="text" runat="server" />
            </span></dd>
      </dl>
        <dl colname="HR_STAFF.STATUS_CODE" class="hide"><dt><%=HR_STAFF.Attribute.STATUS_CODE.ZhName %>：</dt><!--调退亡状态-->
            <dd><span>
                
                <input id="txtSTATUS_CODE" type="text" runat="server" />
            </span></dd>
    </dl>
        <dl colname="HR_STAFF.DEGREE_CODE">
            <dt><%=HR_STAFF.Attribute.DEGREE_CODE.ZhName %>：</dt><!--文化程度-->
            <dd><span>
                
                <input id="txtDEGREE_CODE" type="text" runat="server" />
            </span></dd>
       </dl>
        <dl colname="HR_STAFF.MAJOR"><dt><%=HR_STAFF.Attribute.MAJOR.ZhName %>：</dt><!--专业-->
            <dd><span>
                
                <input id="txtMAJOR" type="text" runat="server" />
            </span></dd>
      </dl><dl class="btn"><dt>&nbsp;</dt>
            <dd>
            <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" /></span>
              <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
              <span><input id="btnMore" type="button" value="展开更多条件" class="toshow" onclick="_topMoreColsToFind(this);"/></span>
            </dd>
    </dl>
    <div class="clear"></div>
    </div>  
    <div class="tool">
        <ul>
            <li><span class="btn"><input power="NewStaff" id="btn_New" type="button" value="新建" onclick="manager.newRecord('STAFFEdit.aspx?DEPT_ID=<%=deptid %>','PID=<%=pid %>&DeptID=<%=deptid %>');" /></span></li>
            <li><span class="btn"><input power="NewSubStaff" id="Button1" type="button" value="新建下级" onclick="manager.newRecord('STAFFEdit.aspx?DEPT_ID=<%=deptid %>','PID');" /></span></li>
            <li><span class="btn"><input power="EditStaff" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('STAFFEdit.aspx');" /></span></li>
            <li><span class="btn"><input power="DeleteStaffs" id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('STAFFBack.aspx');" /></span></li>
            <li><a href="STAFFManage.aspx?id=&pid=&no=1&sc=1&name=%u62D3%u534E%u80A1%u4EFD&ntype=org&tree=0.6364479532996792" target="_blank">未配置员工</a></li>
        </ul>
        <ol>
            <li><b>排序</b></li>
            <li>
            <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="true" 
                    onselectedindexchanged="ddlSort_SelectedIndexChanged">
            </asp:DropDownList></li>
            
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span class="btn"><asp:Button ID="btnSetPageSize" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="olAllColCBS"></ol></li>
        </ol>
    </div>
    <div class="tblist" >
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="STAFF_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td>序号&nbsp;<a href="StaffManage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>
                    <td data="{colname:'<%=HR_STAFF.Attribute.STAFF_NAME.LongName%>'}"><%=HR_STAFF.Attribute.STAFF_NAME._ZhName%></td><!--员工姓名-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.STAFF_ID.LongName%>',show:0}"><%=HR_STAFF.Attribute.STAFF_ID._ZhName %></td><!--员工标示-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.STAFF_NO.LongName%>',show:0}"><%=HR_STAFF.Attribute.STAFF_NO._ZhName %></td><!--员工号-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.DEPT_ID.LongName%>',show:0}"><%=HR_STAFF.Attribute.DEPT_ID._ZhName %></td><!--所属部门标识-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.GENDER.LongName%>'}"><%=HR_STAFF.Attribute.GENDER._ZhName %></td><!--性别-->
<%--                    
                    <td data="<%=HR_STAFF.Attribute.PHOTO.LongName%>"><%=HR_STAFF.Attribute.PHOTO._ZhName %></td><!--照片地址-->
                    
                    --%>
                    
                    <td data="{colname:'<%=HR_STAFF.Attribute.MOBILE.LongName%>',show:1}"><%=HR_STAFF.Attribute.MOBILE._ZhName %></td><!--手机号码-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.OFFICE_TEL.LongName%>',show:1}"><%=HR_STAFF.Attribute.OFFICE_TEL._ZhName %></td><!--办公电弧-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.STATION_CODE.LongName%>',show:1}"><%=HR_STAFF.Attribute.STATION_CODE._ZhName %></td><!--岗位编码-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.POS_NAME.LongName%>',show:0}"><%=HR_STAFF.Attribute.POS_NAME._ZhName %></td><!--职位描述-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.PNAME.LongName%>',show:0}"><%=HR_STAFF.Attribute.PNAME._ZhName %></td><!--岗位编码-->
                    
                    <td data="{colname:'<%=HR_STAFF.Attribute.WORK_TYPE_CODE.LongName%>',show:0}"><%=HR_STAFF.Attribute.WORK_TYPE_CODE._ZhName %></td><!--工作分工种类-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.TECH_LEVEL_CODE.LongName%>',show:0}"><%=HR_STAFF.Attribute.TECH_LEVEL_CODE._ZhName %></td><!--技术等级-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.YMD.LongName%>',show:0}"><%=HR_STAFF.Attribute.YMD._ZhName %></td><!--出生年月-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.CERT_FLAG.LongName%>',show:0}"><%=HR_STAFF.Attribute.CERT_FLAG._ZhName %></td><!--持证标记-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.FIXED_FLAG.LongName%>',show:0}"><%=HR_STAFF.Attribute.FIXED_FLAG._ZhName %></td><!--定编标志-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.ON_POS_FLAG.LongName%>',show:0}"><%=HR_STAFF.Attribute.ON_POS_FLAG._ZhName %></td><!--在岗标志-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.PROFESSION_CODE.LongName%>',show:0}"><%=HR_STAFF.Attribute.PROFESSION_CODE._ZhName %></td><!--本专业工作日期-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.PROFESSION_BGN_DATE.LongName%>',show:0}"><%=HR_STAFF.Attribute.PROFESSION_BGN_DATE._ZhName %></td><!--本专业工作日期-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.JOIN_DATE.LongName%>',show:0}"><%=HR_STAFF.Attribute.JOIN_DATE._ZhName %></td><!--工作日期-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.POLITICAL_STATUS_CODE.LongName%>',show:0}"><%=HR_STAFF.Attribute.POLITICAL_STATUS_CODE._ZhName %></td><!--政治面貌-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.TITLE_CODE.LongName%>',show:0}"><%=HR_STAFF.Attribute.TITLE_CODE._ZhName %></td><!--职称编码-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.STATUS_CODE.LongName%>',show:0}"><%=HR_STAFF.Attribute.STATUS_CODE._ZhName %></td><!--调退亡状态-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.ADDR.LongName%>',show:0}"><%=HR_STAFF.Attribute.ADDR._ZhName %></td><!--联系地址-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.EMAIL.LongName%>',show:0}"><%=HR_STAFF.Attribute.EMAIL._ZhName %></td><!--电子邮件-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.NATION.LongName%>',show:0}"><%=HR_STAFF.Attribute.NATION._ZhName %></td><!--民族-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.NATIVE_PLACE.LongName%>',show:0}"><%=HR_STAFF.Attribute.NATIVE_PLACE._ZhName %></td><!--籍贯-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.POST_NO.LongName%>',show:0}"><%=HR_STAFF.Attribute.POST_NO._ZhName %></td><!--邮政编码-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.DEGREE_CODE.LongName%>',show:0}"><%=HR_STAFF.Attribute.DEGREE_CODE._ZhName %></td><!--文化程度-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.GRAD_SCHOOL.LongName%>',show:0}"><%=HR_STAFF.Attribute.GRAD_SCHOOL._ZhName %></td><!--毕业学校-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.GRAD_DATE.LongName%>',show:0}"><%=HR_STAFF.Attribute.GRAD_DATE._ZhName %></td><!--毕业时间-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.MAJOR.LongName%>',show:0}"><%=HR_STAFF.Attribute.MAJOR._ZhName %></td><!--专业-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.AF_ADDTIME.LongName%>',show:0}"><%=HR_STAFF.Attribute.AF_ADDTIME._ZhName %></td><!--录入时间-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.AF_EDITTIME.LongName%>',show:0}"><%=HR_STAFF.Attribute.AF_EDITTIME._ZhName%></td><!--修改时间-->
                    <td data="{colname:'<%=HR_STAFF.Attribute.USER_ID.LongName%>',show:0}"><%=HR_STAFF.Attribute.USER_ID._ZhName %></td><!--用户标识-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_STAFF)Container.DataItem).STAFF_ID%>" /><input value="<%#((HR_STAFF)Container.DataItem).PATH%>" type="hidden" /></td>
                    <td><%#showLeftLinks(((HR_STAFF)Container.DataItem).PATH, ((HR_STAFF)Container.DataItem).PNAME, Container.ItemIndex)%></td>
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NAME%></td>
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_ID %></td>
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NO %></td>
                    <td><%#((HR_STAFF)Container.DataItem).GetValue(HR_DEPT_STAFF.Attribute.DEPT_ID) %></td>
                    <td><%#((HR_STAFF)Container.DataItem).GENDER=="0"?"女":"男"%></td>
                  <%--  <td><%#FormHelper.GetText(HR_STAFF.Attribute.GENDER, ((HR_STAFF)Container.DataItem).GENDER)%></td>--%>
                   <%--  <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((HR_STAFF)Container.DataItem).PHOTO) %></td>--%>
                    <td><%#((HR_STAFF)Container.DataItem).MOBILE %></td>
                    <td><%#((HR_STAFF)Container.DataItem).OFFICE_TEL %></td>
                    <td><%#((HR_STAFF)Container.DataItem).STATION_CODE %></td>
                    <td><%#((HR_STAFF)Container.DataItem).POS_NAME %></td>
                    <td><%#((HR_STAFF)Container.DataItem).PNAME %></td>
                    <td><%#FormHelper.GetText(HR_STAFF.Attribute.WORK_TYPE_CODE, ((HR_STAFF)Container.DataItem).WORK_TYPE_CODE)%></td>
                    <td><%#((HR_STAFF)Container.DataItem).TECH_LEVEL_CODE %></td>
                    <td><%#((HR_STAFF)Container.DataItem).YMD %></td>
                    <td><%#((HR_STAFF)Container.DataItem).CERT_FLAG %></td>
                    <td><%#((HR_STAFF)Container.DataItem).FIXED_FLAG %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).ON_POS_FLAG %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).PROFESSION_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).PROFESSION_BGN_DATE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).JOIN_DATE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).POLITICAL_STATUS_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).TITLE_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STATUS_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).ADDR %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).NATION %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).NATIVE_PLACE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).POST_NO %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).DEGREE_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).GRAD_SCHOOL %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).GRAD_DATE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).MAJOR %></td>
                    
                    
                    <td><%#(((HR_STAFF)Container.DataItem).AF_ADDTIME == DateTime.MinValue) ? "" : ((HR_STAFF)Container.DataItem).AF_ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((HR_STAFF)Container.DataItem).AF_EDITTIME == DateTime.MinValue) ? "" : ((HR_STAFF)Container.DataItem).AF_EDITTIME.ToString("yyyy-MM-dd HH:mm")%></td>

                    <td><%#((HR_STAFF)Container.DataItem).USER_ID %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="path-url">
        <strong>当前路径：</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
    <div class="tblist" style="min-height:60px">
         <table cellpadding="0" cellspacing="0" id="Table1">
            <thead>
                <tr keyname="DEPT_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <%--<td data="{colname:'<%=HR_DEPT_MANAGER.Attribute.DEPT_ID.LongName%>',show:1}"><%=HR_DEPT_MANAGER.Attribute.DEPT_ID._ZhName %></td><!--部门标识-->
                    --%>
                    
                    <td data="{colname:'<%=HR_DEPT_MANAGER.Attribute.STAFF_ID.LongName%>',show:1}" >主管姓名</td><!--员工标识-->
                    
                    
                    <td data="{colname:'<%=HR_DEPT_MANAGER.Attribute.MAG_NAME.LongName%>',show:1}">管理人级别</td><!--管理人级别-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList_DEPT_MANAGER" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_DEPT_MANAGER)Container.DataItem).MAG_ID%>" /></td>
                  <%--  <td><%#((HR_DEPT_MANAGER)Container.DataItem).DEPT_ID %></td>--%>
                    <td style="color:Blue"><%#((HR_DEPT_MANAGER)Container.DataItem).MAG_NAME %></td>

                    <td><%#FormHelper.GetText(HR_DEPT_MANAGER.Attribute.LEVEL_CODE, ((HR_DEPT_MANAGER)Container.DataItem).LEVEL_CODE)%></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="tblist" style="min-height:60px">
         <table cellpadding="0" cellspacing="0" id="Table2">
            <thead>
                <tr keyname="STATION_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <%--<td data="{colname:'<%=HR_STATION.Attribute.STATION_ID.LongName%>',show:1}"><%=HR_STATION.Attribute.STATION_ID._ZhName %></td><!--岗位编号-->
                    --%><td data="{colname:'<%=HR_STATION.Attribute.SORT_NO.LongName%>',show:1}"><%=HR_STATION.Attribute.SORT_NO._ZhName %></td><!--序号-->
                    <td data="{colname:'<%=HR_STATION.Attribute.STATION_NAME.LongName%>',show:1}"><%=HR_STATION.Attribute.STATION_NAME._ZhName %></td><!--岗位名称-->
<%--                    <td data="{colname:'<%=HR_STATION.Attribute.PID.LongName%>',show:1}"><%=HR_STATION.Attribute.PID._ZhName %></td><!--父编号-->
                    <td data="{colname:'<%=HR_STATION.Attribute.PATH.LongName%>',show:1}"><%=HR_STATION.Attribute.PATH._ZhName %></td><!--编号路径-->
                    --%>
                    <td data="{colname:'<%=HR_STATION.Attribute.SUB_NUM.LongName%>',show:1}"><%=HR_STATION.Attribute.SUB_NUM._ZhName %></td><!--子岗位个数-->
                    <td data="{colname:'<%=HR_STATION.Attribute.LEVEL_ID.LongName%>',show:1}"><%=HR_STATION_TYPE.Attribute.TYPE_NAME._ZhName%></td><!--类型-->
                    <td data="{colname:'<%=HR_STATION.Attribute.LEVEL_ID.LongName%>',show:1}"><%=HR_STATION_LEVEL.Attribute.LEVEL_NAME._ZhName%></td><!--等级-->
                    <td data="{colname:'<%=HR_STATION.Attribute.LEVEL_ID.LongName%>',show:1}"><%=HR_STATION.Attribute.MBR_NUM._ZhName%></td><!--员工定编-->
                    </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList_HR_STATION" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_STATION)Container.DataItem).STATION_ID%>" /></td>
                    <td><%#((HR_STATION)Container.DataItem).SORT_NO %></td>
                 <%--   <td><%#((HR_STATION)Container.DataItem).STATION_ID %></td>--%>
                    <td><%#((HR_STATION)Container.DataItem).STATION_NAME %></td>
<%--                    <td><%#((HR_STATION)Container.DataItem).PID %></td>
                    <td><%#((HR_STATION)Container.DataItem).PATH %></td>--%>
                    <td><%#((HR_STATION)Container.DataItem).SUB_NUM %></td>
                    <td><%#((HR_STATION)Container.DataItem).GetValue(HR_STATION_TYPE.Attribute.TYPE_NAME)%></td>
                    <td><%#((HR_STATION)Container.DataItem).GetValue(HR_STATION_LEVEL.Attribute.LEVEL_NAME)%></td>
                    <td><%#((HR_STATION)Container.DataItem).MBR_NUM %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
</div>
</asp:Content>