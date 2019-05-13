package com.zhang.ssmschoolshop.service;


import com.zhang.ssmschoolshop.entity.ShopCart;
import com.zhang.ssmschoolshop.entity.ShopCartExample;
import com.zhang.ssmschoolshop.entity.ShopCartKey;

import java.util.List;

public interface ShopCartService {
    public void addShopCart(ShopCart shopCart);

    public List<ShopCart> selectByExample(ShopCartExample shopCartExample);

    public void deleteByKey(ShopCartKey shopCartKey);

    public void updateCartByKey(ShopCart shopCart);

    public ShopCart selectCartByKey(ShopCartKey shopCartKey);
}
