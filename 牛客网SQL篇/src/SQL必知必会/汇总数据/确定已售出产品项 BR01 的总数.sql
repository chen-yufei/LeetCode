/*
OrderItems表代表售出的产品，quantity代表售出商品数量，产品项为prod_id。
quantity	prod_id
10	        AR01
100	        AR10
1000	    BR01
10001	    BR010
【问题】修改创建的语句，确定已售出产品项（prod_id）为"BR01"的总数。
【示例结果】返回商品项已订购订单数
items_ordered
1000
【示例解析】已订购商品BR01的数量quantity为1000。
示例1
输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	quantity INT(16) NOT NULL COMMENT '商品数量',
	prod_id VARCHAR(255) NOT NULL COMMENT '商品项'
);
INSERT `OrderItems` VALUES (10,'AR01'),(100,'AR10'),(1000,'BR01'),(10001,'BR010');

输出：
1000.000
*/
select
    sum(quantity) as items_ordered
from OrderItems
where prod_id='BR01'