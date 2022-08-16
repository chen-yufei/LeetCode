/*
我们的示例商店正在进行打折促销，所有产品均降价 10%。Products表包含prod_id产品id、prod_price产品价格
【问题】编写 SQL语句，从 Products 表中返回 prod_id、prod_price 和 sale_price。sale_price 是一个包含促销价格的计算字段。
提示：可以乘以 0.9，得到原价的 90%（即 10%的折扣）
【示例结果】
返回产品id prod_id、产品价格prod_price、销售价格 sale_price
prod_id	prod_price  sale_price
a0011	9.49	    8.541
a0019	600	        540
b0019   1000	    900
【示例解析】sale_price的价格是prod_price的90%
示例1
输入：
DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
`prod_id` VARCHAR(255) NOT NULL COMMENT '产品 ID',
`prod_price` DOUBLE NOT NULL COMMENT '产品价格'
);
INSERT INTO `Products` VALUES ('a0011',9.49),
('a0019',600),
('b0019',1000);

输出：
prod_id|prod_price|sale_price
a0011|9.490|8.541
a0019|600.000|540.000
b0019|1000.000|900.000
*/
select
    prod_id,
    prod_price,
    prod_price*0.9 as sale_price
from Products