<%@ Page Language="C#" AutoEventWireup="true" CodeFile="USERManager.aspx.cs" Inherits="SYS_User_USERManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
          .pull-left{color:red;} 
         ul li ,.breadcrumb {list-style: none;}
         body {font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;font-size: 14px;line-height: 20px;color: #333;}
        h1, h2, h3, h4, h5, h6 {margin: 10px 0;font-family: inherit;font-weight: bold;line-height: 20px;}
        .breadcrumb {padding: 8px 15px;margin: 0 0 20px;background-color: #f5f5f5; height:56px;}   
        .pull-left { float:left;}   
        table{ text-align:center;}
        th{ width:auto;}
        .cz{ width:200px;}
        .table th, .table td {padding: 8px;line-height: 20px;vertical-align: top;border-top: 1px solid #ddd;}
        .btn-small { padding: 2px 10px;font-size: 11.9px; }
        a {text-decoration: none;}
        .icon-edit {background-position: -96px -72px;}
        .input-rank{ width:30px;}
        .icon-edit ,.icon-trash{ width: 14px;height: 14px;line-height: 14px;vertical-align: text-top;background-image: url("img/glyphicons-halflings.png");background-repeat: no-repeat;display:inline-block;}
        .icon-trash{ background-position: -456px 0;}
       .btn {display: inline-block;padding: 4px 12px;margin-bottom: 0;font-size: 14px;line-height: 20px;color: #333;text-align: center;text-shadow: 0 1px 1px rgba(255,255,255,0.75);vertical-align: middle;background-color: #f5f5f5;background-image: -moz-linear-gradient(top,#fff,#e6e6e6);background-image: -webkit-gradient(linear,0 0,0 100%,from(#fff),to(#e6e6e6));background-image: -webkit-linear-gradient(top,#fff,#e6e6e6);background-image: -o-linear-gradient(top,#fff,#e6e6e6);background-image: linear-gradient(to bottom,#fff,#e6e6e6);background-repeat: repeat-x;border: 1px solid #ccc;border-color: #e6e6e6 #e6e6e6 #bfbfbf;border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);border-bottom-color: #b3b3b3;border-radius: 4px;filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff',endColorstr='#ffe6e6e6',GradientType=0);filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);}

    </style>
</head>
<body>
    <div class="main-right">
        <ul class="breadcrumb clearfix">
            <h5 class="pull-left">“新建”：打开窗体新建用户。在表格中选中一行，点“编辑”打开窗口编辑用户。在表格左边多选用户，再点“删除”可批删除用户。</h5>
                   <img src="img/搜狗截图_2014-02-18_15-30-47.png" alt="add"/>
        </ul>
        <form class="form-inline" runat="server">
            <table class="table table-striped">              
                <thead>
                    <tr>
                        <th><input type="checkbox"/></th>
                        <th>排序</th>
                        <th>真实姓名</th>
                        <th>用户名</th>
                        <th>内部邮件</th>
                        <th>状态标志</th>
                        <th>修改时间</th>
                        <th>用户类型</th>
                        <th>员工</th>                       
                        <th class="cz"></th>
                    </tr>
                </thead>
                <tbody>
                   <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td><input type="text" value="1" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                      
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit">
                               </i> 编辑</a>
					        <a class="btn btn-small btn-delete"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>		

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="2" class="input-rank" /> </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                      
                        <td>
					        <a class="btn btn-small" href="#"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019" href="#"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>	

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td><input type="text" value="3" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                     
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>	

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="4" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                       
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>	

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="5" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>		

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="6" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                      
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>	

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="6" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                       
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>	

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="7" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                       
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>	

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="8" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                      
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>		

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="9" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                      
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>	

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="10" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                       
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>	

                    <tr>
                        <td>
                            <input type="checkbox"/>
                        </td>
                         <td> <input type="text" value="11" class="input-rank" />  </td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                        <td><span class="badge">mflizi@163.com</span></td>
                        <td> 金子 </td>
                    
                        <td>
					        <a class="btn btn-small" href="/cate/update/529995e5f39d9019"><i class="icon-edit"></i> 编辑</a>
					        <a class="btn btn-small btn-delete" id="529995e5f39d9019"><i class="icon-trash"></i> 删除</a>
				        </td>
			        </tr>	
			    </tbody>
	        </table>
        </form>
     <%--   <a href="javascript:;window.close();">退出</a>
        <a id="A1" runat="server" href="javascript:void(0);"  onserverclick="aa">点击退出</a>--%>

   </div>
</body>
</html>
