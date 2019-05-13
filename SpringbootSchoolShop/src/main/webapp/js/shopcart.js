/*
$(document).ready(function(){
	$('.delete-goods').click(function(){
		var goodsid = $(this).attr("data-goodsid");
        alert("asfd");
		// deleteGoods(goodsid);
	});

	$('.confirm-orders').click(function(){
		confirmOrders();
		alert("已成功加入订单，并已发送邮件至卖家，请等待卖家回复！");
		location.href = "/index.jsp";
	});
});*/
/*
function deleteGoods(goodsid){
	$.post("servlet/DeleteCartServlet", { 
		goodsId: goodsid,
	});
}

function confirmOrders(){
	$.post("servlet/SaleServlet");
}*/
$(document).ready(function () {
    var path = $("#path").text();
    showcart();

    /*$('.delete-goods').click(function(){
        alert("adf");
        var goodsid = $(this).attr("data-goodsid");
        $.ajax({
            url: "/shop/deleteCart" + goodsid,
            type: "DELETE",
            success:function (result) {
                swal(result.msg, "","success");
                showcart();
            },
            error:function () {
                /!*to_page('/shop',currentPage);*!/
                swal("删除失败");
            }
        })
    });*/
});

/*$(document).on("click",".delete-good",function () {
    alert("afd");
});*/

function deleteCartGoods(goodsid) {
    $.ajax({
        url: "/shop/deleteCart/" + goodsid,
        type: "DELETE",
        success: function (result) {
            // swal(result.msg, "","success");
            showcart();
        },
        error:function () {
            swal("删除失败");
        }
    })
}

//改变商品数量更新购物车
function updateCart(goodsid, newNum) {
    //获取当前数量
    // var newNum = $(".num").val();
    $.ajax({
        url: "/shop/update",
        data: {
            goodsid: goodsid,
            num:newNum
        },
        method: "post",
        success: function (result) {
            // swal(result.msg, "", "success");
            showcart();
        },
        error: function (result) {
            swal("更新购物车失败");
        }
    });
}

function showcart() {
    $.ajax({
        url: "/shop" + "/cartjson",
        type: "post",
        success: function (result) {
            //显示购物车
            build_cart_table(result);
        },
        error: function (result) {
            swal("获取购物车失败");
        }
    });
}

function build_cart_table(result) {
    $("#cart-table tbody").empty();
    var goods = result.info.shopcart;
    var totalnum = 0;
    var totalMoney = 0;

    if(goods.length === 0) {
        var spareTd = $('<tr> <td colspan="6"> <div class="coupon" style="margin-left:37%;">购物车还是空的，快去<a href="/shop/main" style="color:red;">首页</a>看看吧！ </div> </td> </tr>');
        spareTd.appendTo("#cart-table tbody");
    } else {
        $.each(goods, function (index,item) {

            var delA = $("<a></a>").addClass("delete-goods").attr("data-goodsid",item.goodsid).append("×");

            var deleteCart = $("<td></td>").addClass("product-remove product-remove_2")
                .append(delA);

            delA.click(function () {
                deleteCartGoods(item.goodsid);
            });

            var shopimage = $("<td></td>").addClass("product-thumbnail product-thumbnail-2")
                .append($("<a></a>").attr("href","/shop/detail?goodsid="+item.goodsid)
                    .append($("<img/>").attr("src","/shop/pictures/"+item.imagePaths[0].path)));

            var goodsname = $("<td></td>").addClass("product-name product-name_2")
                .append($("<a></a>").attr("href","/shop/detail?goodsid="+item.goodsid).append(item.goodsname));

            var goodsprice = $("<td></td>").addClass("product-price")
                .append($("<span></span>").addClass("amount-list amount-list-2").append("￥"+item.price));

            var numIput = $("<input/>").addClass("num").attr("type","number").attr("value",item.num);

            var num = $("<td></td>").addClass("product-stock-status")
                .append($("<div></div>").addClass("latest_es_from_2")
                    .append(numIput));

            numIput.change(function () {
               updateCart(item.goodsid,$(this).val());
            });

            var totalPrice = $("<td></td>").addClass("product-price")
                .append($("<span></span>").addClass("amount-list amount-list-2").append("￥"+item.price*item.num));

            var goodsitem = $("<tr></tr>").append(deleteCart)
                .append(shopimage)
                .append(goodsname)
                .append(goodsprice)
                .append(num)
                .append(totalPrice)
                .appendTo("#cart-table tbody");
            totalnum++;
            totalMoney = totalMoney + item.price*item.num;
        });
    }

    //小计
    $("#total-num").text(totalnum);
    $("#total-price").text("￥"+totalMoney);
}
