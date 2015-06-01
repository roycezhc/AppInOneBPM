<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STAFFSel" CodeFile="STAFFSel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
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
    
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <script type="text/javascript">
       function selOK_B(id) {
           $("input[id$='hidSelID']").val(id);
           __doPostBack("ctl00$cphBody$LinkButton1", "");
       }
   </script>
   <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
  </div>
   <div class="topfind"> 
          <dl class="hide">
               <dt><%=HR_STAFF.Attribute.STAFF_NO.ZhName %>：</dt><!--员工号-->
               <dd><span><input id="txtSTAFF_NO" type="text" runat="server" />
               </span></dd>
          </dl>
          <dl>
               <dt><%=HR_STAFF.Attribute.STAFF_NAME.ZhName%>：</dt><!--员工姓名-->
               <dd><span><input id="txtNAME" type="text" runat="server" />
               </span></dd>
        </dl>
          <dl class="hide">
               <dt><%=HR_STAFF.Attribute.SNAME.ZhName%>：</dt><%--SNAME--%>
               <dd>
                
                    <span><input id="txtSNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
          </dl>
          <dl>
               <dt><%=HR_STAFF.Attribute.RNAME.ZhName%>：</dt><%--RNAME--%>
               <dd>
                
                    <span><input id="txtRNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
          <dl class="hide">
               <dt><%=HR_STAFF.Attribute.DEPT_ID.ZhName %>：</dt><!--所属部门标识-->
               <dd><span>
                
                    <input id="txtDEPT_ID" type="text" runat="server" />
               </span></dd>
          </dl>
          <dl>
               <dt><%=HR_STAFF.Attribute.GENDER.ZhName %>：</dt><!--性别-->
               <dd><span>
               
                    <select id="txtGENDER" runat="server" >
                    </select>
               </span></dd>
        </dl>
          <dl class="hide">
               <dt><%=HR_STAFF.Attribute.STATION_CODE.ZhName %>：</dt><!--岗位编码-->
               <dd><span>
                
                    <input id="txtSTATION_CODE" type="text" runat="server" />
               </span></dd>
          </dl>
          <dl class="hide">
               <dt><%=HR_STAFF.Attribute.MOBILE.ZhName %>：</dt><!--手机号码-->
               <dd><span>
                
                    <input id="txtMOBILE" type="text" runat="server" />
               </span></dd>
        </dl>
          <dl class="hide">
               <dt><%=HR_STAFF.Attribute.OFFICE_TEL.ZhName %>：</dt><!--办公电弧-->
               <dd><span>
                
                    <input id="txtOFFICE_TEL" type="text" runat="server" />
               </span></dd>
          </dl>
          <dl class="hide"><dt><%=HR_STAFF.Attribute.ON_POS_FLAG.ZhName %>：</dt><!--在岗标志-->
               <dd><span>
                
                    <input id="txtON_POS_FLAG" type="text" runat="server" />
               </span></dd>
        </dl>
          <dl class="hide">
               <dt><%=HR_STAFF.Attribute.TITLE_CODE.ZhName %>：</dt><!--职称编码-->
               <dd><span>
                
                    <input id="txtTITLE_CODE" type="text" runat="server" />
               </span></dd>
          </dl>
          <dl><dt><%=HR_STAFF.Attribute.EMAIL.ZhName %>：</dt><!--电子邮件-->
               <dd><span>
                
                    <input id="txtEMAIL" type="text" runat="server" />
               </span></dd>
          </dl>
          <dl class="btn"><dd>
               <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click"/></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               <span><input id="btnSelOK" type="button" onclick="selok();" value="确定" /></span>
               </dd>
        </dl>
        <div class="clear"></div>
    </div> 
        <div class="tblist" id="tblist" style=" min-height:100px;">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td><a href="STAFFSel.aspx" id="a_top" runat="server"><b>/顶级</b></a></td>
                    <td><%=HR_STAFF.Attribute.STAFF_ID._ZhName %></td><!--员工标示-->
                    <td><%=HR_STAFF.Attribute.STAFF_NAME._ZhName%></td><!--员工姓名-->
                    <td><%=HR_STAFF.Attribute.STAFF_NO._ZhName %></td><!--员工号-->
                    <td><%=HR_STAFF.Attribute.DEPT_ID._ZhName %></td><!--所属部门标识-->
                    <td><%=HR_STAFF.Attribute.GENDER._ZhName %></td><!--性别-->
                    <td><%=HR_STAFF.Attribute.STATION_CODE._ZhName %></td><!--岗位编码-->
                    <td><%=HR_STAFF.Attribute.MOBILE._ZhName %></td><!--手机号码-->
                    <td><%=HR_STAFF.Attribute.OFFICE_TEL._ZhName %></td><!--办公电弧-->
<%--                    <td><%=HR_STAFF.Attribute.ON_POS_FLAG._ZhName %></td><!--在岗标志-->
                    <td><%=HR_STAFF.Attribute.TITLE_CODE._ZhName %></td><!--职称编码-->
                    <td><%=HR_STAFF.Attribute.STATUS_CODE._ZhName %></td><!--调退亡状态-->
                    <td><%=HR_STAFF.Attribute.EMAIL._ZhName %></td><!--电子邮件-->
                    <td><%=HR_STAFF.Attribute.AF_ADDTIME._ZhName %></td><!--录入时间-->--%>
                    <td><%=HR_STAFF.Attribute.USER_ID._ZhName %></td><!--用户标识-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbodyList">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                     <td><%#showLeftLinks(((HR_STAFF)Container.DataItem).PATH, ((HR_STAFF)Container.DataItem).PNAME)%></td>
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_ID %></td>
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NAME%></td>
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NO %></td>
                    <td><%#((HR_STAFF)Container.DataItem).DEPT_ID %></td>
                    <td><%#FormHelper.GetText(HR_STAFF.Attribute.GENDER, ((HR_STAFF)Container.DataItem).GENDER)%></td>
                    <td><%#((HR_STAFF)Container.DataItem).STATION_CODE %></td>
                    <td><%#((HR_STAFF)Container.DataItem).MOBILE %></td>
                    <td><%#((HR_STAFF)Container.DataItem).OFFICE_TEL %></td>
                   <%-- <td><%#((HR_STAFF)Container.DataItem).ON_POS_FLAG %></td>
                    <td><%#((HR_STAFF)Container.DataItem).TITLE_CODE %></td>
                    <td><%#((HR_STAFF)Container.DataItem).STATUS_CODE %></td>
                    <td><%#((HR_STAFF)Container.DataItem).EMAIL %></td>
                    <td><%#(((HR_STAFF)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((HR_STAFF)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>--%>
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
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

