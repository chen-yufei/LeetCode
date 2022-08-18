/*
OrderItems表代表订单信息，包括字段：订单号order_num和item_price商品售出价格、quantity商品数量。
order_num	item_price	quantity
a1	        10	        105
a2          1	        1100
a2          1	        200
a4          2	        1121
a5          5	        10
a2          1	        19
a7	        7	        5
【问题】编写 SQL 语句，根据订单号聚合，返回订单总价不小于1000 的所有订单号，最后的结果按订单号进行升序排序。
提示：总价 = item_price 乘以 quantity
【示例结果】
order_num	total_price
a1	        1050
a2          1319
a4          2242
示例1
输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
	item_price INT(16) NOT NULL COMMENT '售出价格',
	quantity INT(16) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES ('a1',10,105),('a2',1,1100),('a2',1,200),('a4',2,1121),('a5',5,10),('a2',1,19),('a7',7,5);

输出：
a1|1050.000
a2|1319.000
a4|2242.000
*/
select
    order_num,
    sum(item_price*quantity) as total_price
from OrderItems
group by order_num
having total_price >= 1000
order by order_num asc