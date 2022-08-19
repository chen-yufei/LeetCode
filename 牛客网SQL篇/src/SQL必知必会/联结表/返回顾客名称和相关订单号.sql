/*
Customers 表有字段顾客名称cust_name、顾客id cust_id
cust_id	    cust_name
cust10      andy
cust1       ben
cust2       tony
cust22      tom
cust221     an
cust2217    hex
Orders订单信息表，含有字段order_num订单号、cust_id顾客id
order_num	cust_id
a1	        cust10
a2	        cust1
a3	        cust2
a4	        cust22
a5	        cust221
a7	        cust2217
【问题】
编写 SQL 语句，返回 Customers 表中的顾客名称（cust_name）和Orders 表中的相关订单号（order_num），并按顾客名称再按订单号对结果进行升序排序。你可以尝试用两个不同的写法，一个使用简单的等联结语法，另外一个使用 INNER JOIN。

【示例结果】cust_name代表用户名称cust_name和订单号order_num。
cust_name	order_num
an	        a5
andy	    a1
ben	        a2
hex	        a7
tom	        a4
tony	    a3
【示例解析】顾客名称为an的cust_id为cust221，他的订单号为a5。
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

输出：
an|a5
andy|a1
ben|a2
hex|a7
tom|a4
tony|a3
*/
select
    cust_name,
    order_num
from Customers c
left join Orders o on c.cust_id=o.cust_id
order by cust_name asc,order_num asc