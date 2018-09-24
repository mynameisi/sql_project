import psycopg2


def execute_query(sql):
    # input: an SELECT SQL query
    # output: the result of executing such query against database "news"
    db = psycopg2.connect(database="news")
    c = db.cursor()
    c.execute(sql)
    results = c.fetchall()
    db.close()
    return results


def load_sql(file):
    # loads the sql command from sql file into a string
    with open(file, "r") as sql_file:
        sql = sql_file.read()
    return sql


def print_result(sql, result_format):
    # prints the result with specific format
    for (t1, t2) in execute_query(sql):
        print(result_format.format(t1, t2))


pop_article_sql = load_sql("pop_article.sql")
pop_article_result_format = "\"{}\" -- {} views"

pop_author_sql = load_sql("pop_article author.sql")
pop_author_result_format = "{} -- {} views"

error_prone_date_sql = load_sql("error_prone_date.sql")
error_prone_date_result_format = "{} -- {}% errors"

print('1. What are the most popular three articles of all time?')
print_result(pop_article_sql, pop_article_result_format)
print('2. Who are the most popular article authors of all time?')
print_result(pop_author_sql, pop_author_result_format)
print('3. On which days did more than 1% of requests lead to errors?')
print_result(error_prone_date_sql, error_prone_date_result_format)
