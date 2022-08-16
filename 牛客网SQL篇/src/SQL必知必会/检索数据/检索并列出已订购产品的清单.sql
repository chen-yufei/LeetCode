/*
表OrderItems含有非空的列prod_id代表商品id，包含了所有已订购的商品（有些已被订购多次）。
prod_id
a1
a2
a3
a4
a5
a6
a7
【问题】编写SQL 语句，检索并列出所有已订购商品（prod_id）的去重后的清单。

输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	prod_id VARCHAR(255) NOT NULL COMMENT '商品id'
);
INSERT `OrderItems` VALUES ('a1'),('a2'),('a3'),('a4'),('a5'),('a6'),('a6')

输出：
a1
a2
a3
a4
a5
a6
*/
select
    distinct(prod_id)
from OrderItems