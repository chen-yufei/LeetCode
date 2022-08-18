/*
 Products 表中检索所有的产品名称：prod_name、产品id：prod_id
prod_id	prod_name
a0001	egg
a0002   sockets
a0013   coffee
a0003   cola
OrderItems代表订单商品表，订单产品：prod_id、售出数量：quantity
prod_id	quantity
a0001	105
a0002   1100
a0002	200
a0013   1121
a0003   10
a0003   19
a0003   5
【问题】
编写 SQL 语句，从 Products 表中检索所有的产品名称（prod_name），以及名为 quant_sold 的计算列，
其中包含所售产品的总数（在 OrderItems 表上使用子查询和 SUM(quantity)检索）。

【示例结果】返回产品名称prod_name和产品售出数量总和
prod_name	quant_sold
egg	        105
sockets	    1300
coffee      1121
cola	    34
【示例解析】prod_name是cola的prod_id为a0003，quantity总量为34，返回结果无需排序。
示例1
输入：
DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
`prod_id` VARCHAR(255) NOT NULL COMMENT '产品 ID',
`prod_name` VARCHAR(255) NOT NULL COMMENT '产品名称'
);
INSERT INTO `Products` VALUES ('a0001','egg'),
('a0002','sockets'),
('a0013','coffee'),
('a0003','cola');

DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	prod_id VARCHAR(255) NOT NULL COMMENT '产品id',
	quantity INT(16) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES ('a0001',105),('a0002',1100),('a0002',200),('a0013',1121),('a0003',10),('a0003',19),('a0003',5);

输出：
egg|105.000
sockets|1300.000
coffee|1121.000
cola|34.000
*/
select
    prod_name,
    (select sum(quantity)
     from OrderItems o
     where o.prod_id=p.prod_id) as quant_sold
from Products p