/*
现有一张试卷作答记录表exam_record，其中包含多年来的用户作答试卷记录，结构如下表：
作答记录表exam_record：
submit_time为 完成时间
Filed	    Type	    Null	Key	    Extra	        Default	    Comment
id	        int(11)	    NO	    PRI	    auto_increment	(NULL)	    自增ID
uid	        int(11)     NO                              (NULL)      用户ID
exam_id	    int(11)     NO                              (NULL)      试卷ID
start_time	datetime	NO                              (NULL)      开始时间
submit_time	datetime    YES                             (NULL)      提交时间
score	    tinyint(4)  YES                             (NULL)      得分

请把exam_record表中2021年9月1日之前开始作答的未完成记录全部改为被动完成，即：将完成时间改为'2099-01-01 00:00:00'，分数改为0。

drop table if EXISTS exam_record;
CREATE TABLE IF NOT EXISTS exam_record (
id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
uid int NOT NULL COMMENT '用户ID',
exam_id int NOT NULL COMMENT '试卷ID',
start_time datetime NOT NULL COMMENT '开始时间',
submit_time datetime COMMENT '提交时间',
score tinyint COMMENT '得分'
)CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO exam_record(uid,exam_id,start_time,submit_time,score) VALUES
(1001, 9001, '2020-01-02 09:01:01', '2020-01-02 09:21:01', 80),
(1001, 9002, '2021-09-01 09:01:01', '2021-09-01 09:21:01', 90),
(1002, 9001, '2021-08-02 19:01:01', null, null),
(1002, 9002, '2021-09-05 19:01:01', '2021-09-05 19:40:01', 89),
(1003, 9001, '2021-09-02 12:01:01', null, null),
(1003, 9002, '2021-09-01 12:01:01', null, null);

输出：
1001|9001|2020-01-02 09:01:01|2020-01-02 09:21:01|80
1001|9002|2021-09-01 09:01:01|2021-09-01 09:21:01|90
1002|9001|2021-08-02 19:01:01|2099-01-01 00:00:00|0
1002|9002|2021-09-05 19:01:01|2021-09-05 19:40:01|89
1003|9001|2021-09-02 12:01:01|None|None
1003|9002|2021-09-01 12:01:01|None|None
*/
UPDATE exam_record
SET submit_time='2099-01-01 00:00:00', score=0
WHERE start_time < '2021-09-01 00:00:00' AND score IS NULL