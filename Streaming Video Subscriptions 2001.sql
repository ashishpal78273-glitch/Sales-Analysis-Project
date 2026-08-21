use streaming_video_subscriptions;

select count(customer_id) as Total_Subscriptions from streaming_video_subscriptions_1;

select count(was_subscription_paid) as Total_paid_subscription 
from streaming_video_subscriptions_1
where was_subscription_paid = 'yes';

select count(was_subscription_paid) as Total_Unpaid_Subscription 
from streaming_video_subscriptions_1
where was_subscription_paid = 'NO';

select subscription_interval , avg(subscription_cost) as average_subscription_cost
from streaming_video_subscriptions_1
group by subscription_interval;

select subscription_interval , count(*) as paid_subscription
from streaming_video_subscriptions_1
where was_subscription_paid = 'yes'
group by subscription_interval
order by paid_subscription desc;

select subscription_interval , count(*) as total_subscriptions,
     avg(subscription_cost) as average_cost
from streaming_video_subscriptions_1
group by subscription_interval;

select case 
      when subscription_cost < 10 then 'low'
      when subscription_cost between 10 and 20 then 'medium'
      else 'high'
      end as cost_category,
      count(*) as total_subscriptions
from streaming_video_subscriptions_1
group by cost_category;

select subscription_interval , count(*) as total_subscription , 
       sum(case when was_subscription_paid = 'yes' then 1 else 0 end) as paid_subscription ,
       sum(case when was_subscription_paid = 'no' then 1 else 0 end) as not_paid_subscription
from streaming_video_subscriptions_1
group by subscription_interval;

select subscription_interval,
     sum(case when was_subscription_paid = 'yes' then 1 else 0 end)/ count(*) * 100 as paid_subscription,
     sum(case when was_subscription_paid = 'no' then 1 else 0 end)/ count(*) * 100 as not_paid_subscription
from streaming_video_subscriptions_1
group by subscription_interval;

SELECT 
    YEAR(STR_TO_DATE(created_date, '%d %M %Y')) AS year,
    MONTH(STR_TO_DATE(created_date, '%d %M %Y')) AS month,
    COUNT(*) AS total_subscription
FROM streaming_video_subscriptions_1
GROUP BY 
    YEAR(STR_TO_DATE(created_date, '%d %M %Y')),
    MONTH(STR_TO_DATE(created_date, '%d %M %Y'));
