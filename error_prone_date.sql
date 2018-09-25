-- This query provides answer for:
-- On which days did more than 1% of requests lead to errors?
-- This query joins 2 query results
-- error_cnt contains dates with error request count
-- total_cnt containts dates with total request count

SELECT to_char(error_cnt.date, 'FMMonth DD,YYYY'),
       to_char((error_cnt.cnt::decimal/total_cnt.cnt)*100,'FM999D9') AS ratio
FROM
  (SELECT TIME::TIMESTAMP::date AS date,
          count(*) AS cnt
   FROM log
   WHERE status != '200 OK'
   GROUP BY date) AS error_cnt --total number of error requests on each date

JOIN
  (SELECT TIME::TIMESTAMP::date AS date,
          count(*) AS cnt
   FROM log
   GROUP BY date) AS total_cnt --total number of requests on each date
 ON error_cnt.date=total_cnt.date
WHERE error_cnt.cnt::decimal/total_cnt.cnt>0.01;
