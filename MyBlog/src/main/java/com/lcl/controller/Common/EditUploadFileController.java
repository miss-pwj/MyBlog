package com.lcl.controller.Common;

import cn.hutool.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Calendar;

public class EditUploadFileController extends HttpServlet {
    @RequestMapping("editormdPic")
    @ResponseBody
    public JSONObject editormdPic (@RequestParam(value = "editormd-image-file", required = true) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{

        //String rootPath ="/Users/ //本地使用,上传位置wujiawei/Documents/uploads/";
        String rootPath =request.getSession().getServletContext().getRealPath("/resource/uploads");
        System.out.println(rootPath);
        //文件的完整名称,如spring.jpeg
        String filename = file.getOriginalFilename();
        //文件名,如spring

        String name = filename.substring(0,filename.indexOf("."));
        //文件后缀,如.jpeg
        String suffix = filename.substring(filename.lastIndexOf("."));

        //创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR)
                + File.separator + (date.get(Calendar.MONTH)+1));

        //目标文件
        File descFile = new File(rootPath+File.separator+dateDirs+File.separator+filename);
        int i = 1;
        //若文件存在重命名
        String newFilename = filename;
        while(descFile.exists()) {
            newFilename = name+"("+i+")"+suffix;
            String parentPath = descFile.getParent();
            descFile = new File(parentPath+File.separator+newFilename);
            i++;
        }
        //判断目标文件所在的目录是否存在
        if(!descFile.getParentFile().exists()) {
            //如果目标文件所在的目录不存在，则创建父目录
            descFile.getParentFile().mkdirs();
        }

        //将内存中的数据写入磁盘
        file.transferTo(descFile);
        //完整的url
        String fileUrl =  "/uploads/"+dateDirs+ "/"+newFilename;

        JSONObject res = new JSONObject();
        res.put("url",fileUrl);
        res.put("success", 1);
        res.put("message", "upload success!");

        return res;

    }
}
