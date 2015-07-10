package demo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class SocketDemo {
	public static void main(String[] args) throws UnknownHostException, IOException {
		Socket socket = new Socket("today.hit.edu.cn",80);
		PrintWriter out = new PrintWriter(socket.getOutputStream(),true);
		for(int i = 60;i < 80;++i)
		{
			out.println("GET /commend/113864_1.htm HTTP/1.1");
			out.println("Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
			out.println("Accept-Encoding:gzip, deflate, sdch");
			out.println("Accept-Language:zh-CN,zh;q=0.8");
			out.println("X-Forwarded-For: 172.27.50."+i);
			out.println("Cache-Control:no-cache");
			out.println("Connection:keep-alive");
			out.println("Cookie:__utmz=161430584.1436103962.1.1.utmccn=(direct)|utmcsr=(direct)|utmcmd=(none); bdshare_firstime=1436103962066; ASPSESSIONIDAACTRCAS=DDOAIFACLCJBJPEJOOPEMKPK; __utma=161430584.126526174.1436103962.1436162967.1436317231.5; __utmc=161430584; __utmb=161430584; lastVisit=%A1%BE%D1%A7%CA%F5%B2%E8%BB%B0%BB%E1%A1%BF%B9%DC%C0%ED%D1%A7%D4%BA%A1%B0%D1%D0%CD%BE%D3%D0%C4%E3%A3%AC%D1%A7%CA%F5%B2%E8%BB%B0%BB%E1%A1%B1%B5%DA%CA%AE%D2%BB%C6%DA%BB%EE%B6%AF%B3%C9%B9%A6%BE%D9%B0%EC%7C%2Fnews%2F2015%2F07%2D07%2F592040170RL0%2Ehtm%7C2015%2D7%2D8+9%3A02%3A55%2C%A1%BE%C9%FA%C8%E7%CF%C4%BB%A8+%D2%BB%D2%BB%B2%BB%C9%E1%A1%BF%C0%ED%D1%A7%D4%BA2011%BC%B6%B1%BE%BF%C6%B1%CF%D2%B5%C9%FA%CD%ED%BB%E1%B3%C9%B9%A6%BE%D9%B0%EC%7C%2Fnews%2F2015%2F07%2D07%2F0873407170RL0%2Ehtm%7C2015%2D7%2D8+8%3A59%3A36%2C%B5%DA115%C6%DA%D1%D0%BE%BF%C9%FA%C8%CB%CE%C4%CB%D8%D6%CA%BD%B2%D7%F9%A1%AA%A1%AA%C8%CB%C9%FA%B5%C4%D1%A1%D4%F1%D4%A4%B8%E6%7C%2Fnews%2F2015%2F07%2D03%2F6910706170RL0%2Ehtm%7C2015%2D7%2D6+14%3A32%3A59%2C2015%C4%EA%B9%FA%BC%CA%C1%AA%BA%CF%C5%E0%D1%F8%CF%EE%C4%BF%D5%D0%C9%FA%D0%FB%BD%B2%7C%2Fnews%2F2015%2F07%2D02%2F4831809070RL0%2Ehtm%7C2015%2D7%2D5+23%3A09%3A15%2C%A1%BE%C7%E0%C4%EA%D6%D0%B9%FA%BB%EA%A1%BF%B5%DA9%C6%DA%A3%BA%BC%CD%C4%EE%BD%A8%B5%B394%D6%DC%C4%EA%A3%AC%D1%A7%CF%B0%B9%FE%B9%A4%B4%F3%BE%AB%C9%F1%7C%2Fnews%2F2015%2F07%2D04%2F7445422170RL0%2Ehtm%7C2015%2D7%2D5+21%3A49%3A06%2C%A1%B0%C3%CE%CF%EB%A1%A4%B5%A3%B5%B1%A1%B1%B1%CF%D2%B5%C9%FA%B5%B3%D4%B1%B4%FA%B1%ED%D7%F9%CC%B8%BB%E1%7C%2Fnews%2F2015%2F07%2D05%2F5361142170RL0%2Ehtm%7C2015%2D7%2D5+21%3A44%3A52%2C");
			out.println("Host:today.hit.edu.cn");
			out.println("Pragma:no-cache");
			out.println("User-Agent:Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36");
			out.println();
			out.println();
		}
		
		BufferedReader bfrd = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		String line = null;
		while((line = bfrd.readLine())!= null)
		{
			System.out.println(line);
		}
		socket.close();
	}
}