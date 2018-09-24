SELECT articles.title,
       count(*) AS cnt
FROM log
JOIN articles ON log.path=concat('/article/',articles.slug)
GROUP BY articles.title
ORDER BY cnt DESC
LIMIT 3;
