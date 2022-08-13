/*
题目：运营想要计算一些参加了答题的不同学校、不同难度的用户平均答题量，请你写SQL取出相应数据
用户信息表：user_profile
id	device_id	gender	age	university	gpa	active_days_within_30   question_cnt    answer_cnt
1	2138	    male	21	北京大学	    3.4	    7	                    2	            12
2	3214	    male	NULL复旦大学	    4	    15	                    5	            25
3	6543	    female	20	北京大学	    3.2	    12	                    3	            30
4	2315	    female	23	浙江大学	    3.6	    5	                    1	            2
5	5432	    male	25	山东大学	    3.8	    20	                    15	            70
6	2131	    male	28	山东大学	    3.3	    15	                    7	            13
7	4321	    male	28	复旦大学	    3.6	    9	                    6	            52
第一行表示:id为1的用户的常用信息为使用的设备id为2138，性别为男，年龄21岁，北京大学，gpa为3.4，在过去的30天里面活跃了7天，发帖数量为2，回答数量为12
最后一行表示:id为7的用户的常用信息为使用的设备id为4321，性别为男，年龄28岁，复旦大学，gpa为3.6，在过去的30天里面活跃了9天，发帖数量为6，回答数量为52

题库练习明细表：question_practice_detail
id	device_id   question_id	result
1	2138	    111	        wrong
2   3214	    112	        wrong
3	3214	    113	        wrong
4	6534        111	        right
5	2315	    115	        right
6	2315	    116	        right
7	2315        117	        wrong
8	5432	    117	        wrong
9	5432	    112	        wrong
10	2131	    113	        right
11  5432	    113	        wrong
12	2315	    115	        right
13	2315	    116	        right
14	2315        117	        wrong
15	5432        117	        wrong
16  5432	    112	        wrong
17  2131	    113	        right
18  5432	    113	        wrong
19	2315	    117	        wrong
20  5432	    117	        wrong
21	5432	    112	        wrong
22	2131	    113	        right
23  5432	    113	        wrong

第一行表示:id为1的用户的常用信息为使用的设备id为2138，在question_id为111的题目上，回答错误
......
最后一行表示:id为23的用户的常用信息为使用的设备id为5432，在question_id为113的题目上，回答错误

表：question_detail
id	question_id	difficult_level
1	111	        hard
2	112	        medium
3	113	        easy
4	115	        easy
5	116	        medium
6	117	        easy
第一行表示: 题目id为111的难度为hard
....
第一行表示: 题目id为117的难度为easy

请你写一个SQL查询，计算山东、不同难度的用户平均答题量，根据示例，你的查询应返回以下结果(结果在小数点位数保留4位，4位之后四舍五入)：

university	difficult_level	avg_answer_cnt
山东大学	easy	4.5000
山东大学	medium	3.0000
山东大学有设备id为5432和2131这2个用户，这2个用户总共在question_practice_detail表下有12条答题记录，
且答题题目是112，113，117，且数目分别为3，6，3，从question_detail可以知道题目难度分别为medium,easy,easy，
所以，easy共有9个，故easy的题目平均答题量= 9(easy=9)/2 (device_id=3214 or device_id=5432) =4.5000，medium共有3个，
medium的答题只有device_id=5432的用户，故medium的题目平均答题量= 3(medium=9)/1 ( device_id=5432) =3.0000

示例1
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
`result` varchar(32) NOT NULL
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
INSERT INTO question_practice_detail VALUES(1,2138,111,'wrong');
INSERT INTO question_practice_detail VALUES(2,3214,112,'wrong');
INSERT INTO question_practice_detail VALUES(3,3214,113,'wrong');
INSERT INTO question_practice_detail VALUES(4,6543,111,'right');
INSERT INTO question_practice_detail VALUES(5,2315,115,'right');
INSERT INTO question_practice_detail VALUES(6,2315,116,'right');
INSERT INTO question_practice_detail VALUES(7,2315,117,'wrong');
INSERT INTO question_practice_detail VALUES(8,5432,117,'wrong');
INSERT INTO question_practice_detail VALUES(9,5432,112,'wrong');
INSERT INTO question_practice_detail VALUES(10,2131,113,'right');
INSERT INTO question_practice_detail VALUES(11,5432,113,'wrong');
INSERT INTO question_practice_detail VALUES(12,2315,115,'right');
INSERT INTO question_practice_detail VALUES(13,2315,116,'right');
INSERT INTO question_practice_detail VALUES(14,2315,117,'wrong');
INSERT INTO question_practice_detail VALUES(15,5432,117,'wrong');
INSERT INTO question_practice_detail VALUES(16,5432,112,'wrong');
INSERT INTO question_practice_detail VALUES(17,2131,113,'right');
INSERT INTO question_practice_detail VALUES(18,5432,113,'wrong');
INSERT INTO question_practice_detail VALUES(19,2315,117,'wrong');
INSERT INTO question_practice_detail VALUES(20,5432,117,'wrong');
INSERT INTO question_practice_detail VALUES(21,5432,112,'wrong');
INSERT INTO question_practice_detail VALUES(22,2131,113,'right');
INSERT INTO question_practice_detail VALUES(23,5432,113,'wrong');
INSERT INTO question_detail VALUES(1,111,'hard');
INSERT INTO question_detail VALUES(2,112,'medium');
INSERT INTO question_detail VALUES(3,113,'easy');
INSERT INTO question_detail VALUES(4,115,'easy');
INSERT INTO question_detail VALUES(5,116,'medium');
INSERT INTO question_detail VALUES(6,117,'easy');

输出：
山东大学|easy|4.5000
山东大学|medium|3.0000
*/
select
    u.university,
    qd.difficult_level,
    count(qpd.question_id) / count(distinct(qpd.device_id)) as avg_answer_cnt
from question_practice_detail qpd
left join user_profile u on qpd.device_id=u.device_id
left join question_detail qd on qpd.question_id=qd.question_id
where u.university='山东大学'
group by qd.difficult_level