/*
题目：现在运营举办了一场比赛，收到了一些参赛申请，表数据记录形式如下所示，现在运营想要统计每个性别的用户分别有多少参赛者，请取出相应结果
示例：user_submit
device_id	profile	                blog_url
2138	    180cm,75kg,27,male	    http:/url/bigboy777
3214	    165cm,45kg,26,female	http:/url/kittycc
6543	    178cm,65kg,25,male	    http:/url/tiger
4321	    171cm,55kg,23,female	http:/url/uhksd
2131	    168cm,45kg,22,female	http:/urlsydney

根据示例，你的查询应返回以下结果：
gender	number
male	2
female	3
输入：
drop table if exists user_submit;
CREATE TABLE `user_submit` (
`id` int NOT NULL,
`device_id` int NOT NULL,
`profile` varchar(100) NOT NULL,
`blog_url` varchar(100) NOT NULL
);
INSERT INTO user_submit VALUES(1,2138,'180cm,75kg,27,male','http:/url/bisdgboy777');
INSERT INTO user_submit VALUES(1,3214,'165cm,45kg,26,female','http:/url/dkittycc');
INSERT INTO user_submit VALUES(1,6543,'178cm,65kg,25,male','http:/url/tigaer');
INSERT INTO user_submit VALUES(1,4321,'171cm,55kg,23,female','http:/url/uhsksd');
INSERT INTO user_submit VALUES(1,2131,'168cm,45kg,22,female','http:/url/sysdney');

输出：
male|2
female|3
*/
select
    substring_index(profile,',',-1) as gender,
    count(*) as number
from user_submit
group by gender


//substring_index()函数
/*
substring_index()
substring_index(str,delim,count)

str:要处理的字符串
delim:分隔符
count:计数

如果count是正数，那么就是从左往右数，第N个分隔符的左边的所有内容
如果count是负数，那么就是从右往左数，第N个分隔符的右边的所有内容
*/