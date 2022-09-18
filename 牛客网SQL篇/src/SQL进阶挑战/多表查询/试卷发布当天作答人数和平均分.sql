/*
试卷发布当天作答人数和平均分
*/

select
    er.exam_id,
    count(distinct er.uid) as uv,
    round(avg(er.score),1) as avg_score
from exam_record er
left join examination_info ei on er.exam_id=ei.exam_id
left join user_info ui on er.uid=ui.uid
where date(ei.release_time)=date(er.submit_time) and ui.level > 5 and ei.tag='SQL'
group by er.exam_id
order by uv desc,avg_score asc;