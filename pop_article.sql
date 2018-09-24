-- This query provides answer for:
-- What are the most popular three articles of all time?
-- The following query joins article with log
-- since all articles are accessed via a path
-- so the joining condition is based on that

SELECT articles.title,
       count(*) AS cnt
FROM log
JOIN articles ON log.path=concat('/article/',articles.slug)
GROUP BY articles.title
ORDER BY cnt DESC
LIMIT 3;

-- The following query takes into account of paths such as:
-- /article/bad-things-gonea
-- The spec hasn't mentioned if this is a different article
-- or should be take into account for article "bad-things-gone"
-- -- I have decided not to use this query
-------------------------------------------------------------------//
-- SELECT articles.title,
--        count(*) AS cnt
-- FROM log
-- JOIN articles ON position(articles.slug in log.path)!=0
-- GROUP BY articles.title
-- ORDER BY cnt DESC

 --The following query checks for all the paths without proper titles
-------------------------------------------------------------------//
-- SELECT DB3.path
-- FROM (
--         (SELECT *
--          FROM log
--          LEFT JOIN articles ON position(articles.slug IN log.path)!=0)
--       EXCEPT
--         (SELECT *
--          FROM log
--          JOIN articles ON position(articles.slug IN log.path)!=0)) AS DB3
-- WHERE DB3.path!='/'
-- GROUP BY DB3.path;

--Query Results
-------------------------------------------------------------------//
-- /%20%20%20
-- /+++ATH0
-- /spam-spam-spam-humbug
