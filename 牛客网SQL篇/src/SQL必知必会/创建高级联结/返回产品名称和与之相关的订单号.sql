/*
Products表为产品信息表含有字段prod_id产品id、prod_name产品名称
prod_id	prod_name
a0001	egg
a0002	sockets
a0013   coffee
a0003	cola
a0023	soda
OrderItems表为订单信息表含有字段order_num订单号和产品id prod_id
prod_id	order_num
a0001	a105
a0002	a1100
a0002   a200
a0013   a1121
a0003	a10
a0003	a19
a0003   a5
【问题】
使用 OUTER JOIN 联结 Products 表和 OrderItems 表，返回产品名称（prod_name）和与之相关的
订单号（order_num）的列表，并按照产品名称升序排序。
【示例结果】
返回产品名称prod_name和订单号order_num
prod_name	order_num
coffee	    a1121
cola	    a5
cola        a19
cola        a10
egg	        a105
sockets	    a200
sockets     a1100
soda	    NULL
【示例解析】
返回产品和对应实际支付订单的订单号，但是无实际订单的产品soda也返回，最后根据产品名称升序排序。

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
('a0003','cola'),
('a0023','soda');

DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	prod_id VARCHAR(255) NOT NULL COMMENT '产品id',
	order_num VARCHAR(255) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES ('a0001','a105'),('a0002','a1100'),('a0002','a200'),('a0013','a1121'),('a0003','a10'),('a0003','a19'),('a0003','a5');

输出：
coffee|a1121
cola|a5
cola|a19
cola|a10
egg|a105
sockets|a200
sockets|a1100
soda|None
*/
select
    p.prod_name,
    oi.order_num
from Products p
left join OrderItems oi on oi.prod_id=p.prod_id
order by p.prod_name