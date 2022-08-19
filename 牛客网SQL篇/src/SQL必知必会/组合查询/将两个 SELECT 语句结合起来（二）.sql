/*
表OrderItems包含订单产品信息，字段prod_id代表产品id、quantity代表产品数量。
prod_id	quantity
a0001   105
a0002	100
a0002	200
a0013   1121
a0003   10
a0003   19
a0003   5
BNBG	10002
【问题】
  将两个 SELECT 语句结合起来，以便从 OrderItems表中检索产品 id（prod_id）和 quantity。其中，一个 SELECT 语句过滤数量为 100 的行，另一个 SELECT 语句过滤 id 以 BNBG 开头的产品，最后按产品 id 对结果进行升序排序。
 注意：这次仅使用单个 SELECT 语句。
【示例结果】
返回产品id prod_id和产品数量quantity
prod_id	quantity
a0002	100
BNBG	10002
【示例解析】
产品id a0002因为数量等于100被选取返回；BNBG因为是以 BNBG 开头的产品所以返回；最后以产品id进行排序返回。

示例1
输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	prod_id VARCHAR(255) NOT NULL COMMENT '产品id',
	quantity VARCHAR(255) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES ('a0001',105),('a0002',100),('a0002',200),('a0013',1121),
('a0003',10),('a0003',19),('a0003',5),('BNBG',10002);

输出：
a0002|100.000
BNBG|10002.000
*/
select
    prod_id,
    quantity
from OrderItems
where quantity=100 or prod_id like 'BNBG%'