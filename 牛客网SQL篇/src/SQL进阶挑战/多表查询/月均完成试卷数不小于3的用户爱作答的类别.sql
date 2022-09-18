/*
月均完成试卷数不小于3的用户爱作答的类别
*/

select tag, count(start_time) as tag_cnt
from
    exam_record as er
    inner JOIN
    examination_info as ei
    on er.exam_id = ei.exam_id
where uid in(
    select distinct uid
    from
        exam_record as er
        inner JOIN
        examination_info as ei
        on er.exam_id = ei.exam_id
    group by
        uid,
        month(submit_time)
    having
        count(submit_time) >= 3
    )
group by tag
order by tag_cnt DESC