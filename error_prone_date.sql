SELECT to_char(cnt.date, 'FMMonth DD,YYYY'),
       to_char(cnt.ratio*100,'FM999D9')
FROM
  (SELECT error_cnt.date,
          error_cnt.cnt::decimal/total_cnt.cnt AS ratio
   FROM
     (SELECT TIME::TIMESTAMP::date AS date,
             count(*) AS cnt
      FROM log
      WHERE status LIKE '4%'
        OR status LIKE '5%'
      GROUP BY date) AS error_cnt
     JOIN
     (SELECT TIME::TIMESTAMP::date AS date,
             count(*) AS cnt
      FROM log
      GROUP BY date) AS total_cnt
     ON error_cnt.date=total_cnt.date) AS cnt
WHERE cnt.ratio>0.01;
