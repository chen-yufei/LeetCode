/*
有Products 表
prod_id	prod_name   prod_price
a0011	egg	        3
a0019	sockets	    4
b0019   coffee	    15
【问题】编写 SQL 语句，返回 Products 表中所有价格在 3 美元到 6 美元之间的产品的名称（prod_name）和价格（prod_price），然后按价格对结果进行排序
【示例结果】返回商品名称prod_name和商品价格prod_price
prod_name   prod_price
egg	        3
sockets	    4

注：不需要考虑商品价格相同的情况

输入：
DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
`prod_id` VARCHAR(255) NOT NULL COMMENT '产品 ID',
`prod_name` VARCHAR(255) NOT NULL COMMENT '产品名称',
`prod_price` DOUBLE NOT NULL COMMENT '产品价格'
);
INSERT INTO `Products` VALUES ('a0011','egg',3),
('a0019','sockets',4),
('b0019','coffee',15);

输出：
egg|3.000
sockets|4.000
*/
select
    prod_name,
    prod_price
from Products
where prod_price between 3 and 6