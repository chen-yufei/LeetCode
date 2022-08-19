/*
Products表含有字段prod_name代表产品名称
prod_name
flower
rice
ring
umbrella
Customers表代表顾客信息，cust_name代表顾客名称
cust_name
andy
ben
tony
tom
an
lee
hex
【问题】
编写 SQL 语句，组合 Products 表中的产品名称（prod_name）和 Customers 表中的顾客名称（cust_name）并返回，然后按产品名称对结果进行升序排序。
【示例结果】
prod_name
an
andy
ben
flower
hex
lee
rice
ring
tom
tony
umbrella
【示例解析】
拼接cust_name和prod_name并根据结果升序排序

示例1
输入：
DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
`prod_name` VARCHAR(255) NOT NULL COMMENT '产品名称'
);
INSERT INTO `Products` VALUES ('flower'),
('rice'),
('ring'),
('umbrella');

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
	cust_name VARCHAR(255) NOT NULL COMMENT '客户姓名'
);
INSERT `Customers` VALUES ('andy'),('ben'),('tony'),('tom'),('an'),('lee'),('hex');

输出：
an
andy
ben
flower
hex
lee
rice
ring
tom
tony
umbrella
*/
select
    prod_name as prod_name
from Products
union all
select
    cust_name as prod_name
from Customers
order by prod_name asc