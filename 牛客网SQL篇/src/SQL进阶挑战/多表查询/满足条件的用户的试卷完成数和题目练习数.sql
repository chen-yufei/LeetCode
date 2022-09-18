/*
满足条件的用户的试卷完成数和题目练习数
*/

select
    uid,
    exam_cnt,
    if(question_cnt is null, 0, question_cnt)
from
(select
    uid,
    count(submit_time) as exam_cnt
from exam_record
where YEAR(submit_time) = 2021
group by uid) t

left join

(select
    uid,
    count(submit_time) as question_cnt
from practice_record
where YEAR(submit_time) = 2021
group by uid) t2 using(uid)

where uid in
(
select
    uid
from exam_record
join examination_info using(exam_id)
join user_info using(uid)
where tag = 'SQL' and difficulty = 'hard' and `level` = 7
group by uid
having avg(score) >= 80
)
order by exam_cnt asc, question_cnt desc