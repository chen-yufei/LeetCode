/*
我们需要一个顾客 ID 列表，其中包含他们已订购的总金额。
OrderItems表代表订单信息，OrderItems表有订单号：order_num和商品售出价格：item_price、商品数量：quantity。
order_num	item_price	quantity
a0001	    10	        105
a0002       1	        1100
a0002       1	        200
a0013       2	        1121
a0003       5	        10
a0003       1   	    19
a0003       7	        5
Orders表订单号：order_num、顾客id：cust_id
order_num	cust_id
a0001	    cust10
a0002       cust1
a0003       cust1
a0013       cust2
【问题】
编写 SQL语句，返回顾客 ID（Orders 表中的 cust_id），并使用子查询返回total_ordered 以便返回每个顾客的订单总数，将结果按金额从大到小排序。
提示：你之前已经使用 SUM()计算订单总数。

【示例结果】返回顾客id cust_id和total_order下单总额
cust_id	total_ordered
cust2	2242
cust1	1300
cust10	1050
cust2	104
【示例解析】cust2在Orders里面的订单a0013，a0013的售出价格是2售出数量是1121，总额是2242，最后返回cust2的支付总额是2242。

输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
	item_price INT(16) NOT NULL COMMENT '售出价格',
	quantity INT(16) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES ('a0001',10,105),('a0002',1,1100),('a0002',1,200),('a0013',2,1121),('a0003',5,10),('a0003',1,19),('a0003',7,5);

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders`(
  order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
  cust_id VARCHAR(255) NOT NULL COMMENT '顾客id'
);
INSERT `Orders` VALUES ('a0001','cust10'),('a0003','cust1'),('a0013','cust2');

输出：
cust2|2242.000
cust10|1050.000
cust1|104.000
*/
select
    cust_id,
    (select
    sum(item_price*quantity)
    from OrderItems oi
    where oi.order_num=o.order_num) as total_ordered
from Orders o
order by total_ordered desc