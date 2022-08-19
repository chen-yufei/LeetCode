/*
表OrderItems代表订单商品信息表，prod_id为产品id；Orders表代表订单表有cust_id代表顾客id和订单日期order_date
OrderItems表
prod_id	order_num
BR01	a0001
BR01	a0002
BR02    a0003
BR02    a0013
Orders表
order_num	cust_id	order_date
a0001	    cust10	2022-01-01 00:00:00
a0002	    cust1	2022-01-01 00:01:00
a0003	    cust1   2022-01-02 00:00:00
a0013	    cust2   2022-01-01 00:20:00
【问题】
编写 SQL 语句，使用子查询来确定哪些订单（在 OrderItems 中）购买了 prod_id 为 "BR01" 的产品，然后从 Orders 表中返回每个产品对应的顾客 ID（cust_id）和订单日期（order_date），按订购日期对结果进行升序排序。
提示：这一次使用联结和简单的等联结语法。
【示例结果】
返回顾客id cust_id和定单日期order_date
cust_id	order_date
cust10	2022-01-01 00:00:00
cust1	2022-01-01 00:01:00
【示例解析】
产品id为BR01的订单a0001和a002的下单顾客cust10和cust1的下单时间分别为2022-01-01 00:00:00和2022-01-01 00:01:00

示例1
输入：
DROP TABLE IF EXISTS `OrderItems`;
  CREATE TABLE IF NOT EXISTS `OrderItems`(
    prod_id VARCHAR(255) NOT NULL COMMENT '产品id',
    order_num VARCHAR(255) NOT NULL COMMENT '商品订单号'
  );
  INSERT `OrderItems` VALUES ('BR01','a0001'),('BR01','a0002'),('BR02','a0003'),('BR02','a0013');

  DROP TABLE IF EXISTS `Orders`;
  CREATE TABLE IF NOT EXISTS `Orders`(
    order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
    cust_id VARCHAR(255) NOT NULL COMMENT '顾客id',
    order_date TIMESTAMP NOT NULL COMMENT '下单时间'
  );
  INSERT `Orders` VALUES ('a0001','cust10','2022-01-01 00:00:00'),('a0002','cust1','2022-01-01 00:01:00'),
  ('a0003','cust1','2022-01-02 00:00:00'),('a0013','cust2','2022-01-01 00:20:00');

输出：
cust10|2022-01-01 00:00:00
cust1|2022-01-01 00:01:00
*/
select
    o.cust_id,
    o.order_date
from Orders o
left join OrderItems oi on o.order_num=oi.order_num
where oi.prod_id='BR01'
order by order_date asc