/*Call Volume & Miss Rate by Department*/
select _source_department_name, count(*) as total_calls,
sum(case when status='Connected' then 1 else 0 end) as Connected_calls,
sum(case when  status='Missed' then 1 else 0 end) as Missed_calls,
sum(case when status='Voicemail' then 1 else 0 end) as Voice_mails,
round(SUM(case when status='Missed' then 1 else 0 end)/count(*)*100,2) as Missed_call_Percent
from calling_data where _source_department_name is not null  group by _source_department_name;

/*top & bottom performing agents*/
select agent_names,count(*) as total_calls,
Sum(case when status='Connected' then 1 else 0 end) as total_connected_calls,
sum(case when status='Connected' then 1 else 0 end)/count(*)*100 as connected_percent
from calling_data where agent_names is not null group by agent_names 
 having count(*)>50 order by connected_percent desc;
 
 /*What are peak call hours & worst missed-call hours*/
 select date_format(start_time,'%h %p')  as call_hour, 
 dayname(start_time) as day_of_week,count(*) as total_calls,
 sum(case when status='Missed' then 1 else 0 end) as total_missed_calls,
 sum(case when status='Missed' then 1 else 0 end)/count(*)*100 as missed_call_percent
from calling_data group by call_hour,day_of_week order by total_calls desc, call_hour desc;

/*Which states generate maximum call volume*/
select _source_department_name, count(*) as total_calls ,
sum(case when status='Connected' then 1 else 0 end) as connected_calls,
rank() over(order by count(*) desc) from calling_data
where _source_department_name is not null group by _source_department_name  order by total_calls desc;

/*How many customers called more than once*/
with cust_calls as (Select `CUST NUMBER`, count(*) as total_calls from calling_data
where `CUST NUMBER` is not null group by `CUST NUMBER`),
cust_bucket as (select case when total_calls=1 then 'called_once'
when total_calls =2 then 'called_twice'
else 'multiple_calls' end as call_bucket from cust_calls)
SELECT call_bucket,COUNT(*) AS customer_count,ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),2) AS pct_of_customers
FROM cust_bucket
GROUP BY call_bucket
ORDER BY customer_count DESC;





