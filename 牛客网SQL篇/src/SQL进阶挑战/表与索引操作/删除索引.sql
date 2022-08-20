/*
请删除examination_info表上的唯一索引uniq_idx_exam_id和全文索引full_idx_tag。
后台会通过 SHOW INDEX FROM examination_info 来对比输出结果。

输入：
drop table if exists examination_info;
CREATE TABLE IF NOT EXISTS examination_info (
id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
exam_id int COMMENT '试卷ID',
tag varchar(32) COMMENT '类别标签',
difficulty varchar(8) COMMENT '难度',
duration int NOT NULL COMMENT '时长(分钟数)',
release_time datetime COMMENT '发布时间'
)CHARACTER SET utf8 COLLATE utf8_bin;
CREATE INDEX idx_duration ON examination_info(duration);
CREATE UNIQUE INDEX uniq_idx_exam_id ON examination_info(exam_id);
ALTER TABLE examination_info ADD FULLTEXT full_idx_tag(tag);

输出：
examination_info|0|PRIMARY|1|id|A|0|None|None||BTREE|||YES|None
examination_info|1|idx_duration|1|duration|A|0|None|None||BTREE|||YES|None
*/

/*方式一：*/
alter table examination_info drop index uniq_idx_exam_id;
alter table examination_info drop index full_idx_tag;
/*方式二：*/
drop index   uniq_idx_exam_id on examination_info;
drop index  full_idx_tag  on examination_info;
