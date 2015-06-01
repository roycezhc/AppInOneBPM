<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="PUSH_MESSAGE.aspx.cs" Inherits="WECAdmin_PUSH_MESSAGE" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
 <!DOCTYPE html>
<html>
    <head>
      <title>推送管理</title>
       <script src="../Lib/JQuery/jquery.min.js"></script>
        <script src="../Lib/Bootstrap/bootstrap.js"></script>
    <link href="../Themes/PMMS/bootstrap.css" type="text/css" rel="Stylesheet"/>
    <script>
        $(function () {
            $("#push").click(function () {
                //
                $("form").submit();
            });
        });
    </script>
    </head>
    <body>
        <div class="container">
            <div class="alert alert-info alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <strong>Info!</strong> 推送消息
            </div>
            <form method="post">
                <div class="form-group">
                    <label>推送设备</label>
                    <div class="radio">
                        <label>
                            <input type="radio" value="0" name="pushtype" checked="checked"/>全部
                        </label>
                         <label>
                            <input type="radio" value="1" name="pushtype"/>Android
                        </label>
                        <label>
                             <input type="radio" value="2" name="pushtype"/>IOS
                         </label>
                         <label>
                             <input type="radio" value="3" name="pushtype"/>指定
                        </label>
                        <label>
                             <input class="form-control" type="text" name="staffid" />
                         </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>推送时间</label>
                    <div class="radio">
                        <label>
                            <input type="radio" value="0" name="timetype" checked="checked"/>立刻
                        </label>
                        <label>
                            <input type="radio" value="1" name="timetype"/>指定
                        </label>
                        <label>
                            <input class="form-control" type="datetime-local" name="pushtime"  />
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label>内容</label>
                    <div>
                        <textarea class="form-control" rows="15" cols="75" name="message"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <input class="btn btn-default" type="button" value="推送" id="push" />
                </div>
           </form>
        </div>
     </body>
</html>