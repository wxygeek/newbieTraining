package vote;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;

public class Vote {
	
	private URL url;
	private int votes;
	
	public Vote (URL url,int votes){
		this.url = url;
		this.votes = votes;
	}
	
	public void autoVotes() throws UnknownHostException, IOException {
		

		try{
			for(int i=0;i<votes;i++){
				
				int n = (int) (100*Math.random());
				String ip = n+"."+(n+i)+"."+(n+i)+"."+(n+i);
				
				URLConnection urlCon = url.openConnection();
				HttpURLConnection hUrlCon = (HttpURLConnection)urlCon;
				hUrlCon.setRequestProperty("X-Forwarded-For", ip);
				hUrlCon.setRequestProperty("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8");
				hUrlCon.setRequestProperty("Connection","Keep-Alive");
				hUrlCon.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36");
				hUrlCon.connect();
				InputStream is = hUrlCon.getInputStream();
			}
			
		}catch(Exception e) {
			e.printStackTrace();}
		

	}
}
