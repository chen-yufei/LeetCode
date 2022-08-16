/*
Products表
prod_name   prod_desc
a0011	    usb
a0019       iphone13
b0019       gucci t-shirts
c0019	    gucci toy
d0019	    lego toy
【问题】编写 SQL 语句，从 Products 表中检索产品名称（prod_name）和描述（prod_desc），仅返回描述中包含 toy 一词的产品名称
【示例结果】返回产品名称和产品描述
prod_name   prod_desc
c0019	    gucci toy
d0019	    lego toy

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
('d0019','lego toy');

输出：
c0019|gucci toy
d0019|lego toy
*/
select
    prod_name,
    prod_desc
from Products
where prod_desc like '%toy%'