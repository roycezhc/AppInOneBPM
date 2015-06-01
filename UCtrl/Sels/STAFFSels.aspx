<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STAFF_STAFFSels" CodeFile="STAFFSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
        <script type="text/javascript">$(function () { Sels_Load(); });</script>
    <script type="text/javascript">
        var manager = new ListManager({listID:'divList'});
        $(function () {
            Sels.Para.idIndex = 2;
            Sels.Para.nameIndex = 3;
            manager.initBodyRows();
        });

        function _canSel(tds) {
            var tdObj = $(tds[1]);
            var aObj = tdObj.find("a");
            if (aObj.length > 0) {
                return false;
            }
            return true;
        }
    </script>

    <style type="text/css">
    #divList tbody tr td{ cursor:pointer;}
    .lrlayout .left{border:none;}
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
    <input id="hidCondition" type="hidden" runat="server" />
    <input id="hidOld" type="hidden" runat="server" />
    <input id="hidInitIDS" type="hidden" runat="server" />
    <div class="titnav">
       <dl><dt><b><%#title %>多选</b></dt><dd></dd></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
     <div class="topfind"> 
          <dl>
               <dt><%=HR_STAFF.Attribute.STAFF_NO.ZhName %>：</dt><!--员工号-->
               <dd><span><input id="txtSTAFF_NO" type="text" runat="server" />
               </span></dd>
          </dl>
          <dl>
               <dt><%=HR_STAFF.Attribute.STAFF_NAME.ZhName%>：</dt><!--员工姓名-->
               <dd><span><input id="txtNAME" type="text" runat="server" />
               </span></dd>
        </dl>
          <dl>
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
          <dl>
               <dt><%=HR_STAFF.Attribute.GENDER.ZhName %>：</dt><!--性别-->
               <dd><span>
               
                    <select id="txtGENDER" runat="server" >
                    </select>
               </span></dd>
        </dl>
          <dl>
               <dt><%=HR_STAFF.Attribute.STATION_CODE.ZhName %>：</dt><!--岗位编码-->
               <dd><span>
                
                    <input id="txtSTATION_CODE" type="text" runat="server" />
               </span></dd>
          </dl>
          <dl>
               <dt><%=HR_STAFF.Attribute.MOBILE.ZhName %>：</dt><!--手机号码-->
               <dd><span>
                
                    <input id="txtMOBILE" type="text" runat="server" />
               </span></dd>
        </dl>
          <dl>
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
               <span><input id="btnSelOK" type="button" onclick="selok();" value="确定选择" /></span>
               </dd>
        </dl>
        <div class="clear"></div>
    </div> 
    <div class="lrlayout">
    <div class="left" style="width:150px;height:400px;">
       <select id="selectedlist" multiple="multiple" style="color:Blue;width:100%;height:100%;">
       </select>
    </div>
    <div class="right" style="margin-left:152px;height:400px;">
    <div class="tblist" id="divList"  style="min-height:50px;">
       <table cellpadding="0" cellspacing="0">
             <thead>
                <tr>
                    <td class="first"><input type="checkbox" id="ckSelAll" name="all" value='全选' onclick='_selAll(this);'/></td>
                     <td><a href="STAFFSels.aspx" id="a_top" runat="server"><b>/顶级</b></a></td>
                    <td><%=HR_STAFF.Attribute.STAFF_ID._ZhName %></td><!--员工标示-->
                    <td><%=HR_STAFF.Attribute.STAFF_NAME._ZhName%></td><!--员工姓名-->
                    <td><%=HR_STAFF.Attribute.STAFF_NO._ZhName %></td><!--员工号-->
                    <td><%=HR_STAFF.Attribute.DEPT_ID._ZhName %></td><!--所属部门标识-->
                    <td><%=HR_STAFF.Attribute.GENDER._ZhName %></td><!--性别-->
                    <td><%=HR_STAFF.Attribute.STATION_CODE._ZhName %></td><!--岗位编码-->
                    <td><%=HR_STAFF.Attribute.MOBILE._ZhName %></td><!--手机号码-->
                    <td><%=HR_STAFF.Attribute.OFFICE_TEL._ZhName %></td><!--办公电弧-->
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                    <tr>
                    <td class="first"><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((HR_STAFF)Container.DataItem).STAFF_ID %>" /></td>
                    <td><%#showLeftLinks(((HR_STAFF)Container.DataItem).PATH, ((HR_STAFF)Container.DataItem).PNAME)%></td>
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_ID %></td>
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NAME%></td>
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NO %></td>
                    <td><%#((HR_STAFF)Container.DataItem).DEPT_ID %></td>
                    <td><%#FormHelper.GetText(HR_STAFF.Attribute.GENDER, ((HR_STAFF)Container.DataItem).GENDER)%></td>
                    <td><%#((HR_STAFF)Container.DataItem).STATION_CODE %></td>
                    <td><%#((HR_STAFF)Container.DataItem).MOBILE %></td>
                    <td><%#((HR_STAFF)Container.DataItem).OFFICE_TEL %></td>
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
     </div>
     </div>
</div>
</asp:Content>
