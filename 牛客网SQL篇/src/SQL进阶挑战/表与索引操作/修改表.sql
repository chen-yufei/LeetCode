/*
现有一张用户信息表user_info，其中包含多年来在平台注册过的用户信息。
用户信息表user_info：
Filed	    Type	    Null	Key	Default Extra	        Comment
id	        int(11)	    NO	    PRI	(NULL)  auto_increment	自增ID
uid	        int(11)     NO      UNI	(NULL)                  用户ID
nick_name	varchar(64)	YES         (NULL)                  昵称
achievement	int(11)	    YES         0                       成就值
level	    int(11)	    YES         (NULL)                  用户等级
job	varchar(32)         YES         (NULL)                  职业方向
register_time datetime	YES         CURRENT_TIMESTAMP       注册时间
请在用户信息表，字段level的后面增加一列最多可保存15个汉字的字段school；并将表中job列名改为profession，
同时varchar字段长度变为10；achievement的默认值设置为0。

Filed	    Type	    Null	Key	    Default         Extra	Comment
id	        int(11)	    NO	    PRI     auto_increment	        自增ID
uid	        int(11)     NO      UNI                             用户ID
nick_name	varchar(64)	YES                                     昵称
achievement	int(11)	    YES             0                       成就值
level	    int(11)	    YES                                     用户等级
school	    varchar(15)
profession	varchar(10) YES                                     职业方向
register_time datetime	YES             CURRENT_TIMESTAMP       注册时间

备注：建表时限制的字符集为utf8，MySQL版本为8.*
后台会通过SHOW FULL FIELDS FROM user_info 来对比输出结果。

输入：
drop table if exists user_info;
CREATE TABLE IF NOT EXISTS user_info (
id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
uid int UNIQUE NOT NULL COMMENT '用户ID',
`nick_name` varchar(64) COMMENT '昵称',
achievement int COMMENT '成就值',
level int COMMENT '用户等级',
job varchar(10) COMMENT '职业方向',
register_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间'
)CHARACTER SET utf8 COLLATE utf8_general_ci;
复制
输出：
id|int|None|NO|PRI|None|auto_increment|select,insert,update,references|自增ID
uid|int|None|NO|UNI|None||select,insert,update,references|用户ID
nick_name|varchar(64)|utf8_general_ci|YES||None||select,insert,update,references|昵称
achievement|int|None|YES||0||select,insert,update,references|
level|int|None|YES||None||select,insert,update,references|用户等级
school|varchar(15)|utf8_general_ci|YES||None||select,insert,update,references|
profession|varchar(10)|utf8_general_ci|YES||None||select,insert,update,references|
register_time|datetime|None|YES||CURRENT_TIMESTAMP|DEFAULT_GENERATED|select,insert,update,references|注册时间
*/
alter table user_info add school varchar(15) after level;
alter table user_info change job profession varchar(10);
alter table user_info modify achievement int(11) default 0;

/*
alter table user_info add school varchar(15) after level;
增加列在某列之后
alter table 增加的表格 add 增加列的名称 数据类型 位置(after level 在level 之后)

alter table user_info change job profession varchar(10);
更换列的名称及数据类型
alter table user_info change 原列名 修改列名 修改数据类型

alter table user_info modify achievement int(11) default 0;
更改数据类型
alter table 表名 modify 修改列名称 数据类型 默认值等
*/