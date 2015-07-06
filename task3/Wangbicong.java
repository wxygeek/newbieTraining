package addvote;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class AddVote {

	public static void main(String[] args){
		try {
			for(int i=0;i<100;i++){
				URL url = new URL("http://today.hit.edu.cn/commend/113738_1.htm");
		    	HttpURLConnection con = (HttpURLConnection)url.openConnection();
			    Random ran = new Random();
			
				int ip1 = ran.nextInt(255);
				int ip2 = ran.nextInt(255);
				int ip3 = ran.nextInt(255);
				int ip4 = ran.nextInt(255);
				String ipAddress = ip1+"."+ip2+"."+ip3+"."+ip4;
				
			//	con.setRequestMethod("HEAD");
				con.setRequestProperty("X-Forwarded-For",ipAddress);
				
				/*Map<String,List<String>> headerMap = con.getHeaderFields();  
			    Iterator<String> iterator = headerMap.keySet().iterator();  
			    while (iterator.hasNext()) {  
			        String key = iterator.next();  
			        List<String> values = headerMap.get(key);  
			          
			        System.out.println(key + ":" + values.toString());  
			    }  */
				
			    System.out.println(con.getResponseMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
