<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="Admin_AU_POWERDICEdit" CodeFile="POWERDICEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script type="text/javascript">
        function fillChg(me) {
            var obj = eval("(" + me.value + ")");
            $("input[id$='txtDIC_NAME']").val(obj.name);
            $("select[id$='selCtrlType']").val(obj.ctrlType);
            $("input[id$='DIC_CODE']").val(obj.dicCode);
            $("select[id$='selDealType']").val(obj.dealType);
            $("select[id$='selDealType']").val(obj.dealType);

            var checker = new formChecker({ btnIDS: 'btnOK,_btnOK' });
        }
    </script>
<style type="text/css">
.form dl dd input{width:200px;}
.form dl dd select{width:200px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
    <div class="titnav">
        <dl><dt><b>权限信息编辑</b></dt>
        </dl>    
    </div>
    <div class="warn">
    <b class='info' id='info_div' runat="server" visible="false"></b>
    </div>
    <div class="tool">
       <ul>
       <li><span><asp:Button ID="btnOK" runat="server" Text="确定" onclick="btnOK_Click"/>
           </span></li>
       <li><span><input onclick="window.close();" value="关闭" type="button" /></span></li>
       </ul>
    </div>
    <div class="form">
       <input id="txtMdlID" type="hidden" runat="server" />
       <div>
           <dl>
               <dt><%=SYS_MDLPOWER_DIC.Attribute.DIC_NAME.ZhName %>：</dt><%--全名权限名称--%>
               <dd>
                    <input id="txtDIC_NAME" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </dd>
               <dt style="width:80px;">快速填充：</dt>
              <dd>
                <select id="selQuikFill" onchange="fillChg(this);" style="width:80px;">
                    <option value="{name:'',ctrlType:'1',dicCode:'',dealType:'1'}">请选择</option>
                    <option value="{name:'新增',ctrlType:'1',dicCode:'New',dealType:'1'}">新增</option>
                    <option value="{name:'编辑',ctrlType:'1',dicCode:'Edit',dealType:'1'}">编辑</option>
                    <option value="{name:'删除',ctrlType:'1',dicCode:'Del',dealType:'1'}">删除</option>
                    <option value="{name:'查询',ctrlType:'1',dicCode:'Find',dealType:'1'}">查询</option>
                    <option value="{name:'打印',ctrlType:'1',dicCode:'Print',dealType:'1'}">打印</option>
                    <option value="{name:'导出',ctrlType:'1',dicCode:'Out',dealType:'1'}">导出</option>
                    <option value="{name:'处理',ctrlType:'1',dicCode:'Deal',dealType:'1'}">处理</option>
                    <option value="{name:'设置',ctrlType:'1',dicCode:'Sel',dealType:'1'}">设置</option>
                </select></dd>
           </dl>
           <dl>
               <dt>控件类型：</dt>
               <dd>
                   <select id="selCtrlType" runat="server">
                   </select>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_MDLPOWER_DIC.Attribute.DIC_CODE.ZhName%>：</dt><%--DIC_CODE--%>
               <dd>
                
                    <input id="txtDIC_CODE" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_MDLPOWER_DIC.Attribute.DEAL_TYPE.ZhName %>：</dt><%--处理方式--%>
               <dd>
                     <select id="selDealType" runat="server">
                     </select>
               </dd>
           </dl>
         <div class="clear"></div>
       </div>

    </div>
    <div class="tool">
       <ul>
       <li><span><asp:Button ID="_btnOK" runat="server" Text="确定" onclick="btnOK_Click"/>
           </span></li>
       <li><span><input onclick="window.close();" value="关闭" type="button" /></span></li>
       </ul>
    </div>
</div>
</asp:Content>

