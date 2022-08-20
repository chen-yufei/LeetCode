/*
现有一张试卷作答记录表exam_record，其中包含多年来的用户作答试卷记录，结构如下表：
作答记录表exam_record：
start_time是试卷开始时间
submit_time 是交卷，即结束时间
Filed	    Type	    Null	Key	    Extra	        Default	    Comment
id	        int(11)	    NO	    PRI	    auto_increment	(NULL)	    自增ID
uid	        int(11)     NO                              (NULL)      用户ID
exam_id	    int(11)     NO                              (NULL)      试卷ID
start_time	datetime	NO                              (NULL)      开始时间
submit_time	datetime    YES                             (NULL)      提交时间
score	    tinyint(4)  YES                             (NULL)      得分

请删除exam_record表中作答时间小于5分钟整且分数不及格（及格线为60分）的记录；
后台会执行您的SQL，然后通过 SELECT * FROM exam_record; 语句来筛选出剩下的数据，与正确数据进行对比。

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
(1002, 9001, '2021-05-02 10:01:01', '2021-05-02 10:05:58', 60),
(1002, 9002, '2021-06-02 19:01:01', '2021-06-02 19:05:01', 54),
(1003, 9001, '2021-09-05 19:01:01', '2021-09-05 19:40:01', 49),
(1003, 9001, '2021-09-05 19:01:01', '2021-09-05 19:15:01', 70),
(1003, 9001, '2021-09-06 19:01:01', '2021-09-06 19:05:01', 80),
(1003, 9002, '2021-09-09 07:01:02', null, null);

输出：
1|1001|9001|2020-01-01 22:11:12|2020-01-01 23:16:12|50
3|1002|9001|2021-05-02 10:01:01|2021-05-02 10:05:58|60
5|1003|9001|2021-09-05 19:01:01|2021-09-05 19:40:01|49
6|1003|9001|2021-09-05 19:01:01|2021-09-05 19:15:01|70
7|1003|9001|2021-09-06 19:01:01|2021-09-06 19:05:01|80
8|1003|9002|2021-09-09 07:01:02|None|None
*/
delete from exam_record
where timestampdiff(MINUTE,start_time,submit_time) < 5 and score < 60
