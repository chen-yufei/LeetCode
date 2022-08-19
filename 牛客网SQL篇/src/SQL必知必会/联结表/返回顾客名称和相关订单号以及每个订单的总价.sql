/*
Customers 表有字段，顾客名称：cust_name、顾客id：cust_id
cust_id	    cust_name
cust10      andy
cust1       ben
cust2       tony
cust22      tom
cust221     an
cust2217    hex
Orders订单信息表，含有字段，订单号：order_num、顾客id：cust_id
order_num	cust_id
a1	        cust10
a2	        cust1
a3	        cust2
a4	        cust22
a5	        cust221
a7	        cust2217
OrderItems表有字段，商品订单号：order_num、商品数量：quantity、商品价格：item_price
order_num	quantity	item_price
a1	        1000        10
a2	        200         10
a3	        10          15
a4	        25          50
a5	        15	        25
a7	        7	        7
【问题】
除了返回顾客名称和订单号，返回 Customers 表中的顾客名称（cust_name）和Orders 表中的相关订单号（order_num），添加第三列 OrderTotal，其中包含每个订单的总价，并按顾客名称再按订单号对结果进行升序排序。

【示例结果】返回顾客名称 cust_name、订单号order_num、订单总额OrderTotal
cust_name	order_num	OrderTotal
an	        a5	        375
andy	    a1	        10000
ben	        a2	        2000
hex	        a7	        49
tom	        a4	        1250
tony	    a3	        150

【示例解析】
例如顾客名称cust_name为an的顾客的订单a5的订单总额为quantity*item_price = 15 * 25 = 375，最后以cust_name和order_num来进行升序排序。

示例1
输入：
DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders`(
  order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
  cust_id VARCHAR(255) NOT NULL COMMENT '顾客id'
);
INSERT `Orders` VALUES ('a1','cust10'),('a2','cust1'),('a3','cust2'),('a4','cust22'),('a5','cust221'),('a7','cust2217');

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
	cust_id VARCHAR(255) NOT NULL COMMENT '客户id',
	cust_name VARCHAR(255) NOT NULL COMMENT '客户姓名'
);
INSERT `Customers` VALUES ('cust10','andy'),('cust1','ben'),('cust2','tony'),('cust22','tom'),('cust221','an'),('cust2217','hex');

DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
  order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
  quantity INT(16) NOT NULL COMMENT '商品数量',
  item_price INT(16) NOT NULL COMMENT '商品价格'
);
INSERT `OrderItems` VALUES ('a1',1000,10),('a2',200,10),('a3',10,15),('a4',25,50),('a5',15,25),('a7',7,7);

输出：
an|a5|375
andy|a1|10000
ben|a2|2000
hex|a7|49
tom|a4|1250
tony|a3|150
*/
select
    c.cust_name,
    o.order_num,
    (oi.quantity*oi.item_price) as OrderTotal
from Orders o
left join Customers c on c.cust_id=o.cust_id
left join OrderItems oi on oi.order_num=o.order_num
order by cust_name asc,order_num asc