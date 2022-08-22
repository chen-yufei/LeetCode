/*
牛客的运营同学想要查看大家在SQL类别中高难度试卷的得分情况。
请你帮她从exam_record数据表中计算所有用户完成SQL类别高难度试卷得分的截断平均值（去掉一个最大值和一个最小值后的平均值）。
示例数据：examination_info（exam_id试卷ID, tag试卷类别, difficulty试卷难度, duration考试时长, release_time发布时间）
id	exam_id	tag	    difficulty	duration	release_time
1	9001	SQL	    hard	    60	        2020-01-01 10:00:00
2	9002	算法  medium	    80	        2020-08-02 10:00:00
示例数据：
exam_record（uid用户ID, exam_id试卷ID, start_time开始作答时间, submit_time交卷时间, score得分）
id	uid	    exam_id	start_time	            submit_time             score
1	1001	9001	2020-01-02 09:01:01	    2020-01-02 09:21:01     80
2	1001    9001    2021-05-02 10:01:01	    2021-05-02 10:30:01     81
3	1001	9001    2021-06-02 19:01:01     2021-06-02 19:31:01     84
4	1001	9002    2021-09-05 19:01:01     2021-09-05 19:40:01	    89
5	1001    9001	2021-09-02 12:01:01     (NULL)                  (NULL)
6	1001    9002    2021-09-01 12:01:01     (NULL)                  (NULL)
7	1002	9002    2021-02-02 19:01:01     2021-02-02 19:30:01     87
8	1002	9001    2021-05-05 18:01:01     2021-05-05 18:59:02	    90
9   1003	9001    2021-09-07 12:01:01     2021-09-07 10:31:01     50
10	1004	9001    2021-09-06 10:01:01     (NULL)                  (NULL)
根据输入你的查询结果如下：
tag	difficulty	clip_avg_score
SQL	hard	81.7
从examination_info表可知，试卷9001为高难度SQL试卷，该试卷被作答的得分有[80,81,84,90,50]，
去除最高分和最低分后为[80,81,84]，平均分为81.6666667，保留一位小数后为81.7
输入描述：
输入数据中至少有3个有效分数
示例1
输入：
drop table if exists examination_info;
CREATE TABLE  examination_info (
    id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    exam_id int UNIQUE NOT NULL COMMENT '试卷ID',
    tag varchar(32) COMMENT '类别标签',
    difficulty varchar(8) COMMENT '难度',
    duration int NOT NULL COMMENT '时长',
    release_time datetime COMMENT '发布时间'
)CHARACTER SET utf8 COLLATE utf8_general_ci;

drop table if exists exam_record;
CREATE TABLE exam_record (
    id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    uid int NOT NULL COMMENT '用户ID',
    exam_id int NOT NULL COMMENT '试卷ID',
    start_time datetime NOT NULL COMMENT '开始时间',
    submit_time datetime COMMENT '提交时间',
    score tinyint COMMENT '得分'
)CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO examination_info(exam_id,tag,difficulty,duration,release_time) VALUES
  (9001, 'SQL', 'hard', 60, '2020-01-01 10:00:00'),
  (9002, '算法', 'medium', 80, '2020-08-02 10:00:00');

INSERT INTO exam_record(uid,exam_id,start_time,submit_time,score) VALUES
(1001, 9001, '2020-01-02 09:01:01', '2020-01-02 09:21:01', 80),
(1001, 9001, '2021-05-02 10:01:01', '2021-05-02 10:30:01', 81),
(1001, 9001, '2021-06-02 19:01:01', '2021-06-02 19:31:01', 84),
(1001, 9002, '2021-09-05 19:01:01', '2021-09-05 19:40:01', 89),
(1001, 9001, '2021-09-02 12:01:01', null, null),
(1001, 9002, '2021-09-01 12:01:01', null, null),
(1002, 9002, '2021-02-02 19:01:01', '2021-02-02 19:30:01', 87),
(1002, 9001, '2021-05-05 18:01:01', '2021-05-05 18:59:02', 90),
(1003, 9001, '2021-02-06 12:01:01', null, null),
(1003, 9001, '2021-09-07 10:01:01', '2021-09-07 10:31:01', 50);

输出：
SQL|hard|81.7
*/
select
    tag,
    difficulty,
    round(avg(score),1) as 'clip_avg_score'
from(
    select
        tag,
        difficulty,
        score,
        rank() over (order by score) as 'asc',
        rank() over (order by score desc) as 'desc'
    from
        exam_record
        inner join examination_info USING(exam_id)
    where
        tag = 'SQL'
        and difficulty = 'hard'
        and score is not null) temp
where temp.asc != 1 and temp.desc != 1
GROUP BY tag,difficulty