<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_THEMESel" CodeFile="THEMESel.aspx.cs" %>
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
         
            <dl colname="THEME_ID">
               <dt><%=SYS_THEME.Attribute.THEME_ID.ZhName %>：</dt><!--THEME_ID-->
               <dd><span>
                
                    <input id="txtTHEME_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="THEME_NAME">
               <dt><%=SYS_THEME.Attribute.THEME_NAME.ZhName %>：</dt><!--皮肤名称(英文)-->
               <dd><span>
                
                    <input id="txtTHEME_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SYS_NAME">
               <dt><%=SYS_THEME.Attribute.SYS_NAME.ZhName %>：</dt><!--系统名称-->
               <dd><span>
               
                    <textarea id="txtSYS_NAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="LOGIN_TIT">
               <dt><%=SYS_THEME.Attribute.LOGIN_TIT.ZhName %>：</dt><!--登录界面标题-->
               <dd><span>
               
                    <textarea id="txtLOGIN_TIT" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="LOGIN_HTML">
               <dt><%=SYS_THEME.Attribute.LOGIN_HTML.ZhName %>：</dt><!--LOGIN_HTML-->
               <dd><span>
                
                    <input id="txtLOGIN_HTML" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TECH_DES">
               <dt><%=SYS_THEME.Attribute.TECH_DES.ZhName %>：</dt><!--技术支持描述-->
               <dd><span>
               
                    <textarea id="txtTECH_DES" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="RIGHT_DES">
               <dt><%=SYS_THEME.Attribute.RIGHT_DES.ZhName %>：</dt><!--版权描述-->
               <dd><span>
               
                    <textarea id="txtRIGHT_DES" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="VERSION">
               <dt><%=SYS_THEME.Attribute.VERSION.ZhName %>：</dt><!--版本信息-->
               <dd><span>
               
                    <textarea id="txtVERSION" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
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
                    
                    
                    <td><%=SYS_THEME.Attribute.THEME_ID._ZhName %></td><!--THEME_ID-->
                    
                    
                    <td><%=SYS_THEME.Attribute.THEME_NAME._ZhName %></td><!--皮肤名称(英文)-->
                    
                    
                    <td><%=SYS_THEME.Attribute.SYS_NAME._ZhName %></td><!--系统名称-->
                    
                    
                    <td><%=SYS_THEME.Attribute.LOGIN_TIT._ZhName %></td><!--登录界面标题-->
                    
                    
                    <td><%=SYS_THEME.Attribute.LOGIN_HTML._ZhName %></td><!--LOGIN_HTML-->

                    <td><%=SYS_THEME.Attribute.VERSION._ZhName %></td><!--版本信息-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((SYS_THEME)Container.DataItem).THEME_ID %></td>
                    
                    
                    <td><%#((SYS_THEME)Container.DataItem).THEME_NAME %></td>
                    
                    
                    <td><%#((SYS_THEME)Container.DataItem).SYS_NAME %></td>
                    
                    
                    <td><%#((SYS_THEME)Container.DataItem).LOGIN_TIT %></td>
                    
                    
                    <td><%#((SYS_THEME)Container.DataItem).LOGIN_HTML %></td>

                    <td><%#((SYS_THEME)Container.DataItem).VERSION %></td>
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

