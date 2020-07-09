package com.lcl;

import com.lcl.entity.Article;
import com.lcl.mapper.ArticleMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 * @author lcl
 * @date 2020/6/13 11:10
 * @Description
 */

//@WebAppConfiguration
//@RunWith(SpringJUnit4ClassRunner.class)
//
//@ContextConfiguration(locations = {"classpath:spring/springmvc.xml","classpath:spring/applicationContext-*.xml"})
public class DaoTest {

    @Autowired
    ArticleMapper articleMapper;

    public void getdate() {
        for (int i = 0; i < 30; i++) {
            Date date = randomDate("2020-06-07", "2020-06-12");
            System.out.println(new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(date));
        }
    }

    private static Date randomDate(String beginDate, String endDate) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date start = format.parse(beginDate);
            Date end = format.parse(endDate);

            if (start.getTime() >= end.getTime()) {
                return null;
            }
            long date = random(start.getTime(), end.getTime());
            return new Date(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static long random(long begin, long end) {
        long rtn = begin + (long) (Math.random() * (end - begin));
        if (rtn == begin || rtn == end) {
            return random(begin, end);
        }
        return rtn;
    }

    @Test
    public void testDao() {
        getdate();
    }

//
//    @Test
//    public void testAritcle(){
//        Article article = new Article();
//
//        for(int i = 1;i<52;i++){
//            article.setArticleId(i);
//            article.setArticleTitle("SSMJava博客，第"+i+"篇");
//            article.setArticleContent("SSMJava博客，第\"+i+\"篇\"");
//            articleMapper.updateArticle(article);
//        }
//    }


    @Test
    public void RandomString() {
        String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random1 = new Random();
        //指定字符串长度，拼接字符并toString
        StringBuffer sb = new StringBuffer();
        for (int j = 0; j < 50; j++)
            for (int i = 0; i < 20; i++) {
                //获取指定长度的字符串中任意一个字符的索引值
                int number = random1.nextInt(str.length());
                //根据索引值获取对应的字符
                char charAt = str.charAt(number);
                sb.append(charAt);
            }
        System.out.println(sb);
    }

    @Test
    public void testFilePath() {
        String str = "(王勃)送梓州李使君(王维)汉江临眺(王维)终南别业(王维)终南山(王维)酬张少府(王维)过香积寺(王维)辋川闲居赠裴秀才迪(王维)山居秋暝(王维)归嵩山作(王维)次北固山下(王湾)云阳馆与韩绅宿别(司空曙)喜外弟卢纶见宿(司空曙)贼平后送人北归(司空曙)赋得古原草送别(白居易)题大庾岭北驿(宋之问)寄左省杜拾遗(岑参)听蜀僧浚弹琴(李白)夜泊牛渚怀古(李白)赠孟浩然(李白)渡荆门送别(李白)送友人(李白)喜见外弟又言别(李益)凉思(李商隐)北青萝(李商隐)蝉(李商隐)风雨(李商隐)落花(李商隐)登岳阳楼(杜甫)奉济驿重送严公四韵(杜甫)别房太尉墓(杜甫)旅夜书怀(杜甫)至德二载甫自京金光门(杜甫)月夜忆舍弟(杜甫)天末怀李白(杜甫)月夜(杜甫)春望(杜甫)春宿左省(杜甫)旅宿(杜牧)春宫怨(杜荀鹤)和晋陵陆丞早春游望(杜审言)杂诗三首·其三(沈佺期)宿桐庐江寄广陵旧游(孟浩然)留别王维(孟浩然)早寒有怀(孟浩然)岁暮归南山(孟浩然)过故人庄(孟浩然)秦中寄远上人(孟浩然)望洞庭湖赠张丞相(孟浩然)与诸子登岘山(孟浩然)宴梅道士山房(孟浩然)章台夜思(韦庄)淮上喜会梁州故人(韦应物)赋得暮雨送李曹(韦应物)经邹鲁祭孔子而叹之(唐玄宗)灞上秋居(马戴)楚江怀古三首·其一(马戴)除夜有怀(崔涂)孤雁(崔涂)题破山寺后禅院(常建)望月怀远(张九龄)书边事(张乔)没蕃故人(张籍)秋日赴阙题潼关驿楼(许浑)早秋(许浑)送人东游(温庭筠)寻陆鸿渐不遇(皎然)寻南溪常道士(刘长卿)新年作(刘长卿)秋日登吴公台上寺远眺(刘长卿)送李中丞归汉阳别业(刘长卿)饯别王十一南游(刘长卿)蜀先主庙(刘禹锡)阙题(刘昚虚)送李端(卢纶)送僧归日本(钱起)谷口书斋寄杨补阙(钱起)在狱咏蝉(骆宾王)江乡故人偶集客舍(戴叔伦)酬程延秋夜即事见赠(韩翃)";
        String[] s = str.split("\\(");

        for (String s1 : s) {
            System.out.println(s1);
        }
    }

    @Test
    public void testString() {
        String str = "寥落古行宫，宫花寂寞红。 白头宫女在，闲坐说玄宗。\n" +
                "白日依山尽，黄河入海流。 欲穷千里目，更上一层楼。\n" +
                "三日入厨下，洗手作羹汤。 未谙姑食性，先遣小姑尝。\n" +
                "红豆生南国，春来发几枝。 愿君多采撷，此物最相思。\n" +
                "君自故乡来，应知故乡事。 来日绮窗前，寒梅著花未？\n" +
                "空山不见人，但闻人语响。 返景入深林，复照青苔上。\n" +
                "独坐幽篁里，弹琴复长啸。 深林人不知，明月来相照。\n" +
                "山中相送罢，日暮掩柴扉。 春草明年绿，王孙归不归？(明年 一作：年年)\n" +
                "绿蚁新醅酒，红泥小火炉。 晚来天欲雪，能饮一杯无？\n" +
                "北斗七星高，哥舒夜带刀。 至今窥牧马，不敢过临洮。\n" +
                "床前明月光，疑是地上霜。 举头望明月，低头思故乡。\n" +
                "美人卷珠帘，深坐颦蛾眉。(颦 一作：蹙) 但见泪痕湿，不知心恨谁。\n" +
                "向晚意不适，驱车登古原。 夕阳无限好，只是近黄昏。\n" +
                "鸣筝金粟柱，素手玉房前。 欲得周郎顾，时时误拂弦。\n" +
                "岭外音书断，经冬复历春。 近乡情更怯，不敢问来人。\n" +
                "功盖三分国，名成八阵图。（名成 一作：名高） 江流石不转，遗恨失吞吴。\n" +
                "移舟泊烟渚，日暮客愁新。 野旷天低树，江清月近人。\n" +
                "春眠不觉晓，处处闻啼鸟。 夜来风雨声，花落知多少。\n" +
                "打起黄莺儿，莫教枝上啼。 啼时惊妾梦，不得到辽西。\n" +
                "千山鸟飞绝，万径人踪灭。 孤舟蓑笠翁，独钓寒江雪。\n" +
                "怀君属秋夜，散步咏凉天。 空山松子落，幽人应未眠。\n" +
                "终南阴岭秀，积雪浮云端。 林表明霁色，城中增暮寒。\n" +
                "故国三千里，深宫二十年。 一声何满子，双泪落君前。\n" +
                "松下问童子，言师采药去。 只在此山中，云深不知处。\n" +
                "归山深浅去，须尽丘壑美。 莫学武陵人，暂游桃源里。\n" +
                "苍苍竹林寺，杳杳钟声晚。 荷笠带斜阳，青山独归远。(斜阳 一作：夕阳)\n" +
                "泠泠七弦上，静听松风寒。(七弦 一作：七丝) 古调虽自爱，今人多不弹。\n" +
                "孤云将野鹤，岂向人间住。 莫买沃洲山，时人已知处。\n" +
                "昨夜裙带解，今朝蟢子飞。 铅华不可弃，莫是藁砧归。\n" +
                "寒雨连江夜入吴，平明送客楚山孤。 洛阳亲友如相问，一片冰心在玉壶。\n" +
                "闺中少妇不知愁，春日凝妆上翠楼。(不知 一作：不曾) 忽见陌头杨柳色，悔教夫婿觅封侯。\n" +
                "昨夜风开露井桃，未央前殿月轮高。 平阳歌舞新承宠，帘外春寒赐锦袍。\n" +
                "独在异乡为异客，每逢佳节倍思亲。 遥知兄弟登高处，遍插茱萸少一人。\n" +
                "葡萄美酒夜光杯，欲饮琵琶马上催。 醉卧沙场君莫笑，古来征战几人回？\n" +
                "泪湿罗巾梦不成，夜深前殿按歌声。 红颜未老恩先断，斜倚薰笼坐到明。\n" +
                "寂寂花时闭院门，美人相并立琼轩。 含情欲说宫中事，鹦鹉前头不敢言。\n" +
                "洞房昨夜停红烛，待晓堂前拜舅姑。 妆罢低声问夫婿，画眉深浅入时无。\n" +
                "故园东望路漫漫，双袖龙钟泪不干。 马上相逢无纸笔，凭君传语报平安。\n" +
                "故人西辞黄鹤楼，烟花三月下扬州。 孤帆远影碧空尽，唯见长江天际流。 (唯 通：惟)";
        String[] s = str.split(" \n");

        for (String s1 : s) {
            System.out.println(s1);
        }
//        System.out.println(s);
    }

    @Test
    public void testStringTitle() {
        String str = "<b>元稹</b>\n" +


                "<b>王之涣</b>\n" +


                "<b>王建</b>\n" +


                "<b>王维</b>\n" +


                "<b>王维</b>\n" +

                "<b>王维</b>\n" +


                "<b>王维</b>\n" +


                "<b>王维</b>\n" +


                "<b>白居易</b>\n" +


                "<b>西鄙人</b>\n" +


                "<b>李白</b>\n" +


                "<b>李白</b>\n" +


                "<b>李商隐</b>\n" +


                "<b>李端</b>\n" +


                "<b>宋之问</b>\n" +


                "<b>杜甫</b>\n" +


                "<b>孟浩然</b>\n" +


                "<b>孟浩然</b>\n" +


                "<b>金昌绪</b>\n" +


                "<b>柳宗元</b>\n" +


                "<b>韦应物</b>\n" +


                "<b>祖咏</b>\n" +


                "<b>张祜</b>\n" +


                "<b>贾岛</b>\n" +


                "<b>裴迪</b>\n" +


                "<b>刘长卿</b>\n" +


                "<b>刘长卿</b>\n" +


                "<b>刘长卿</b>\n" +


                "<b>权德舆</b>\n" +


                "<b>王昌龄</b>\n" +


                "<b>王昌龄</b>\n" +


                "<b>王昌龄</b>\n" +


                "<b>王维</b>\n" +


                "<b>王翰</b>\n" +


                "<b>白居易</b>\n" +


                "<b>朱庆馀</b>\n" +


                "<b>朱庆馀</b>\n" +


                "<b>岑参</b>\n" +


                "<b>李白</b>";
        String[] s = str.split(" \n");
        for (String s1 : s) {
            System.out.println(s1);

        }


    }


    @Test
    public void testStr() {
        String str = "小学古诗初中古诗高中古诗小学文言初中文言高中文言唐诗三百古诗三百宋词三百宋词精选古诗十九诗经楚辞乐府写景咏物春天夏天秋天冬天写雨写雪写风写花梅花荷花菊花柳树月亮山水写山写水长江黄河儿童写鸟写马田园边塞地名节日春节元宵寒食清明端午七夕中秋重阳怀古抒情爱国离别送别思乡思念";
    }
}
