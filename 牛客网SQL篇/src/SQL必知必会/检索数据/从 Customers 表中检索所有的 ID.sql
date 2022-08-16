/*
描述
现有表Customers如下：
cust_id
A
B
C
【问题】
编写 SQL 语句，从 Customers 表中检索所有的cust_id
返回cust_id列的内容
cust_id
A
B
C

输入：
DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
    cust_id VARCHAR(255) DEFAULT NULL
);
INSERT `Customers` VALUES ('A'),('B'),('C');

输出：
A
B
C
*/
select
    cust_id
from Customers