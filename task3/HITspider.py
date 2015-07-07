import re
import random
import urllib2


class vote :
    def __init__ (self,url) :
        self.url = ''
        self.sources = ['.'.join((str(random.randint(1,254)) for _ in range(4))) for _ in range(100)]  
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
                'User-Agent' : 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/43.0.2357.81 Chrome/43.0.2357.81 Safari/537.36'
            }
            req = urllib2.Request(self.url,headers = header)
            urllib2.urlopen(req)
                    





if __name__ == '__main__' :
    url = raw_input()
    v = vote(url)
    v.vote_100_times()


