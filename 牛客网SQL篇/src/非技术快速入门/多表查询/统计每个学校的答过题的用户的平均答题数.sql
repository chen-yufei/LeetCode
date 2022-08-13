/*
运营想要了解每个学校答过题的用户平均答题数量情况，请你取出数据。
用户信息表 user_profile，其中device_id指终端编号（认为每个用户有唯一的一个终端），gender指性别，age指年龄，
university指用户所在的学校，gpa是该用户平均学分绩点，active_days_within_30是30天内的活跃天数。
device_id	gender  age university	gpa	active_days_within_30
2138	    male	21	北京大学	    3.4	        7
3214        male	NULL复旦大学	    4	        15
6543	    female	20	北京大学	    3.2	        12
2315	    female	23	浙江大学	    3.6	        5
5432	    male	25	山东大学	    3.8	        20
2131	    male	28	山东大学	    3.3	        15
4321	    male    28	复旦大学	    3.6	        9
第一行表示:用户的常用信息为使用的设备id为2138，性别为男，年龄21岁，北京大学，gpa为3.4，在过去的30天里面活跃了7天
最后一行表示:用户的常用信息为使用的设备id为4321，性别为男，年龄28岁，复旦大学，gpa为3.6，在过去的30天里面活跃了9天

答题情况明细表 question_practice_detail，其中question_id是题目编号，result是答题结果。
device_id	question_id	result
2138	    111	        wrong
3214	    112	        wrong
3214	    113         wrong
6543	    111	        right
2315	    115	        right
2315	    116	        right
2315	    117	        wrong
5432	    118	        wrong
5432	    112	        wrong
2131	    114	        right
5432	    113	        wrong

第一行表示用户的常用信息为使用的设备id为2138，在question_id为111的题目上，回答错误
....
最后一行表示用户的常用信息为使用的设备id为5432，在question_id为113的题目上，回答错误
请你写SQL查找每个学校用户的平均答题数目(说明：某学校用户平均答题数量计算方式为该学校用户答题总次数除以答过题的不同用户个数)根据示例，你的查询应返回以下结果（结果保留4位小数），注意：结果按照university升序排序！！！

university	avg_answer_cnt
北京大学	    1.0000
复旦大学	    2.0000
山东大学	    2.0000
浙江大学	    3.0000
解释:
第一行：北京大学总共有2个用户，2138和6543，2个用户在question_practice_detail里面答了2题，平均答题数目为2/2=1.0000
....
最后一行:浙江大学总共有1个用户，2315，这个用户在question_practice_detail里面答了3题，平均答题数目为3/1=3.0000

输入：
drop table if exists `user_profile`;
drop table if  exists `question_practice_detail`;
CREATE TABLE `user_profile` (
`device_id` int NOT NULL,
`gender` varchar(14) NOT NULL,
`age` int ,
`university` varchar(32) NOT NULL,
`gpa` float,
`active_days_within_30` int
);
CREATE TABLE `question_practice_detail` (
`device_id` int NOT NULL,
`question_id`int NOT NULL,
`result` varchar(32) NOT NULL
);

INSERT INTO user_profile VALUES(2138,'male',21,'北京大学',3.4,7);
INSERT INTO user_profile VALUES(3214,'male',null,'复旦大学',4.0,15);
INSERT INTO user_profile VALUES(6543,'female',20,'北京大学',3.2,12);
INSERT INTO user_profile VALUES(2315,'female',23,'浙江大学',3.6,5);
INSERT INTO user_profile VALUES(5432,'male',25,'山东大学',3.8,20);
INSERT INTO user_profile VALUES(2131,'male',28,'山东大学',3.3,15);
INSERT INTO user_profile VALUES(4321,'male',28,'复旦大学',3.6,9);
INSERT INTO question_practice_detail VALUES(2138,111,'wrong');
INSERT INTO question_practice_detail VALUES(3214,112,'wrong');
INSERT INTO question_practice_detail VALUES(3214,113,'wrong');
INSERT INTO question_practice_detail VALUES(6543,111,'right');
INSERT INTO question_practice_detail VALUES(2315,115,'right');
INSERT INTO question_practice_detail VALUES(2315,116,'right');
INSERT INTO question_practice_detail VALUES(2315,117,'wrong');
INSERT INTO question_practice_detail VALUES(5432,118,'wrong');
INSERT INTO question_practice_detail VALUES(5432,112,'wrong');
INSERT INTO question_practice_detail VALUES(2131,114,'right');
INSERT INTO question_practice_detail VALUES(5432,113,'wrong');

输出：
北京大学|1.0000
复旦大学|2.0000
山东大学|2.0000
浙江大学|3.0000
*/
select
    u.university,
    count(q.question_id)/count(distinct(q.device_id)) as avg_answer_cnt
from question_practice_detail q
left join user_profile u on u.device_id=q.device_id
group by u.university