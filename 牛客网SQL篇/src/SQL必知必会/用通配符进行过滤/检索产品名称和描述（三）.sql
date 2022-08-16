/*
Products表
【问题】编写 SQL 语句，从 Products 表中检索产品名称（prod_name）和描述（prod_desc），
仅返回描述中同时出现 toy 和 carrots 的产品。有好几种方法可以执行此操作，但对于这个挑战题，请使用 AND 和两个 LIKE 比较。
prod_name   prod_desc
a0011	    usb
a0019       iphone13
b0019       gucci t-shirts
c0019	    gucci toy
d0019	    lego carrots toy
【示例结果】返回产品名称和产品描述
prod_name   prod_desc
d0019	    lego carrots toy
示例1
输入：
DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
`prod_name` VARCHAR(255) NOT NULL COMMENT '产品 ID',
`prod_desc` VARCHAR(255) NOT NULL COMMENT '产品名称'
);
INSERT INTO `Products` VALUES ('a0011','usb'),
('a0019','iphone13'),
('b0019','gucci t-shirts'),
('c0019','gucci toy'),
('d0019','lego carrots toy');

输出：
d0019|lego carrots toy
*/
select
    prod_name,
    prod_desc
from Products
where prod_desc like '%toy%' and prod_desc like '%carrots%'