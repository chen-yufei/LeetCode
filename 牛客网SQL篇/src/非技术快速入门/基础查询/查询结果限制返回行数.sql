/*
描述
题目：现在运营只需要查看前2个用户明细设备ID数据，请你从用户信息表 user_profile 中取出相应结果。

示例：user_profile
id	device_id	gender	age	university	province
1	2138	    male	21	北京大学	    Beijing
2	3214	    male        复旦大学	    Shanghai
3	6543	    female	20	北京大学	    Beijing
4	2315	    female	23	浙江大学	    ZheJiang
5	5432	    male	25	山东大学	    Shandong
根据示例，你的查询应返回以下结果：
device_id
2138
3214

输入：
drop table if exists user_profile;
CREATE TABLE `user_profile` (
`id` int NOT NULL,
`device_id` int NOT NULL,
`gender` varchar(14) NOT NULL,
`age` int ,
`university` varchar(32) NOT NULL,
`province` varchar(32)  NOT NULL);
INSERT INTO user_profile VALUES(1,2138,'male',21,'北京大学','BeiJing');
INSERT INTO user_profile VALUES(2,3214,'male',null,'复旦大学','Shanghai');
INSERT INTO user_profile VALUES(3,6543,'female',20,'北京大学','BeiJing');
INSERT INTO user_profile VALUES(4,2315,'female',23,'浙江大学','ZheJiang');
INSERT INTO user_profile VALUES(5,5432,'male',25,'山东大学','Shandong');

输出：
2138
3214
*/

/*
使用LIMIT限制结果集
LIMIT 子句可以被用于强制 SELECT 语句返回指定的记录数。
LIMIT 接受一个或两个数字参数。参数必须是一个整数常量。
如果只给定一个参数，它表示返回最大的记录行数目。
如果给定两个参数，第一个参数指定第一个返回记录行的偏移量，第二个参数指定返回记录行的最大数目。
为了检索从某一个偏移量到记录集的结束所有的记录行，可以指定第二个参数为 -1。
初始记录行的偏移量是 0(而不是 1)。

例:检索记录行 6-10
SELECT * FROM table LIMIT 5,5

例:检索记录行 11-last
SELECT * FROM table LIMIT 10,-1

例:检索前 5 个记录行
SELECT * FROM table LIMIT 5
*/

select
    device_id
from user_profile
order by id
limit 2


