/*
题目：现在运营想要查看用户在某天刷题后第二天还会再来刷题的平均概率。请你取出相应数据。
示例：question_practice_detail
id	device_id	question_id	result	date
1	2138	    111	        wrong	2021-05-03
2	3214        112	        wrong	2021-05-09
3	3214	    113	        wrong   2021-06-15
4	6543        111	        right   2021-08-13
5	2315        115         right	2021-08-13
6	2315        116         right   2021-08-14
7	2315	    117         wrong   2021-08-15
……

根据示例，你的查询应返回以下结果：
avg_ret
0.3000


输入：
drop table if exists `user_profile`;
drop table if  exists `question_practice_detail`;
drop table if  exists `question_detail`;
CREATE TABLE `user_profile` (
`id` int NOT NULL,
`device_id` int NOT NULL,
`gender` varchar(14) NOT NULL,
`age` int ,
`university` varchar(32) NOT NULL,
`gpa` float,
`active_days_within_30` int ,
`question_cnt` int ,
`answer_cnt` int
);
CREATE TABLE `question_practice_detail` (
`id` int NOT NULL,
`device_id` int NOT NULL,
`question_id`int NOT NULL,
`result` varchar(32) NOT NULL,
`date` date NOT NULL
);
CREATE TABLE `question_detail` (
`id` int NOT NULL,
`question_id`int NOT NULL,
`difficult_level` varchar(32) NOT NULL
);

INSERT INTO user_profile VALUES(1,2138,'male',21,'北京大学',3.4,7,2,12);
INSERT INTO user_profile VALUES(2,3214,'male',null,'复旦大学',4.0,15,5,25);
INSERT INTO user_profile VALUES(3,6543,'female',20,'北京大学',3.2,12,3,30);
INSERT INTO user_profile VALUES(4,2315,'female',23,'浙江大学',3.6,5,1,2);
INSERT INTO user_profile VALUES(5,5432,'male',25,'山东大学',3.8,20,15,70);
INSERT INTO user_profile VALUES(6,2131,'male',28,'山东大学',3.3,15,7,13);
INSERT INTO user_profile VALUES(7,4321,'male',28,'复旦大学',3.6,9,6,52);
INSERT INTO question_practice_detail VALUES(1,2138,111,'wrong','2021-05-03');
INSERT INTO question_practice_detail VALUES(2,3214,112,'wrong','2021-05-09');
INSERT INTO question_practice_detail VALUES(3,3214,113,'wrong','2021-06-15');
INSERT INTO question_practice_detail VALUES(4,6543,111,'right','2021-08-13');
INSERT INTO question_practice_detail VALUES(5,2315,115,'right','2021-08-13');
INSERT INTO question_practice_detail VALUES(6,2315,116,'right','2021-08-14');
INSERT INTO question_practice_detail VALUES(7,2315,117,'wrong','2021-08-15');
INSERT INTO question_practice_detail VALUES(8,3214,112,'wrong','2021-05-09');
INSERT INTO question_practice_detail VALUES(9,3214,113,'wrong','2021-08-15');
INSERT INTO question_practice_detail VALUES(10,6543,111,'right','2021-08-13');
INSERT INTO question_practice_detail VALUES(11,2315,115,'right','2021-08-13');
INSERT INTO question_practice_detail VALUES(12,2315,116,'right','2021-08-14');
INSERT INTO question_practice_detail VALUES(13,2315,117,'wrong','2021-08-15');
INSERT INTO question_practice_detail VALUES(14,3214,112,'wrong','2021-08-16');
INSERT INTO question_practice_detail VALUES(15,3214,113,'wrong','2021-08-18');
INSERT INTO question_practice_detail VALUES(16,6543,111,'right','2021-08-13');
INSERT INTO question_detail VALUES(1,111,'hard');
INSERT INTO question_detail VALUES(2,112,'medium');
INSERT INTO question_detail VALUES(3,113,'easy');
INSERT INTO question_detail VALUES(4,115,'easy');
INSERT INTO question_detail VALUES(5,116,'medium');
INSERT INTO question_detail VALUES(6,117,'easy');

输出：
0.3000
*/
select
    count(distinct qpd2.device_id,qpd2.date)/count(distinct qpd1.device_id,qpd1.date) as avg_ret
from question_practice_detail qpd1
left join question_practice_detail qpd2
on qpd1.device_id=qpd2.device_id
and datediff(qpd1.date,qpd2.date)=1

//mysql date_add() 函数介绍
/*
date_add()：实现对日期类型的数据进行加或减的操作，返回操作后的数据，但不会修改原有的数据。
语法：
DATE_ADD(date,INTERVAL expr unit)

参数：
date：一个时间类型的字符。
INTERVAL：固定的标志。
expr：表示数量，如果为正则为加上，如果为负则为减去。
unit：表示加上或减去的时间类型，比如年，月，日，周等。可参考下面的表格。

mysql date_add() 当前时间上加上一天
select date_add(now(),interval 1 day);
*/


//datediff(次日,当日)=1 即次日-当日=1
