<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITYShow.aspx.cs" Inherits="WEC_ACTIVITYShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.ID.ZhName %>：</dt><%--编号(ID)--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.AID.ZhName %>：</dt><%--公众号编号--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.KEYWORD.ZhName %>：</dt><%--关键词(NAM--%>
               <dd>
               
                    <asp:Label id="txtKEYWORD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.INSTRUCTION.ZhName %>：</dt><%--成功抢到券说明--%>
               <dd>
               
                    <asp:Label id="txtINSTRUCTION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TIME.ZhName %>：</dt><%--活动时间--%>
               <dd>
               
                    <asp:Label id="txtTIME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.START_PICURL.ZhName %>：</dt><%--2-活动开始图--%>
               <dd>
               
                    <asp:Label id="txtSTART_PICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.WIN_PICURL.ZhName %>：</dt><%--中奖后显示的头--%>
               <dd>
               
                    <asp:Label id="txtWIN_PICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.OUT_PICURL.ZhName %>：</dt><%--中奖图片外链地--%>
               <dd>
               
                    <asp:Label id="txtOUT_PICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.END_THEME.ZhName %>：</dt><%--3-活动结束公--%>
               <dd>
               
                    <asp:Label id="txtEND_THEME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.END_PICURL.ZhName %>：</dt><%--3-活动结束图--%>
               <dd>
               
                    <asp:Label id="txtEND_PICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_ONE.ZhName %>：</dt><%--奖品类别1--%>
               <dd>
               
                    <asp:Label id="txtTYPE_ONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_ONE.ZhName %>：</dt><%--图片地址1--%>
               <dd>
               
                    <asp:Label id="txtPIC_ONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_ONE.ZhName %>：</dt><%--优惠券名称1--%>
               <dd>
               
                    <asp:Label id="txtNAME_ONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_ONE.ZhName %>：</dt><%--优惠券数量1--%>
               <dd>
               
                    <asp:Label id="txtNUM_ONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_TWO.ZhName %>：</dt><%--奖品类别2--%>
               <dd>
               
                    <asp:Label id="txtTYPE_TWO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_TWO.ZhName %>：</dt><%--图片地址2--%>
               <dd>
               
                    <asp:Label id="txtPIC_TWO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_TWO.ZhName %>：</dt><%--优惠券名称2--%>
               <dd>
               
                    <asp:Label id="txtNAME_TWO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_TWO.ZhName %>：</dt><%--优惠券数量2--%>
               <dd>
               
                    <asp:Label id="txtNUM_TWO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_THREE.ZhName %>：</dt><%--奖品类别3--%>
               <dd>
               
                    <asp:Label id="txtTYPE_THREE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_THREE.ZhName %>：</dt><%--图片地址3--%>
               <dd>
               
                    <asp:Label id="txtPIC_THREE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_THREE.ZhName %>：</dt><%--优惠券名称3--%>
               <dd>
               
                    <asp:Label id="txtNAME_THREE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_THREE.ZhName %>：</dt><%--优惠券数量3--%>
               <dd>
               
                    <asp:Label id="txtNUM_THREE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FOUR.ZhName %>：</dt><%--奖品类别4--%>
               <dd>
               
                    <asp:Label id="txtTYPE_FOUR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FOUR.ZhName %>：</dt><%--图片地址4--%>
               <dd>
               
                    <asp:Label id="txtPIC_FOUR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FOUR.ZhName %>：</dt><%--优惠券名称4--%>
               <dd>
               
                    <asp:Label id="txtNAME_FOUR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FOUR.ZhName %>：</dt><%--优惠券数量4--%>
               <dd>
               
                    <asp:Label id="txtNUM_FOUR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FIVE.ZhName %>：</dt><%--奖品类别5--%>
               <dd>
               
                    <asp:Label id="txtTYPE_FIVE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FIVE.ZhName %>：</dt><%--图片地址5--%>
               <dd>
               
                    <asp:Label id="txtPIC_FIVE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FIVE.ZhName %>：</dt><%--优惠券名称5--%>
               <dd>
               
                    <asp:Label id="txtNAME_FIVE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FIVE.ZhName %>：</dt><%--优惠券数量5--%>
               <dd>
               
                    <asp:Label id="txtNUM_FIVE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_SIX.ZhName %>：</dt><%--奖品类别6--%>
               <dd>
               
                    <asp:Label id="txtTYPE_SIX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_SIX.ZhName %>：</dt><%--图片地址6--%>
               <dd>
               
                    <asp:Label id="txtPIC_SIX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_SIX.ZhName %>：</dt><%--优惠券名称6--%>
               <dd>
               
                    <asp:Label id="txtNAME_SIX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_SIX.ZhName %>：</dt><%--优惠券数量6--%>
               <dd>
               
                    <asp:Label id="txtNUM_SIX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.CONFIRM_PWD.ZhName %>：</dt><%--兑奖密码--%>
               <dd>
               
                    <asp:Label id="txtCONFIRM_PWD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SN_RENAME.ZhName %>：</dt><%--SN码重命名为--%>
               <dd>
               
                    <asp:Label id="txtSN_RENAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TEL_RENAME.ZhName %>：</dt><%--手机号重命名--%>
               <dd>
               
                    <asp:Label id="txtTEL_RENAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_NUM.ZhName %>：</dt><%--抽奖页面是否显--%>
               <dd>
               
                    <asp:Label id="txtSHOW_NUM" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SN_CODE.ZhName %>：</dt><%--SN码生成设置--%>
               <dd>
               
                    <asp:Label id="txtSN_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME.ZhName %>：</dt><%--活动名称--%>
               <dd>
               
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.CONTENT.ZhName %>：</dt><%--简介--%>
               <dd>
               
                    <asp:Label id="txtCONTENT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.INFO.ZhName %>：</dt><%--活动说明--%>
               <dd>
               
                    <asp:Label id="txtINFO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.USE_INSTRUCTION.ZhName %>：</dt><%--兑换券使用说明--%>
               <dd>
               
                    <asp:Label id="txtUSE_INSTRUCTION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.END_INSTRUCTION.ZhName %>：</dt><%--结束活动说明--%>
               <dd>
               
                    <asp:Label id="txtEND_INSTRUCTION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.ADDTIME.ZhName %>：</dt><%--添加时间--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.FOR_PEOPLE.ZhName %>：</dt><%--适用人群--%>
               <dd>
               
                    <asp:Label id="txtFOR_PEOPLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PROBABILITY.ZhName %>：</dt><%--中奖概率--%>
               <dd>
               
                    <asp:Label id="txtPROBABILITY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUMBER_TIMES.ZhName %>：</dt><%--每人最多允许抽--%>
               <dd>
               
                    <asp:Label id="txtNUMBER_TIMES" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.MOST_NUM_TIMES.ZhName %>：</dt><%--每人每天最多抽--%>
               <dd>
               
                    <asp:Label id="txtMOST_NUM_TIMES" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.KIND.ZhName %>：</dt><%--活动类别--%>
               <dd>
               
                    <asp:Label id="txtKIND" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.INFORMATION.ZhName %>：</dt><%--兑奖信息--%>
               <dd>
               
                    <asp:Label id="txtINFORMATION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.WIN_INFO.ZhName %>：</dt><%--中奖提示--%>
               <dd>
               
                    <asp:Label id="txtWIN_INFO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NO_WIN_INFO.ZhName %>：</dt><%--未中奖提示--%>
               <dd>
               
                    <asp:Label id="txtNO_WIN_INFO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_WIN_USRE.ZhName %>：</dt><%--显示设置--%>
               <dd>
               
                    <asp:Label id="txtSHOW_WIN_USRE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PLAY_AUDIO.ZhName %>：</dt><%--功能选择--%>
               <dd>
               
                    <asp:Label id="txtPLAY_AUDIO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.MP3_URL.ZhName %>：</dt><%--背景音乐--%>
               <dd>
               
                    <asp:Label id="txtMP3_URL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.RULES.ZhName %>：</dt><%--活动规则--%>
               <dd>
               
                    <asp:Label id="txtRULES" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SYSTEM_SCORE.ZhName %>：</dt><%--每道系统分值--%>
               <dd>
               
                    <asp:Label id="txtSYSTEM_SCORE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.CUSTOM_SCORE.ZhName %>：</dt><%--每道自定义分值--%>
               <dd>
               
                    <asp:Label id="txtCUSTOM_SCORE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>