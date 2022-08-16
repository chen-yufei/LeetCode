/*
有Vendors表
vend_name
海底捞
小龙坎
大龙燚

【问题】下面的 SQL 语句有问题吗？尝试将它改正确，使之能够正确运行，并且返回结果根据vend_name逆序排列
SELECT vend_name, FROM Vendors
ORDER vend_name DESC;
【示例展示】
返回vend_name
vend_name
海底捞
小龙坎
大龙燚

输入：
DROP TABLE IF EXISTS `Vendors`;
CREATE TABLE IF NOT EXISTS `Vendors` (
  `vend_name` VARCHAR(255) NOT NULL COMMENT 'vend名称'
);
INSERT INTO `Vendors` VALUES ('海底捞'),
('小龙坎'),
('大龙燚');

输出：
海底捞
小龙坎
大龙燚
*/
select
    vend_name
from Vendors
order by vend_name desc