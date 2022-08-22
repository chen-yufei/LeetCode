/*
有一个试卷作答记录表exam_record，请从中统计出总作答次数total_pv、试卷已完成作答数complete_pv、已完成的试卷数complete_exam_cnt。
示例数据 exam_record表（uid用户ID, exam_id试卷ID, start_time开始作答时间, submit_time交卷时间, score得分）：
id	uid	    exam_id	start_time	        submit_time         score
1	1001	9001	2020-01-02 09:01:01	2020-01-02 09:21:01 80
2	1001    9001    2021-05-02 10:01:01	2021-05-02 10:30:01 81
3	1001	9001    2021-06-02 19:01:01 2021-06-02 19:31:01 84
4	1001	9002    2021-09-05 19:01:01 2021-09-05 19:40:01	89
5	1001    9001	2021-09-02 12:01:01 (NULL)              (NULL)
6	1001    9002    2021-09-01 12:01:01 (NULL)              (NULL)
7	1002	9002    2021-02-02 19:01:01 2021-02-02 19:30:01 87
8	1002	9001    2021-05-05 18:01:01 2021-05-05 18:59:02	90
9   1003	9001    2021-02-06 12:01:01 (NULL)              (NULL)
10	1003	9001    2021-09-07 10:01:01 2021-09-07 10:31:01 88
11	1004    9001    2021-09-06 12:01:01 (NULL)              (NULL)
示例输出：
total_pv	complete_pv	complete_exam_cnt
11	        7	         2
解释：表示截止当前，有11次试卷作答记录，已完成的作答次数为7次（中途退出的为未完成状态，其交卷时间和份数为NULL），
已完成的试卷有9001和9002两份。
示例1
输入：
drop table if exists exam_record;
CREATE TABLE exam_record (
    id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    uid int NOT NULL COMMENT '用户ID',
    exam_id int NOT NULL COMMENT '试卷ID',
    start_time datetime NOT NULL COMMENT '开始时间',
    submit_time datetime COMMENT '提交时间',
    score tinyint COMMENT '得分'
)CHARACTER SET utf8 COLLATE utf8_general_ci;

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
(1003, 9001, '2021-09-07 10:01:01', '2021-09-07 10:31:01', 89),
(1004, 9001, '2021-09-06 12:01:01', null, null);

输出：
11|7|2
*/
SELECT
COUNT(start_time) as total_pv,
COUNT(submit_time) as complete_pv,
count(distinct exam_id and score is not null)
as complete_exam_cnt
from exam_record