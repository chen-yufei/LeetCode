/*
有Products表，含有字段prod_price代表产品价格，vend_id代表供应商id
vend_id	prod_price
a0011	100
a0019   0.1
b0019   1000
b0019   6980
b0019   20
【问题】编写 SQL 语句，返回名为 cheapest_item 的字段，该字段包含每个供应商成本最低的产品（使用 Products 表中的 prod_price），然后从最低成本到最高成本对结果进行升序排序。
【示例结果】返回供应商id vend_id和对应供应商成本最低的产品cheapest_item。
vend_id	cheapest_item
a0019	0.1
b0019   20
a0011   100
【示例解析】
例如b0019成本最低的价格是20，且最后根据成本价格排序返回依次是a0019、b0019、a0011。
示例1
输入：
DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
`vend_id` VARCHAR(255) NOT NULL COMMENT '供应商ID',
`prod_price` DOUBLE NOT NULL COMMENT '产品价格'
);
INSERT INTO `Products` VALUES ('a0011',100),
('a0019',0.1),
('b0019',1000),
('b0019',6980),
('b0019',20);

输出：
vend_id|cheapest_item
a0019|0.100
b0019|20.000
a0011|100.000
*/
select
    vend_id,
    min(prod_price) as cheapest_item
from Products
group by vend_id
order by cheapest_item asc