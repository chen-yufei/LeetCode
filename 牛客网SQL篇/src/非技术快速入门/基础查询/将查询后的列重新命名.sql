/*
描述
题目：现在你需要查看前2个用户明细设备ID数据，并将列名改为 'user_infos_example',，请你从用户信息表取出相应结果。

示例：user_profile
id	device_id	gender	age	university	province
1	2138	    male	21	北京大学	    Beijing
2	3214	    male        复旦大学	    Shanghai
3	6543	    female	20	北京大学	    Beijing
4	2315	    female	23	浙江大学	    ZheJiang
5	5432	    male	25	山东大学	    Shandong
根据示例，你的查询应返回以下结果：
user_infos_example
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
select
    device_id as user_infos_example
from user_profile
order by id
limit 2