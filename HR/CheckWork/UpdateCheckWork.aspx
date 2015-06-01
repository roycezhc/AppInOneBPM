<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CheckWork_UpdateCheckWork" CodeFile="UpdateCheckWork.aspx.cs" %>
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self"/>
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
    <link href="Uploadify/uploadify.css" rel="stylesheet" type="text/css" />
    <link href="../../Lib/MyDP/seldate.css" rel="stylesheet" type="text/css" />
    <link href="Uploadify/jquery_loadmask.css" rel="stylesheet" type="text/css" />
    <script src="../../Lib/MyDP/seldate.js" type="text/javascript"></script>
    <script src="Uploadify/jquery-1_4_2_min.js" type="text/javascript"></script>
    <script src="Uploadify/jquery_uploadify_v2_1_4.js" type="text/javascript"></script>
    <script src="Uploadify/swfobject.js" type="text/javascript"></script>
    <script src="Uploadify/jquery_loadmask.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager();
        $(function () {
            manager.initBodyRows();
            manager.initFindDL();
            //manager.initPageSizeEvt("txtPageNum");
            bindWinResize(40);
        });

        $(document).ready(function () {
            $('#uploadify').uploadify({
                'width': 110,
                'heigth': 30,
                'uploader': 'uploadify/uploadify.swf',
                'script': 'Uploadify.ashx',
                'cancelImg': 'uploadify/cancel.png',
                'folder': 'uploads',
                'auto': false,
                'multi': true,
                'sizeLimit': "21474836470",
                'fileExt': '*.mdb;',
                'fileDesc': '请选择Access数据库文件(*.mdb)',
                'simUploadLimit ': 5,
                'buttonText': '',
                'buttonImg': 'Uploadify/browse.jpg',
                'scriptData': { 'methed': 'uploadFile', 'arg1': 'value1' },
                'onComplete': function (event, queueID, file, serverData, data) {
                    //serverData为服务器端返回的字符串值
                    if (serverData != "0") {
                        var item = serverData.split('|');
                        if (item.length > 2) {
                            reFreshTable("1");
                            //AddReptItem(item);
                        }
                        else {
                            alert(serverData);
                        }
                    }
                    else {
                        //alert("上传失败！");
                    }
                }
            });
        });

        function AddReptItem(item) {
            if (item == undefined || item == null)
                return;
            var err = "";
            try {
                if (item.length < 3)
                    return;
            } catch (err) { return; }
            var tb = $("#tbodylist");
            if (tb.length < 1)
                return;
            var tr = "";
            tr += "<tr>";
            tr += "    <th><input type='checkbox' /></th>";
            tr += "    <td><a title='" + item[0] + "' href='uploads/" + item[0] + "'>" + getShowString(item[0]) + "</a></dt>"
            tr += "    <td>" + item[1] + "</dt>"
            tr += "    <td>" + item[2] + "</dt>"
            tr += "    <td><select><option value='' selected='selected'>默认方案</option>" + decodeURI($("#cphBody_txtFangAnSelStr").val()) + "</select></td>";
            tr += "    <td><input type='text' readonly='readonly' onclick='setday(this)' /></dt>"
            tr += "    <td><input type='text' readonly='readonly' onclick='setday(this)' /></dt>"
            tr += "    <td style='background-color:#f5f5f5'>";
            tr += "           <image onclick='doThis(this)' title='同步考勤记录' src='Uploadify/update.png'/>";
            tr += "           <image onclick='doThis(this)' title='同步员工信息' src='Uploadify/stff.png'/>";
            tr += "           <image onclick='doThis(this)' title='删除文件' src='Uploadify/delete.png'/>";
            tr += "    </td>";
            tr += "</tr>";

            var tbItems = tb.html();
            if (tb[0].childNodes.length >= 15) {
                tbItems = tbItems.substring(0,tbItems.lastIndexOf("<TR>"));
            }
            tb.html(tr + tbItems);
        }

        function getShowString(str) {
            if (str.length > 15) {
                str = str.substr(0, 10) + ".." + str.substr(str.length - 4, 4);
            }
            return str;
        }

        function doThis(me) {
            var btn = $(me);
            if (btn.length < 1)
                return;
            var tit = btn[0].title;
            var tr = btn[0].parentNode.parentNode;
            if (tit == "同步考勤记录") {
                var fileName = tr.cells[1].childNodes[0].title;
                var fangan = tr.cells[4].childNodes[0][0].text;
                var stime = tr.cells[5].childNodes[0].value;
                var etime = tr.cells[6].childNodes[0].value;
                if(fangan == "" || stime == "" || etime == ""){
                    alert("请完整输入起始时间、结束时间！");
                    return;
                }
                doUpdateCheck(tr, fileName, fangan, stime, etime);
            }
            else if (tit == "同步员工信息") {
                var fileName = tr.cells[1].childNodes[0].title;
                var fangan = tr.cells[4].childNodes[0][0].text;
                doUpdateStff(tr, fileName, fangan);
            }
            else if (tit == "删除文件") {
                var fileName = tr.cells[1].childNodes[0].title;
                deleteFile(tr, fileName);
            }
        }

        function doUpdateStff(tr, fileName, fangan) {
            if (!confirm("确定要同步文件：" + fileName + "的员工信息吗？\n方案：" + fangan))
                return;
            $(".main").mask("正在同步员工信息...");
            var doworkurl = "UpdateCheckWorkDoWork.aspx?dotype=updatestff&filename=" + encodeURI(fileName) + "&fangan=" + encodeURI(fangan) + "&r=" + Math.random();
            $.ajax({
                type: "GET",
                url: doworkurl,
                data: "",
                dataType: "html",
                timeout: 180000,
                success: function (data) {
                    $(".main").unmask();
                    alert(data);
                    if (data.indexOf("成功") >= 0) {
                        //tr.style.display = "none";
                        //reFreshTable("");
                    }
                },
                error: function (a, b, c) {
                    $(".main").unmask();
                    if (b == "timeout") {
                        alert("员工信息同步异常，timeout！");
                    }
                },
                complete: function (xht, sta) {
                    $(".main").unmask();
                    if (sta == "error") {
                        alert("员工信息同步异常，error！");
                    }
                }
            });
        }

        function doUpdateCheck(tr, fileName, fangan, stime, etime) {
            if (!confirm("确定要同步文件：" + fileName + "的考勤记录吗？\n方案：" + fangan + "\n起始时间：" + stime + "\n结束时间：" + etime))
                return;
            $(".main").mask("正在同步考勤记录...");
            var doworkurl = "UpdateCheckWorkDoWork.aspx?dotype=updatecheck&filename=" + encodeURI(fileName) + "&fangan=" + encodeURI(fangan) + "&stime=" + encodeURI(stime) + "&etime=" + encodeURI(etime) + "&r=" + Math.random();
            $.ajax({
                type: "GET",
                url: doworkurl,
                data: "",
                dataType: "html",
                timeout: 180000,
                success: function (data) {
                    $(".main").unmask();
                    alert(data);
                    if (data.indexOf("成功") >= 0) {
                        //tr.style.display = "none";
                        //reFreshTable("");
                    }
                },
                error: function (a, b, c) {
                    $(".main").unmask();
                    if (b == "timeout") {
                        alert("考勤记录同步异常，timeout！");
                    }
                },
                complete: function (xht, sta) {
                    $(".main").unmask();
                    if (sta == "error") {
                        alert("考勤记录同步异常，error！");
                    }
                }
            });
        }

        function deleteFile(tr, fileName) {
            if (!confirm("确定要删除文件：" + fileName + "吗？"))
                return;
            $(".main").mask("正在删除文件...");
            var doworkurl = "UpdateCheckWorkDoWork.aspx?dotype=delete&filename=" + encodeURI(fileName) + "&r=" + Math.random();
            $.ajax({
                type: "GET",
                url: doworkurl,
                data: "",
                dataType: "html",
                timeout: 60000,
                success: function (data) {
                    $(".main").unmask();
                    alert(data);
                    if (data.indexOf("成功") >= 0) {
                        //tr.style.display = "none";
                        reFreshTable("");
                    }
                },
                error: function (a, b, c) {
                    $(".main").unmask();
                    if (b == "timeout") {
                        alert("删除异常，timeout！");
                    }
                },
                complete: function (xht, sta) {
                    $(".main").unmask();
                    if (sta == "error") {
                        alert("删除异常，error！");
                    }
                }
            });
        }

        function getCurrPageIndex() {
            var pageStr = $("#cphBody_aspPager").find("td")[0].outerText;
            var index = pageStr.substring(pageStr.indexOf("页码") + 3, pageStr.indexOf("/"));
            return index;
        }

        function reFreshTable(pageIndex) {
            var index;
            if (pageIndex == undefined || pageIndex == "" || pageIndex == null) {
                index = getCurrPageIndex();
            }
            else
                index = pageIndex;
            if (index == null || index == undefined || index == "")
                index = "1";
            __doPostBack('ctl00$cphBody$aspPager', index);
        }

         window.onresize = function () {
            var h = $(window).height();
            var w = $(window).width();
            $("div.tblist").height(h - 70);
            $(".left").height(h - 40);
            $(".left").width(w - 390);
            $(".right").height($("div .tblist").height());
        }
    </script>
    <style type="text/css">
        image{ cursor:pointer; border: sidle 1px black; background-color:#f5f5f5;}
        .main{min-width:980px;height:100%;width:100%; }
        .left{float:left; min-height:50px; min-width:600px; margin-right:5px; border-left:1px solid #ddd; border-right:1px solid #ddd; border-bottom:1px solid #ddd;  text-align:left; height:100%;}
        .left table td input{width:80px;}
        .right{ float:left;  height:100px;width:345px; text-align:left; background-color:#f5f5f5; border:solid 2px #e5e5e5; margin-left:0; margin-right:0; padding:5px;}
        .tblist table{ min-width:600px;}
        .tblist table thead tr td image{ clear:both; float:right; margin-top:-20px;}
        .tblist table tbody tr td image{ text-align:center; line-height:20px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat = "server" ></asp:ScriptManager>
<div class="main">
<input type="hidden" id="txtFangAnSelStr" runat="server" />
   <div class="titnav">
    <dl><dt><b>考勤机数据库上传</b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
         <div class="clear"></div>
<div class="left">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
             <ContentTemplate>
     <div class="tblist">
        <table cellpadding="0" cellspacing="0" id="tbList" style=" min-height:600px;">
             <thead>
                <tr>
                   <td class="first"><input  style=" width:30px;" type="checkbox" onclick="_selAll(this)" /></td>
                   <td><label>文件名称</label></td>
                   <td><label>文件大小</label></td>
                   <td><label>上传时间</label></td>
                   <td><label>考勤方案</label><image style="display:none;" onclick="" title="编辑方案" src="Uploadify/edit.png"/></td>
                   <td><label>起开日期</label></td>
                   <td><label>结束日期</label></td>
                   <td><label>操作</label></td>
                </tr>
             </thead>
             <tbody id="tbodyList">
                   <asp:Repeater ID="repList" runat="server">
                       <ItemTemplate>
                       <tr>
                          <td class="first"><input  style=" width:30px;" type="checkbox" /></td>
                          <td><a title="<%#((FileInfo)Container.DataItem).Name%>" ><%#GetShowString(((FileInfo)Container.DataItem).Name)%></a></td>
                          <td><%#((FileInfo)Container.DataItem).Length + "Byte"%></td>
                          <td><%#((FileInfo)Container.DataItem).CreationTime%></td>
                          <td><select><option value="" selected="selected">默认方案</option><%#m_fanganList%></select></td>
                          <td><input type="text" readonly="readonly" onclick="setday(this)" /></td>
                          <td><input type="text" readonly="readonly" onclick="setday(this)" /></td>
                          <td style=" background-color:#f5f5f5">
                              <image onclick="doThis(this)" title="同步考勤记录" src="Uploadify/update.png"/>
                              <image onclick="doThis(this)" title="同步员工信息" src="Uploadify/stff.png"/>
                              <image onclick="doThis(this)" title="删除文件" src="Uploadify/delete.png"/>
                          </td>
                       </tr>
                      </ItemTemplate>
                  </asp:Repeater>
            </tbody>
        </table>
     </div>
        </ContentTemplate>
            </asp:UpdatePanel>

    <div class="pages">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
             <ContentTemplate>
         <WebCtrl:AspNetPager ID="aspPager" runat="server" OnPageChanged="aspPager_PageChanged">
         </WebCtrl:AspNetPager>
    </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</div>
<div class="right">
    <div id="fileQueue"></div>
    <image onclick="javascript:$('.right').mask('正在准备上传......');$('#uploadify').uploadifyUpload();$('.right').unmask();" src="Uploadify/update.jpg"/>
    <image onclick="javascript:$('.right').mask('正在取消上传......');$('#uploadify').uploadifyClearQueue();$('.right').unmask();" src="Uploadify/cancel.jpg"/>
    <input type="file" name="uploadify" id="uploadify" />
</div>
</div>
<script type="text/javascript">
    window.onresize();
</script>
</asp:Content>

