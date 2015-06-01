<%@ Page Title="用户选择" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITYSel.aspx.cs" Inherits="WEC_ACTIVITYSel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
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
         
            <dl colname="ID">
               <dt><%=WEC_ACTIVITY.Attribute.ID.ZhName %>：</dt><!--编号(ID)-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AID">
               <dt><%=WEC_ACTIVITY.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="KEYWORD">
               <dt><%=WEC_ACTIVITY.Attribute.KEYWORD.ZhName %>：</dt><!--关键词(NAM-->
               <dd><span>
               
                    <textarea id="txtKEYWORD" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="INSTRUCTION">
               <dt><%=WEC_ACTIVITY.Attribute.INSTRUCTION.ZhName %>：</dt><!--成功抢到券说明-->
               <dd><span>
               
                    <input id="txtINSTRUCTION" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TIME">
               <dt><%=WEC_ACTIVITY.Attribute.TIME.ZhName %>：</dt><!--活动时间-->
               <dd><span>
               
                    <textarea id="txtTIME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="START_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.START_PICURL.ZhName %>：</dt><!--2-活动开始图-->
               <dd><span>
               
                    <textarea id="txtSTART_PICURL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="WIN_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.WIN_PICURL.ZhName %>：</dt><!--中奖后显示的头-->
               <dd><span>
               
                    <textarea id="txtWIN_PICURL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="OUT_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.OUT_PICURL.ZhName %>：</dt><!--中奖图片外链地-->
               <dd><span>
               
                    <textarea id="txtOUT_PICURL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="END_THEME">
               <dt><%=WEC_ACTIVITY.Attribute.END_THEME.ZhName %>：</dt><!--3-活动结束公-->
               <dd><span>
               
                    <input id="txtEND_THEME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="END_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.END_PICURL.ZhName %>：</dt><!--3-活动结束图-->
               <dd><span>
               
                    <textarea id="txtEND_PICURL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="TYPE_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_ONE.ZhName %>：</dt><!--奖品类别1-->
               <dd><span>
               
                    <textarea id="txtTYPE_ONE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PIC_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_ONE.ZhName %>：</dt><!--图片地址1-->
               <dd><span>
               
                    <textarea id="txtPIC_ONE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NAME_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_ONE.ZhName %>：</dt><!--优惠券名称1-->
               <dd><span>
               
                    <textarea id="txtNAME_ONE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NUM_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_ONE.ZhName %>：</dt><!--优惠券数量1-->
               <dd><span>
               
                    <input id="txtNUM_ONE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_TWO.ZhName %>：</dt><!--奖品类别2-->
               <dd><span>
               
                    <textarea id="txtTYPE_TWO" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PIC_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_TWO.ZhName %>：</dt><!--图片地址2-->
               <dd><span>
               
                    <textarea id="txtPIC_TWO" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NAME_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_TWO.ZhName %>：</dt><!--优惠券名称2-->
               <dd><span>
               
                    <textarea id="txtNAME_TWO" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NUM_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_TWO.ZhName %>：</dt><!--优惠券数量2-->
               <dd><span>
               
                    <input id="txtNUM_TWO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_THREE.ZhName %>：</dt><!--奖品类别3-->
               <dd><span>
               
                    <textarea id="txtTYPE_THREE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PIC_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_THREE.ZhName %>：</dt><!--图片地址3-->
               <dd><span>
               
                    <textarea id="txtPIC_THREE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NAME_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_THREE.ZhName %>：</dt><!--优惠券名称3-->
               <dd><span>
               
                    <textarea id="txtNAME_THREE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NUM_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_THREE.ZhName %>：</dt><!--优惠券数量3-->
               <dd><span>
               
                    <input id="txtNUM_THREE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FOUR.ZhName %>：</dt><!--奖品类别4-->
               <dd><span>
               
                    <textarea id="txtTYPE_FOUR" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PIC_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FOUR.ZhName %>：</dt><!--图片地址4-->
               <dd><span>
               
                    <textarea id="txtPIC_FOUR" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NAME_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FOUR.ZhName %>：</dt><!--优惠券名称4-->
               <dd><span>
               
                    <textarea id="txtNAME_FOUR" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NUM_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FOUR.ZhName %>：</dt><!--优惠券数量4-->
               <dd><span>
               
                    <input id="txtNUM_FOUR" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FIVE.ZhName %>：</dt><!--奖品类别5-->
               <dd><span>
               
                    <textarea id="txtTYPE_FIVE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PIC_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FIVE.ZhName %>：</dt><!--图片地址5-->
               <dd><span>
               
                    <textarea id="txtPIC_FIVE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NAME_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FIVE.ZhName %>：</dt><!--优惠券名称5-->
               <dd><span>
               
                    <textarea id="txtNAME_FIVE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NUM_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FIVE.ZhName %>：</dt><!--优惠券数量5-->
               <dd><span>
               
                    <input id="txtNUM_FIVE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_SIX.ZhName %>：</dt><!--奖品类别6-->
               <dd><span>
               
                    <textarea id="txtTYPE_SIX" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PIC_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_SIX.ZhName %>：</dt><!--图片地址6-->
               <dd><span>
               
                    <textarea id="txtPIC_SIX" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NAME_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_SIX.ZhName %>：</dt><!--优惠券名称6-->
               <dd><span>
               
                    <textarea id="txtNAME_SIX" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NUM_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_SIX.ZhName %>：</dt><!--优惠券数量6-->
               <dd><span>
               
                    <input id="txtNUM_SIX" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CONFIRM_PWD">
               <dt><%=WEC_ACTIVITY.Attribute.CONFIRM_PWD.ZhName %>：</dt><!--兑奖密码-->
               <dd><span>
               
                    <textarea id="txtCONFIRM_PWD" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="SN_RENAME">
               <dt><%=WEC_ACTIVITY.Attribute.SN_RENAME.ZhName %>：</dt><!--SN码重命名为-->
               <dd><span>
               
                    <textarea id="txtSN_RENAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="TEL_RENAME">
               <dt><%=WEC_ACTIVITY.Attribute.TEL_RENAME.ZhName %>：</dt><!--手机号重命名-->
               <dd><span>
               
                    <textarea id="txtTEL_RENAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="SHOW_NUM">
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_NUM.ZhName %>：</dt><!--抽奖页面是否显-->
               <dd><span>
               
                    <input id="txtSHOW_NUM" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SN_CODE">
               <dt><%=WEC_ACTIVITY.Attribute.SN_CODE.ZhName %>：</dt><!--SN码生成设置-->
               <dd><span>
               
                    <input id="txtSN_CODE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="NAME">
               <dt><%=WEC_ACTIVITY.Attribute.NAME.ZhName %>：</dt><!--活动名称-->
               <dd><span>
               
                    <textarea id="txtNAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="CONTENT">
               <dt><%=WEC_ACTIVITY.Attribute.CONTENT.ZhName %>：</dt><!--简介-->
               <dd><span>
               
                    <textarea id="txtCONTENT" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="INFO">
               <dt><%=WEC_ACTIVITY.Attribute.INFO.ZhName %>：</dt><!--活动说明-->
               <dd><span>
               
                    <input id="txtINFO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="USE_INSTRUCTION">
               <dt><%=WEC_ACTIVITY.Attribute.USE_INSTRUCTION.ZhName %>：</dt><!--兑换券使用说明-->
               <dd><span>
               
                    <input id="txtUSE_INSTRUCTION" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="END_INSTRUCTION">
               <dt><%=WEC_ACTIVITY.Attribute.END_INSTRUCTION.ZhName %>：</dt><!--结束活动说明-->
               <dd><span>
               
                    <input id="txtEND_INSTRUCTION" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WEC_ACTIVITY.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WEC_ACTIVITY.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="FOR_PEOPLE">
               <dt><%=WEC_ACTIVITY.Attribute.FOR_PEOPLE.ZhName %>：</dt><!--适用人群-->
               <dd><span>
               
                    <input id="txtFOR_PEOPLE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PROBABILITY">
               <dt><%=WEC_ACTIVITY.Attribute.PROBABILITY.ZhName %>：</dt><!--中奖概率-->
               <dd><span>
               
                    <textarea id="txtPROBABILITY" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NUMBER_TIMES">
               <dt><%=WEC_ACTIVITY.Attribute.NUMBER_TIMES.ZhName %>：</dt><!--每人最多允许抽-->
               <dd><span>
               
                    <input id="txtNUMBER_TIMES" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="MOST_NUM_TIMES">
               <dt><%=WEC_ACTIVITY.Attribute.MOST_NUM_TIMES.ZhName %>：</dt><!--每人每天最多抽-->
               <dd><span>
               
                    <input id="txtMOST_NUM_TIMES" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="KIND">
               <dt><%=WEC_ACTIVITY.Attribute.KIND.ZhName %>：</dt><!--活动类别-->
               <dd><span>
               
                    <select id="txtKIND" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="INFORMATION">
               <dt><%=WEC_ACTIVITY.Attribute.INFORMATION.ZhName %>：</dt><!--兑奖信息-->
               <dd><span>
               
                    <textarea id="txtINFORMATION" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="WIN_INFO">
               <dt><%=WEC_ACTIVITY.Attribute.WIN_INFO.ZhName %>：</dt><!--中奖提示-->
               <dd><span>
               
                    <textarea id="txtWIN_INFO" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NO_WIN_INFO">
               <dt><%=WEC_ACTIVITY.Attribute.NO_WIN_INFO.ZhName %>：</dt><!--未中奖提示-->
               <dd><span>
               
                    <textarea id="txtNO_WIN_INFO" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="SHOW_WIN_USRE">
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_WIN_USRE.ZhName %>：</dt><!--显示设置-->
               <dd><span>
               
                    <input id="txtSHOW_WIN_USRE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PLAY_AUDIO">
               <dt><%=WEC_ACTIVITY.Attribute.PLAY_AUDIO.ZhName %>：</dt><!--功能选择-->
               <dd><span>
               
                    <input id="txtPLAY_AUDIO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="MP3_URL">
               <dt><%=WEC_ACTIVITY.Attribute.MP3_URL.ZhName %>：</dt><!--背景音乐-->
               <dd><span>
               
                    <textarea id="txtMP3_URL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="RULES">
               <dt><%=WEC_ACTIVITY.Attribute.RULES.ZhName %>：</dt><!--活动规则-->
               <dd><span>
               
                    <textarea id="txtRULES" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="SYSTEM_SCORE">
               <dt><%=WEC_ACTIVITY.Attribute.SYSTEM_SCORE.ZhName %>：</dt><!--每道系统分值-->
               <dd><span>
               
                    <input id="txtSYSTEM_SCORE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CUSTOM_SCORE">
               <dt><%=WEC_ACTIVITY.Attribute.CUSTOM_SCORE.ZhName %>：</dt><!--每道自定义分值-->
               <dd><span>
               
                    <input id="txtCUSTOM_SCORE" type="text" runat="server" />
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
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.ID._ZhName %></td><!--编号(ID)-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.AID._ZhName %></td><!--公众号编号-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.KEYWORD._ZhName %></td><!--关键词(NAM-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.INSTRUCTION._ZhName %></td><!--成功抢到券说明-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.TIME._ZhName %></td><!--活动时间-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.START_PICURL._ZhName %></td><!--2-活动开始图-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.WIN_PICURL._ZhName %></td><!--中奖后显示的头-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.OUT_PICURL._ZhName %></td><!--中奖图片外链地-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.END_THEME._ZhName %></td><!--3-活动结束公-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.END_PICURL._ZhName %></td><!--3-活动结束图-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.TYPE_ONE._ZhName %></td><!--奖品类别1-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.PIC_ONE._ZhName %></td><!--图片地址1-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NAME_ONE._ZhName %></td><!--优惠券名称1-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NUM_ONE._ZhName %></td><!--优惠券数量1-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.TYPE_TWO._ZhName %></td><!--奖品类别2-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.PIC_TWO._ZhName %></td><!--图片地址2-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NAME_TWO._ZhName %></td><!--优惠券名称2-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NUM_TWO._ZhName %></td><!--优惠券数量2-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.TYPE_THREE._ZhName %></td><!--奖品类别3-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.PIC_THREE._ZhName %></td><!--图片地址3-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NAME_THREE._ZhName %></td><!--优惠券名称3-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NUM_THREE._ZhName %></td><!--优惠券数量3-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.TYPE_FOUR._ZhName %></td><!--奖品类别4-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.PIC_FOUR._ZhName %></td><!--图片地址4-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NAME_FOUR._ZhName %></td><!--优惠券名称4-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NUM_FOUR._ZhName %></td><!--优惠券数量4-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.TYPE_FIVE._ZhName %></td><!--奖品类别5-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.PIC_FIVE._ZhName %></td><!--图片地址5-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NAME_FIVE._ZhName %></td><!--优惠券名称5-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NUM_FIVE._ZhName %></td><!--优惠券数量5-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.TYPE_SIX._ZhName %></td><!--奖品类别6-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.PIC_SIX._ZhName %></td><!--图片地址6-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NAME_SIX._ZhName %></td><!--优惠券名称6-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NUM_SIX._ZhName %></td><!--优惠券数量6-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.CONFIRM_PWD._ZhName %></td><!--兑奖密码-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.SN_RENAME._ZhName %></td><!--SN码重命名为-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.TEL_RENAME._ZhName %></td><!--手机号重命名-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.SHOW_NUM._ZhName %></td><!--抽奖页面是否显-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.SN_CODE._ZhName %></td><!--SN码生成设置-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NAME._ZhName %></td><!--活动名称-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.CONTENT._ZhName %></td><!--简介-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.INFO._ZhName %></td><!--活动说明-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.USE_INSTRUCTION._ZhName %></td><!--兑换券使用说明-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.END_INSTRUCTION._ZhName %></td><!--结束活动说明-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.STATUS._ZhName %></td><!--状态-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.ADDTIME._ZhName %></td><!--添加时间-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.FOR_PEOPLE._ZhName %></td><!--适用人群-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.PROBABILITY._ZhName %></td><!--中奖概率-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NUMBER_TIMES._ZhName %></td><!--每人最多允许抽-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.MOST_NUM_TIMES._ZhName %></td><!--每人每天最多抽-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.KIND._ZhName %></td><!--活动类别-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.INFORMATION._ZhName %></td><!--兑奖信息-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.WIN_INFO._ZhName %></td><!--中奖提示-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.NO_WIN_INFO._ZhName %></td><!--未中奖提示-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.SHOW_WIN_USRE._ZhName %></td><!--显示设置-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.PLAY_AUDIO._ZhName %></td><!--功能选择-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.MP3_URL._ZhName %></td><!--背景音乐-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.RULES._ZhName %></td><!--活动规则-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.SYSTEM_SCORE._ZhName %></td><!--每道系统分值-->
                    
                    
                    <td><%=WEC_ACTIVITY.Attribute.CUSTOM_SCORE._ZhName %></td><!--每道自定义分值-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).AID %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).KEYWORD %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).INSTRUCTION %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).TIME %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).START_PICURL %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).WIN_PICURL %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).OUT_PICURL %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).END_THEME %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).END_PICURL %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).TYPE_ONE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).PIC_ONE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NAME_ONE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NUM_ONE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).TYPE_TWO %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).PIC_TWO %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NAME_TWO %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NUM_TWO %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).TYPE_THREE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).PIC_THREE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NAME_THREE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NUM_THREE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).TYPE_FOUR %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).PIC_FOUR %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NAME_FOUR %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NUM_FOUR %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).TYPE_FIVE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).PIC_FIVE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NAME_FIVE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NUM_FIVE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).TYPE_SIX %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).PIC_SIX %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NAME_SIX %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NUM_SIX %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).CONFIRM_PWD %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).SN_RENAME %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).TEL_RENAME %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).SHOW_NUM %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).SN_CODE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).CONTENT %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).INFO %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).USE_INSTRUCTION %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).END_INSTRUCTION %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_ACTIVITY.Attribute.STATUS, ((WEC_ACTIVITY)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_ACTIVITY)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_ACTIVITY)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).FOR_PEOPLE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).PROBABILITY %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NUMBER_TIMES %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).MOST_NUM_TIMES %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_ACTIVITY.Attribute.KIND, ((WEC_ACTIVITY)Container.DataItem).KIND)%></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).INFORMATION %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).WIN_INFO %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).NO_WIN_INFO %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).SHOW_WIN_USRE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).PLAY_AUDIO %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).MP3_URL %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).RULES %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).SYSTEM_SCORE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY)Container.DataItem).CUSTOM_SCORE %></td>
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

