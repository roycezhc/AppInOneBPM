<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_A_VOTEEdit.aspx.cs" Inherits="WEC_A_VOTEEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
       $(function () {
           //var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
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
<%--<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="保存退出"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="保存"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="关闭" type="button" /></span></li>
</ul>
</div>--%>
<div class="form" id="divForm">
       <div>
        
           <dl >
               <dt><%=WEC_A_VOTE.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtID" type="text" runat="server" ck="{type:1,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
           <dl >
               <dt><%=WEC_A_VOTE.Attribute.AID.ZhName %>：</dt><%--公众号编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtAID" type="text" runat="server" ck="{type:1,min:0,max:18,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.KEYWORD.ZhName %>：</dt><%--关键词--%>
               <dd><span>
               
                    <script type="text/javascript">
                        $(function () {
                            var kindEditor = new creatKindEditor('#<%=txtKEYWORD.ClientID%>');
                        });
                    </script>
                    <input id="txtKEYWORD" type="text"  runat="server" style="width:668px;height:230px;" ck="{need:1,len:500,type:0}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.TITLE.ZhName %>：</dt><%--投票标题--%>
               <dd><span>
               
                    <script type="text/javascript">
                        $(function () {
                            var kindEditor = new creatKindEditor('#<%=txtTITLE.ClientID%>');
                        });
                    </script>
                    <input id="txtTITLE" type="text"  runat="server" style="width:668px;height:230px;" ck="{need:1,len:500,type:0}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.PICURL.ZhName %>：</dt><%--投票图片--%>
               <dd><span>
                             
                    <script type="text/javascript">
                        $(function () {
                            var smImage = new creatSmImage('#btntxtPICURL', '#<%=txtPICURL.ClientID%>', '#<%=hidtxtPICURL.ClientID%>');
                        });
                    </script>
                    <div class="controls">
					    <img id="txtPICURL" runat="server" style="max-height:100px;vertical-align: middle;">
                        <span class="insertimage"><a id="btntxtPICURL">选择图文封面</a></span>  建议大小(宽720高400)
                        <input type="hidden" id="hidtxtPICURL" runat="server" />
                    </div></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.INSTRUCTION.ZhName %>：</dt><%--投票说明--%>
               <dd><span>
               
                    <script type="text/javascript">
                        $(function () {
                            var kindEditor = new creatKindEditor('#<%=txtINSTRUCTION.ClientID%>');
                        });
                    </script>
                    <input id="txtINSTRUCTION" type="text"  runat="server" style="width:668px;height:230px;" ck="{need:1,len:500,type:0}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.PIC_SHOW.ZhName %>：</dt><%--图片显示--%>
               <dd><span>
               
                    <select id="txtPIC_SHOW" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.IS_RADIO.ZhName %>：</dt><%--是否多选--%>
               <dd><span>
               
                    <select id="txtIS_RADIO" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.SELECT_NUM.ZhName %>：</dt><%--多选数量--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSELECT_NUM" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.TIME.ZhName %>：</dt><%--时间设置--%>
               <dd><span>
               
                    <input id="txtTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:500,type:3}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.RESULT.ZhName %>：</dt><%--投票结果--%>
               <dd><span>
               <!--文字-->
                    <input id="txtRESULT" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.SHARE.ZhName %>：</dt><%--是否分享--%>
               <dd><span>
               
                    <select id="txtSHARE" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.KIND.ZhName %>：</dt><%--类别--%>
               <dd><span>
               
                    <select id="txtKIND" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
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