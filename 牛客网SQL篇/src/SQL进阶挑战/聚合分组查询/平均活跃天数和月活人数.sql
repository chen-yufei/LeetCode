/*
用户在牛客试卷作答区作答记录存储在表exam_record中，内容如下：
exam_record表（uid用户ID, exam_id试卷ID, start_time开始作答时间, submit_time交卷时间, score得分）
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
12	1006    9002    2021-09-02 12:11:01 2021-09-02 12:31:01 89
13	1007	9002	2020-09-02 12:11:01	2020-09-02 12:31:01 89
请计算2021年每个月里试卷作答区用户平均月活跃天数avg_active_days和月度活跃人数mau，上面数据的示例输出如下：
month	avg_active_days	mau
202107	1.50	        2
202109	1.25	        4
解释：2021年7月有2人活跃，共活跃了3天（1001活跃1天，1002活跃2天），平均活跃天数1.5；2021年9月有4人活跃，共活跃了5天，平均活跃天数1.25，结果保留2位小数。
注：此处活跃指有交卷行为。
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
(1006, 9002, '2021-09-02 12:11:01', '2021-09-02 12:31:01', 89),
(1007, 9002, '2020-09-02 12:11:01', '2020-09-02 12:31:01', 89);

输出：
202107|1.50|2
202109|1.25|4
*/
select
    date_format(submit_time,'%Y%m') as month,
    round((count(distinct uid,date_format(submit_time,'%y%m%d'))) / count(distinct uid),2) as avg_active_days,
    count(distinct uid) as mau
from exam_record
where submit_time is not null
and year(submit_time)=2021
group by date_format(submit_time,'%Y%m')