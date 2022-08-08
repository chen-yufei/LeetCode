/*
表: Orders
+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
Order_number是该表的主键。
此表包含关于订单ID和客户ID的信息。
 

编写一个SQL查询，为下了 最多订单 的客户查找 customer_number 。
测试用例生成后， 恰好有一个客户 比任何其他客户下了更多的订单。
查询结果格式如下所示。

 
示例 1:
输入:
Orders 表:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
输出:
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
*/
select
    customer_number
from Orders
group by customer_number
order by count(*) desc
limit 1