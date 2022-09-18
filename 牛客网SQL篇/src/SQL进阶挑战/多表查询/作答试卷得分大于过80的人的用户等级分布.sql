/*
作答试卷得分大于过80的人的用户等级分布
*/

select
    ui.level,
    count(ui.uid) as level_cnt
from exam_record er
left join examination_info ei on er.exam_id=ei.exam_id
left join user_info ui on ui.uid=er.uid
where ei.tag='SQL' and er.score > 80
group by ui.level
order by level_cnt desc;