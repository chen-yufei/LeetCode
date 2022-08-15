/*
题目：现在运营想要将用户划分为25岁以下和25岁及以上两个年龄段，分别查看这两个年龄段用户数量
本题注意：age为null 也记为 25岁以下
示例：user_profile
id	device_id	gender	age	university	gpa	active_days_within_30   question_cnt    answer_cnt
1	2138	    male	21	北京大学	    3.4	    7	                    2	        12
2	3214	    male	    复旦大学	    4	    15	                    5	        25
3	6543	    female	20	北京大学	    3.2	    12	                    3	        30
4	2315	    female	23	浙江大学	    3.6	    5	                    1	        2
5	5432	    male	25	山东大学	    3.8	    20	                    15	        70
6	2131	    male	28	山东大学     3.3	    15	                    7	        13
7	4321	    male	26	复旦大学	    3.6	    9	                    6	        52

根据示例，你的查询应返回以下结果：
age_cut	    number
25岁以下   	4
25岁及以上   3

输入：
drop table if exists `user_profile`;
drop table if  exists `question_practice_detail`;
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
25岁以下|4
25岁及以上|3
*/
select
  case when age < 25 or age is null then '25岁以下'
       when age >= 25 then '25岁及以上'
  end as age_cut,
  count(*) as number
from user_profile
group by age_cut


//case函数详解
/*
CASE函数
是一种多分支的函数，可以根据条件列表的值返回多个可能的结果表达式中的一个。
可用在任何允许使用表达式的地方，但不能单独作为一个语句执行。
分为：
简单CASE函数
搜索CASE函数

简单 CASE函数
CASE 测试表达式
WHEN 简单表达式1 THEN 结果表达式1
WHEN 简单表达式2 THEN 结果表达式2 …
WHEN 简单表达式n THEN 结果表达式n
[ ELSE 结果表达式n+1 ]
END

计算测试表达式，按从上到下的书写顺序将测试表达式的值与每个WHEN子句的简单表达式进行比较。
如果某个简单表达式的值与测试表达式的值相等，则返回第一个与之匹配的WHEN子句所对应的结果表达式的值。
如果所有简单表达式的值与测试表达式的值都不相等，
若指定了ELSE子句,则返回ELSE子句中指定的结果表达式的值；
若没有指定ELSE子句，则返回NULL。

例48. 查询班级表中的学生的班号、班名、系号和班主任号，并对系号作如下处理：
当系号为1时，显示 “计算机系”；
当系号为2时，显示 “软件工程系”；
当系号为3时，显示 “物联网系”。

SELECT 班号 ,班名,
CASE 系号
WHEN 1 THEN '软件工程系'
WHEN 2 THEN '计算机系'
WHEN 3 THEN '物联网系'
END AS 系号,班主任号
FROM 班级表

搜索CASE函数
CASE
WHEN 布尔表达式1 THEN 结果表达式1
WHEN 布尔表达式2 THEN 结果表达式2 …
WHEN 布尔表达式n THEN 结果表达式n
[ ELSE 结果表达式n+1 ]
END
按从上到下的书写顺序计算每个WHEN子句的布尔表达式。
返回第一个取值为TRUE的布尔表达式所对应的结果表达式的值。
如果没有取值为TRUE的布尔表达式，
则当指定了ELSE子句时,返回ELSE子句中指定的结果；
如果没有指定ELSE子句，则返回NULL。

例48用搜索CASE来做：
SELECT 班号 ,班名,
CASE
WHEN 系号=1 THEN '软件工程系'
WHEN 系号=2 THEN '计算机系'
WHEN 系号=3 THEN '物联网系'
END AS 系号,班主任号
FROM 班级表

例49.查询“M01F011”号课程的考试情况，列出学号、课程号和成绩，同时将百分制成绩显示为等级。
SELECT 学号,课程号,
CASE
WHEN 成绩 >= 90 THEN '优'
WHEN 成绩 BETWEEN 80 AND 89 THEN '良'
WHEN 成绩 BETWEEN 70 AND 79 THEN '中'
WHEN 成绩 BETWEEN 60 AND 69 THEN '及格'
WHEN 成绩 <60 THEN '不及格'
END 成绩
FROM 成绩表
WHERE 课程号 = 'M01F011'
CASE函数(续)
例50.统计每个班男生和女生的数量各是多少，统计结果的表头为，班号，男生数量，女生数量。
SELECT 班号,
COUNT(CASE WHEN 性别=‘男’ THEN ‘男’ END) 男生数,
COUNT(CASE WHEN 性别=‘女’ THEN ‘女’ END) 女生数
FROM 学生表 GROUP BY 班号

例51.判断成绩的等级，85-100为“优”，70-84为“良”，60-69为“及格”，60以下为“不及格”，并统计每一等级的人数。
SELECT
CASE
WHEN GRADE BETWEEN 85 AND 100 THEN '优'
WHEN GRADE BETWEEN 70 AND 84 THEN '良'
WHEN GRADE BETWEEN 60 AND 69 THEN '及格'
ELSE '不及格'
END 等级, COUNT(*) 人数
FROM SC
GROUP BY
CASE
WHEN GRADE BETWEEN 85 AND 100 THEN '优'
WHEN GRADE BETWEEN 70 AND 84 THEN '良'
WHEN GRADE BETWEEN 60 AND 69 THEN '及格'
ELSE '不及格'
END
*/