/*
OrderItems表含有：订单号order_num，quantity产品数量
order_num	quantity
a1	        105
a2	        1100
a2	        200
a4	        1121
a5	        10
a2	        19
a7	        5
【问题】从 OrderItems 表中检索出所有不同且不重复的订单号（order_num），其中每个订单都要包含 100 个或更多的产品。
【示例结果】返回订单号列order_num
order_num
a1
a2
a4

输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
	quantity VARCHAR(255) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES ('a1','105'),('a2','1100'),('a2','200'),('a4','1121'),('a5','10'),('a2','19'),('a7','5')

输出：
a1
a2
a4
*/
select
    distinct(order_num)
from OrderItems
where quantity >= 100