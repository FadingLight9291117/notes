DROP DATABASE IF EXISTS db_learn;
CREATE DATABASE IF NOT EXISTS db_learn;
USE db_learn;

CREATE TABLE IF NOT EXISTS Student(
Sno INT PRIMARY KEY,
Sname CHAR(20),
Ssex CHAR(2),
Sage SMALLINT,
Sdept CHAR(20)
);

INSERT INTO Student VALUES
(201215121, "李勇", "男", 20, "CS"),
(201215122, "刘晨", "女", 19, "CS"),
(201215132, "王敏", "女", 18, "MA"),
(201215125, "张立", "男", 19, "IS");

CREATE TABLE IF NOT EXISTS Course(
Cno INT PRIMARY KEY,
Cname CHAR(40) NOT NULL,
Cpno CHAR(4),
Ccredit SMALLINT
);

INSERT INTO Course VALUES
(1, "数据库", 5 ,4),
(2, "数学", null, 2),
(3, "信息系统", 1, 4),
(4, "操作系统", 6, 3),
(5, "数据结构", 7, 4),
(6, "数据处理", 7, 4),
(7, "PASCAL语言", 6, 4);

CREATE TABLE IF NOT EXISTS SC(
Sno INT,
Cno INT,
Grade SMALLINT
);

INSERT INTO SC VALUES
(201215121, 1, 92),
(201215121, 2, 85),
(201215121, 3, 88),
(201215122, 2, 90),
(201215122, 3, 80);