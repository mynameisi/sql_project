-- This query provides answer for:
-- Who are the most popular article authors of all time?
-- the inner join provides the answer but only with author ids
-- so the outter join is carried out for obtainning author names

SELECT authors.name,
       author_cnt.view_count
FROM
  (SELECT articles.author AS id,
          count(*) AS view_count
   FROM log
   JOIN articles ON log.path=concat('/article/',articles.slug)
   GROUP BY articles.author
   ORDER BY view_count DESC) AS author_cnt
JOIN authors ON author_cnt.id = authors.id
