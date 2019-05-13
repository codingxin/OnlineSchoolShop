$(document).ready(function (){
    var cateId={};

   $("[name='changCate']") .click(function (){
       $("#update-cate").modal({
           backdrop:'static'
       });
       $("#categoryName").val($(this).parent().prev().children().text());
       cateId=$(this).parent().prev().children().attr("cateId");
   });

   $("#saveCatename").click(function (){
       var category={};
       category.cateid=cateId;
       category.catename=$("#categoryName").val();
       $.ajax({
           type:"POST",
           url:"/shop/admin/goods/saveCate",
           contentType:"application/x-www-form-urlencoded; charset=utf-8",
           data:category,
           dataType:"json",
           success:function (result){
               if (result.msg=="名字已经存在")
               {
                   swal(result.msg);
               }
               else {
                   swal(result.msg);
                   $("button").click(function (){
                       location.reload();
                   });
               }
           },
           error:function (){
               alert("更新失败");
           }
       });
   })
    $("[name='deleteCate']").click(function (){
        var category={};
        category.cateid=$(this).parent().prev().prev().children().attr("cateId");
        $.ajax({
            type:"POST",
            url:"/shop/admin/goods/deleteCate",
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            data:category,
            dataType:"json",
            success:function (result){
                swal(result.msg);
                $("button").click(function (){
                    location.reload();
                });
            },
            error:function (){
                alert("更新失败");
            }
        });
    })
});