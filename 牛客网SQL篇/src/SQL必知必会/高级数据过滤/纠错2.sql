/*
供应商表Vendors有字段供应商名称vend_name、供应商国家vend_country、供应商省份vend_state
vend_name	vend_country	vend_state
apple	    USA	            CA
vivo	    CNA	            shenzhen
huawei	    CNA	            xian
【问题】修改正确下面sql，使之正确返回
SELECT vend_name
FROM Vendors
ORDER BY vend_name
WHERE vend_country = 'USA' AND vend_state = 'CA';
【示例结果】
结果返回vend_name
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
('beef noodle king','USA','CA'),
('vivo','CNA','shenzhen'),
('huawei','CNA','xian');

输出：
apple
beef noodle king
*/
SELECT vend_name
FROM Vendors
WHERE vend_country = 'USA' AND vend_state = 'CA'
ORDER BY vend_name