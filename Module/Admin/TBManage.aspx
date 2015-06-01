<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_WF_TBManage" CodeFile="TBManage.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/jsPlugin/divTree/divTree.js?t=8" type="text/javascript"></script>
    <script type="text/javascript"><%=af_js %></script>
    <script type="text/javascript">
        function doResize() {
            InitDivH(33, new Array($("div.left"), $("div.right")));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="titnav">
  <dl><dt><b>表单管理</b></dt><dd><a href='<%=Request["preUrl"] %>'>返回</a></dd></dl>
</div>
<div class="lrlayout">
     <div class="left" style="width:240px;height:500px; overflow:auto;">
        <div class="divtree"><ul class="db" id="TF_TABLE">
            <li data="{id:'0',pid:'0',name:'表管理',ntype:'TF_TABLE-root',no:1,sc:0}"><div><b><em></em></b><a>表管理</a></div></li>
        </ul></div>
        <div class="divtree"><ul class="db" id="TF_TB_RELA">
            <li data="{id:'0',pid:'0',name:'关系管理',ntype:'TF_TB_RELA-root',no:1,sc:0}"><div><b><em></em></b><a>关系管理</a></div></li>
        </ul></div>
        <div class="divtree"><ul class="db" id="TF_FORM">
            <li data="{id:'0',pid:'0',name:'表单管理',ntype:'TF_FORM-root',no:1,sc:0}"><div><b><em></em></b><a>表单管理</a></div></li>
        </ul></div>
     </div>
     <div class="right" style="margin-left:242px;height:500px;">
     <iframe src="" id="ifrMain" frameborder="0"></iframe>
     </div>
</div>
</asp:Content>

