/*
Customers表代表顾客信息含有顾客id cust_id和 顾客名称 cust_name
cust_id	    cust_name
cust10	    andy
cust1	    ben
cust2       tony
cust22	    tom
cust221	    an
cust2217	hex
Orders表代表订单信息含有订单号order_num和顾客id cust_id
order_num	cust_id
a1	        cust10
a2          cust1
a3	        cust2
a4          cust22
a5          cust221
a7	        cust2217
【问题】使用 INNER JOIN 编写 SQL语句，检索每个顾客的名称（Customers表中的 cust_name）和所有的订单号（Orders 表中的 order_num），最后根据顾客姓名cust_name升序返回。
【示例结果】返回顾客名称cust_name和订单号order_num
cust_name	order_num
an	        a5
andy	    a1
ben         a2
hex	        a7
tom         a4
tony        a3

输入：
DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
	cust_id VARCHAR(255) NOT NULL COMMENT '客户id',
	cust_name VARCHAR(255) NOT NULL COMMENT '客户姓名'
);
INSERT `Customers` VALUES ('cust10','andy'),('cust1','ben'),('cust2','tony'),('cust22','tom'),('cust221','an'),('cust2217','hex');

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders`(
  order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
  cust_id VARCHAR(255) NOT NULL COMMENT '顾客id'
);
INSERT `Orders` VALUES ('a1','cust10'),('a2','cust1'),('a3','cust2'),('a4','cust22'),('a5','cust221'),('a7','cust2217');

输出：
an|a5
andy|a1
ben|a2
hex|a7
tom|a4
tony|a3
*/
select
    c.cust_name,
    o.order_num
from Customers c
inner join Orders o on o.cust_id=c.cust_id
order by cust_name asc