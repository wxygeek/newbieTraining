import re
import random
import urllib2
import time


class vote :
    def __init__ (self,url) :
        self.url = ''
        self.sources = ['.'.join((str(random.randint(1,254)) for _ in range(4))) for _ in range(1000)]  
        self.res = urllib2.urlopen(url)
        self.page = self.res.read()
    
    def get_real_url (self) :
        fuck_html = re.compile(r'/commend/(.*?)htm')
        match = fuck_html.findall(self.page)
        self.url =  'http://today.hit.edu.cn/commend/'+match[0].replace('_0','_1')+'htm'



    def vote_100_times (self):
        self.get_real_url()
        for source in self.sources :
            header= {
                'X-Forwarded-For' : source,
                'host' : 'today.hit.edu.cn',
                'User-Agent' : 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)'
            }
            req = urllib2.Request(self.url,headers = header)
            urllib2.urlopen(req)
            print(source)
            time.sleep(2)
                    





if __name__ == '__main__' :
    url = raw_input()
    v = vote(url)
    v.vote_100_times()


