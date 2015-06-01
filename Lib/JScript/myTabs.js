$(function () {
    var tabsObj = $("div[class='tabs']");
    var btnsObj = tabsObj.find("ul:first").children();
    var contsObj = tabsObj.find("ol:first").children();

    for (var i = 0; i < btnsObj.length; i++) {
        var clsMore = $(btnsObj[i]).attr("class");
        if (clsMore != undefined && clsMore.indexOf('more') != -1) {
            return;
        }
        $(btnsObj[i]).bind("click", i, function (event) {
            btnsObj.removeClass("show");
            contsObj.removeClass("show");

            var tabObj = $(btnsObj[event.data]);
            var contObj=$(contsObj[event.data]);
            tabObj.addClass("show");
            contObj.addClass("show");

            tabClick(tabObj, contObj);
        });
    }

});

function tabClick(tabObj) { }