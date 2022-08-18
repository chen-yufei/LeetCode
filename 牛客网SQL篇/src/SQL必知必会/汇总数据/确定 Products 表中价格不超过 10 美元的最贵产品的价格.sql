/*
Products 表
prod_price
9.49
600
1000
【问题】编写 SQL 语句，确定 Products 表中价格不超过 10 美元的最贵产品的价格（prod_price）。将计算所得的字段命名为 max_price。
【示例结果】返回max_price
max_price
9.49
【示例解析】
返回十元以下最高价格max_price。
示例1
输入：
DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
`prod_price` DOUBLE NOT NULL COMMENT '产品价格'
);
INSERT INTO `Products` VALUES (9.49),
(600),
(1000);

输出：
max_price
9.490
*/
select
    max(prod_price) as max_price
from Products
where prod_price <= 10