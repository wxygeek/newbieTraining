import java.net.*;
import java.util.*;

public class shuapiao
{
	public static void main(String[] args)
	{    
		try{
			for(int i=1;i<=100;i++)
			{
				//获取随机IP值
				Random getRandom=new Random();
				int ip1=getRandom.nextInt(255);
				int ip2=getRandom.nextInt(255);
				int ip3=getRandom.nextInt(255);
				int ip4=getRandom.nextInt(255);
				String ip=ip1+"."+ip2+"."+ip3+"."+ip4;
				
				//创建一个url对象			
				URL url=new URL("http://today.hit.edu.cn/commend/113987_1.htm");
				
				//从网络中获取网页数据
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				
				//设置请求属性
				con.setRequestProperty("X-Forwarded-For",ip);
				
				//发送请求
				con.getHeaderFields();					
				
				//延迟一秒
				Thread.sleep(1000);  
			}
		}catch (Exception e){
			e.printStackTrace();	
		}
	}
}
