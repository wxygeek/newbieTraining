# The Newbie Training

欢迎来到新手村，你需要完成以下训练：

1. Task1——github的使用
	1. 注册github帐号
	2. star这个仓库
	3. 自学git及github的基础使用，并在自己电脑上配置好环境
	4. fork这个仓库，clone下你的仓库，在本地创建新的分支（不要使用默认的master分支）
	5. 在本地task1目录下，添加一个新的文件，以自己的github账户名作为markdown文件的文件名，如：gkuchan.md
	6. 文件中可以写你想说的任何话（推荐写自己的座右铭）
	7. commit到本地仓库，然后将本地分支推送到remote
	8. 向原仓库的master分支发起pull request，等待合并分支

	请于2015年6月21日前完成以上内容。

2. Task2——Linux环境搭建及Mysql使用
	1. 搭起一套任意你喜欢的Linux发行版环境（以后任务会持续使用）
	2. 安装Mysql
	3. 学习数据库存在的意义和作用,学习基础的增删改查sql语句
	4. 下载 https://launchpadlibrarian.net/24493586/employees_db-full-1.0.6.tar.bz2 ，向数据库中导入全部内容
	5. 在task2文件夹下，建立属于自己的sql文件，如：gkuchan.sql
	6. 文件中包含查询以下内容的sql语句：
		1. 查询工作最长时间的雇员信息（包含他的能得到的全部信息）（工作时间指employee中hire_date最早）
		2. 为所有男性雇员工资+1 (性别信息在employee表中，一个人可能包含多条salary信息，需要全部修改)
		3. 在数据库中彻底抹掉last name为Acton的所有人的所有相关信息（涉及到多个表的信息删除）
		4. 在数据库中插入你自己的信息，给自己制定一个title、把自己加入到你喜欢的部门中、给自己制定你期望的工资
	7. 任务提交方式同task1相同，分支可任意。请保证sql脚本文件可以直接被执行。

	请于2015年6月28日前完成以上内容。

	扩展学习：http://coolshell.cn/articles/1846.html

3. 学习"语义化版本" && 学习Linux基础命令 && 学习http协议

	1. 语义化版本：http://semver.org/lang/zh-CN/

	2. Linux常用命令：cd ls grep find cp mv rm ps kill tar cat time wget ...

	3. 了解浏览器运作原理，学习HTTP协议，学习简单的http请求调试，如何伪造http请求，为写刷票脚本做好准备
	
	扩展学习：

		1. Linux文件权限相关知识（chown chgrp chmod等命令）

		2. 配置自己的一套Linux Shell

	很多同学这周面临考试周，课程内容比较紧张。所以这周没有提交任务，大家在忙完考试的剩余时间里，为下周的刷票脚本做做准备就好。刷票脚本的本质就是伪造对方服务器识别的http请求。
	脚本不限制语言，大家可以用自己熟悉的语言实现。在浏览器调试控制台可以执行的脚本也ok。
	

4. Task3——学习http协议及编写今日哈工大刷票脚本
	
	编写今日哈工大( http://today.hit.edu.cn/ )新闻页面的的刷票脚本，实现每一篇新闻中刷“推荐本文”数量的脚本。
	
	1. 任意点击一篇新闻，要求其目前的“推荐本文”数量小于20
	2. 刷票实现“推荐本文”的数量大于100（不要刷过多）
	3. 脚本只需更改url链接，即可自动选择页面刷票
	4. 语言任意
	5. 请在task3下新建文件夹，包含所需文件，不需要包含库文件
	
	请于2015年7月12日前完成以上内容。

5. Task4

	Coming Soon...