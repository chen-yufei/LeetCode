/*
有表Products
prod_id	prod_name       prod_price
a0018	sockets	        9.49
a0019	iphone13	    600
b0018   gucci t-shirts	1000
【问题】从 Products 表中检索产品 ID（prod_id）和产品名称（prod_name），只返回价格为 9.49 美元的产品。
【示例结果】返回prod_id和prod_name
prod_id	prod_name
a0018	sockets

输入：
DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
  `prod_id` VARCHAR(255) NOT NULL COMMENT '产品 ID',
  `prod_name` VARCHAR(255) NOT NULL COMMENT '产品名称',
  `prod_price` DOUBLE NOT NULL COMMENT '产品价格'
);
INSERT INTO `Products` VALUES ('a0018','sockets',9.49),
('a0019','iphone13',600),
('b0019','gucci t-shirts',1000);

输出：
a0018|sockets
*/
select
    prod_id,
    prod_name
from Products
where prod_price=9.49