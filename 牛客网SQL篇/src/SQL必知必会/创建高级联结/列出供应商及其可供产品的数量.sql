/*
有Vendors表含有vend_id供应商id.
vend_id
a0002
a0013
a0003
a0010
有Products表含有供应商id和供应产品id
vend_id	prod_id
a0001   egg
a0002	prod_id_iphone
a00113  prod_id_tea
a0003   prod_id_vivo phone
a0010   prod_id_huawei phone
【问题】
列出供应商（Vendors 表中的 vend_id）及其可供产品的数量，包括没有产品的供应商。你需要使用 OUTER JOIN 和 COUNT()聚合函数来计算 Products 表中每种产品的数量，最后根据vend_id 升序排序。
注意：vend_id 列会显示在多个表中，因此在每次引用它时都需要完全限定它。
【示例结果】
返回供应商id和对应供应商供应的产品的个数
vend_id	prod_id
a0002	1
a0013   0
a0003   1
a0010   1
【示例解析】
供应商a00013供应的商品不在Products表中所以为0，其他供应商供应的产品为1个。

输入：
DROP TABLE IF EXISTS `Vendors`;
CREATE TABLE IF NOT EXISTS `Vendors` (
  `vend_id` VARCHAR(255) NOT NULL COMMENT 'vend名称'
);
INSERT INTO `Vendors` VALUES ('a0002'),
('a0013'),
('a0003'),
('a0010');

DROP TABLE IF EXISTS `Products`;
CREATE TABLE IF NOT EXISTS `Products` (
`vend_id` VARCHAR(255) NOT NULL COMMENT '产品 ID',
`prod_id` VARCHAR(255) NOT NULL COMMENT '产品名称'
);
INSERT INTO `Products` VALUES ('a0001','egg'),
('a0002','prod_id_iphone'),
('a00113','prod_id_tea'),
('a0003','prod_id_vivo phone'),
('a0010','prod_id_huawei phone');

输出：
a0002|1
a0003|1
a0010|1
a0013|0
*/
select
    v.vend_id,
    count(p.prod_id) as prod_id
from Vendors v
left join Products p on v.vend_id=p.vend_id
group by v.vend_id
order by v.vend_id asc