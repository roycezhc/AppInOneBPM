<%@ Page Title="部门管理" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="Admin_DEPT_DeptManageNew" CodeFile="DeptManageNew.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="../../Lib/JQuery/jquery.min.js"></script>
    <script src="../../Lib/jsPlugin/divTree/divTree.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {
        var tv = new TV.Tree("tree0", {
            selNodeHandle: function (tn) {
                //alert(tn.getNAME()+"------");
            }
        });
    });

</script>
<style type="text/css">

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div id="tttt">
<div class="aaaa"></div>
</div>
<div class="lrlayout">
    <div class="left" style="width:180px;height:auto;">
        <div>
           <ul class="tree0" id="tree0">
              <li data="{id:'0',pid:'0',name:'根节点1',ntype:'dept',no:1,sc:0}"><div><b><em></em></b><a>根节点1</a></div></li>
              <li><div><b><em></em></b><a>根节点1</a></div>
                  <ul>
                   <li><div><b><em></em></b><a>节点1</a></div></li>
                   <li><div><b><em></em></b><a>节点2</a></div></li>
                   <li><div><b><em></em></b><a>节点3</a></div></li>
                   <li><div><b class="opened"><em></em></b><a>节点4</a></div>
                       <ul>
                          <li><div><b><em></em></b><a>节点1</a></div></li>
                          <li><div><b class="opened"><em></em></b><a>节点1</a></div>
                              <ul>
                                  <li><div><b><em></em></b><a>节点1</a></div></li>
                                  <li><div><b><em></em></b><a>节点1</a></div></li>
                                  <li><div><b><em></em></b><a>节点1</a></div></li>
                                  <li><div class='leaf'><b><em></em></b><a>节点1</a></div></li>
                               </ul>
                          </li>
                          <li><div><b><em></em></b><a>节点1</a></div></li>
                          <li><div class='leaf'><b><em></em></b><a>节点1</a></div></li>
                       </ul>
                   </li>
                   <li><div><b><em></em></b><a>节点5</a></div></li>
                   <li><div class='leaf'><b><em></em></b><a>节点6</a></div></li>
                 </ul>
              </li>
              <li><div><b><em></em></b><a>根节点1</a></div></li>
           </ul>
        </div>
        
        <div class="tree1" id="treemag" style=" overflow:auto;">
             <ul><asp:Literal ID="litChnl" runat="server"></asp:Literal>
             </ul>
        </div>
     </div>
     <div class="right" style="margin-left:182px;height:auto;">
     <iframe src="" id="ifrMain" frameborder="0"></iframe>
     </div>
</div>

</asp:Content>

