/*
现在有Customers 表（表中含有列cust_id代表客户id，cust_name代表客户姓名）
cust_id cust_name
a1      andy
a2	    ben
a3	    tony
a4	    tom
a5      an
a6      lee
a7	    hex
【问题】需要编写 SQL语句，检索所有列。
【示例结果】
返回所有列cust_id和cust_name。
cust_id cust_name
a1      andy
a2	    ben
a3	    tony
a4	    tom
a5      an
a6      lee
a7	    hex

输入：
DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
	cust_id VARCHAR(255) NOT NULL COMMENT '客户id',
	cust_name VARCHAR(255) NOT NULL COMMENT '客户姓名'
);
INSERT `Customers` VALUES ('a1','andy'),('a2','ben'),('a3','tony'),('a4','tom'),('a5','an'),('a6','lee'),('a7','hex');

输出：
a1|andy
a2|ben
a3|tony
a4|tom
a5|an
a6|lee
a7|hex
*/
select
    cust_id,
    cust_name
from Customers