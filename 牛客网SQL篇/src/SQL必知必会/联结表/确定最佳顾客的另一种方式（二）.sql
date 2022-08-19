/*
OrderItems表代表订单信息，确定最佳顾客的另一种方式是看他们花了多少钱，OrderItems表有订单号order_num和item_price商品售出价格、quantity商品数量
order_num	item_price	quantity
a1	        10	        105
a2          1	        1100
a2          1	        200
a4          2	        1121
a5          5	        10
a2          1	        19
a7	        7	        5
Orders表含有字段order_num 订单号、cust_id顾客id
order_num	cust_id
a1	        cust10
a2          cust1
a3	        cust2
a4          cust22
a5          cust221
a7	        cust2217
顾客表Customers有字段cust_id 客户id、cust_name 客户姓名
cust_id	    cust_name
cust10	    andy
cust1	    ben
cust2       tony
cust22	    tom
cust221 	an
cust2217	hex

【问题】编写 SQL 语句，返回订单总价不小于1000 的客户名称和总额（OrderItems 表中的order_num）。
提示：需要计算总和（item_price 乘以 quantity）。按总额对结果进行排序，请使用INNER JOIN 语法。
【示例结果】
cust_name	total_price
andy	    1050
ben         1319
tom         2242
【示例解析】
总额（item_price 乘以 quantity）大于等于1000的订单号，例如a2对应的顾客id为cust1，cust1的顾客名称cust_name是ben，最后返回ben作为order_num a2的quantity * item_price总和的结果1319。
示例1
输入：
DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE IF NOT EXISTS `OrderItems`(
	order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
	item_price INT(16) NOT NULL COMMENT '售出价格',
	quantity INT(16) NOT NULL COMMENT '商品数量'
);
INSERT `OrderItems` VALUES ('a1',10,105),('a2',1,1100),('a2',1,200),('a4',2,1121),('a5',5,10),('a2',1,19),('a7',7,5);


DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
	cust_id VARCHAR(255) NOT NULL COMMENT '客户id',
	cust_name VARCHAR(255) NOT NULL COMMENT '客户姓名'
);
INSERT `Customers` VALUES ('cust10','andy'),('cust1','ben'),('cust2','tony'),('cust22','tom'),('cust221','an'),('cust2217','hex');

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders`(
  order_num VARCHAR(255) NOT NULL COMMENT '商品订单号',
  cust_id VARCHAR(255) NOT NULL COMMENT '顾客id'
);
INSERT `Orders` VALUES ('a1','cust10'),('a2','cust1'),('a3','cust2'),('a4','cust22'),('a5','cust221'),('a7','cust2217');

输出：
andy|1050.000
ben|1319.000
tom|2242.000
*/
select
    c.cust_name,
    sum(oi.item_price*oi.quantity) as total_price
from OrderItems oi
inner join Orders o on o.order_num=oi.order_num
inner join Customers c on c.cust_id=o.cust_id
group by cust_name
having total_price >= 1000
order by total_price