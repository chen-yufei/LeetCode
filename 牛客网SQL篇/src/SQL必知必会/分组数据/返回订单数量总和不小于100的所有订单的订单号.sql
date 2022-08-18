/*
OrderItems代表订单商品表，包括：订单号order_num和订单数量quantity。
order_num	quantity
a1	        105
a2          1100
a2          200
a4          1121
a5          10
a2          19
a7	        5
【问题】请编写 SQL 语句，返回订单数量总和不小于100的所有订单号，最后结果按照订单号升序排序。
【示例结果】返回order_num订单号。
order_num
a1
a2
a4
【示例解析】
订单号a1、a2、a4的quantity总和都大于等于100，按顺序为a1、a2、a4。
示例1
输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
	quantity INT(255) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES ('a1',105),('a2',200),('a4',1121),('a5',10),('a7',5);

输出：
a1
a2
a4
*/
select
    order_num
from OrderItems
group by order_num
having sum(quantity) > 100
order by order_num asc