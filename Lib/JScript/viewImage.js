
function viewImage() {
    var picPath;
    var image;
    var box;
    //图片按比例缩放
    var flag = false;
    //只要调用这个方法就可以了,参数（this,这里为显示的位置)
    this.LoadImage = function (ele, show_pos_obj) {
        picPath = GetImgPath(ele);
        if (picPath != "" && picPath != null) {
            image = new Image();
            image.src = picPath;
            box = GetObj(show_pos_obj);
            box.innerHTML += "<span style='color:gray;font-size:11px'>加载中...</span>";
            setTimeout(ImgView, 1000);
        } else {
            return false;
        }
    }

    //呈现图片视图
    function ImgView() {
        if (image.width == 0 || image.height == 0) {
            settimeout(ImgView, 1000);
        } else {
            if (box != null) {
                var imgWidth = (image.width >= box.offsetWidth) ? box.offsetWidth : image.width;
                var imgHeight = (image.height >= box.offsetHeight) ? box.offsetHeight : image.height;
                var alt = "图片实际尺寸为：" + image.width + "&nbsp;*&nbsp;" + image.height;
                //alert(box.innerHTML);
                var imgObj = box.getElementsByTagName("img")[0];
                //alert(imgObj.tagName);
                imgObj.setAttribute("src", picPath);
                DrawImage(imgObj, box.offsetWidth, box.offsetHeight);
                box.getElementsByTagName("span")[0].style.display="none";
                //box.innerHTML = "<img width='" + imgWidth + "' height='" + imgHeight + "' id='apic' src='" + picPath + "' onload='DrawImage(this," + box.offsetWidth + "," + box.offsetHeight + ")' title=" + alt + " />";
            }
        }
    }

    //获取IE，FF下图片的路径
    function GetImgPath(obj) {
        if (ValidateImgUrl(obj)) {
            if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
                obj.select();
                return document.selection.createRange().text;
            }
            else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                if (obj.files) {
                    return obj.files.item(0).getAsDataURL();
                }
                return obj.value;
            }
            return obj.value;
        }
    }

    //图片格式验证
    function ValidateImgUrl(obj) {
        return true;
//        var url = GetObj(obj).value;
//        var filename = url.substring(url.lastIndexOf(".") + 1).toLowerCase();
//        if (filename != "jpg" && filename != "gif" && filename != "png" && filename != "bmp" && filename != "jpeg") {
//            alert("图片格式有误，请选择jpg|gif|png|bmp格式的图片上传"); return false;
//        }
//        if (url.length > 0) {
//            //return document.getElementById(id).value;
//            return true;
//        }
//        else { return false; }
    }

    function GetObj(id) {
        return "string" == typeof id ? document.getElementById(id) : id;
    }


   function DrawImage(ImgD, iwidth, iheight) {
        //参数(图片,允许的宽度,允许的高度)
        var image = new Image();
        image.src = ImgD.src;
        if (image.width > 0 && image.height > 0) {
            flag = true;
            if (image.width / image.height >= iwidth / iheight) {
                if (image.width > iwidth) {
                    ImgD.width = iwidth;
                    ImgD.height = (image.height * iwidth) / image.width;
                } else {
                    ImgD.width = image.width;
                    ImgD.height = image.height;
                }
            } else {
                if (image.height > iheight) {
                    ImgD.height = iheight;
                    ImgD.width = (image.width * iheight) / image.height;
                } else {
                    ImgD.width = image.width;
                    ImgD.height = image.height;
                }
            }
        }
    }
}
