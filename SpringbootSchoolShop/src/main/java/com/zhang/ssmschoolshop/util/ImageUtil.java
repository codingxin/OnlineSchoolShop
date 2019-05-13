package com.zhang.ssmschoolshop.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @author created by Zhangdazhuang
 * @version v.0.1
 * @Description TODO
 * @date 2019/4/30
 * @备注
 **/
public class ImageUtil {

    public static String imagePath(MultipartFile file, String shopName) {
        if (file.isEmpty()) {
            return "false";
        }
        int size = (int) file.getSize();
        String path = "D:/upload";
        String os = System.getProperty("os.name");
        if(os.toLowerCase().startsWith("linux")){
            path="/usr/upload";
        }
        String fileName=UUID.randomUUID().toString().substring(0,4)+shopName;
        File dest = new File(path + "/" +fileName);
        System.out.println("保存的绝对路径为:"+dest);
        if (!dest.getParentFile().exists()) { //判断文件父目录是否存在
            dest.getParentFile().mkdir();
        }
        try {
            //根据系统的不同，保存到不同的路径
            file.transferTo(dest);
            return fileName;
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "false";
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "false";
        }


    }
}
