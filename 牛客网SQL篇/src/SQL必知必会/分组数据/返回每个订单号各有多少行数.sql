/*
OrderItems 表包含每个订单的每个产品
order_num
a002
a002
a002
a004
a007
【问题】编写 SQL 语句，返回每个订单号（order_num）各有多少行数（order_lines），并按 order_lines对结果进行升序排序。
【示例结果】返回订单号order_num和对应订单号的行数order_lines
order_num	order_lines
a004	    1
a007        1
a002        3
【示例解析】
订单号a002有3行订单记录也是最多的订单号故排在最后一位返回，相同订单行数的订单无需过多处理。
示例1
输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	order_num VARCHAR(255) NOT NULL COMMENT '商品订单号'
);
INSERT `OrderItems` VALUES ('a002'),('a002'),('a002'),('a004'),('a007');

输出：
a004|1
a007|1
a002|3
*/
select
    order_num,
    count(*) as order_lines
from OrderItems
group by order_num
order by order_lines asc