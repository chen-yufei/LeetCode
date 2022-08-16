/*
有表Customers，cust_id代表客户id，cust_name代表客户姓名。
cust_id cust_name
a1      andy
a2	    ben
a3	    tony
a4	    tom
a5      an
a6      lee
a7	    hex
【问题】从 Customers 中检索所有的顾客名称（cust_name），并按从 Z 到 A 的顺序显示结果。
【示例结果】返回客户姓名cust_name
cust_name
tony
tom
lee
hex
ben
andy
an

输入：
DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
	cust_id VARCHAR(255) NOT NULL COMMENT '客户id',
	cust_name VARCHAR(255) NOT NULL COMMENT '客户姓名'
);
INSERT `Customers` VALUES ('a1','andy'),('a2','ben'),('a3','tony'),('a4','tom'),('a5','an'),('a6','lee'),('a7','hex');

输出：
cust_name
tony
tom
lee
hex
ben
andy
an
*/
select
    cust_name
from Customers
order by cust_name desc