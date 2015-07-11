package vote;

import java.io.IOException;
import java.net.URL;
import java.net.UnknownHostException;

public class MStart {
	
	public static void main(String[] args) throws UnknownHostException, IOException{
		
		URL url = new URL("http://today.hit.edu.cn/commend/113844_1.htm");
		int votes = 150;
		
		Vote vote = new Vote(url,votes);
		vote.autoVotes();
	}

}
