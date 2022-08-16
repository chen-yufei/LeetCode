/*
假设有一个OrderItems表
quantity	item_price
1	        100
10	        1003
2           500
【问题】
编写 SQL 语句，显示 OrderItems 表中的数量（quantity）和价格（item_price），并按数量由多到少、价格由高到低排序。

返回quantity和item_price

输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems` (
  `quantity` INT(64) NOT NULL COMMENT '数量',
  `item_price` INT(64) NOT NULL COMMENT '订单价格'
);
INSERT INTO `OrderItems` VALUES (1,100),
(10,1003),
(2,500);

输出：
10|1003
2|500
1|100
*/
select
    quantity,
    item_price
from OrderItems
order by quantity desc,item_price desc