package com.zhang.ssmschoolshop.controller.admin;

import com.zhang.ssmschoolshop.entity.Goods;
import com.zhang.ssmschoolshop.entity.GoodsExample;
import com.zhang.ssmschoolshop.service.GoodsService;
import com.zhang.ssmschoolshop.util.ExcelUtils;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author codingzx
 * @description
 * @date 2021/7/24 13:20
 */


@Controller
@RequestMapping("/admin")
public class ExcelController {

    @Autowired
    private GoodsService goodsService;


    @GetMapping("/excel/export")
    public String ExportRecord(HttpServletResponse response, HttpServletRequest request) {
        List<Goods> goodsList = goodsService.selectByExample(new GoodsExample());

        //定义导出的excel名字
        String excelName = "资源详情表";

        //导出用户相关信息
        new ExcelUtils().export(excelName, goodsList, Goods.class, response);
        return "导出资源成功";
    }

    @GetMapping("/excel/import")
    public String ImportRecord(HttpServletResponse response, HttpServletRequest request) {
        String path = "D:\\github\\myproject\\SptingbootSchoolShop\\import.txt";
        //List<Goods> goodsList=(List<Goods>)ExcelUtils.getRecordByTxt(path);
        // 入库
        return "导入资源成功";
    }


}
