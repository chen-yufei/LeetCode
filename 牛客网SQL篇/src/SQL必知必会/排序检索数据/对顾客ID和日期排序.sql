/*
有Orders表
cust_id	order_num	order_date
andy	aaaa	    2021-01-01 00:00:00
andy	bbbb	    2021-01-01 12:00:00
bob	    cccc	    2021-01-10 12:00:00
dick	dddd	    2021-01-11 00:00:00
【问题】编写 SQL 语句，从 Orders 表中检索顾客 ID（cust_id）和订单号（order_num），并先按顾客 ID 对结果进行排序，再按订单日期倒序排列。
【示例答案】
返回2列，cust_id和order_num
cust_id	order_num
andy	bbbb
andy	aaaa
bob	    cccc
dick	dddd

输入：
DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders` (
  `cust_id` varchar(255) NOT NULL COMMENT '顾客 ID',
  `order_num` varchar(255) NOT NULL COMMENT '订单号',
  `order_date` timestamp NOT NULL COMMENT '订单时间'
);
INSERT INTO `Orders` VALUES ('andy','aaaa','2021-01-01 00:00:00'),
('andy','bbbb','2021-01-01 12:00:00'),
('bob','cccc','2021-01-10 12:00:00'),
('dick','dddd','2021-01-11 00:00:00');

输出：
andy|bbbb
andy|aaaa
bob|cccc
dick|dddd
*/
select
    cust_id,
    order_num
from Orders
order by cust_id asc,order_date desc