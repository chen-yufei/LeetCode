/*
Products表
prod_name   prod_desc
a0011	    usb
a0019       iphone13
b0019       gucci t-shirts
c0019	    gucci toy
d0019	    lego toy carrots
【问题】编写 SQL 语句，从 Products 表中检索产品名称（prod_name）和描述（prod_desc），
仅返回在描述中以先后顺序同时出现 toy 和 carrots 的产品。提示：只需要用带有三个 % 符号的 LIKE 即可。
【示例结果】返回产品名称和产品描述
prod_name   prod_desc
d0019	    lego toy carrots
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
('d0019','lego toy carrots ');

输出：
d0019|lego toy carrots
*/
select
    prod_name,
    prod_desc
from Products
where prod_desc like '%toy%carrots%'