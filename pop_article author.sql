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
