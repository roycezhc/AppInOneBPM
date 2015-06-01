<%@ Page Language="C#" AutoEventWireup="true" CodeFile="USERAdd.aspx.cs" Inherits="SYS_User_USERAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
          ul li{ list-style:none;}/*栏目管理*/
          a {color: #08c;text-decoration: none;}
          .breadcrumb li {line-height: 35px;display: inline-block; margin-bottom:20px;}
          div {display: block;}
          body {font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;font-size: 14px;line-height: 20px;color: #333;}
          .active{}
          .well{ border-top: 1px solid #e2e2e2 ; padding-top: 20px;}
          .control-label {float: left;width: 160px;padding-top: 5px;text-align: right;}
          .controls{margin-left: 100px;padding-left: 100px;}
          .control-group {margin-bottom: 20px;}
          input[ type="text"]{ width:200px; border: 1px solid #ccc;box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);transition: border linear .2s,box-shadow linear .2s;
            height:20px; padding:4px 6px; font-size:14px; line-height:20px; color:#555; border-radius:4px; }
           .label {display: inline-block;padding: 2px 4px;font-size: 11.844px;font-weight: bold;line-height: 14px;color: white;text-shadow: 0 -1px 0 rgba(0,0,0,0.25);white-space: nowrap;vertical-align: baseline;background-color: #999;border-radius: 3px;}
           .j_level_type{ width:215px; border: 1px solid #ccc;box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);transition: border linear .2s,box-shadow linear .2s;
            height:32px; padding:4px 6px; font-size:14px; line-height:20px; color:#555; border-radius:4px; }
           .img-polaroid{border: 1px solid rgba(0,0,0,0.2);margin: 10px 0;/*height: 90px;width: 90px;*/background-color: #bababa;padding: 4px;}          
           .form-horizontal input{ display:inline-block; }
           .j_img_clear{margin: 10px 0 5px 10px;}
           .row-fluid .span8 {display: block;float: left;}
           .row-fluid .span4 {display: block;float: left; margin-left:40px;}
           h5 {font-size: 14px;}
           .btn{padding: 4px 12px;font-size: 14px;line-height: 20px;color: #333;text-align: center;text-shadow: 0 1px 1px rgba(255,255,255,0.75);background-color: #f5f5f5;background-image: linear-gradient(to bottom,#fff,#e6e6e6);background-repeat: repeat-x;border: 1px solid #ccc;border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);border-bottom-color: #b3b3b3;border-radius: 4px;box-shadow: inset 0 1px 0 rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.05);}
          .btn-primary{color: white;background-color: #04c;background-image: linear-gradient(to bottom,#08c,#04c);}
          .btn-success {color: white;background-color: #5bb75b;background-image: linear-gradient(to bottom,#62c462,#51a351); }
    </style>
</head>
<body>
    <div class="main">
        <ul class="breadcrumb clearfix">
	        <li><a href="/cate">控制面板</a> <span class="divider">/</span></li>
	        <li class="active">用户管理</li>
        </ul>
        <div class="well">
	        <div class="row-fluid">
		        <div class="span8">
			        <form class="form-horizontal" action="" method="post" runat="server">
				        <div class="control-group">
					        <label class="control-label" for="input-cate_name">真实姓名</label>
					        <div class="controls">
						        <input type="text" name="cate_name" id="input-cate_name" />
						        <span class="help-inline">
                                    <img src="../../Themes/PMMS/img/find.gif"  alt="logo"/></span>
					        </div>
				        </div>
				        <div class="control-group">
					        <label class="control-label" for="input-description">用户名</label>
					        <div class="controls">
						        <input type="text" name="description" id="input-description"/>
						        <span class="help-inline"><span class="label">建议13个汉字以内</span></span>
					        </div>
				        </div>
                         <div class="control-group">
					        <label class="control-label" for="input-cate_name">密码</label>
					        <div class="controls">
						        <input type="text" name="cate_name" id="Text1" />
						        <span class="help-inline"><span class="label">不填写，不修改密码</span></span>
					        </div>
				        </div>
				        <div class="control-group">
					        <label class="control-label" for="input-description">内部邮件</label>
					        <div class="controls">
						        <input type="text" name="description" id="Text2"/>
						        <span class="help-inline"><span class="label">？？？？？？</span></span>
					        </div>
				        </div>
                        <div class="control-group">
					        <label class="control-label" for="input-cate_name">工作电脑IP地址</label>
					        <div class="controls">
						        <input type="text" name="cate_name" id="Text3">
						        <span class="help-inline"><span class="label">支持多IP，以“,”号分割</span></span>
					        </div>
				        </div>
				        <div class="control-group">
					        <label class="control-label" for="input-description">状态标志</label>
					        <div class="controls">
                               <select name="level_type" class="j_level_type">
                                        <option value="0">未选择</option>
                                        <option value="1">正常</option>
                                        <option value="2">禁用</option>                     
                               </select>
					        </div>
				        </div>
                         <div class="control-group">
					        <label class="control-label" for="input-cate_name">用户类型</label>
					        <div class="controls">
						        <select name="level_type1" class="j_level_type">
                                        <option value="0">未选择</option>
                                        <option value="1">系统管理员</option>
                                        <option value="2">超级管理员</option> 
                                        <option value="3">普通用户</option>                          
                               </select>
					        </div>
				        </div>
				        <div class="control-group">
					        <label class="control-label" for="input-description">用户角色</label>
					        <div class="controls">
						        <input type="text" name="description" id="Text6" />
						       <span class="help-inline">
                                    <img src="../../Themes/PMMS/img/find.gif"  alt="logo"/></span>
					        </div>
				        </div>
				        <div class="control-group">
					        <label class="control-label" for="input-image">栏目图片</label>
					        <div class="controls">
						        <img src="img/no_image.png" class="img-polaroid" id="image-preview" alt="crame"/>
                                <input type="button" class="btn j_img_clear" value="清空" />
						        <input type="hidden" name="image" id="input-image"/>
						        <div id="uploader-image" class="uploadify" style="height: 25px; width: 90px;">
                                    <div id="uploader-image-button" class="uploadify-button " style="height: 25px; line-height: 25px; width: 90px;">
                                            <span class="uploadify-button-text">上传图片</span>
                                    </div>
                                </div>
                                <div id="uploader-image-queue" class="uploadify-queue"></div>
						        <a class="btn btn-success" onclick="show_icons_sys()">选择系统图标</a>
					        </div>
				        </div>
				        <%--<div class="control-group" id="control_show_url">
					        <div class="controls">
						        <a href="#" id="show_url"><span class="label"><i class="icon-share icon-white"></i> 指向外部链接</span></a>
					        </div>
				        </div>--%>
				        <%--<div class="control-group hide" id="control_url">
					        <label class="control-label" for="input-url">外部链接</label>
					        <div class="controls">
						        <input type="text" name="url" id="input-url" class="span4" placeholder="http://">
					        </div>
				        </div>
				        <div class="control-group">
					        <label class="control-label" for="input-description">是否在首页显示</label>
					        <div class="controls">
						        <label for="display-yes" style="display:inline-block;">是</label><input id="display-yes" type="radio" checked="checked" name="display" value="0"/>
						        <label for="display-no" style="display:inline-block;">否</label><input id="display-no" type="radio" name="display" value="1"/>
					        </div>
				        </div>--%>
                
                        <div class="control-group">
                            <label class="control-label" for="input-image">查看权限</label>
                            <div class="controls">
                                <select name="level_type"  class="j_level_type">
                                <option value="0">匿名用户</option>
                                <option value="1">关注用户</option>
                                <option value="2">会员卡用户</option>                     
                               </select>
                            </div>
                        </div>
                        <div class="control-group j_level" style="display:none;">
                            <label class="control-label" for="input-image">会员卡等级</label>
                            <div class="controls">
                                <select name="level" style="width:120px;">
                                                                                <option value="1318">名牌珠宝</option>
                                                                                </select>
                            </div>
                        </div>
                
				        <div class="control-group" id="control_tpl">
					        <label class="control-label" for="tpllist">栏目模版</label>
					        <div class="controls">
						        <select id="tpllist" name="tpl" autocomplete="off" class="j_level_type">
							        <option value="" selected="" preview="http://web.bama555.com/assets/types_pub/cate/default/preview.jpg">使用全局设置</option>
														        <option value="default" preview="http://web.bama555.com/assets/types_pub/cate/default/preview.jpg">默认模版</option>
													        </select>
					        </div>
					        <div class="controls">
						        <img id="tpl_preview" style="margin-top: 12px;" width="220" src="http://web.bama555.com/assets/types_pub/cate/default/preview.jpg">
					        </div>
				        </div>
				        <div class="control-group">
					        <div class="controls">
						        <button type="submit" class="btn btn-primary">确认保存</button>
					        </div>
				        </div>
			        </form>
		        </div>
		        <div class="span4">
			        <h5>图例说明：</h5>
			        <img src="img/guide_2.jpg" alt="shili"/>
		        </div>
	        </div>
        </div>

</div>
</body>
</html>
