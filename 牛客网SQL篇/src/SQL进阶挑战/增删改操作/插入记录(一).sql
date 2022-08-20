/*
牛客后台会记录每个用户的试卷作答记录到exam_record表，现在有两个用户的作答记录详情如下：
用户1001在2021年9月1日晚上10点11分12秒开始作答试卷9001，并在50分钟后提交，得了90分；
用户1002在2021年9月4日上午7点1分2秒开始作答试卷9002，并在10分钟后退出了平台。
试卷作答记录表exam_record中，表已建好，其结构如下，请用一条语句将这两条记录插入表中。

Filed	    Type	    Null	Key	    Extra	        Default	    Comment
id	        int(11)	    NO	    PRI	    auto_increment	(NULL)	    自增ID
uid	        int(11)     NO                              (NULL)      用户ID
exam_id	    int(11)     NO                              (NULL)      试卷ID
start_time	datetime	NO                              (NULL)      开始时间
submit_time	datetime    YES                             (NULL)      提交时间
score	    tinyint(4)  YES                             (NULL)      得分
该题最后会通过执行SELECT uid, exam_id, start_time, submit_time, score FROM exam_record;来对比结果

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
复制
输出：
1001|9001|2021-09-01 22:11:12|2021-09-01 23:01:12|90
1002|9002|2021-09-04 07:01:02|None|None
*/
INSERT INTO exam_record VALUES
(NULL, 1001, 9001, '2021-09-01 22:11:12', '2021-09-01 23:01:12', 90),
(NULL, 1002, 9002, '2021-09-04 07:01:02', NULL, NULL)