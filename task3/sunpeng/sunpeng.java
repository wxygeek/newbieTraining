package internet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

import org.junit.Test;

public class MyBrowser {
	
	
	//模拟浏览器
	public static void main(String[] args) throws IOException, InterruptedException {
		
		
		String url = "today.hit.edu.cn";
		Socket s;
		try {
			s = new Socket(url,80);
		} catch (UnknownHostException e) {
			throw new RuntimeException("未知主机异常");
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		//获取输出流给服务器发数据
		PrintWriter out;
		try {
			out = new PrintWriter(s.getOutputStream(),true);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		for( int i = 50 ; i < 100 ; i++){
			
			//Request URL:http://today.hit.edu.cn/news/2015/06-30/6204633160RL0.htm
			out.println("GET /commend/114129_1.htm HTTP/1.1");
			out.println("Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
			out.println("Accept-Encoding:gzip, deflate, sdch");
			out.println("Accept-Language:zh-CN,zh;q=0.8");
			out.println("X-Forwarded-For:172.27.50"+ i);
			out.println("Cache-Control:no-cache");
			out.println("Connection:keep-alive");
			out.println("Cookie:ASPSESSIONIDQARSSTCA=GKCFAHFDPJPDIKGEEOLHHNIH; __utma=161430584.243760590.1436506312.1436506312.1436506312.1; __utmc=161430584; __utmz=161430584.1436506312.1.1.utmccn=(direct)|utmcsr=(direct)|utmcmd=(none); lastVisit=%B9%D8%D3%DA%CB%B6%CA%BF%D1%D0%BE%BF%C9%FA%B0%EC%C0%ED%B1%CF%D2%B5%C0%EB%D0%A3%CA%D6%D0%F8%B5%C4%CD%A8%D6%AA%7C%2Fnews%2F2015%2F06%2D30%2F6204633160RL0%2Ehtm%7C2015%2D7%2D10+13%3A34%3A40%2C; __utmb=161430584; bdshare_firstime=1436506481787");
			out.println("Host:today.hit.edu.cn");
			out.println("Pragma:no-cache");
			out.println("User-Agent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36");
//			out.print("Referer:http://today.hit.edu.cn/commend/114111_1.htm");
//			out.println("Remote Address:219.217.227.135:80");
			out.println();
			out.println();
//			Thread.sleep(100);
		}
		
		
	InputStream in = s.getInputStream();
	byte[] buf = new byte[1024*1024];
	
	int len = in.read(buf);		
	String str = new String(buf,0,len);
	System.out.println(str);

		s.close();
	
		
	}
}

	