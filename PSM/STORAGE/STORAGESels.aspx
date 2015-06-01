<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="IM_STORAG_STORAGESels" CodeFile="STORAGESels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager({listID:'divList'});
        $(function () {
            manager.initBodyRows();
        });
    </script>
    <style type="text/css">
    #tbody-rows tr td{ cursor:pointer;}
    .lrlayout .left{border:none;}
   </style>
<script type="text/javascript">
    var hidObdID = "<%=hidOld.ClientID %>";
    function selok() {
        try {
            var selinfo = document.getElementById(hidObdID).value;
            window.returnValue = "["+selinfo+"]"; //返回选中对象：{ID:，名:}
            window.close();
        } catch (e) { }
    }

    function removeByObjStr(srcObjStr, moveObjStr) {
        var str = "";
        if (srcObjStr.indexOf('[') == -1) {
            srcObjStr = "[" + srcObjStr + "]";
        }
        if (moveObjStr.indexOf('(') == -1) {
            moveObjStr = "(" + moveObjStr + ")";
        }
        var srcObj = eval(srcObjStr);
        var moveObj = eval(moveObjStr);
        for (var i = 0; i < srcObj.length; i++) {
            if (isObjEqual(srcObj[i], moveObj) == false) {
                str += str == "" ? getObjStr(srcObj[i]) : "," + getObjStr(srcObj[i]);
            }
        }
        return str;
    }

    function isObjEqual(obj1, obj2) {
        for (var el in obj1) {
            if (obj1[el.toString()] == obj2[el.toString()]) {
                continue;
            } else {
                return false;
            }
        }
    }

    function getObjStr(obj) {
        var str = "{";
        for (var el in obj) {
            if (str.length > 1) {
                str += ",";
            }
            str += el.toString() + ":'" + obj[el.toString()] + "'";
        }
        str += "}";
        return str;
    }

    function getRowText(tds) {
        return "{ID:'" + tds[1].innerHTML + "',Name:'" + tds[2].innerHTML + "'}";
    }

    function selThis(el) {
        var hid = document.getElementById(hidObdID);
        var selinfo = hid.value;
        var trObj = $(el.parentNode.parentNode);
        var tds = trObj.find("td");
        var obj = document.getElementById("selectedlist");
        if (el.checked == true) {
            if (selinfo == "") {
                selinfo = getRowText(tds);
            } else {
                selinfo += "," + getRowText(tds);
            }
            //颜色也要改变
            $(el.parentNode.parentNode).css({ color: "#000", background: "#dde" });
            addOption(obj, tds[1].innerHTML, tds[2].innerHTML, false);
            if (trObj.parent().find("input[type='checkbox']").attr("checked") == true) {
                $("#ckSelAll").attr("checked", true);
            }
        } else {
            selinfo = removeByObjStr(selinfo, getRowText(tds));
            //颜色也要改变
            $(el.parentNode.parentNode).css({ color: "#000", background: "none" });
            removeByValue(obj, tds[1].innerHTML);
            $("#ckSelAll").attr("checked", false);
        }
        hid.value = selinfo; //alert(selinfo);
    }
    //页面加载后，根据隐藏域里的信息初始化左边列表框，选中右边表格相关行的选择框
    function setSelectHtml() {
        try {
            var objHid = document.getElementById(hidObdID);// alert(objHid.value);
            if (objHid.value != "") {
                var obj = document.getElementById("selectedlist");
                var arr = eval("[" + objHid.value + "]");
                for (var j = 0; j < arr.length; j++) {
                    addOption(obj, arr[j].ID, arr[j].Name, false);
                }
                var trs = $("#tbody-rows").find("tr");
                var selNum = 0;
                for (var i = 0; i < trs.length; i++) {
                    var ck = $(trs[i]).find("input");
                    var hadVal = false;
                    for (var a = 0; a < arr.length; a++) {
                        if (ck.val() == arr[a].ID) {
                            hadVal = true;selNum++; break;
                        }
                    }
                    if (hadVal == true) {
                        ck.attr("checked", true);
                        ck.parent().parent().css({ color: "#000", background: "#dde" });
                    }
                }
                if (trs.length == selNum) {
                    $("#ckSelAll").attr("checked", true);
                }
            }
        } catch (e) { }
    }

    $(function () {
        setSelectHtml();

        var trs = $("#tbody-rows").find("tr");
        for (var i = 0; i < trs.length; i++) {
            $(trs[i]).bind("click", trs[i], function (e) {
                if (e.target.tagName != "INPUT") {
                    var ck = $(e.data).find("input");
                    if (ck.attr("checked") == "") {
                        ck.attr("checked", "checked");
                    } else {
                        ck.attr("checked", "");
                    }
                    selThis(ck[0]);
                }
            });

        }
        var listSel = $("#selectedlist");
        listSel.bind("dblclick", listSel[0], function (e) {
            var curOp = e.data.options[e.data.selectedIndex];

            var cks = $("#tbody-rows").find("input[value='" + curOp.value + "']");
            var tds = cks.parent().parent().children();
            if (cks.length > 0) {
                cks[0].checked = false;
                selThis(cks[0]);
            } else {
                var hid = $("input[id$='hidOld']")[0];
                hid.value = removeByObjStr(hid.value, getRowText(tds));
            }
            removeByValue(e.data, curOp.value);
        });
        var qingkong = $("#qingkong");
        qingkong.bind("click", function (e) {
            $('#selectedlist').children().each(function () {
                if ($(this).val() != '') {
                    this.selected = true; $(this).dblclick(); //
                }
            });
        });

        bindWinResize();
    });

    function doResize() {
        InitDivH(110, new Array($("div.left"), $("div.right")));
    }

    function _selAll(el) {
        var cks = $("#tbody-rows").find("input[type='checkbox']");
        for (var i = 0; i < cks.length; i++) {
            cks[i].checked = el.checked;
            selThis(cks[i]);
        }
    }

</script>
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
    <div class="topfind"><!--需要隐去时，用 style="display:none;"-->        
         <dl>
               <dt><%=IM_STORAGE.Attribute.NAME.ZhName %>：</dt><!--仓库名-->
               <dd><span>
                
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
           </dl><dl>
               <dt><%=IM_STORAGE.Attribute.SNAME.ZhName %>：</dt><!--仓库简称-->
               <dd><span>
                
                    <input id="txtSNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=IM_STORAGE.Attribute.RNAME.ZhName %>：</dt><!--助记码-->
               <dd><span>
                
                    <input id="txtRNAME" type="text" runat="server" />
               </span></dd>
        </dl><dl>
               <dt>所属机构：</dt>
            <dd><selorg:wucselorg ID="wucSelORG1" runat="server" /></dd>
          </dl>
          <dl class="btn">
            <dd>
            <span><asp:Button ID="btn_Find" runat="server" Text="查询" onclick="btnFind_Click" Width="51" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"  style="width:60px;"/></span>
            <span><input id="btnNew" type="button" value="确定选择" onclick="selok();"  style="width:70px;"/></span>
            </dd>
        </dl>
        <h6></h6>
    </div> 
    <div class="lrlayout">
    <div class="left" style="width:150px;height:400px;">
       <select id="selectedlist" multiple="multiple" style="color:Blue;width:100%;height:100%;">
       </select>
    </div>
    <div class="right" style="margin-left:152px;height:400px;">
    <div class="tblist" id="divList">
       <table cellpadding="0" cellspacing="0">
             <thead>
                <tr>
                    <td class="first"><input type="checkbox" id="ckSelAll" name="all" value='全选' onclick='_selAll(this);'/></td>
                    <td><%=IM_STORAGE.Attribute.STOR_ID._ZhName %></td><!--仓库唯一标识-->
                    <td><%=IM_STORAGE.Attribute.NAME._ZhName %></td><!--仓库名-->
                    <td><%=IM_STORAGE.Attribute.SNAME._ZhName %></td><!--仓库简称-->
                    <td><%=IM_STORAGE.Attribute.RNAME._ZhName %></td><!--助记码-->
                    <td><%=IM_STORAGE.Attribute.ORG_ID._ZhName %></td><!--机构ID-->
                    <td><%=IM_STORAGE.Attribute.USE_FLAG._ZhName%></td><!--状态-->
                </tr>
            </thead>
            <tbody id="tbody-rows">
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                    <tr>
                    <td class="first"><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((IM_STORAGE)Container.DataItem).STOR_ID %>" /></td>
                    <td><%#((IM_STORAGE)Container.DataItem).STOR_ID %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).NAME %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).SNAME %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).RNAME %></td>
                    <td><%#((IM_STORAGE)Container.DataItem).ORG_ID %></td>
                    <td><%#FormHelper.GetText(IM_STORAGE.Attribute.USE_FLAG, ((IM_STORAGE)Container.DataItem).USE_FLAG)%></td>
                    </tr>   
                   </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <div class="pages">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
     </div>
     </div>
     </div>
</div>
</asp:Content>
