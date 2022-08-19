/*
有表OrderItems代表订单商品信息表，prod_id为产品id；Orders表代表订单表有cust_id代表顾客id和订单日期order_date；Customers表含有cust_email 顾客邮件和cust_id顾客id
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

Customers表代表顾客信息，cust_id为顾客id，cust_email为顾客email
cust_id	cust_email
cust10	cust10@cust.com
cust1	cust1@cust.com
cust2   cust2@cust.com
【问题】返回购买 prod_id 为BR01 的产品的所有顾客的电子邮件（Customers 表中的 cust_email），结果无需排序。
提示：涉及到 SELECT 语句，最内层的从 OrderItems 表返回 order_num，中间的从 Customers 表返回 cust_id，但是必须使用 INNER JOIN 语法。
【示例结果】返回顾客email cust_email
cust_email
cust10@cust.com
cust1@cust.com【示例解析】
产品id为BR01的订单a0001和a002的下单顾客cust10和cust1的顾客email cust_email分别是：cust10@cust.com 、cust1@cust.com
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
  INSERT `Orders` VALUES ('a0001','cust10','2022-01-01 00:00:00'),('a0002','cust1','2022-01-01 00:01:00'),('a0003','cust1','2022-01-02 00:00:00'),('a0013','cust2','2022-01-01 00:20:00');

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
    cust_id VARCHAR(255) NOT NULL COMMENT '顾客id',
    cust_email VARCHAR(255) NOT NULL COMMENT '顾客email'
  );
INSERT `Customers` VALUES ('cust10','cust10@cust.com'),('cust1','cust1@cust.com'),('cust2','cust2@cust.com');

输出：
cust10@cust.com
cust1@cust.com
*/
select
    distinct(c.cust_email)
from OrderItems oi
inner join Orders o on o.order_num=oi.order_num
inner join Customers c on c.cust_id=o.cust_id
where oi.prod_id='BR01'