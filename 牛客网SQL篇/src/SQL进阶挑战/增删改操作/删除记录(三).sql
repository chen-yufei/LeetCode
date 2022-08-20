/*
现有一张试卷作答记录表exam_record，其中包含多年来的用户作答试卷记录，结构如下表：
Filed	    Type	    Null	Key	    Extra	        Default	    Comment
id	        int(11)	    NO	    PRI	    auto_increment	(NULL)	    自增ID
uid	        int(11)     NO                              (NULL)      用户ID
exam_id	    int(11)     NO                              (NULL)      试卷ID
start_time	datetime	NO                              (NULL)      开始时间
submit_time	datetime    YES                             (NULL)      提交时间
score	    tinyint(4)  YES                             (NULL)      得分

请删除exam_record表中所有记录，并重置自增主键。
后台会通过SELECT table_rows, auto_increment FROM information_schema.tables WHERE table_name='exam_record'
语句来对比输出结果

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
(1001, 9002, '2020-01-02 09:01:01', '2020-01-02 09:06:00', 58);

输出：
0|None
*/
truncate table exam_record