/*
Products 表
prod_id	prod_name       prod_price
a0018	sockets	        9.49
a0019	iphone13	    600
b0019   gucci t-shirts	1000
【问题】编写 SQL 语句，从 Products 表中检索产品 ID（prod_id）和产品名称（prod_name），只返回价格为 9 美元或更高的产品。
【示例答案】返回prod_id商品id和prod_name商品名称
prod_id	prod_name
a0018	sockets
a0019	iphone13
b0019   gucci t-shirts

输入：
DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
`prod_id` VARCHAR(255) NOT NULL COMMENT '产品 ID',
`prod_name` VARCHAR(255) NOT NULL COMMENT '产品名称',
`prod_price` DOUBLE NOT NULL COMMENT '产品价格'
);
INSERT INTO `Products` VALUES ('a0011','usb',9.49),
('a0019','iphone13',600),
('b0019','gucci t-shirts',1000);

输出：
a0011|usb
a0019|iphone13
b0019|gucci t-shirts
*/
select
    prod_id,
    prod_name
from Products
where prod_price >= 9