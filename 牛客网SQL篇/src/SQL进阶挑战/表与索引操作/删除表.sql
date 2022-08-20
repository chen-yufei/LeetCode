/*
现有一张试卷作答记录表exam_record，其中包含多年来的用户作答试卷记录。
一般每年都会为exam_record表建立一张备份表exam_record_{YEAR}，{YEAR}为对应年份。
现在随着数据越来越多，存储告急，请你把很久前的（2011到2014年）备份表都删掉（如果存在的话）。


备注:后台会通过SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_NAME LIKE \'exam\_record\_201_\'
 来对比输出结果。

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
CREATE TABLE IF NOT EXISTS exam_record_2010 (LIKE exam_record);
CREATE TABLE IF NOT EXISTS exam_record_2012 (LIKE exam_record);
CREATE TABLE IF NOT EXISTS exam_record_2013 (LIKE exam_record);
CREATE TABLE IF NOT EXISTS exam_record_2014 (LIKE exam_record);
CREATE TABLE IF NOT EXISTS exam_record_2015 (LIKE exam_record);

输出：
exam_record_2010
exam_record_2015
*/
DROP TABLE IF EXISTS exam_record_2011, exam_record_2012, exam_record_2013, exam_record_2014;