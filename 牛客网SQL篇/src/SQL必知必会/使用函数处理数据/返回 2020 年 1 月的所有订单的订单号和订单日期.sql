/*
Orders订单表
order_num	order_date
a0001	    2020-01-01 00:00:00
a0002       2020-01-02 00:00:00
a0003       2020-01-01 12:00:00
a0004       2020-02-01 00:00:00
a0005       2020-03-01 00:00:00
【问题】编写 SQL 语句，返回 2020 年 1 月的所有订单的订单号（order_num）和订单日期（order_date），并按订单日期升序排序
【示例结果】
返回订单号order_num，和order_date订单时间
order_num	order_date
a0001	    2020-01-01 00:00:00
a0003       2020-01-01 12:00:00
a0002       2020-01-02 00:00:00
【示例解析】
a0001、a0002、a0003 时间属于2020年1月
示例1
输入：
DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders`(
	order_num VARCHAR(255) NOT NULL COMMENT '订单号',
	order_date TIMESTAMP NOT NULL COMMENT '订单日期'
);
INSERT `Orders` VALUES ('a0001','2020-01-01 00:00:00'),
('a0002','2020-01-02 00:00:00'),
('a0003','2020-01-01 12:00:00'),
('a0004','2020-02-01 00:00:00'),
('a0005','2020-03-01 00:00:00');

输出：
a0001|2020-01-01 00:00:00
a0003|2020-01-01 12:00:00
a0002|2020-01-02 00:00:00
*/
select
    order_num,
    order_date
from Orders
where year(order_date)='2020' and month(order_date)='01'
order by order_date asc