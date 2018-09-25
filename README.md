# Log Analysis Project
This project is an `internal reporting tool` that is design to answer the following 3 questions against the [`news` database](https://d17h27t6h515a5.cloudfront.net/topher/2016/August/57b5f748_newsdata/newsdata.zip)
1. What are the most popular three articles of all time?
	 Example answer format: "Princess Shellfish Marries Prince Handsome" — 1201 views
2. Who are the most popular article authors of all time?
	 Example answer format: Ursula La Multa — 2304 views
3. On which days did more than 1% of requests lead to errors?
	 Example answer format:July 29, 2016 — 2.5% errors

This is an assignment project from the [UDacity Full Stack Web Developer program Nanodegree Program](https://www.udacity.com/course/full-stack-web-developer-nanodegree--nd004).

contained in the `sql_project-master` folder are the following content:
1. `report.py` the main python file which, when executed, prints the results of the above three questions.
The logic of the program is straight forward: loads the sql file for each questions and then prints the answer.
- The code is formatted according to `PEP8` standard using `autopep8 --in-place --aggressive --aggressive report.py`
- The result printed is as follows:
```
1. What are the most popular three articles of all time?
"Candidate is jerk, alleges rival" -- 338647 views
"Bears love berries, alleges bear" -- 253801 views
"Bad things gone, say good people" -- 170098 views

2. Who are the most popular article authors of all time?
Ursula La Multa -- 507594 views
Rudolf von Treppenwitz -- 423457 views
Anonymous Contributor -- 170098 views
Markoff Chaney -- 84557 views

3. On which days did more than 1% of requests lead to errors?
July 17,2016 -- 2.3% errors
```
2. `sql file` sql files are seperated from the python file for easier management
   1. `pop_article.sql` is for the 1st question `What are the most popular three articles of all time?`
	    - `BEWARE: `after some investigation, I found there are data in the logs with paths like `/article/bad-things-gonea`
			- should such path be considered as a viewing of the article `bad-things-gone`?
			- the requirement is not clear form UDacity, so I took the liberty of discarding addresses like this
			- please refer to the SQL file for more detail

	 2. `pop_article author` is for the 2nd question `Who are the most popular article authors of all time?`
	 3. `error_prone_date.sql` is for the 3rd question `On which days did more than 1% of requests lead to errors?`
please refer to the SQL files for the detailed logic of each query.

- This site is built according to the [UDacity project rubric](https://review.udacity.com/#!/rubrics/277/view).

### Prerequisites

- `python 2` or `python 3` is required for this project
- A [Linux virtual machine with course specific settings](https://classroom.udacity.com/nanodegrees/nd004-mena/parts/a8609286-c119-4bc5-b9c9-2a3828080114/modules/56f0f4c7-d611-4949-b8d5-e1b9df12d95f/lessons/e168714c-3584-4569-bd1f-3d623c07b0ac/concepts/14c72fe3-e3fe-4959-9c4b-467cf5b7c3a0) is required for this project. A detailed process from [UDacity](https://classroom.udacity.com/nanodegrees/nd004-cn/parts/d3335c49-3556-488a-9f63-c0d28b16ff12/modules/bc51d967-cb21-46f4-90ea-caf73439dc59/lessons/5475ecd6-cfdb-4418-85a2-f2583074c08d/concepts/14c72fe3-e3fe-4959-9c4b-467cf5b7c3a0) is as following:
	1. Install [VirtualBox](https://www.virtualbox.org/wiki/Download_Old_Builds_5_1)
	2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
	3. Download the [VM configuration](https://s3.amazonaws.com/video.udacity-data.com/topher/2018/April/5acfbfa3_fsnd-virtual-machine/fsnd-virtual-machine.zip)
- `PosgreSQL` is required for this project. It comes with the virtual machine
- [newsdata.sql](https://d17h27t6h515a5.cloudfront.net/topher/2016/August/57b5f748_newsdata/newsdata.zip) outght to be downloaded and pre-executed to populate the database with data

### Deployment

clone the project from my GitHub repository

```
$ git clone https://github.com/mynameisi/sql_project.git
```

## Running the program

```
$ vagrant up
$ vagrant ssh
$ cd cloned_directory
$ python report.py
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
