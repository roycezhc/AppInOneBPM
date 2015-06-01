    
        $(function () {
            var tv = new TV.Tree("TF_TABLE", {
                selNodeHandle: function (tn) {
                    //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                    var ntype = tn.getNTYPE();
                    if (ntype == "TF_TABLE-root") {
                        return false;
                    }
                    if (ntype == "TF_TABLE" || ntype == "TF_TABLE-mx") {
                        $("#ifrMain").attr("src", "FIELD/FIELDManage.aspx?" + tn.getDataPara()); //"TABLE/FIELD/FIELDManage.aspx?"//"TABLE/TABLEShow.aspx?"
                    }
                    if (ntype == "TF_TB_FIELD") {
                        $("#ifrMain").attr("src", "FIELD/FIELDEdit.aspx?edit=1&" + tn.getDataPara());
                    }
                    return false;
                },
                pageBack: 'TBBack_New.aspx', //设置异步处理的后台页面地址
                showDelete: true,
                showUp: true,
                showDown:true,
                checkBox: 0
            });
            tv.addMenu("addTB", "新建表", function (tn) {
                $("#ifrMain").attr("src", "TABLE/TABLEEdit.aspx?" + tn.getDataPara());
            });
            /////////////////////

            //tv.addMenu("synTB", "更新配置（同步数据源）", function (tn) {
            //    $("#ifrMain").attr("src", "TABLE/TABLESyn.aspx?" + tn.getDataPara());
            //});

            tv.addMenu("addSubTB", "添加明细表", function (tn) {
                $("#ifrMain").attr("src", "TABLE/TABLEEdit.aspx?mx=1&" + tn.getDataPara());
            });

            tv.addMenu("editTB", "修改表", function (tn) {
                $("#ifrMain").attr("src", "TABLE/TABLEEdit.aspx?edit=1&" + tn.getDataPara());
            });
            tv.addMenu("addField", "新建字段", function (tn) {
                $("#ifrMain").attr("src", "FIELD/FIELDEdit.aspx?" + tn.getDataPara());
            });
            tv.addMenu("editField", "修改字段", function (tn) {
                $("#ifrMain").attr("src", "FIELD/FIELDEdit.aspx?edit=1&" + tn.getDataPara());
            });

            tv.beforeShowMenu = function () {
                var tn = this.getSelNode();
                this.hideMenuItem("addTB", "synTB", "addSubTB", "editTB", "addField", "editField", "newFrom", "editForm", "editFormCol", "formDesign", "showDelete", "addSubForm","addCol");
                var ntype = tn.getNTYPE();
                if (ntype == "TF_TABLE-root") {
                    this.showMenuItem("addTB");
                }
                if (ntype == "TF_TABLE") {
                    this.showMenuItem("editTB", "synTB", "addField", "showDelete", "addSubTB");
                }
                if (ntype == "TF_TABLE-mx") {
                    this.showMenuItem("editTB", "synTB", "addField", "showDelete");
                }
                if (ntype == "TF_TB_FIELD") {
                    this.showMenuItem("editField", "showDelete");
                }
            }
            bindWinResize();
        });

        $(function () {
            var tv = new TV.Tree("TF_TB_RELA", {
                selNodeHandle: function (tn) {
                    //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                    var ntype = tn.getNTYPE();
                    if (ntype == "TF_TB_RELA-root") {
                        return false;
                    }
                    if (ntype == "TF_TB_RELA" || ntype == "TF_TB_RELA-mx") {
                        $("#ifrMain").attr("src", "FIELD/FIELDManage.aspx?" + tn.getDataPara()); //"TABLE/FIELD/FIELDManage.aspx?"//"TABLE/TABLEShow.aspx?"
                    }
                    if (ntype == "TF_TB_FIELD") {
                        $("#ifrMain").attr("src", "FIELD/FIELDEdit.aspx?edit=1&" + tn.getDataPara());
                    }
                    return false;
                },
                pageBack: 'TBBack_New.aspx', //设置异步处理的后台页面地址//TBBack.aspx
                showDelete: true,
                checkBox: 0
            });
//            tv.addMenu("addTB", "新建表", function (tn) {
//                $("#ifrMain").attr("src", "TABLE/TABLEEdit.aspx?" + tn.getDataPara());
//            });
//            /////////////////////
//            tv.addMenu("addSubTB", "添加明细表", function (tn) {
//                $("#ifrMain").attr("src", "TABLE/TABLEEdit.aspx?mx=1&" + tn.getDataPara());
//            });

//            tv.addMenu("editTB", "修改表", function (tn) {
//                $("#ifrMain").attr("src", "TABLE/TABLEEdit.aspx?edit=1&" + tn.getDataPara());
//            });
//            tv.addMenu("addField", "新建字段", function (tn) {
//                $("#ifrMain").attr("src", "FIELD/FIELDEdit.aspx?" + tn.getDataPara());
//            });
//            tv.addMenu("editField", "修改字段", function (tn) {
//                $("#ifrMain").attr("src", "FIELD/FIELDEdit.aspx?edit=1&" + tn.getDataPara());
//            });

//            tv.beforeShowMenu = function () {
//                var tn = this.getSelNode();
//                this.hideMenuItem("addTB", "addSubTB", "editTB", "addField", "editField", "newFrom", "editForm", "editFormCol", "formDesign", "showDelete", "addSubForm", "addCol");
//                var ntype = tn.getNTYPE();
//                if (ntype == "TF_TB_RELA-root") {
//                    this.showMenuItem("addTB");
//                }
//                if (ntype == "TF_TB_RELA") {
//                    this.showMenuItem("editTB", "addField", "showDelete", "addSubTB");
//                }
//                if (ntype == "TF_TB_RELA-mx") {
//                    this.showMenuItem("editTB", "addField", "showDelete");
//                }
//                if (ntype == "TF_TB_FIELD") {
//                    this.showMenuItem("editField", "showDelete");
//                }
//            }
//            bindWinResize();
        });

        //CHG START 表单管理菜单样式变更 jin-shenjian 2013/10/30
//    $(function () {
//        var tv = new TV.Tree("TF_FORM", {
//            selNodeHandle: function (tn) {
//                //点击某个节点时可以执行此函数，根据需要编写自定义代码。
//                var ntype = tn.getNTYPE();
//                
//                if (ntype == "TF_FORM-root") {
//                    return false;
//                }

//                if (ntype == "TF_FORM" || ntype == "TF_FORM-mx") {
//                    $("#ifrMain").attr("src", "FORM/COLUMN/COLUMNManage.aspx?" + tn.getDataPara());
//                }
//                if (ntype == "TF_F_COLUMN") {
//                    $("#ifrMain").attr("src", "FORM/COLUMN/COLUMNEdit.aspx?edit=1&" + tn.getDataPara());
//                }
//                return false;
//            },
//            pageBack: 'TBBack_New.aspx', //设置异步处理的后台页面地址
//            showDelete: true,
//            checkBox: 0
//        });

//        tv.addMenu("newFrom", "创建表单", function (tn) {
//            $("#ifrMain").attr("src", "FORM/FORMEdit.aspx?" + tn.getDataPara());
//        });

//        tv.addMenu("addSubForm", "创建子表单", function (tn) {
//            $("#ifrMain").attr("src", "FORM/FORMEdit.aspx?" + tn.getDataPara());
//        });

//        tv.addMenu("editForm", "修改表单", function (tn) {
//            $("#ifrMain").attr("src", "FORM/FORMEdit.aspx?edit=1&" + tn.getDataPara());
//        });

//        tv.addMenu("addCol", "创建栏目", function (tn) {
//            //CHG START 新增时候EDIT不用传入 jin-shenjian 2013/10/26
//            //$("#ifrMain").attr("src", "FORM/COLUMN/COLUMNEdit.aspx?edit=1&" + tn.getDataPara());
//            $("#ifrMain").attr("src", "FORM/COLUMN/COLUMNEdit.aspx?" + tn.getDataPara());
//            //CHG END 新增时候EDIT不用传入 jin-shenjian 2013/10/26
//        });
//        //注释掉了？
//        tv.addMenu("formDesign", "表单设计", function (tn) {
//            $("#ifrMain").attr("src", "FORM/FormDesign.aspx?" + tn.getDataPara());
//        });

//        tv.beforeShowMenu = function () {
//            var tn = this.getSelNode();
//            this.hideMenuItem("addTB", "addSubTB", "editTB", "addField", "editField", "newFrom", "editForm", "editFormCol", "formDesign", "showDelete", "addSubForm", "addCol");
//            var ntype = tn.getNTYPE();
//            if (ntype == "TF_FORM-root") {
//                this.showMenuItem("newFrom");
//            }

//            if (ntype == "TF_FORM") {
//                this.showMenuItem("editForm", "formDesign", "showDelete", "addSubForm", "addCol");

//            }
//            if (ntype == "TF_FORM-mx") {
//                this.showMenuItem("editForm", "showDelete", "addCol");
//                this.hideMenuItem("addSubForm", "formDesign");
//            }
//            if (ntype == "TF_F_COLUMN") {
//                this.showMenuItem("editFormCol", "showDelete");
//            }
//        }
//        bindWinResize();
//    });

    $(function () {
        var tv = new TV.Tree("TF_FORM", {
            selNodeHandle: function (tn) {
                //点击某个节点时可以执行此函数，根据需要编写自定义代码。
                var ntype = tn.getNTYPE();

                if (ntype == "TF_FORM-root" || ntype == "TF_FORM_DESIGN") {
                    return false;
                }
                //表单列表
                if (ntype == "TF_FORM_MANAGE") {
                    //$("#ifrMain").attr("src", "FORM/COLUMN/aaa.aspx?" + tn.getDataPara());
                }
                //关系管理
                if (ntype == "TF_TB_RELA") {
                    $("#ifrMain").attr("src", "FIELD/FIELDManage.aspx?" + tn.getDataPara());
                }
                //列表布局
                if (ntype == "TF_DESIGN_LIST") {
                    $("#ifrMain").attr("src", "FORM/FormDesign.aspx?" + tn.getDataPara());
                }
                //详细布局
                if (ntype == "TF_DESIGN_DETAIL") {
                    //  $("#ifrMain").attr("src", "FORM/FormDesign.aspx?" + tn.getDataPara());
                    $("#ifrMain").attr("src", "FORM/NEWFORM/NEWFORMManage.aspx?" + tn.getDataPara());
                }
                //表单字段管理
                if (ntype == "TF_FORM" || ntype == "TF_FORM-mx") {
                    $("#ifrMain").attr("src", "FORM/COLUMN/COLUMNManage.aspx?" + tn.getDataPara());
                }
                //表单字段
                if (ntype == "TF_F_COLUMN") {
                    $("#ifrMain").attr("src", "FORM/COLUMN/COLUMNEdit.aspx?edit=1&" + tn.getDataPara());
                }
                return false;
            },
            pageBack: 'TBBack_New.aspx', //设置异步处理的后台页面地址
            showDelete: true,
            checkBox: 0
        });

        tv.addMenu("newFrom", "创建表单", function (tn) {
            $("#ifrMain").attr("src", "FORM/FORMEdit.aspx?" + tn.getDataPara());
        });

        tv.addMenu("addSubForm", "创建子表单", function (tn) {
            $("#ifrMain").attr("src", "FORM/FORMEdit.aspx?" + tn.getDataPara());
        });

        tv.addMenu("editForm", "修改表单", function (tn) {
            $("#ifrMain").attr("src", "FORM/FORMEdit.aspx?edit=1&" + tn.getDataPara());
        });

        tv.addMenu("addCol", "创建栏目", function (tn) {
            $("#ifrMain").attr("src", "FORM/COLUMN/COLUMNEdit.aspx?" + tn.getDataPara());
        });

        tv.beforeShowMenu = function () {
            var tn = this.getSelNode();
            this.hideMenuItem("addTB", "addSubTB", "editTB", "addField", "editField", "newFrom", "editForm", "editFormCol", "formDesign", "showDelete", "addSubForm", "addCol");
            var ntype = tn.getNTYPE();
            if (ntype == "TF_FORM-root") {
                this.showMenuItem("newFrom");
            }

            if (ntype == "TF_FORM") {
                this.showMenuItem("editForm", "formDesign", "addSubForm", "addCol", "showDelete");

            }
            if (ntype == "TF_FORM-mx") {
                this.showMenuItem("editForm", "addCol");
                this.hideMenuItem("addSubForm", "formDesign");
            }
            if (ntype == "TF_F_COLUMN") {
                this.showMenuItem("editFormCol", "showDelete");
            }
            if (ntype == "TF_FORM_MANAGE") {
                this.showMenuItem("showDelete");
            }
        }
        bindWinResize();
    });
    //CHG END 表单管理菜单样式变更 jin-shenjian 2013/10/30