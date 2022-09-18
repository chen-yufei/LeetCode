/*
每个6/7级用户活跃情况
*/

select u_i.uid as uid,
       count(distinct act_month) as act_month_total,
       count(distinct case
             when year(act_time) = 2021
             then act_day
             end) as act_days_2021,
       count(distinct case
             when year(act_time) = 2021
             and tag = 'exam'
             then act_day
             end) as act_days_2021_exam,
        count(distinct case
             when year(act_time) = 2021
             and tag = 'question'
             then act_day
             end) as act_days_2021_question
from user_info u_i
left join (select uid,
             start_time as act_time,
             date_format(start_time, '%Y%m') as act_month,
             date_format(start_time, '%Y%m%d') as act_day,
             'exam' as tag
      from exam_record
      union all
      select uid,
             submit_time as act_time,
             date_format(submit_time, '%Y%m') as act_month,
             date_format(submit_time, '%Y%m%d') as act_day,
             'question' as tag
      from  practice_record
      ) exam_and_practice
on exam_and_practice.uid = u_i.uid
where u_i.level >= 6
group by uid
order by act_month_total desc, act_days_2021 desc

