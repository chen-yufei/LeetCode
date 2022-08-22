/*
现有试卷作答记录表exam_record（uid用户ID, exam_id试卷ID, start_time开始作答时间, submit_time交卷时间, score得分），示例数据如下：
id	uid	    exam_id	start_time	        submit_time	        score
1	1001	9001    2021-07-02 09:01:01 2021-07-02 09:21:01 80
2	1002    9001    2021-09-05 19:01:01 2021-09-05 19:40:01 81
3	1002    9002    2021-09-02 12:01:01 (NULL)	            (NULL)
4	1002    9003    2021-09-01 12:01:01 (NULL)              (NULL)
5	1002    9001    2021-07-02 19:01:01 2021-07-02 19:30:01 82
6	1002    9002    2021-07-05 18:01:01 2021-07-05 18:59:02 90
7	1003    9002    2021-07-06 12:01:01 (NULL)              (NULL)
8	1003    9003    2021-09-07 10:01:01 2021-09-07 10:31:01 86
9	1004    9003    2021-09-06 12:01:01 (NULL)              (NULL)
10	1002    9003    2021-09-01 12:01:01 2021-09-01 12:31:01 81
11	1005    9001    2021-09-01 12:01:01 2021-09-01 12:31:01 88
12	1005    9002    2021-09-01 12:01:01 2021-09-01 12:31:01 88
13	1006    9002    2021-09-02 12:11:01 2021-09-02 12:31:01 89

还有一张试卷信息表examination_info（exam_id试卷ID, tag试卷类别, difficulty试卷难度,
duration考试时长, release_time发布时间），示例数据如下：
id	exam_id	tag	difficulty	duration    release_time
1	9001	SQL	hard	    60	        2020-01-01 10:00:00
2	9002	SQL	easy        60          2020-02-01 10:00:00
3	9003    算法 medium      80           2020-08-02 10:00:00

请统计2021年每个未完成试卷作答数大于1的有效用户的数据（有效用户指完成试卷作答数至少为1且未完成数小于5），
输出用户ID、未完成试卷作答数、完成试卷作答数、作答过的试卷tag集合，按未完成试卷数量由多到少排序。示例数据的输出结果如下：
uid	incomplete_cnt	complete_cnt    detail
1002	2	            4	        2021-09-01:算法;2021-07-02:SQL;2021-09-02:SQL;2021-09-05:SQL;2021-07-05:SQL
解释：2021年的作答记录中，除了1004，其他用户均满足有效用户定义，但只有1002未完成试卷数大于1，
因此只输出1002，detail中是1002作答过的试卷{日期:tag}集合，日期和tag间用:连接，多元素间用;连接。
示例1
输入：
drop table if exists examination_info;
CREATE TABLE examination_info (
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
(1001, 9001, '2021-07-02 09:01:01', '2021-07-02 09:21:01', 80),
(1002, 9001, '2021-09-05 19:01:01', '2021-09-05 19:40:01', 81),
(1002, 9002, '2021-09-02 12:01:01', null, null),
(1002, 9003, '2021-09-01 12:01:01', null, null),
(1002, 9001, '2021-07-02 19:01:01', '2021-07-02 19:30:01', 82),
(1002, 9002, '2021-07-05 18:01:01', '2021-07-05 18:59:02', 90),
(1003, 9002, '2021-07-06 12:01:01', null, null),
(1003, 9003, '2021-09-07 10:01:01', '2021-09-07 10:31:01', 86),
(1004, 9003, '2021-09-06 12:01:01', null, null),
(1002, 9003, '2021-09-01 12:01:01', '2021-09-01 12:31:01', 81),
(1005, 9001, '2021-09-01 12:01:01', '2021-09-01 12:31:01', 88),
(1005, 9002, '2021-09-01 12:01:01', '2021-09-01 12:31:01', 88),
(1006, 9002, '2021-09-02 12:11:01', '2021-09-02 12:31:01', 89);

输出：
1002|2|4|2021-07-02:SQL;2021-07-05:SQL;2021-09-01:算法;2021-09-02:SQL;2021-09-05:SQL
*/
select
    uid,
    sum(if(submit_time is null, 1, 0)) as incomplete_cnt,
    sum(if(submit_time is null, 0, 1)) as complete_cnt,
    group_concat(distinct CONCAT(DATE_FORMAT(start_time, '%Y-%m-%d'),':',tag) separator ';') as detail
from exam_record er
join examination_info ei on er.exam_id = ei.exam_id
where YEAR(start_time) = 2021
group by uid
having incomplete_cnt>1
and incomplete_cnt<5
and complete_cnt >= 1
order by incomplete_cnt desc