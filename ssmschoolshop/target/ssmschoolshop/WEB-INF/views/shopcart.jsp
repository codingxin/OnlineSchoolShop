
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>长理商城-购物车</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shopcart.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>
    <script src="${pageContext.request.contextPath}/js/shopcart.js"></script>
    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">
    <!-- 	<script>
            $(document).ready(function(){
                $(".list-group-item").hover(function(){
                    $(this).children("div.sort-detail").show();
                },function(){
                    $(this).children("div.sort-detail").hide();
                });
            })
        </script> -->
</head>
<body>
<div id="main" class="container">
    <jsp:include page="header.jsp"/>
</div>
<div class="shopping_cart">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="account_heading account_heading_ah">
                    <h1>购物车</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="all_wis_frm">
                <div class="col-md-12">
                    <div class="wishlist-content wishlist-content-2">
                        <form action="#">
                            <div class="wishlist-table wishlist-table-2 table-responsive">
                                <table id="cart-table">
                                    <thead>
                                    <tr>
                                        <th class="product-remove"><span class="nobr"></span></th>
                                        <th class="product-thumbnail product-thumbnail-2"></th>
                                        <th class="product-name product-name_2"><span
                                                class="nobr">商品</span></th>
                                        <th class="product-price"><span class="nobr"> 价格
												</span></th>
                                        <th class="product-stock-stauts"><span class="nobr">
														数量 </span></th>
                                        <th class="product-add-to-cart"><span class="nobr">总价</span></th>
                                    </tr>
                                    </thead>
                                    <tbody>




                                    </tbody>
                                    <%--<tfoot>
                                    <tr>
                                        <td colspan="6">
                                            <div class="coupon">
                                                <!-- <label for="coupon_code"></label>
                                                    <input id="coupon_code" class="input-text" type="text" placeholder="Coupon code" value="" name="coupon_code"> -->
                                                <a
                                                        class="button_act button_act_3 button_act_333 button_act_tp "
                                                        href="./shopcart.jsp">更新购物车</a>
                                                <!-- <a class="button_act btn-tip " href="#">Update cart</a> -->
                                            </div>
                                        </td>
                                    </tr>
                                    </tfoot>--%>
                                </table>
                            </div>
                        </form>
                        <div class="row">
                            <div class="col-md-6 col-xs-12">
                                <div class="cart_totals ">
                                    <h2>总价</h2>
                                    <table class="shop_table shop_table_responsive">
                                        <tbody>
                                        <tr class="cart-subtotal">
                                            <th>小计</th>
                                            <td data-title="Subtotal"><span
                                                    class="woocommerce-Price-amount amount"> <span
                                                    class="woocommerce-Price-currencySymbol" id="total-num"></span>
													</span></td>
                                        </tr>
                                        <tr class="order-total">
                                            <th>总额</th>
                                            <td data-title="Total"><strong> <span
                                                    class="woocommerce-Price-amount amount"> <span
                                                    class="woocommerce-Price-currencySymbol" id="total-price"></span>
														</span>
                                            </strong></td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="wc-proceed-to-checkout">
                                        <a class="button_act button_act-tc confirm-orders" href="${pageContext.request.contextPath}/order">确认订单</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xs-12"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="path" hidden>${pageContext.request.contextPath}</div>
</body>
</html>
