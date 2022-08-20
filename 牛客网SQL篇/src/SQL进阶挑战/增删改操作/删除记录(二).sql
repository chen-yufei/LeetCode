/*
现有一张试卷作答记录表exam_record，其中包含多年来的用户作答试卷记录，结构如下表：
作答记录表exam_record：
start_time是试卷开始时间
submit_time 是交卷时间，即结束时间，如果未完成的话，则为空
Filed	    Type	    Null	Key	    Extra	        Default	    Comment
id	        int(11)	    NO	    PRI	    auto_increment	(NULL)	    自增ID
uid	        int(11)     NO                              (NULL)      用户ID
exam_id	    int(11)     NO                              (NULL)      试卷ID
start_time	datetime	NO                              (NULL)      开始时间
submit_time	datetime    YES                             (NULL)      提交时间
score	    tinyint(4)  YES                             (NULL)      得分

请删除exam_record表中未完成作答或作答时间小于5分钟整的记录中，开始作答时间最早的3条记录。
后台会通过 SELECT * FROM exam_record 语句来对比结果。

输入：
drop table if EXISTS exam_record;
CREATE TABLE IF NOT EXISTS exam_record (
id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
uid int NOT NULL COMMENT '用户ID',
exam_id int NOT NULL COMMENT '试卷ID',
start_time datetime NOT NULL COMMENT '开始时间',
submit_time datetime COMMENT '提交时间',
score tinyint COMMENT '得分'
)CHARACTER SET utf8 COLLATE utf8_general_ci;
TRUNCATE exam_record;
INSERT INTO exam_record(uid, exam_id, start_time, submit_time, score) VALUES
(1001, 9001, '2020-01-01 22:11:12', '2020-01-01 23:16:12', 50),
(1001, 9002, '2020-01-02 09:01:01', '2020-01-02 09:06:00', 58),
(1001, 9002, '2020-01-02 09:01:01', '2020-01-02 09:05:01', 58),
(1002, 9001, '2021-05-02 10:01:01', '2021-05-02 10:06:58', 60),
(1002, 9002, '2021-06-02 19:01:01', null, null),
(1003, 9001, '2021-09-05 19:01:01', null, null),
(1003, 9001, '2021-09-05 19:01:01', null, null),
(1003, 9002, '2021-09-09 07:01:02', null, null);

输出：
1|1001|9001|2020-01-01 22:11:12|2020-01-01 23:16:12|50
4|1002|9001|2021-05-02 10:01:01|2021-05-02 10:06:58|60
6|1003|9001|2021-09-05 19:01:01|None|None
7|1003|9001|2021-09-05 19:01:01|None|None
8|1003|9002|2021-09-09 07:01:02|None|None
*/
delete from exam_record
where submit_time is null
or timestampdiff(MINUTE,start_time,submit_time) < 5
order by start_time
limit 3