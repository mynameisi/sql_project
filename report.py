import psycopg2

DBNAME = "news"


def execute_query(sql):
    db = psycopg2.connect(database=DBNAME)
    c = db.cursor()
    c.execute(sql)
    results = c.fetchall()
    db.close()
    return results


def load_sql(file):
    with open(file, "r") as sql_file:
        sql = sql_file.read()
    return sql


def print_result(sql, result_format):
    for (t1, t2) in execute_query(sql):
        print(result_format.format(t1, t2))


pop_article_sql = load_sql("pop_article.sql")
pop_article_result = "\"{}\" -- {} views"

pop_author_sql = load_sql("pop_article author.sql")
pop_author_result = "{} -- {} views"

error_prone_date_sql = load_sql("error_prone_date.sql")
error_prone_date_result = "{} -- {}% errors"

print('1. What are the most popular three articles of all time?')
print_result(pop_article_sql, pop_article_result)
print('2. Who are the most popular article authors of all time?')
print_result(pop_author_sql, pop_author_result)
print('3. On which days did more than 1% of requests lead to errors?')
print_result(error_prone_date_sql, error_prone_date_result)
