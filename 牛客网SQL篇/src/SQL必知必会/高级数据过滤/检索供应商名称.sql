/*
Vendors表有字段供应商名称（vend_name）、供应商国家（vend_country）、供应商州（vend_state）
vend_name	vend_country	vend_state
apple	    USA	            CA
vivo	    CNA             shenzhen
huawei	    CNA	            xian

【问题】编写 SQL 语句，从 Vendors 表中检索供应商名称（vend_name），
仅返回加利福尼亚州的供应商（这需要按国家[USA]和州[CA]进行过滤，没准其他国家也存在一个CA）
【示例答案】返回供应商名称vend_name
vend_name
apple

输入：
DROP TABLE IF EXISTS `Vendors`;
CREATE TABLE IF NOT EXISTS `Vendors` (
  `vend_name` VARCHAR(255) NOT NULL COMMENT 'vend名称',
  `vend_country` VARCHAR(255) NOT NULL COMMENT 'vend国家',
  `vend_state` VARCHAR(255) NOT NULL COMMENT 'vend州'
);
INSERT INTO `Vendors` VALUES ('apple','USA','CA'),
('vivo','CNA','shenzhen'),
('huawei','CNA','xian');

输出：
apple
*/
select
    vend_name
from Vendors
where vend_country='USA' and vend_state='CA'