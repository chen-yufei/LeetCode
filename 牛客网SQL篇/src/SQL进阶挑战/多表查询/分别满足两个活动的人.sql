/*
分别满足两个活动的人
*/

select uid,
       'activity1' as activity
from exam_record
where year(submit_time) = 2021
group by uid
having min(score) >= 85
union all
select distinct uid,
       'activity2' as activity
from exam_record e_r join examination_info e_i
on e_r.exam_id = e_i.exam_id
where year(e_r.submit_time) = 2021
and e_i.difficulty = 'hard'
and e_r.score > 80
and timestampdiff(minute, e_r.start_time, e_r.submit_time) * 2 < e_i.duration
order by uid