/*
OrderItems 表包含了所有已订购的产品（有些已被订购多次）。
prod_id order_num	quantity
BR01	a1	        105
BR02    a2	        1100
BR02    a2	        200
BR03    a4	        1121
BR017   a5	        10
BR02    a2	        19
BR017   a7	        5
【问题】编写SQL 语句，查找所有订购了数量至少100 个的 BR01、BR02 或BR03 的订单。
你需要返回 OrderItems 表的订单号（order_num）、产品 ID（prod_id）和数量（quantity），并按产品 ID 和数量进行过滤。
【示例答案】返回商品id prod_id、订单order_num、数量quantity。
order_num	prod_id quantity
a1	        BR01    105
a2	        BR02    1100
a2	        BR02    200
a4	        BR03    1121
【示例解析】
返回的结果中，数量满足大于等于100，且满足prod_id 是"BR01"，“BR02”，“BR03"中的任意一个。

输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(

	prod_id VARCHAR(255) NOT NULL COMMENT '商品号',
	order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
	quantity INT(255) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES ('BR01','a1','105'),('BR02','a2','1100'),('BR02','a2','200'),('BR03','a4','1121'),('BR017','a5','10'),('BR02','a2','19'),('BR017','a7','5')

输出：
a1|BR01|105
a2|BR02|1100
a2|BR02|200
a4|BR03|1121
*/
select
    order_num,
    prod_id,
    quantity
from OrderItems
where prod_id in('BR01','BR02','BR03') and quantity >= 100