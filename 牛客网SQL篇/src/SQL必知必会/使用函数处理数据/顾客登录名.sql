/*
我们的商店已经上线了，正在创建顾客账户。所有用户都需要登录名，默认登录名是其名称和所在城市的组合。
给出 Customers表 如下：
cust_id	cust_name	cust_contact	cust_city
a1	    Andy Li	    Andy Li	        Oak Park
a2	    Ben Liu	    Ben Liu         Oak Park
a3      Tony Dai	Tony Dai        Oak Park
a4      Tom Chen	Tom Chen        Oak Park
a5      An Li	    An Li           Oak Park
a6	    Lee Chen	Lee Chen        Oak Park
a7	    Hex Liu	    Hex Liu         Oak Park
【问题】编写 SQL 语句，返回顾客 ID（cust_id）、顾客名称（cust_name）和登录名（user_login），
其中登录名全部为大写字母，并由顾客联系人的前两个字符（cust_contact）和其所在城市的前三个字符（cust_city）组成。提示：需要使用函数、拼接和别名。
【示例结果】
返回顾客id cust_id，顾客名称cust_name，顾客登录名 user_login
cust_id	cust_name	user_login
a1	    Andy Li 	ANOAK
a2	    Ben Liu	    BEOAK
a3      Tony Dai	TOOAK
a4      Tom Chen	TOOAK
a5      An Li	    ANOAK
a6	    Lee Chen	LEOAK
a7	    Hex Liu	    HEOAK
【示例解析】
例如，登录名是 ANOAK（Andy Li，居住在 Oak Park）
示例1
输入：
DROP TABLE IF EXISTS `Customers`;
CREATE TABLE IF NOT EXISTS `Customers`(
	cust_id VARCHAR(255) NOT NULL COMMENT '客户id',
	cust_name VARCHAR(255) NOT NULL COMMENT '客户姓名',
	cust_contact VARCHAR(255) NOT NULL COMMENT '客户联系人',
	cust_city VARCHAR(255) NOT NULL COMMENT '客户城市'
);
INSERT `Customers` VALUES ('a1','Andy Li','Andy Li','Oak Park'),('a2','Ben Liu','Ben Liu','Oak Park'),
('a3','Tony Dai','Tony Dai','Oak Park'),('a4','Tom Chen','Tom Chen','Oak Park'),
('a5','An Li','An Li','Oak Park'),('a6','Lee Chen','Lee Chen','Oak Park'),('a7','Hex Liu','Hex Liu','Oak Park');

输出：
cust_id|cust_name|user_login
a1|Andy Li|ANOAK
a2|Ben Liu|BEOAK
a3|Tony Dai|TOOAK
a4|Tom Chen|TOOAK
a5|An Li|ANOAK
a6|Lee Chen|LEOAK
a7|Hex Liu|HEOAK
*/
select
    cust_id,
    cust_name,
    upper(concat(substring(cust_name,1,2),substring(cust_city,1,3))) as user_login
from Customers