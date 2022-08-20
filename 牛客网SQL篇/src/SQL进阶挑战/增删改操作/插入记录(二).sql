/*
现有一张试卷作答记录表exam_record，结构如下表，其中包含多年来的用户作答试卷记录，
由于数据越来越多，维护难度越来越大，需要对数据表内容做精简，历史数据做备份。
表exam_record：
Filed	    Type	    Null	Key	    Extra	        Default	    Comment
id	        int(11)	    NO	    PRI	    auto_increment	(NULL)	    自增ID
uid	        int(11)     NO                              (NULL)      用户ID
exam_id	    int(11)     NO                              (NULL)      试卷ID
start_time	datetime	NO                              (NULL)      开始时间
submit_time	datetime    YES                             (NULL)      提交时间
score	    tinyint(4)  YES                             (NULL)      得分
我们已经创建了一张新表exam_record_before_2021用来备份2021年之前的试题作答记录，结构和exam_record表一致，请将2021年之前的已完成了的试题作答纪录导入到该表。
后台会通过执行"SELECT * FROM exam_record_before_2021;"语句来对比结果

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
CREATE TABLE IF NOT EXISTS exam_record_before_2021 (
id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
uid int NOT NULL COMMENT '用户ID',
exam_id int NOT NULL COMMENT '试卷ID',
start_time datetime NOT NULL COMMENT '开始时间',
submit_time datetime COMMENT '提交时间',
score tinyint COMMENT '得分'
)CHARACTER SET utf8 COLLATE utf8_general_ci;
TRUNCATE exam_record;
TRUNCATE exam_record_before_2021;
INSERT INTO exam_record(uid,exam_id,start_time,submit_time,score) VALUES
(1001, 9001, '2020-01-01 09:00:01', null, null),
(1001, 9002, '2020-01-02 09:01:01', '2020-01-02 09:21:01', 70),
(1001, 9002, '2020-09-02 09:00:01', null, null),
(1002, 9001, '2021-05-02 10:01:01', '2021-05-02 10:30:01', 81),
(1002, 9002, '2021-09-02 12:01:01', null, null);

输出：
1|1001|9002|2020-01-02 09:01:01|2020-01-02 09:21:01|70
*/
INSERT INTO exam_record_before_2021(uid, exam_id, start_time, submit_time, score)
SELECT uid, exam_id, start_time, submit_time, score
FROM exam_record
WHERE YEAR(submit_time) < '2021'