<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITYManage.aspx.cs" Inherits="WEC_ACTIVITYManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {        
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        //bindWinResize(500);
        try{
            $("#display_search").click(function () {
                $(".topfind").toggleClass("hide");   if($("#display_search").val()=="显示查询")$("#display_search").val("隐藏查询");else $("#display_search").val("显示查询");     
            });

            $("a").click(function () {
                var a_id = $($(this).parent().siblings()[0]).children("[type=checkbox]").val();
                location.href = "../WEC_ACTIVITY_SNCODE/WEC_ACTIVITY_SNCODEManage.aspx?a_id=" + a_id;
            });
        }catch(e){}
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind hide" ><!--需要隐去时，用 style="display:none;"-->        

            <dl colname="WEC_ACTIVITY.ID">
               <dt><%=WEC_ACTIVITY.Attribute.ID.ZhName %>：</dt><!--编号(ID)-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd></dl>
         
            <dl colname="WEC_ACTIVITY.AID">
               <dt><%=WEC_ACTIVITY.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.KEYWORD">
               <dt><%=WEC_ACTIVITY.Attribute.KEYWORD.ZhName %>：</dt><!--关键词(NAM-->
               <dd><span>
               
                    <input id="txtKEYWORD" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.INSTRUCTION">
               <dt><%=WEC_ACTIVITY.Attribute.INSTRUCTION.ZhName %>：</dt><!--成功抢到券说明-->
               <dd><span>
               
                    <input id="txtINSTRUCTION" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TIME">
               <dt><%=WEC_ACTIVITY.Attribute.TIME.ZhName %>：</dt><!--活动时间-->
               <dd><span>
               
                    <input id="txtTIME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.START_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.START_PICURL.ZhName %>：</dt><!--2-活动开始图-->
               <dd><span>
               
                    <input id="txtSTART_PICURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.WIN_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.WIN_PICURL.ZhName %>：</dt><!--中奖后显示的头-->
               <dd><span>
               
                    <input id="txtWIN_PICURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.OUT_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.OUT_PICURL.ZhName %>：</dt><!--中奖图片外链地-->
               <dd><span>
               
                    <input id="txtOUT_PICURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.END_THEME">
               <dt><%=WEC_ACTIVITY.Attribute.END_THEME.ZhName %>：</dt><!--3-活动结束公-->
               <dd><span>
               
                    <input id="txtEND_THEME" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.END_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.END_PICURL.ZhName %>：</dt><!--3-活动结束图-->
               <dd><span>
               
                    <input id="txtEND_PICURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_ONE.ZhName %>：</dt><!--奖品类别1-->
               <dd><span>
               
                    <input id="txtTYPE_ONE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_ONE.ZhName %>：</dt><!--图片地址1-->
               <dd><span>
               
                    <input id="txtPIC_ONE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_ONE.ZhName %>：</dt><!--优惠券名称1-->
               <dd><span>
               
                    <input id="txtNAME_ONE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_ONE.ZhName %>：</dt><!--优惠券数量1-->
               <dd><span>
               
                    <input id="txtNUM_ONE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_TWO.ZhName %>：</dt><!--奖品类别2-->
               <dd><span>
               
                    <input id="txtTYPE_TWO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_TWO.ZhName %>：</dt><!--图片地址2-->
               <dd><span>
               
                    <input id="txtPIC_TWO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_TWO.ZhName %>：</dt><!--优惠券名称2-->
               <dd><span>
               
                    <input id="txtNAME_TWO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_TWO.ZhName %>：</dt><!--优惠券数量2-->
               <dd><span>
               
                    <input id="txtNUM_TWO" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_THREE.ZhName %>：</dt><!--奖品类别3-->
               <dd><span>
               
                    <input id="txtTYPE_THREE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_THREE.ZhName %>：</dt><!--图片地址3-->
               <dd><span>
               
                    <input id="txtPIC_THREE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_THREE.ZhName %>：</dt><!--优惠券名称3-->
               <dd><span>
               
                    <input id="txtNAME_THREE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_THREE.ZhName %>：</dt><!--优惠券数量3-->
               <dd><span>
               
                    <input id="txtNUM_THREE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FOUR.ZhName %>：</dt><!--奖品类别4-->
               <dd><span>
               
                    <input id="txtTYPE_FOUR" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FOUR.ZhName %>：</dt><!--图片地址4-->
               <dd><span>
               
                    <input id="txtPIC_FOUR" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FOUR.ZhName %>：</dt><!--优惠券名称4-->
               <dd><span>
               
                    <input id="txtNAME_FOUR" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FOUR.ZhName %>：</dt><!--优惠券数量4-->
               <dd><span>
               
                    <input id="txtNUM_FOUR" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FIVE.ZhName %>：</dt><!--奖品类别5-->
               <dd><span>
               
                    <input id="txtTYPE_FIVE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FIVE.ZhName %>：</dt><!--图片地址5-->
               <dd><span>
               
                    <input id="txtPIC_FIVE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FIVE.ZhName %>：</dt><!--优惠券名称5-->
               <dd><span>
               
                    <input id="txtNAME_FIVE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FIVE.ZhName %>：</dt><!--优惠券数量5-->
               <dd><span>
               
                    <input id="txtNUM_FIVE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_SIX.ZhName %>：</dt><!--奖品类别6-->
               <dd><span>
               
                    <input id="txtTYPE_SIX" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_SIX.ZhName %>：</dt><!--图片地址6-->
               <dd><span>
               
                    <input id="txtPIC_SIX" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_SIX.ZhName %>：</dt><!--优惠券名称6-->
               <dd><span>
               
                    <input id="txtNAME_SIX" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_SIX.ZhName %>：</dt><!--优惠券数量6-->
               <dd><span>
               
                    <input id="txtNUM_SIX" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.CONFIRM_PWD">
               <dt><%=WEC_ACTIVITY.Attribute.CONFIRM_PWD.ZhName %>：</dt><!--兑奖密码-->
               <dd><span>
               
                    <input id="txtCONFIRM_PWD" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SN_RENAME">
               <dt><%=WEC_ACTIVITY.Attribute.SN_RENAME.ZhName %>：</dt><!--SN码重命名为-->
               <dd><span>
               
                    <input id="txtSN_RENAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TEL_RENAME">
               <dt><%=WEC_ACTIVITY.Attribute.TEL_RENAME.ZhName %>：</dt><!--手机号重命名-->
               <dd><span>
               
                    <input id="txtTEL_RENAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SHOW_NUM">
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_NUM.ZhName %>：</dt><!--抽奖页面是否显-->
               <dd><span>
               
                    <input id="txtSHOW_NUM" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SN_CODE">
               <dt><%=WEC_ACTIVITY.Attribute.SN_CODE.ZhName %>：</dt><!--SN码生成设置-->
               <dd><span>
               
                    <input id="txtSN_CODE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME">
               <dt><%=WEC_ACTIVITY.Attribute.NAME.ZhName %>：</dt><!--活动名称-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.CONTENT">
               <dt><%=WEC_ACTIVITY.Attribute.CONTENT.ZhName %>：</dt><!--简介-->
               <dd><span>
               
                    <input id="txtCONTENT" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.INFO">
               <dt><%=WEC_ACTIVITY.Attribute.INFO.ZhName %>：</dt><!--活动说明-->
               <dd><span>
               
                    <input id="txtINFO" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.USE_INSTRUCTION">
               <dt><%=WEC_ACTIVITY.Attribute.USE_INSTRUCTION.ZhName %>：</dt><!--兑换券使用说明-->
               <dd><span>
               
                    <input id="txtUSE_INSTRUCTION" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.END_INSTRUCTION">
               <dt><%=WEC_ACTIVITY.Attribute.END_INSTRUCTION.ZhName %>：</dt><!--结束活动说明-->
               <dd><span>
               
                    <input id="txtEND_INSTRUCTION" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.STATUS">
               <dt><%=WEC_ACTIVITY.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.ADDTIME">
               <dt><%=WEC_ACTIVITY.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.FOR_PEOPLE">
               <dt><%=WEC_ACTIVITY.Attribute.FOR_PEOPLE.ZhName %>：</dt><!--适用人群-->
               <dd><span>
               
                    <input id="txtFOR_PEOPLE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PROBABILITY">
               <dt><%=WEC_ACTIVITY.Attribute.PROBABILITY.ZhName %>：</dt><!--中奖概率-->
               <dd><span>
               
                    <input id="txtPROBABILITY" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUMBER_TIMES">
               <dt><%=WEC_ACTIVITY.Attribute.NUMBER_TIMES.ZhName %>：</dt><!--每人最多允许抽-->
               <dd><span>
               
                    <input id="txtNUMBER_TIMES" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.MOST_NUM_TIMES">
               <dt><%=WEC_ACTIVITY.Attribute.MOST_NUM_TIMES.ZhName %>：</dt><!--每人每天最多抽-->
               <dd><span>
               
                    <input id="txtMOST_NUM_TIMES" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.KIND">
               <dt><%=WEC_ACTIVITY.Attribute.KIND.ZhName %>：</dt><!--活动类别-->
               <dd><span>
               
                    <select id="txtKIND" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.INFORMATION">
               <dt><%=WEC_ACTIVITY.Attribute.INFORMATION.ZhName %>：</dt><!--兑奖信息-->
               <dd><span>
               
                    <input id="txtINFORMATION" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.WIN_INFO">
               <dt><%=WEC_ACTIVITY.Attribute.WIN_INFO.ZhName %>：</dt><!--中奖提示-->
               <dd><span>
               
                    <input id="txtWIN_INFO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NO_WIN_INFO">
               <dt><%=WEC_ACTIVITY.Attribute.NO_WIN_INFO.ZhName %>：</dt><!--未中奖提示-->
               <dd><span>
               
                    <input id="txtNO_WIN_INFO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SHOW_WIN_USRE">
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_WIN_USRE.ZhName %>：</dt><!--显示设置-->
               <dd><span>
               
                    <input id="txtSHOW_WIN_USRE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PLAY_AUDIO">
               <dt><%=WEC_ACTIVITY.Attribute.PLAY_AUDIO.ZhName %>：</dt><!--功能选择-->
               <dd><span>
               
                    <input id="txtPLAY_AUDIO" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.MP3_URL">
               <dt><%=WEC_ACTIVITY.Attribute.MP3_URL.ZhName %>：</dt><!--背景音乐-->
               <dd><span>
               
                    <input id="txtMP3_URL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.RULES">
               <dt><%=WEC_ACTIVITY.Attribute.RULES.ZhName %>：</dt><!--活动规则-->
               <dd><span>
               
                    <input id="txtRULES" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SYSTEM_SCORE">
               <dt><%=WEC_ACTIVITY.Attribute.SYSTEM_SCORE.ZhName %>：</dt><!--每道系统分值-->
               <dd><span>
               
                    <input id="txtSYSTEM_SCORE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.CUSTOM_SCORE">
               <dt><%=WEC_ACTIVITY.Attribute.CUSTOM_SCORE.ZhName %>：</dt><!--每道自定义分值-->
               <dd><span>
               
                    <input id="txtCUSTOM_SCORE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newWEC_ACTIVITY" id="btn_New" type="button" value="新建" onclick="manager.newRecord('WEC_ACTIVITYEdit.aspx?kind=<%=kind%>');" /></span></li>
            <li><span><input power="editWEC_ACTIVITY" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('WEC_ACTIVITYEdit.aspx?kind=<%=kind%>');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_ACTIVITY" id="btn_NewSub" type="button" value="新建下级" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="删除" onclick="manager.delBySelIDS('WEC_ACTIVITYBack.aspx');" /></span></li>
            <li><span><input type="button" value="显示查询" id="display_search"/></span></li>
        </ul>
        <ol>
            <li><b>每页显示</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>条</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="设置" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">更多列</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist" >
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>顶级</b></a></td>--%>                       
                        <%                        
                          if ("1".Equals(kind)||"0".Equals(kind)||"2".Equals(kind)||"5".Equals(kind))
                          {
                         %>
                               <td >活动名称</td>                    
                    
                               <td >关键字</td>                    
                    
                               <td >有效参与人数</td>
                       
                               <td >总浏览数</td>

                               <td>开始时间/结束时间</td>
                               
                               <td>适用人群</td>

                               <td>状态</td>

                               <td>操作</td>
                         <%
                          }
                         %>
                
            </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_ACTIVITY)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_ACTIVITY)Container.DataItem).PATH, ((WEC_ACTIVITY)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    <%    
                        if ("1".Equals(kind)||"0".Equals(kind)||"2".Equals(kind)||"5".Equals(kind))
                          {
                         %>
                               <td><%#((WEC_ACTIVITY)Container.DataItem).NAME %></td>
                    
                               <td><%#((WEC_ACTIVITY)Container.DataItem).KEYWORD %></td>
                    
                    
                               <td><%#((WEC_ACTIVITY)Container.DataItem).JOIN_NUM %></td>
                       
                               <td><%#((WEC_ACTIVITY)Container.DataItem).SCAN_NUM %></td>

                               <td><%#((WEC_ACTIVITY)Container.DataItem).TIME %></td>
                               
                               <td><%#((WEC_ACTIVITY)Container.DataItem).FOR_PEOPLE %></td>

                               <td><%#FormHelper.GetText(WEC_ACTIVITY.Attribute.STATUS, ((WEC_ACTIVITY)Container.DataItem).STATUS)%></td>

                               <td><a href="javascript:;">SN码管理</a></td>
                         <%
                          }
                         %>
                    
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
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>