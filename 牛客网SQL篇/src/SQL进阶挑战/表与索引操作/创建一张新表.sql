/*
现有一张用户信息表，其中包含多年来在平台注册过的用户信息，随着牛客平台的不断壮大，用户量飞速增长，为了高效地为高活跃用户提供服务，现需要将部分用户拆分出一张新表。
原来的用户信息表：
Filed	    Type	    Null	Key	Default Extra	        Comment
id	        int(11)	    NO	    PRI	(NULL)  auto_increment	自增ID
uid	        int(11)     NO      UNI	(NULL)                  用户ID
nick_name	varchar(64)	YES         (NULL)                  昵称
achievement	int(11)	    YES         0                       成就值
level	    int(11)	    YES         (NULL)                  用户等级
job	varchar(32)         YES         (NULL)                  职业方向
register_time datetime	YES         CURRENT_TIMESTAMP       注册时间
作为数据分析师，请创建一张优质用户信息表user_info_vip，表结构和用户信息表一致。
你应该返回的输出如下表格所示，请写出建表语句将表格中所有限制和说明记录到表里。
Filed	    Type	    Null	Key	    Default         Extra	Comment
id	        int(11)	    NO	    PRI     auto_increment	        自增ID
uid	        int(11)     NO      UNI                             用户ID
nick_name	varchar(64)	YES                                     昵称
achievement	int(11)	    YES             0                       成就值
level	    int(11)	    YES                                     用户等级
job	        varchar(32) YES                                     职业方向
register_time datetime	YES             CURRENT_TIMESTAMP       注册时间

备注：
1.后台会通过 SHOW FULL FIELDS FROM user_info_vip 语句，来对比输出结果
2.如果该表已经被其他分析师创建过了，正常返回即可
示例1
输入：
drop table if EXISTS user_info_vip;

输出：
id|int|None|NO|PRI|None|auto_increment|select,insert,update,references|自增ID
uid|int|None|NO|UNI|None||select,insert,update,references|用户ID
nick_name|varchar(64)|utf8_general_ci|YES||None||select,insert,update,references|昵称
achievement|int|None|YES||0||select,insert,update,references|成就值
level|int|None|YES||None||select,insert,update,references|用户等级
job|varchar(32)|utf8_general_ci|YES||None||select,insert,update,references|职业方向
register_time|datetime|None|YES||CURRENT_TIMESTAMP|DEFAULT_GENERATED|select,insert,update,references|注册时间
*/
CREATE TABLE IF NOT EXISTS user_info_vip (
    id int PRIMARY KEY AUTO_INCREMENT COMMENT '自增ID',
    uid int UNIQUE NOT NULL COMMENT '用户ID',
    nick_name varchar(64) COMMENT '昵称',
    achievement int DEFAULT 0 COMMENT '成就值',
    level int COMMENT '用户等级',
    job varchar(32) COMMENT '职业方向',
    register_time datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间'
) CHARACTER SET utf8 COLLATE utf8_general_ci


/*
从另一张表复制表结构创建表： CREATE TABLE tb_name LIKE tb_name_old

从另一张表的查询结果创建表： CREATE TABLE tb_name AS SELECT * FROM tb_name_old WHERE options
*/