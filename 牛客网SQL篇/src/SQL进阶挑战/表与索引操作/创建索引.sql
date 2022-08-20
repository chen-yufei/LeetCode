/*
现有一张试卷信息表examination_info，其中包含各种类型试卷的信息。为了对表更方便快捷地查询，
需要在examination_info表创建以下索引，规则如下：
在duration列创建普通索引idx_duration、在exam_id列创建唯一性索引uniq_idx_exam_id、在tag列创建全文索引full_idx_tag。

根据题意，将返回如下结果：
examination_info    0	PRIMARY             1	  id	    A	0           BTREE
examination_info    0	uniq_idx_exam_id    1	exam_id     A	0   YES	    BTREE
examination_info    1	idx_duration        1	duration    A	0           BTREE
examination_info    1	full_idx_tag        1	tag             0   YES     FULLTEXT

备注：后台会通过 SHOW INDEX FROM examination_info 语句来对比输出结果

输入：
drop table if exists examination_info;
CREATE TABLE IF NOT EXISTS examination_info (
id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
exam_id int UNIQUE NOT NULL COMMENT '试卷ID',
tag varchar(32) COMMENT '类别标签',
difficulty varchar(8) COMMENT '难度',
duration int NOT NULL COMMENT '时长',
release_time datetime COMMENT '发布时间'
)CHARACTER SET utf8 COLLATE utf8_bin;

输出：
examination_info|0|PRIMARY|1|id|A|0|None|None||BTREE|||YES|None
examination_info|0|exam_id|1|exam_id|A|0|None|None||BTREE|||YES|None
examination_info|0|uniq_idx_exam_id|1|exam_id|A|0|None|None||BTREE|||YES|None
examination_info|1|idx_duration|1|duration|A|0|None|None||BTREE|||YES|None
examination_info|1|full_idx_tag|1|tag|None|0|None|None|YES|FULLTEXT|||YES|None
*/
CREATE INDEX idx_duration ON examination_info(duration);
CREATE UNIQUE INDEX uniq_idx_exam_id ON examination_info(exam_id);
CREATE FULLTEXT INDEX full_idx_tag ON examination_info(tag);

/*
alter方式创建索引：ALTER TABLE tb_name ADD [UNIQUE | FULLTEXT] [INDEX] index_content(content)

drop方式删除索引：DROP INDEX <索引名> ON <表名>

alter方式删除索引：ALTER TABLE <表名> DROP INDEX <索引名>
*/