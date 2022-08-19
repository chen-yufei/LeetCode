/*
表Customers含有字段cust_name顾客名、cust_contact顾客联系方式、cust_state顾客州、cust_email顾客email
cust_name	cust_contact    cust_state	cust_email
cust10	    8695192	        MI	        cust10@cust.com
cust1	    8695193         MI	        cust1@cust.com
cust2       8695194         IL	        cust2@cust.com
【问题】修正下面错误的SQL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state = 'MI'
ORDER BY cust_name;
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state = 'IL'ORDER BY cust_name;
【示例结果】
返回顾客名称：cust_name、顾客联系方式：cust_contact、顾客email：cust_email
cust_name	cust_contact    cust_email
cust1	    8695193	        cust1@cust.com
cust10	    8695192         cust10@cust.com
cust2       8695194         cust2@cust.com
【示例解析】
返回住在"IL"和"MI"的顾客信息，最后根据顾客名称升序排序。
示例1
输入：
DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
    cust_name VARCHAR(255) NOT NULL COMMENT '顾客id',
    cust_contact VARCHAR(255) NOT NULL COMMENT '顾客联系方式',
    cust_state VARCHAR(255) NOT NULL COMMENT '顾客州',
    cust_email VARCHAR(255) NOT NULL COMMENT '顾客email'
  );
INSERT `Customers` VALUES ('cust10','8695192','MI','cust10@cust.com'),('cust1','8695193','MI','cust1@cust.com'),
('cust2','8695194','IL','cust2@cust.com');

输出：
cust1|8695193.000|cust1@cust.com
cust10|8695192.000|cust10@cust.com
cust2|8695194.000|cust2@cust.com
*/
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state = 'MI'
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state = 'IL'
ORDER BY cust_name