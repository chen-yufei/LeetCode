/*
现有一张题目练习记录表practice_record，示例内容如下：
id	uid	    question_id	submit_time	        score
1	1001	8001	    2021-08-02 11:41:01 60
2	1002	8001	    2021-09-02 19:30:01 50
3	1002    8001        2021-09-02 19:20:01 70
4   1002    8002        2021-09-02 19:38:01 70
5   1003    8002        2021-08-01 19:38:01 80

请从中统计出2021年每个月里用户的月总刷题数month_q_cnt 和日均刷题数avg_day_q_cnt（按月份升序排序）以及该年的总体情况，示例数据输出如下：
submit_month	month_q_cnt	avg_day_q_cnt
202108	        2	        0.065
202109	        3	        0.100
2021汇总	    5	        0.161
解释：2021年8月共有2次刷题记录，日均刷题数为2/31=0.065（保留3位小数）；2021年9月共有3次刷题记录，
日均刷题数为3/30=0.100；2021年共有5次刷题记录（年度汇总平均无实际意义，这里我们按照31天来算5/31=0.161）
牛客已经采用最新的Mysql版本，如果您运行结果出现错误：ONLY_FULL_GROUP_BY，
意思是：对于GROUP BY聚合操作，如果在SELECT中的列，没有在GROUP BY中出现，那么这个SQL是不合法的，
因为列不在GROUP BY从句中，也就是说查出来的列必须在group by后面出现否则就会报错，或者这个字段出现在聚合函数里面。

示例1
输入：
drop table if exists practice_record;
CREATE TABLE  practice_record (
    id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    uid int NOT NULL COMMENT '用户ID',
    question_id int NOT NULL COMMENT '题目ID',
    submit_time datetime COMMENT '提交时间',
    score tinyint COMMENT '得分'
)CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO practice_record(uid,question_id,submit_time,score) VALUES
(1001, 8001, '2021-08-02 11:41:01', 60),
(1002, 8001, '2021-09-02 19:30:01', 50),
(1002, 8001, '2021-09-02 19:20:01', 70),
(1002, 8002, '2021-09-02 19:38:01', 70),
(1003, 8002, '2021-08-01 19:38:01', 80);

输出：
202108|2|0.065
202109|3|0.100
2021汇总|5|0.161
*/
select ifnull(y_m, '2021汇总') as submit_month,
    count(1) as month_q_cnt,
    round(count(1) / max(days_of_month), 3) as avg_day_q_cnt
from (
    select question_id,
        DAYOFMONTH(LAST_DAY(submit_time)) as days_of_month,
        DATE_FORMAT(submit_time, "%Y%m") as y_m
    from practice_record
    where year(submit_time)='2021'
) as t_month_stat
group by y_m
with rollup