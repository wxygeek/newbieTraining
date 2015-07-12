/* 参考学习：
http://my.oschina.net/antianlu/blog/228511 
http://www.w3school.com.cn/js/js_datatypes.asp

*/
var http = require('http'); 
//虽然没用到，留着备用 
var server = http.createServer(function(req,res){}).listen(3000);

var i;
for(i = 0;i < 100;i++) 
{ 
	var ip1 = parseInt((Math.random() * 100000000) % 256);
	var ip2 = parseInt((Math.random() * 100000000) % 256);
	var ip3 = parseInt((Math.random() * 100000000) % 256);
	var ip4 = parseInt((Math.random() * 100000000) % 256);

	IP = ip1 + '.' + ip2 + '.' + ip3 + '.' + ip4;

var headers = {
	X-Forwarded-For : IP， 
	User-Agent : "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36" 
};



var options = { 
	hostname : "today.hit.edu.cn", 
	path : "/commend/114103_1.htm", 
	method : "GET", 
	headers : headers 
};

//请求
var req = http.request(options,function(res){
    console.log(res);
    console.log('STATUS:' + res.statusCode);
    console.log('HEADERS:' + JSON.stringify(res.headers));
    res.setEncoding('utf8');
    res.on('data',function(chunk){
       console.log('BODY' + chunk);
    });
});
 





//空语句，留着以后可能会用 
req.on('response',function(){

});

req.on('connect',function(){

});

req.on('socket',function(){

});

req.on('upgrade',function(){

});

req.on('continue',function(){

})

//请求过程出现错误，返回的请求对象上的'error'的事件将被触发。

req.on('error',function(e){ console.log(e.message); });

//刷新未发送的 
req.end();

}


