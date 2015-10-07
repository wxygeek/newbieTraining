var http=require('http');
var path="/commend/113829_1.htm";
var time=100;
for(var i=0;i<time;i++){
var html="";
var a=parseInt(Math.random()*(255-0)+0);
var b=parseInt(Math.random()*(255-0)+0);
var c=parseInt(Math.random()*(255-0)+0);
var d=parseInt(Math.random()*(255-0)+0);
var ip=a+"."+b+"."+c+"."+d;
var headers={
"X-Forwarded-For":ip,
"User-Agent":"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36"
};
var option={
	"hostname":"today.hit.edu.cn",
	"path":path,
	"method":"get",
	"headers":headers
};
var req=http.request(option,function(res){
	console.log('STATUS: ' + res.statusCode);  
    console.log('HEADERS: ' + JSON.stringify(res.headers));  
    res.setEncoding('utf8');  
});
req.on('error', function (e) {  
    console.log('problem with request: ' + e.message);  
});
req.end(); 
}