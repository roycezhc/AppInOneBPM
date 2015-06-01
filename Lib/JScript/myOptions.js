//判断多选列表里是否已经存在某值为v的项
function hadOption(ops,v){
   for(var i=0;i<ops.length;i++){
      if(ops[i].value==v){
        return true;
      }
   }
   return false;
}

//根据列表对象田加一项,参数分别是：列表对象，值，显示文本，是否选中
function addOption(selObj,val,txt,isSel){
   if(hadOption(selObj.options,val)==false){
       var li=new Option(txt,val);
       if(isSel==true){
          li.selected=true;
       }
       selObj.options.add(li);
       return true;
   }
   return false;
}

//获取指定列表选中的值，有多个逗号隔开
function getOptionValue(selObj){
   var ops=selObj.options;
   var str="";
   for(var i=0;i<ops.length;i++){
      if(ops[i].selected==true){
         str+=str==""?ops[i].value:","+ops[i].value;
      }
   }
   return str;
}

//获取指定列表选中的文本，有多个逗号隔开
function getOptionValue(selObj){
   var ops=selObj.options;
   var str="";
   for(var i=0;i<ops.length;i++){
      if(ops[i].selected==true){
         str+=str==""?ops[i].innerHTML:","+ops[i].value;
      }
   }
   return str;
}

//判断多选列表里是否还存在选中的项
function hadSel(selObj){
   if(selObj.value!=""){
     return true;
   }
   return false;
}
//删除多选列表里所有选择的项
function removeAllSelected(selObj){
   var opts=selObj.options;
   while(hadSel(selObj)){
       opts.remove(opts.selectedIndex);
   }
}

//删除多选列表里所有选择的项
function removeAll(selObj){
   var opts=selObj.options;
   while(opts.length>0){
       opts.remove(0);
   }
}

//删除多选列表里所有选择的项
function removeByValue(selObj,val){
   var opts=selObj.options;
   for(var i=0;i<opts.length;i++){
      if(opts[i].value==val){
         opts.remove(i);
         break;
      }
   }
}