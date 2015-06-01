<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="NEWFORMManage.aspx.cs" Inherits="test_Default4" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.BLL.Base" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../../../SupportPlatform/bootstrap-3.2.0/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <style>
        select {
            border: 1px solid #ccc;
            padding-top: 3px;
            padding-bottom: 3px;
            padding-left: 8px;
            padding-right: 8px;
            border-radius: 5px;
            font-size: 12px;
        }
        ul {
            list-style-type:none;
        }

        ul li div {
            border: 1px solid;
            width: 150px;
            text-align: center;
            line-height: 40px;
            font-size: 20px;
            font-family: 微软雅黑;
            margin:auto;
        }

        ul li {
            margin-top:10px;
            margin-bottom:10px;
        }
    </style>
    <script src="new_form.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody2" Runat="Server">
    <div class="container">
        <div class="row" style="margin-top:20px;">
            <div class="pull-left">
				
							
			<%--	<button class="btn btn-info" title="恢复默认模板" id="recovery">
						
					恢复默认模板
				</button>&nbsp;--%>

				<button class="btn btn-primary" title="新增模板" id="add">
					
					新增模板
				</button>&nbsp;

				
                
				&nbsp;
              </div>
        </div>
        
        <div class="row" style="margin-top:50px;">
            <label style="margin-right:40px;"> 模板选择</label>
            <select style="width:126px;" id="tableList">
                <option value="-1">--无--</option>
                <% foreach (var item in tableMap) {%>
                    <option value="<%=item.Key %>" <%=item.Key.Equals(currTable)?"selected":""%>><%=item.Value %></option>
                <%} %>
            </select>
            <select style="width:70px;" id="templateList">
               <%=html %>
            </select>
            <button class="btn btn-info" title="选择模板" id="selectTp" >
						
					选择模板
				</button>&nbsp;
            <button class="btn btn-danger  pull-right" title="删除模板" id="del" >
						
					删除模板
				</button>&nbsp;
            <button class="btn btn-success pull-right" title="保存" id="save">
						
					保存
			</button>&nbsp;
            
        </div>
        <div class="row" style="margin-top:20px;">
             <div class="pull-left col-lg-3" >
                <label> 字段 </label>
                <div  style="height:500px;border:1px solid #000000;overflow-y:auto;" id="fieldList">
                    <%=fieldHtml %>
                </div>
            </div>
            <div class="pull-right col-lg-9">
                <label> 信息</label>
                <script type='text/javascript'>
                    $(function () {
                        window.kindEditor = new creatKindEditor('#template_content');
                      
                        initDragView();
                      
                    });
                </script>
                <input id='template_content' type='text' style='width:100%;height:500px;' />
            </div>
        </div>
    </div>

    <div class="modal" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">添加模板</h4>
          </div>
          <div class="modal-body">
             <form>
              <div class="form-group">
                <label for="templateName">模板名称</label>
                <input type="text" class="form-control" id="templateName" placeholder="请输入模板名">
              </div>
             </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="ok_template">保存</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div id="data" tablename="<%=currTable %>" zhtablename="<%=currZhTable %>" currtableid ="<%=currTableId %>"  selectetempname="<%=selectedTempName %>"></div>
</asp:Content>
