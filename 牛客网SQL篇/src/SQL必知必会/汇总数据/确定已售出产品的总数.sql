/*
OrderItems表代表售出的产品，quantity代表售出商品数量。
quantity
10
100
1000
10001
2
15
【问题】编写 SQL 语句，确定已售出产品的总数。
【示例结果】返回items_ordered列名，表示已售出商品的总数。
items_ordered
11128
示例1
输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	quantity INT(16) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES (10),(100),(1000),(10001),(2),(15);

输出：
items_ordered
11128.000
*/
select
    sum(quantity) as items_ordered
from OrderItems
