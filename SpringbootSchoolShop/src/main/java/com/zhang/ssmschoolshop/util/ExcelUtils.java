package com.zhang.ssmschoolshop.util;

/**
 * @author codingzx
 * @description
 * @date 2021/4/11 11:23
 */

import com.zhang.ssmschoolshop.annotinon.ExportEntityMap;
import com.zhang.ssmschoolshop.entity.Goods;
import lombok.extern.slf4j.Slf4j;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Footer;
import org.apache.poi.ss.usermodel.Header;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

/**
 * @ClassName : ExportExcelUtils2
 * @Description :
 * @Author : ASUS
 * @Date 2020/3/18
 * @Version 1.0
 **/
@Slf4j
public class ExcelUtils {
    private static final Logger logger = LoggerFactory.getLogger(ExcelUtils.class);

    /**
     * 导出Excel
     *
     * @param excelName 要导出的excel名称
     * @param list      要导出的数据集合
     * @param c         中英文字段对应Map，即要导出的excel表头
     * @param response  使用response可以导出到浏览器
     * @param <T>
     */
    public static <T> void export(String excelName, List<T> list, Class<T> c, HttpServletResponse response) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH：mm：ss");// 设置日期格式
        // 设置默认文件名为当前时间：年月日时分秒
        if (excelName == null || excelName == "") {
            excelName = df.format(new Date()).toString();
        } else {
            excelName = excelName + df.format(new Date()).toString();
        }
        // 设置response头信息
        response.reset();
        response.setContentType("application/vnd.ms-excel"); // 改成输出excel文件
        try {
            response.setHeader("Content-disposition", "attachment; filename="
                    + new String(excelName.getBytes("gb2312"), "ISO-8859-1") + ".xls");
        } catch (UnsupportedEncodingException e1) {
            //logger.info(e1.getMessage());
        }

        try {
            //创建一个WorkBook,对应一个Excel文件
            HSSFWorkbook wb = new HSSFWorkbook();
            //在Workbook中，创建一个sheet，对应Excel中的工作薄（sheet）
            HSSFSheet sheet = wb.createSheet(excelName);
            //设置 边距、页眉、页脚

//            HSSFPrintSetup printSetup = (HSSFPrintSetup) sheet.getPrintSetup();
            HSSFPrintSetup printSetup = sheet.getPrintSetup();
            //// 打印方向，true：横向，false：纵向(默认)
            printSetup.setLandscape(true);
            printSetup.setHeaderMargin(0.2);
            printSetup.setFooterMargin(0.2);
            //设置打印缩放为88%
            //printSetup.setScale((short) 55);
            printSetup.setFitHeight((short) 0);
            printSetup.setFitWidth((short) 1);
            // printSetup.setLeftToRight(true);//列从左向右显示②
            printSetup.setPaperSize(HSSFPrintSetup.A4_PAPERSIZE); // 纸张
            sheet.setMargin(HSSFSheet.BottomMargin, (double) 0.8);// 页边距（下）
            sheet.setMargin(HSSFSheet.LeftMargin, (double) 0);// 页边距（左）
            sheet.setMargin(HSSFSheet.RightMargin, (double) 0);// 页边距（右）
            sheet.setMargin(HSSFSheet.TopMargin, (double) 0.8);// 页边距（上）
            sheet.setHorizontallyCenter(true);//设置打印页面为水平居中
            sheet.setVerticallyCenter(true);
            sheet.setAutobreaks(false);
            sheet.setFitToPage(false);
            Footer footer = sheet.getFooter();
            //设置页数
            footer.setCenter("第" + HeaderFooter.page() + "页，共 " + HeaderFooter.numPages() + "页");
            Header header = sheet.getHeader();
            //自定义页眉,并设置页眉 左中右显示信息
            //居中
//            header.setCenter("Center Header");
            //靠左
            header.setLeft(HSSFHeader.font("宋体", "") +
                    HSSFHeader.fontSize((short) 16) + excelName + ".xls");
            //靠右
//            header.setRight(HSSFHeader.font("Stencil-Normal", "Italic") +
//                    HSSFHeader.fontSize((short) 16) + "Right w/ Stencil-Normal Italic font and size 16");

            //创建单元格，并设置值表头 设置表头居中
            HSSFCellStyle style = wb.createCellStyle();
            //设置边框
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
            //自动换行
            //style.setWrapText(true);
            //创建一个居中格式
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//上下居中
            //设置字体
            HSSFFont font = wb.createFont();
            font.setFontName("宋体");

            style.setFont(font);
            // 填充工作表
            //获取需要转出的excel表头的map字段
            LinkedHashMap<String, String> fieldMap = new LinkedHashMap<>();
            //循环注解里面的值 填入Link集合
            Field[] declaredFields = c.getDeclaredFields();

            for (Field declaredField : declaredFields) {
                //获取注解对象
                ExportEntityMap declaredAnnotation = declaredField.getDeclaredAnnotation(ExportEntityMap.class);
                if (declaredAnnotation != null) {
                    fieldMap.put(declaredAnnotation.EnName(), declaredAnnotation.CnName());
                }
            }
            fillSheet(sheet, list, fieldMap, style);
            //将文件输出
            /**
             * getOutputStream()是以字节流的方式写出数据
             * 浏览器得有对应的编码表来把字节流解析为字符
             * 而如果又实用getWriter（）来以字符的形式写出，
             * 编码变冲突。。所有规范两者不能同时使用
             */
            OutputStream ouputStream = response.getOutputStream();
            wb.write(ouputStream);
            ouputStream.flush();
            ouputStream.close();

        } catch (Exception e) {
            System.err.println("导出Excel失败！");
            System.err.println(e.getMessage());
        }
    }

    /**
     * 根据字段名获取字段对象
     *
     * @param fieldName 字段名
     * @param clazz     包含该字段的类
     * @return 字段
     */
    public static Field getFieldByName(String fieldName, Class<?> clazz) {
        logger.info("根据字段名获取字段对象:getFieldByName()");
        // 拿到本类的所有字段
        Field[] selfFields = clazz.getDeclaredFields();
        // 如果本类中存在该字段，则返回
        for (Field field : selfFields) {
            //如果本类中存在该字段，则返回
            if (field.getName().equals(fieldName)) {
                return field;
            }
        }
        // 否则，查看父类中是否存在此字段，如果有则返回
        Class<?> superClazz = clazz.getSuperclass();
        if (superClazz != null && superClazz != Object.class) {
            //递归
            return getFieldByName(fieldName, superClazz);
        }
        // 如果本类和父类都没有，则返回空
        return null;
    }

    /**
     * 根据字段名获取字段值
     *
     * @param fieldName 字段名
     * @param o         对象
     * @return 字段值
     * @throws Exception 异常
     */
    public static Object getFieldValueByName(String fieldName, Object o)
            throws Exception {
        logger.info("根据字段名获取字段值:getFieldValueByName()");
        Object value = null;
        //根据字段名得到字段对象
        Field field = getFieldByName(fieldName, o.getClass());
        //如果该字段存在，则取出该字段的值
        if (field != null) {
            field.setAccessible(true);//类中的成员变量为private,在类外边使用属性值，故必须进行此操作
            value = field.get(o);//获取当前对象中当前Field的value
        } else {
            throw new Exception(o.getClass().getSimpleName() + "类不存在字段名 "
                    + fieldName);
        }
        return value;
    }

    /**
     * 根据带路径或不带路径的属性名获取属性值,即接受简单属性名，
     * 如userName等，又接受带路径的属性名，如student.department.name等
     *
     * @param fieldNameSequence 带路径的属性名或简单属性名
     * @param o                 对象
     * @return 属性值
     * @throws Exception 异常
     */
    public static Object getFieldValueByNameSequence(String fieldNameSequence,
                                                     Object o) throws Exception {
        // logger.info("根据带路径或不带路径的属性名获取属性值,即接受简单属性名:getFieldValueByNameSequence()");
        Object value = null;
        // 将fieldNameSequence进行拆分
        String[] attributes = fieldNameSequence.split("\\.");
        if (attributes.length == 1) {
            value = getFieldValueByName(fieldNameSequence, o);
        } else {
            // 根据数组中第一个连接属性名获取连接属性对象，如student.department.name
            Object fieldObj = getFieldValueByName(attributes[0], o);
            //截取除第一个属性名之后的路径
            String subFieldNameSequence = fieldNameSequence
                    .substring(fieldNameSequence.indexOf(".") + 1);
            //递归得到最终的属性对象的值
            value = getFieldValueByNameSequence(subFieldNameSequence, fieldObj);
        }
        return value;
    }

    /**
     * 向工作表中填充数据
     *
     * @param sheet    excel的工作表名称
     * @param list     数据源
     * @param fieldMap 中英文字段对应关系的Map
     * @param style    表格中的格式
     * @throws Exception 异常
     */
    public static <T> void fillSheet(HSSFSheet sheet, List<T> list,
                                     LinkedHashMap<String, String> fieldMap, HSSFCellStyle style) throws Exception {
        //logger.info("向工作表中填充数据:fillSheet()");
        // 定义存放英文字段名和中文字段名的数组
        String[] enFields = new String[fieldMap.size()];
        String[] cnFields = new String[fieldMap.size()];
        // 填充数组
        int count = 0;
        for (Map.Entry<String, String> entry : fieldMap.entrySet()) {
            enFields[count] = entry.getKey();
            cnFields[count] = entry.getValue();
            count++;
        }
        //存储最大列宽
        Map<Integer, Integer> maxWidth = new HashMap<>();
        HSSFRow row = sheet.createRow((int) 0);
        HSSFCell cell = null;
        // 填充表头
        for (int i = 0; i < cnFields.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(cnFields[i]);
            cell.setCellStyle(style);
            sheet.autoSizeColumn(i);
            //设置自适应宽高
            maxWidth.put(i, cell.getStringCellValue().getBytes().length * 256 + 200);
        }
        // 填充内容
        for (int index = 0; index < list.size(); index++) {
            row = sheet.createRow(index + 1);
            // 获取单个对象
            T item = list.get(index);
            int j = 0;
            for (int i = 0; i < enFields.length; i++) {
                HSSFCell createCell = row.createCell(j);
                Object objValue = getFieldValueByNameSequence(enFields[i], item);
                String fieldValue = objValue == null ? "" : objValue.toString();
                cell = row.createCell(i);
                createCell.setCellValue(fieldValue);

                int length = createCell.getStringCellValue().getBytes().length * 256 + 200;
                //这里把宽度最大限制到15000
                if (length > 15000) {
                    length = 15000;
                }
                maxWidth.put(j, Math.max(length, maxWidth.get(j)));
                j++;
                createCell.setCellStyle(style);
            }
        }

        // 列宽自适应
        for (int i = 0; i < cnFields.length; i++) {
            sheet.setColumnWidth(i, maxWidth.get(i));
        }
    }

    public static List<T> getRecordByTxt(String path) {
        List<T> result = new ArrayList<>();
        try {
            List<String> contentList = Files.readAllLines(Paths.get(path),
                    StandardCharsets.UTF_8);
            contentList.forEach(e -> {
                if (!StringUtils.isEmpty(e)) {
                    // 处理 string 根据导入的文件自己处理得到实体类
                    // result.add(e);
                }
            });
        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }



}