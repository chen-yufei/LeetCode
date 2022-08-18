/*
OrderItems表含有order_num订单号
order_num
a002
a002
a002
a004
a007
【问题】将下面代码修改正确后执行
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY items
HAVING COUNT(*) >= 3
ORDER BY items, order_num;
【示例结果】
返回订单号order_num和出现的次数items
order_num	items
a002	3
【示例解析】
由于订单号a002出现了三次，所以返回3
示例1
输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	order_num VARCHAR(255) NOT NULL COMMENT '商品订单号'
);
INSERT `OrderItems` VALUES ('a002'),('a002'),('a002'),('a004'),('a007');

输出：
a002|3
*/
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num