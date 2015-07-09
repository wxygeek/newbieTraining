package com.company;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * http://www.cnblogs.com/zhuawang/archive/2012/12/08/2809380.html
 * http://skyline75489.blog.163.com/blog/static/21996714220144435844863
 * URLConnection 获取不到 iframe 标签下的 #document 内容
 * http://www.oschina.net/question/591000_242529 上提问，突然想起解决方法
 * http://www.xdemo.org/jsoup-html-parse/    jsoup 教程参考
 * Created by vilen on 2015/7/8.
 */
public class HaGongDa {
    public static void main(String[] args)  {
        //新闻链接
        String newURL ="http://today.hit.edu.cn/news/2015/07-09/7491115170RL0.htm";
        //刷票次数
        int count= 100;
        String iframeURL = "";
        String clickURL = "";

        String html1 = sendGet(newURL, "");
        System.out.println(html1);
        //jsoup 解析
        Document doc = Jsoup.parse(html1);
        //解析到/commend/114018_0.htm
        Elements links = doc.getElementsByTag("iframe");
        System.out.println(links.toString());
        for (Element link : links) {
            Elements e = link.getElementsByAttributeValueContaining("src", "commend");
            for(Element e1: e){
                iframeURL = e1.attr("src");
            }
        }

        System.out.println("************");
        System.out.println("发送第二次请求");
        System.out.println("************");
        String s2 = sendGet("http://today.hit.edu.cn" + iframeURL, "");
        System.out.println(s2);
        Document doc2 = Jsoup.parse(s2);
        Elements elements2 = doc2.getElementsByClass("bottomBox");
        for (Element e2 : elements2) {
            Elements b2 = e2.getElementsByAttribute("href");
            for(Element b3: b2){
                clickURL = b3.attr("href");
            }
        }

        System.out.println("************");
        System.out.println("第三次请求，模拟点击");
        System.out.println("************");
        for(int i=0;i<count;i++) {
            sendGet("http://today.hit.edu.cn" + clickURL, "");
        }
    }

    private static String sendGet (String url,String param) {
        String result="";
        BufferedReader in = null;
        try {
            String urlNameString;
            if(!param.equals("")) {
                urlNameString = url + "?" + param;
            }else {
                urlNameString = url;
            }
            Random r = new Random();
            int a = r.nextInt(254)+1;
            int b = r.nextInt(255);
            int c = r.nextInt(255);
            int d = r.nextInt(255);
            String ip = ""+a+"."+b+"."+c+"."+d;
            System.out.println(ip);
            URL realUrl = new URL(urlNameString);
            //打开连接
            URLConnection connection = realUrl.openConnection();
            //设置通用的请求属性
            connection.setRequestProperty("X-Forwarded-For",ip);
            connection.setRequestProperty("accept","*/*");
            connection.setRequestProperty("connection","Keep-Alive");
            connection.setRequestProperty("user-agent","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");

            //建立实际的连接
            connection.connect();
            //获取所有响应头字段
            Map<String,List<String>> map = connection.getHeaderFields();
            //遍历响应头字段
            for (String key : map.keySet()){
                System.out.println(key + "--->" + map.get(key));
            }
            //定义 bufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            while ((line = in.readLine())!=null) {
                result += line;
            }

        }catch (Exception e) {
            System.out.println("发送Get请求出现异常!" + e);
            e.printStackTrace();
        }
        finally {
            try {
                if(in != null) {
                    in.close();
                }
            }catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
}
