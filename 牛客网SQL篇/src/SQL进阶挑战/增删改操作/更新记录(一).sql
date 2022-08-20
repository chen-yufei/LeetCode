/*
现有一张试卷信息表examination_info，表结构如下图所示：
Filed	        Type	    Null	Key	Extra	        Default	Comment
id	            int(11)	    NO	    PRI	auto_increment	(NULL)	自增ID
exam_id	        int(11)     NO      UNI                 (NULL)  试卷ID
tag	            varchar(32)	YES                         (NULL)  类别标签
difficulty	    varchar(8)	YES                         (NULL)  难度
duration	    int(11)     NO                          (NULL)  时长(分钟数)
release_time    datetime    YES                         (NULL)  发布时间
请把examination_info表中tag为PYTHON的tag字段全部修改为Python。
后台会通过执行'SELECT exam_id,tag,difficulty,duration,release_time FROM examination_info;'语句来对比结果。

输入：
drop table if EXISTS examination_info;
CREATE TABLE IF NOT EXISTS examination_info (
id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
exam_id int UNIQUE NOT NULL COMMENT '试卷ID',
tag varchar(32) COMMENT '类别标签',
difficulty varchar(8) COMMENT '难度',
duration int NOT NULL COMMENT '时长',
release_time datetime COMMENT '发布时间'
)CHARACTER SET utf8 COLLATE utf8_bin;
TRUNCATE examination_info;
INSERT INTO examination_info(exam_id,tag,difficulty,duration,release_time) VALUES
(9001, 'SQL', 'hard', 60, '2020-01-01 10:00:00'),
(9002, 'python', 'easy', 60, '2020-01-01 10:00:00'),
(9003, 'Python', 'medium', 80, '2020-01-01 10:00:00'),
(9004, 'PYTHON', 'hard', 80, '2020-01-01 10:00:00');

输出：
9001|SQL|hard|60|2020-01-01 10:00:00
9002|python|easy|60|2020-01-01 10:00:00
9003|Python|medium|80|2020-01-01 10:00:00
9004|Python|hard|80|2020-01-01 10:00:00
*/
update examination_info
set tag='Python'
where tag='PYTHON'