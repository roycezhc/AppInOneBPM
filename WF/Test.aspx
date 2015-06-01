<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_Test" CodeFile="Test.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Lib/jsPlugin/layLR/layLR.js" type="text/javascript"></script>

    <script type="text/javascript">
//        $(function (e) {
//            var aobjs = $("#links").find("a");
//            for (var a = 0; a < aobjs.length; a++) {
//                var aobj = $(aobjs[a]);
//                aobj.bind("click", aobj, function (e) {
//                    var selObj = $("#ulStaff").find("input[checked='checked']");
//                    if (selObj.length > 0) {
//                        var sid = selObj[0].id;
//                        var href = e.data.attr("href");
//                        $("#ifrMain").attr("src", "TestGo.aspx?SID=" + sid + "&url=" + escape(href + "&r=" + Math.random()));
//                    }
//                    return false;
//                });

//                aobj.bind("dblclick", aobj, function (e) {
//                    var selObj = $("#ulStaff").find("input[checked='checked']");
//                    if (selObj.length > 0) {
//                        var sid = selObj[0].id;
//                        var href = e.data.attr("href");
//                        window.open("TestGo.aspx?SID=" + sid + "&url=" + escape(href + "&r=" + Math.random()));
//                        //$("#ifrMain").attr("src", );
//                    }
//                    return false;
//                });
//            }
//        });
    </script>

<style type="text/css">
#links{ clear:both;}
#links ul li{ float:left;margin:0 3px;}
#links ul li.sp{width:5px; background:#789;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">

    <input name="tr_1_PJSC" type="file" style="width:150px;height:18px;" exdfile=".jpg|.gif|.png|.jpeg|.bmp|.ico" onchange="selFileChg(this);"/>
    <input name="ttt" type="text" /><asp:Button 
        ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
&nbsp;
<div ng-controller="dddCtrl">
<table>
<tr ng-repeat="item in ObjList">
  <td>{{item.id}}</td> <td>{{item.name}}</td><td><a ng-click="remove($index)"></a></td>
</tr>

</table>
<div choose-dept=""></div>
<button ng-show="showBtn">fhgfhgfh</button>
</div>

<script>

    angular.module("", ["", "", function () {

    } ]).controller("dddCtrl", function ($scope,ggg) { 
    
    });


    function dddCtrl($scope) {
        $scope.ObjList = [];

        $scope.showBtn = false;

        $scope.remove = function (index) {



            $scope.ObjList.splice(index, 0);


        };

    }
</script>
</asp:Content>

