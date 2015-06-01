<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="STEPATH_SETNEW.aspx.cs" Inherits="WF_Admin_STEP_STEPATH_SETNEW" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <script src="<%= ResolveUrl("~/Lib/jquery/jquery-1.11.1.min.js")%>" type="text/javascript"></script>
	<script src="<%= ResolveUrl("~/Lib/jquery/jquery-ui-1.10.4.min.js") %>" type="text/javascript"></script>
	<script src="<%= ResolveUrl("~/Lib/jquery/jquery.jsPlumb-1.7.1.js") %>" type="text/javascript"></script>
    <script src="<%= ResolveUrl("~/Lib/StepCtr/StepCtrBase.js") %>" type="text/javascript"></script>
    <script src="<%= ResolveUrl("~/Lib/StepCtr/StepCtr.js") %>" type="text/javascript"></script>
     <link href="<%=theme %>/jquery-ui-1.10.4.css" rel="stylesheet" type="text/css"/>
    <link href="<%=theme %>/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=theme %>/css/global.css" rel="stylesheet" type="text/css"/>
    <link href="<%=theme %>/css/page.css" rel="stylesheet" type="text/css"/>
    <script>
        <%=script %>
        SP.wfid = '<%=wfid %>';
        SP.procid = '<%=procid %>';
        function checkProc(me) {
            // alert("ssssss");
            //alert("STEPBack.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&checkProc=" + Math.random());
            $.ajax({
                url: "STEPBack.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&checkProc=" + Math.random(),
                cache: false,
                success: function (svrData) {
                    alert(svrData);
                },
                error: function (a, b, c) {
                    alert(a);
                }
            });
        }

        function cloneProc(me) {
            if (confirm('将把当前模版配置的过程所有参数复制到一个新的应用过程，以后提交的记录将走这个新过程，您确定要这样做吗')) {
                $.ajax({
                    url: "STEPBack.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&cloneProc=" + Math.random(),
                    cache: false,
                    success: function (svrData) {
                        if (svrData == "ok") {
                            alert("启动流程成功！");
                            $(me).parent().parent().prev().find("input").attr("disabled", false);
                        } else if (svrData == "err") {
                            alert("启动失败！");
                        } else {
                            alert(svrData);
                        }
                    },
                    error: function (a, b, c) {
                        alert(a);
                    }
                });
            }

        }
        function applyProc(me) {
            if (confirm('将把当前过程模版配置的所有参数应用到正在使用的过程，而不增加新过程。这样可能会影响正在处理的流程，请慎重使用。您确定要这样做吗')) {
                $.ajax({
                    url: "STEPBack.aspx?wfid=" + SP.wfid + "&procid=" + SP.procid + "&applyProc=" + Math.random(),
                    cache: false,
                    success: function (svrData) {
                        if (svrData == "ok") {
                            alert("更新流程成功！");
                        } else if (svrData == "err") {
                            alert("更新失败！");
                        } else {
                            alert(svrData);
                        }
                    },
                    error: function (a, b, c) {
                        alert(a);
                    }
                });
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphBody" Runat="Server">

   <div class="titnav">
  <dl><dt><b>流程引擎设计器</b></dt><dd><a href='<%=Request["preUrl"] %>'>返回</a></dd></dl>
</div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>

    <div class="content-container">
     
		<div id="left">
            <p>&nbsp;工具箱</p>
			<div class="node node-start" id="node0"><span>开始</span></div>
			<div class="node node-active" id="node1">
                <span>活动节点</span>
                <div class="active-content"><span>活动节点</span></div>
			</div>
			<%--<div class="node node-route" id="node2">
                <span>路由节点</span>
                <div class="route-content"><span>路由节点</span></div>
			</div>--%>
            <div class="node roate" id="node2"><span>路由节点</span></div>
			<%--<div class="node radius" id="node3">结束</div>--%>
            <div class="node node-end" id="node3">
                <span>结束</span>
                <div class="active-end"><span>结束</span></div>
			</div>
		</div>
        <div class="bottomtool">
                <ul>
                    <li>
                        <span>
                            <input type="button" value="保存" onclick="save()" />
                        </span>
                    </li>
                </ul>
                <ul>
                    <li>
                        <span>
                            <input id="btnApplyProc" onclick="applyProc(this);" type="button" value="提交并更新过程" />
                        </span>
                    </li>
                </ul>
                <ul>
                    <li>
                        <span>
                            <input id="btnCloneProc" onclick="cloneProc(this);" type="button" value="添加启用流程" title="不影响旧的已在途的流程" />
                        </span>
                    </li>
                </ul>
                <ul>
                    <li>
                        <span>
                            <input id="btnCheckProc" onclick="checkProc(this);" type="button" value="验证过程" />
                        </span>
                    </li>
                </ul>
            </div>

		<div id="right">
			<p>&nbsp;拖动到工作区域</p>
            <%=htmlText %>
		</div>
	</div>
</asp:Content>

