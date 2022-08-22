/*
请从试卷作答记录表中找到SQL试卷得分不小于该类试卷平均得分的用户最低得分。
示例数据 exam_record表（uid用户ID, exam_id试卷ID, start_time开始作答时间, submit_time交卷时间, score得分）：
id	uid     exam_id	start_time	        submit_time            score
1	1001    9001	2020-01-02 09:01:01	2020-01-02 09:21:01    80
2	1002    9001    2021-09-05 19:01:01	2021-09-05 19:40:01    89
3	1002	9002    2021-09-02 12:01:01 (NULL)                 (NULL)
4	1002	9003    2021-09-01 12:01:01 (NULL)	               (NULL)
5	1002    9001	2021-02-02 19:01:01	2021-02-02 19:30:01    87
6	1002    9002    2021-05-05 18:01:01	2021-05-05 18:59:02    90
7	1003	9002    2021-02-06 12:01:01 (NULL)                 (NULL)
8	1003	9003    2021-09-07 10:01:01 2021-09-07 10:31:01	    86
9   1004	9003    2021-09-06 12:01:01	(NULL)                 (NULL)

examination_info表（exam_id试卷ID, tag试卷类别, difficulty试卷难度, duration考试时长, release_time发布时间）
id	exam_id	tag	difficulty  duration	release_time
1	9001	SQL	hard	    60	        2020-01-01 10:00:00
2   9002    SQL easy	    60	        2020-02-01 10:00:00
3	9003    算法medium	    80	        2020-08-02 10:00:00

示例输出数据：
min_score_over_avg
87
解释：试卷9001和9002为SQL类别，作答这两份试卷的得分有[80,89,87,90]，平均分为86.5，不小于平均分的最小分数为87
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
CREATE TABLE  exam_record (
    id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    uid int NOT NULL COMMENT '用户ID',
    exam_id int NOT NULL COMMENT '试卷ID',
    start_time datetime NOT NULL COMMENT '开始时间',
    submit_time datetime COMMENT '提交时间',
    score tinyint COMMENT '得分'
)CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO examination_info(exam_id,tag,difficulty,duration,release_time) VALUES
  (9001, 'SQL', 'hard', 60, '2020-01-01 10:00:00'),
  (9002, 'SQL', 'easy', 60, '2020-02-01 10:00:00'),
  (9003, '算法', 'medium', 80, '2020-08-02 10:00:00');

INSERT INTO exam_record(uid,exam_id,start_time,submit_time,score) VALUES
(1001, 9001, '2020-01-02 09:01:01', '2020-01-02 09:21:01', 80),
(1002, 9001, '2021-09-05 19:01:01', '2021-09-05 19:40:01', 89),
(1002, 9002, '2021-09-02 12:01:01', null, null),
(1002, 9003, '2021-09-01 12:01:01', null, null),
(1002, 9001, '2021-02-02 19:01:01', '2021-02-02 19:30:01', 87),
(1002, 9002, '2021-05-05 18:01:01', '2021-05-05 18:59:02', 90),
(1003, 9002, '2021-02-06 12:01:01', null, null),
(1003, 9003, '2021-09-07 10:01:01', '2021-09-07 10:31:01', 86),
(1004, 9003, '2021-09-06 12:01:01', null, null);

输出：
87
*/
select min(e_r.score) as min_score_over_avg
from exam_record e_r join examination_info e_i
on e_r.exam_id = e_i.exam_id
where e_i.tag = 'SQL'
and score >= (select avg(e1.score)
             from exam_record e1 join examination_info e2
             on e1.exam_id = e2.exam_id
             where tag = 'SQL')