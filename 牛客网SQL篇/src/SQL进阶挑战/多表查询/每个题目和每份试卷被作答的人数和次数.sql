/*
每个题目和每份试卷被作答的人数和次数
*/

select * from (
select
    exam_id as tid,
    count(distinct uid) as uv,
    count(uid) as pv
from exam_record
group by exam_id
order by uv desc,pv desc) exam

union all

select * from (
select
    question_id as tid,
    count(distinct uid) as uv,
    count(uid) as pv
from practice_record pr
group by question_id
order by uv desc,pv desc) practice