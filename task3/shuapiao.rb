require 'net/http'
require 'set'
require 'uri'

Net::HTTP.version_1_2

if ARGV.length != 2 then
	puts 'Usage: ruby file_path url vote_times'
	exit 0
end

#获取网址及次数
urlPath, votesCnt = ARGV
uriParse = URI.parse(urlPath)

begin
	http = Net::HTTP.start(uriParse.host, uriParse.port)
	response = http.get(uriParse.path)
	if response.code != '200'
		raise Net::ProtoFatalError
	end

	#分析网页内容，获取投票页面
	index = (/\/commend\// =~ response.body)
	string = String.new
	until (response.body[index] == '"') do
	  string += response.body[index]
	  index += 1
	end

	#再次分析，获取投票页面
	response = http.get(string);
	index2 = (/\/commend\// =~ response.body)
	old_times_index = (/<div class="topBox ">/ =~ response.body) + 21
	string2 = String.new
	string3 = String.new
	until (response.body[old_times_index] == '<') do
	  string3 += response.body[old_times_index]
	  old_times_index += 1
	end
	until (response.body[index2] == '"') do
	  string2 += response.body[index2]
	  index2 += 1
	end

	#随机产生ip地址
	ipSet = Set.new  #用来记录所产生的ip值防止重复
	
	count = 0
	while count < votesCnt.to_i
		begin
			ipStr = String.new
			ipStr += rand(255).to_s
			ipStr += '.'
			ipStr += rand(255).to_s
			ipStr += '.'
			ipStr += rand(255).to_s
			ipStr += '.'
			ipStr += rand(255).to_s
		end while(ipSet.include? ipStr)
		ipSet << ipStr

		response1 = http.get(string2, 'X-Forwarded-For' => ipStr) #刷票
		
		#分析是否成功刷出一票
		string4 = String.new
		after_vote_index = (/<div class="topBox ">/ =~ response1.body) + 21
		until (response1.body[after_vote_index] == '<') do
			string4 += response1.body[after_vote_index]
			after_vote_index += 1
		end
		
		if string4.to_i - string3.to_i - 1 == count
			count += 1
		end
	end
	puts 'success'
rescue Net::ProtoFatalError, Net::ProtoServerError, Net::ProtoRetriableError, Net::ProtoUnknownError
	puts "Can\'t open \"#{ARGV[0]}\", status #{response.code}"
	exit 1
end