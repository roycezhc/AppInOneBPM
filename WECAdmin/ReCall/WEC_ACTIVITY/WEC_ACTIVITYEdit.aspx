<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITYEdit.aspx.cs" Inherits="WEC_ACTIVITYEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
     $(function () {
         // var checker = new formChecker({btnIDS: 'btnOK,btnSave' });

         var smImage = new creatSmImage('#btnSTART_PICURL', '#<%=txtSTART_PICURL.ClientID%>', '#<%=hidSTART_PICURL.ClientID%>');
         var smImage1 = new creatSmImage('#btnEND_PICURL', '#<%=txtEND_PICURL.ClientID%>', '#<%=hidEND_PICURL.ClientID%>');
     });
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
<div class="form" id="divForm">
       <div>
       
                       <dl class ="hide">
                           <dt><%=WEC_ACTIVITY.Attribute.ID.ZhName%>：</dt><%--编号(ID)--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtID" type="text" runat="server" ck="{type:1,min:0,max:18,need:0}"/></span>
                           </dd>
                       </dl>
                       <dl class ="hide">
                           <dt><%=WEC_ACTIVITY.Attribute.AID.ZhName%>：</dt><%--公众号编号--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtAID" type="text" runat="server" ck="{type:1,min:0,max:18,need:1}"/></span>
                           </dd>
                       </dl>
                       <% if(keyid==""){ %>
                       <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.KEYWORD.ZhName%>：</dt><%--关键词(NAM--%>
                           <dd><span>
               
                                <textarea id="txtKEYWORD" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>
                        <% } %>
                        <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.NAME.ZhName%>：</dt><%--活动名称--%>
                           <dd><span>
               
                                <textarea id="txtNAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>

                      
                        <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.INFORMATION.ZhName%>：</dt><%--兑奖信息--%>
                           <dd><span>
               
                                <textarea id="txtINFORMATION" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>

                        <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.CONTENT.ZhName%>：</dt><%--简介--%>
                           <dd><span>
               
                                <textarea id="txtCONTENT" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>

                       <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.TIME.ZhName%>：</dt><%--活动时间--%>
                           <dd><span>
               
                                <textarea id="txtTIME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>

                         <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.INFO.ZhName%>：</dt><%--活动说明--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtINFO" type="text" runat="server" ck="{type:0,min:0,max:3000,need:1}"/></span>
                           </dd>
                       </dl>

                        <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.START_PICURL.ZhName%>：</dt><%--2-活动开始图--%>
                           <dd> <div class="controls">
					                <img id="txtSTART_PICURL" runat="server" style="max-height:100px;vertical-align: middle;">
                                    <span class="insertimage"><a id="btnSTART_PICURL">选择开始图</a></span>
                                    <input type="hidden" id="hidSTART_PICURL" runat="server" />
                                </div>
                           </dd>
                       </dl>

                        <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.END_THEME.ZhName%>：</dt><%--3-活动结束公--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtEND_THEME" type="text" runat="server" ck="{type:0,min:0,max:3000,need:1}"/></span>
                           </dd>
                       </dl>
         
                        <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.END_INSTRUCTION.ZhName%>：</dt><%--结束活动说明--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtEND_INSTRUCTION" type="text" runat="server" ck="{type:0,min:0,max:3000,need:1}"/></span>
                           </dd>
                       </dl>

                       <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.END_PICURL.ZhName%>：</dt><%--3-活动结束图--%>
                           <dd><div class="controls">
					                <img id="txtEND_PICURL" runat="server" style="max-height:100px;vertical-align: middle;">
                                    <span class="insertimage"><a id="btnEND_PICURL">选择结束图</a></span>
                                    <input type="hidden" id="hidEND_PICURL" runat="server" />
                                </div>
                           </dd>
                       </dl>

          <% if(keyid==""){
                 %>
                        <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.TYPE_ONE.ZhName%>：</dt><%--奖品类别1--%>
                           <dd><span>
               
                                <textarea id="txtTYPE_ONE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>
            
                        <dl>
                           <dt>奖品名称1：</dt><%--奖品名称1--%>
                           <dd><span>
               
                                <textarea id="txtNAME_ONE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>

                        <dl>
                           <dt>奖品数量1：</dt><%--奖品数量1--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtNUM_ONE" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
                           </dd>
                       </dl>

                        <dl>
                           <dt>奖品类别2：</dt><%--奖品类别2--%>
                           <dd><span>
               
                                <textarea id="txtTYPE_TWO" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>

                        <dl>
                           <dt>奖品名称2：</dt><%--奖品名称2--%>
                           <dd><span>
               
                                <textarea id="txtNAME_TWO" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>

                        <dl>
                           <dt>奖品数量2：</dt><%--奖品数量2--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtNUM_TWO" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
                           </dd>
                       </dl>

                       <dl>
                           <dt>奖品类别3：</dt><%--奖品类别3--%>
                           <dd><span>
               
                                <textarea id="txtTYPE_THREE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>

                         <dl>
                           <dt>奖品名称3：</dt><%--奖品名称3--%>
                           <dd><span>
               
                                <textarea id="txtNAME_THREE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:0,len:500,type:0}" /></span>
                           </dd>
                       </dl>
                       <dl>
                           <dt>奖品数量3：</dt><%--奖品数量3--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtNUM_THREE" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
                           </dd>
                       </dl>

                        <dl>
                           <dt>奖品类别4：</dt><%--奖品类别4--%>
                           <dd><span>
               
                                <textarea id="txtTYPE_FOUR" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>
          
                       <dl>
                           <dt>奖品名称4：</dt><%--奖品名称4--%>
                           <dd><span>
               
                                <textarea id="txtNAME_FOUR" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>
                       <dl>
                           <dt>奖品数量4：</dt><%--奖品数量4--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtNUM_FOUR" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
                           </dd>
                       </dl>
                       <dl>
                           <dt>奖品类别5：</dt><%--奖品类别5--%>
                           <dd><span>
               
                                <textarea id="txtTYPE_FIVE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>
          
                       <dl>
                           <dt>奖品名称5：</dt><%--奖品名称5--%>
                           <dd><span>
               
                                <textarea id="txtNAME_FIVE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>
                       <dl>
                           <dt>奖品数量5：</dt><%--奖品数量5--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtNUM_FIVE" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
                           </dd>
                       </dl>
                       <dl>
                           <dt>奖品类别6：</dt><%--奖品类别6--%>
                           <dd><span>
               
                                <textarea id="txtTYPE_SIX" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>
          
                       <dl>
                           <dt>奖品名称6：</dt><%--奖品名称6--%>
                           <dd><span>
               
                                <textarea id="txtNAME_SIX" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>
                       <dl>
                           <dt>奖品数量6：</dt><%--奖品数量6--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtNUM_SIX" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
                           </dd>
                       </dl>
            <%
             }
                  %>
                         <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.PROBABILITY.ZhName%>：</dt><%--中奖概率--%>
                           <dd><span>
               
                                <textarea id="txtPROBABILITY" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>
                       <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.NUMBER_TIMES.ZhName%>：</dt><%--每人最多允许抽--%>
                           <dd><span>
                           <!--文字-->
                                <input id="txtNUMBER_TIMES" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
                           </dd>
                       </dl>
               

                        <dl>
                           <dt><%=WEC_ACTIVITY.Attribute.CONFIRM_PWD.ZhName%>：</dt><%--兑奖密码--%>
                           <dd><span>
               
                                <textarea id="txtCONFIRM_PWD" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                                        runat="server" ck="{need:1,len:500,type:0}" /></span>
                           </dd>
                       </dl>

                     

           
         

       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>