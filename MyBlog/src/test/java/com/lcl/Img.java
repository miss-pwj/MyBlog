package com.lcl;

import java.io.File;

/**
 * @author lcl
 * @date 2020/6/13 17:54
 * @Description
 */
public class Img {
    public static void main(String[] args) {
        //fs为存储文件的字符数组
        String path = "F:\\pics\\pics\\smartresize";
        File file = new File(path);
        String[] fs = file.list();

        //定义循环中需要的变量
        String newName = "";
        String oldName = "";
        File f = null;
        int index = 0;
        int len = ("" + fs.length).length();

        for (int i = 0; i < fs.length; i++) {
            oldName = fs[i];
            index = oldName.lastIndexOf(".");
            //制造文件名
            newName = String.format("img_"+(i+1));
            //截取oldName中.txt
            newName += oldName.substring(index);
            f = new File(path + "/" + oldName);
            f.renameTo(new File(path + "/" + newName));
        }
        System.out.println("运行结束");
    }




}
