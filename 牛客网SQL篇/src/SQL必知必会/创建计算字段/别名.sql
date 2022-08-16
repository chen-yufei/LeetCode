/*
别名的常见用法是在检索出的结果中重命名表的列字段（为了符合特定的报表要求或客户需求）。有表Vendors代表供应商信息，vend_id供应商id、vend_name供应商名称、vend_address供应商地址、vend_city供应商城市。
vend_id vend_name       vend_address    vend_city
a001	tencent cloud	address1	    shenzhen
a002    huawei cloud	address2        dongguan
a003    aliyun cloud	address3        hangzhou
a003    netease cloud	address4        guangzhou
【问题】编写 SQL 语句，从 Vendors 表中检索vend_id、vend_name、vend_address 和 vend_city，
将 vend_name重命名为 vname，将 vend_city 重命名为 vcity，将 vend_address重命名为 vaddress，按供应商名称对结果进行升序排序。
【示例结果】返回vend_id 供应商id、vname 供应商名称、vaddress供应商地址、vcity供应商城市。
vend_id	vname           vaddress	vcity
a003	aliyun cloud    address3	hangzhou
a002    huawei cloud	address2    dongguan
a003    netease cloud	address4    guangzhou
a001    tencent cloud	address1    shenzhen
示例1
输入：
DROP TABLE IF EXISTS `Vendors`;
CREATE TABLE IF NOT EXISTS `Vendors` (
  `vend_id` VARCHAR(255) NOT NULL COMMENT '供应商id',
  `vend_name` VARCHAR(255) NOT NULL COMMENT '供应商名称',
  `vend_address` VARCHAR(255) NOT NULL COMMENT '供应商地址',
  `vend_city` VARCHAR(255) NOT NULL COMMENT '供应商城市'
);
INSERT INTO `Vendors` VALUES ('a001','tencent cloud','address1','shenzhen'),
('a002','huawei cloud','address2','dongguan'),
('a003','aliyun cloud','address3','alibaba');

输出：
vend_id|vname|vaddress|vcity
a003|aliyun cloud|address3|alibaba
a002|huawei cloud|address2|dongguan
a001|tencent cloud|address1|shenzhen
*/
select
    vend_id,
    vend_name as vname,
    vend_address as vaddress,
    vend_city as vcity
from Vendors
order by vname asc