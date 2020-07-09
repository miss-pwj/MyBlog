package com.lcl.util.others;

import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;

/**
 * @author lcl
 * @date 2020/6/13 18:38
 * @Description
 */


public class Jsouppoem {

    public static void main(String[] args) {
        try{
            Document doc = Jsoup.connect("http://www.gushiwen.org/gushi/tangshi.aspx").get();
            Elements divs = doc.select("a[href$=.aspx]");
//            for(int i=0 ;i<divs.size(); i++) {
            for(int i=0 ;i<40; i++) {
                Element div = divs.get(i);
//                System.out.println(div);
//                if(div.attr("href").length() == 25) {
//                    String url = "http://www.gushiwen.org" + div.attr("href");
                    String url = div.attr("href");
//                    System.out.println(url);
                    printLast2Name(url);
//                }
            }

        } catch(Exception e) {
            System.err.println("main");
        }
    }

    public static void printLast2Name(String url){
        try{
            Document doc = Jsoup.connect(url).get();
            System.out.println(doc);
//            Element pobject = doc.select("p[align$=center]").first();
//            Element pobject = doc.select("div[class$=contson]").first();
            Element pobject = doc.select("b").first();
            System.err.println(pobject);

            String text = pobject.text();
//            System.out.println(text);
            String[] split = text.split("，|。|？");
            for(String str : split) {
                String lastName = str.substring(str.length()-2, str.length());
                String pinyin = PinyinHelper.convertToPinyinString(lastName, "", PinyinFormat.WITHOUT_TONE);
                if(register(pinyin + ".com")) {
                    System.out.print(lastName);
                    System.out.print("("+ pinyin + ")  ");
                }
            }
            System.out.println();
            System.out.println();
        } catch(Exception e) {
            System.err.println("print");
        }
    }
    public static boolean register(String url) {
        try {
            Document doc = Jsoup.connect("http://panda.www.net.cn/cgi-bin/check.cgi?area_domain=" + url).get();
            if(doc.text().contains("210 : Domain name is available")) {
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
}