<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CK_USERINFOSel" CodeFile="HR_CK_USERINFOSel.aspx.cs" %>
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
   <div class="topfindl"><!--需要隐去时，用 style="display:none;"-->        
         
            <dl colname="USERID">
               <dt><%=HR_CK_USERINFO.Attribute.USERID.ZhName %>：</dt><!--USERID-->
               <dd><span>
                
                    <input id="txtUSERID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STAFF_ID">
               <dt><%=HR_CK_USERINFO.Attribute.STAFF_ID.ZhName %>：</dt><!--STAFF_ID-->
               <dd><span>
                
                    <input id="txtSTAFF_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="BADGENUMBER">
               <dt><%=HR_CK_USERINFO.Attribute.BADGENUMBER.ZhName %>：</dt><!--BADGENUMBER-->
               <dd><span>
                
                    <input id="txtBADGENUMBER" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SSN">
               <dt><%=HR_CK_USERINFO.Attribute.SSN.ZhName %>：</dt><!--SSN-->
               <dd><span>
                
                    <input id="txtSSN" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="NAME">
               <dt><%=HR_CK_USERINFO.Attribute.NAME.ZhName %>：</dt><!--NAME-->
               <dd><span>
                
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="GENDER">
               <dt><%=HR_CK_USERINFO.Attribute.GENDER.ZhName %>：</dt><!--GENDER-->
               <dd><span>
                
                    <input id="txtGENDER" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TITLE">
               <dt><%=HR_CK_USERINFO.Attribute.TITLE.ZhName %>：</dt><!--TITLE-->
               <dd><span>
                
                    <input id="txtTITLE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PAGER">
               <dt><%=HR_CK_USERINFO.Attribute.PAGER.ZhName %>：</dt><!--PAGER-->
               <dd><span>
                
                    <input id="txtPAGER" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="BIRTHDAY">
               <dt><%=HR_CK_USERINFO.Attribute.BIRTHDAY.ZhName %>：</dt><!--BIRTHDAY-->
               <dd><span>
               
                    <input id="txtBIRTHDAY" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="HIREDDAY">
               <dt><%=HR_CK_USERINFO.Attribute.HIREDDAY.ZhName %>：</dt><!--HIREDDAY-->
               <dd><span>
               
                    <input id="txtHIREDDAY" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STREET">
               <dt><%=HR_CK_USERINFO.Attribute.STREET.ZhName %>：</dt><!--STREET-->
               <dd><span>
                
                    <input id="txtSTREET" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CITY">
               <dt><%=HR_CK_USERINFO.Attribute.CITY.ZhName %>：</dt><!--CITY-->
               <dd><span>
                
                    <input id="txtCITY" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATE">
               <dt><%=HR_CK_USERINFO.Attribute.STATE.ZhName %>：</dt><!--STATE-->
               <dd><span>
                
                    <input id="txtSTATE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ZIP">
               <dt><%=HR_CK_USERINFO.Attribute.ZIP.ZhName %>：</dt><!--ZIP-->
               <dd><span>
                
                    <input id="txtZIP" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OPHONE">
               <dt><%=HR_CK_USERINFO.Attribute.OPHONE.ZhName %>：</dt><!--OPHONE-->
               <dd><span>
                
                    <input id="txtOPHONE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FPHONE">
               <dt><%=HR_CK_USERINFO.Attribute.FPHONE.ZhName %>：</dt><!--FPHONE-->
               <dd><span>
                
                    <input id="txtFPHONE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="VERIFICATIONMETHOD">
               <dt><%=HR_CK_USERINFO.Attribute.VERIFICATIONMETHOD.ZhName %>：</dt><!--VERIFICATIONMETHOD-->
               <dd><span>
                
                    <input id="txtVERIFICATIONMETHOD" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DEFAULTDEPTID">
               <dt><%=HR_CK_USERINFO.Attribute.DEFAULTDEPTID.ZhName %>：</dt><!--DEFAULTDEPTID-->
               <dd><span>
                
                    <input id="txtDEFAULTDEPTID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SECURITYFLAGS">
               <dt><%=HR_CK_USERINFO.Attribute.SECURITYFLAGS.ZhName %>：</dt><!--SECURITYFLAGS-->
               <dd><span>
                
                    <input id="txtSECURITYFLAGS" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ATT">
               <dt><%=HR_CK_USERINFO.Attribute.ATT.ZhName %>：</dt><!--ATT-->
               <dd><span>
                
                    <input id="txtATT" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="INLATE">
               <dt><%=HR_CK_USERINFO.Attribute.INLATE.ZhName %>：</dt><!--INLATE-->
               <dd><span>
                
                    <input id="txtINLATE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OUTEARLY">
               <dt><%=HR_CK_USERINFO.Attribute.OUTEARLY.ZhName %>：</dt><!--OUTEARLY-->
               <dd><span>
                
                    <input id="txtOUTEARLY" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OVERTIME">
               <dt><%=HR_CK_USERINFO.Attribute.OVERTIME.ZhName %>：</dt><!--OVERTIME-->
               <dd><span>
                
                    <input id="txtOVERTIME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SEP">
               <dt><%=HR_CK_USERINFO.Attribute.SEP.ZhName %>：</dt><!--SEP-->
               <dd><span>
                
                    <input id="txtSEP" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="HOLIDAY">
               <dt><%=HR_CK_USERINFO.Attribute.HOLIDAY.ZhName %>：</dt><!--HOLIDAY-->
               <dd><span>
                
                    <input id="txtHOLIDAY" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="MINZU">
               <dt><%=HR_CK_USERINFO.Attribute.MINZU.ZhName %>：</dt><!--MINZU-->
               <dd><span>
                
                    <input id="txtMINZU" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PASSWORD">
               <dt><%=HR_CK_USERINFO.Attribute.PASSWORD.ZhName %>：</dt><!--PASSWORD-->
               <dd><span>
                
                    <input id="txtPASSWORD" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LUNCHDURATION">
               <dt><%=HR_CK_USERINFO.Attribute.LUNCHDURATION.ZhName %>：</dt><!--LUNCHDURATION-->
               <dd><span>
                
                    <input id="txtLUNCHDURATION" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="MVerifyPass">
               <dt><%=HR_CK_USERINFO.Attribute.MVerifyPass.ZhName %>：</dt><!--MVerifyPass-->
               <dd><span>
                
                    <input id="txtMVerifyPass" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PHOTO">
               <dt><%=HR_CK_USERINFO.Attribute.PHOTO.ZhName %>：</dt><!--PHOTO-->
               <dd><span>
                
                    <input id="txtPHOTO" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl><dt></dt><dd class="btn">
         <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.USERID._ZhName %></td><!--USERID-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.STAFF_ID._ZhName %></td><!--STAFF_ID-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.BADGENUMBER._ZhName %></td><!--BADGENUMBER-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.SSN._ZhName %></td><!--SSN-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.NAME._ZhName %></td><!--NAME-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.GENDER._ZhName %></td><!--GENDER-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.TITLE._ZhName %></td><!--TITLE-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.PAGER._ZhName %></td><!--PAGER-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.BIRTHDAY._ZhName %></td><!--BIRTHDAY-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.HIREDDAY._ZhName %></td><!--HIREDDAY-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.STREET._ZhName %></td><!--STREET-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.CITY._ZhName %></td><!--CITY-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.STATE._ZhName %></td><!--STATE-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.ZIP._ZhName %></td><!--ZIP-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.OPHONE._ZhName %></td><!--OPHONE-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.FPHONE._ZhName %></td><!--FPHONE-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.VERIFICATIONMETHOD._ZhName %></td><!--VERIFICATIONMETHOD-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.DEFAULTDEPTID._ZhName %></td><!--DEFAULTDEPTID-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.SECURITYFLAGS._ZhName %></td><!--SECURITYFLAGS-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.ATT._ZhName %></td><!--ATT-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.INLATE._ZhName %></td><!--INLATE-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.OUTEARLY._ZhName %></td><!--OUTEARLY-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.OVERTIME._ZhName %></td><!--OVERTIME-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.SEP._ZhName %></td><!--SEP-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.HOLIDAY._ZhName %></td><!--HOLIDAY-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.MINZU._ZhName %></td><!--MINZU-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.PASSWORD._ZhName %></td><!--PASSWORD-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.LUNCHDURATION._ZhName %></td><!--LUNCHDURATION-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.MVerifyPass._ZhName %></td><!--MVerifyPass-->
                    
                    
                    <td><%=HR_CK_USERINFO.Attribute.PHOTO._ZhName %></td><!--PHOTO-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).USERID %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).STAFF_ID %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).BADGENUMBER %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).SSN %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).GENDER %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).PAGER %></td>
                    
                    
                    <td><%#(((HR_CK_USERINFO)Container.DataItem).BIRTHDAY == DateTime.MinValue) ? "" : ((HR_CK_USERINFO)Container.DataItem).BIRTHDAY.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((HR_CK_USERINFO)Container.DataItem).HIREDDAY == DateTime.MinValue) ? "" : ((HR_CK_USERINFO)Container.DataItem).HIREDDAY.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).STREET %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).CITY %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).STATE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).ZIP %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).OPHONE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).FPHONE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).VERIFICATIONMETHOD %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).DEFAULTDEPTID %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).SECURITYFLAGS %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).ATT %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).INLATE %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).OUTEARLY %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).OVERTIME %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).SEP %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).HOLIDAY %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).MINZU %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).PASSWORD %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).LUNCHDURATION %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).MVerifyPass %></td>
                    
                    
                    <td><%#((HR_CK_USERINFO)Container.DataItem).PHOTO %></td>
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

