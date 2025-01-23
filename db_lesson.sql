-- Q1
create table `departments`(
department_id int unsigned auto_increment primary key,
name varchar(20) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);

-- Q2
alter table people modify department_id INT unsigned;

-- Q3
-- (departments)
insert into departments (name)
values
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

-- (people)
insert into people (name, department_id, age, gender)
values
('福田だいすけ', 1, 42, 1),
('豊島はなこ', 1, 34, 2),
('早坂てつお', 1, 61, 1),
('田中ゆうこ', 2, 25, 2),
('毛利小五郎', 2, 40, 1),
('速水ゆうき', 2, 30, 1),
('不思議沢みちこ', 2, 32, 2),
('胡桃みか', 3, 45, 2),
('唐ゆいな', 4, 23, 2),
('田中ゆうこ', 5, 25, 2);

-- (reports)
insert into reports (person_id, content)
values
(146, '東京都'),
(147, '石川県'),
(148, '宮城県'),
(149, '茨城県'),
(150, '静岡県'),
(151, '青森県'),
(152, '沖縄県'),
(153, '大阪府'),
(154, '埼玉県'),
(155, '愛知県');

-- Q4
SELECT * FROM people WHERE department_id IS NULL;

-- Q5
select name, age, gender from people where gender = 1 ORDER BY age desc;

-- Q6
SELECT
  `name`, `email`, `age`
-- A.テーブルからname、email、ageの3つのカラムのを指定してレコード1行ずつ表示します。

FROM
  `people`  
-- A.peopleテーブルからカラムとレコードを表示します。

WHERE
  `department_id` = 1
-- A.テーブルからカラム=値のレコードを表示します。

ORDER BY
  `created_at`;
-- A.テーブルから指定のカラムを昇順通りにレコードに表示します。

-- Q7
SELECT name, age, gender FROM people WHERE gender= 2 and age BETWEEN 20 AND 29
or gender= 1 and age BETWEEN 40 AND 49;

-- Q8
SELECT p.name, d.name, p.age
from departments d join people p on d.department_id = p.department_id
where d.department_id = 1 ORDER BY age;

-- Q9
select AVG(age) from people where gender = 2;

-- Q10
SELECT p.name, d.name, r.content
from departments d join people p on d.department_id = p.department_id
JOIN reports r ON p.person_id = r.person_id;

-- Q11
SELECT p.name, r.content
FROM people p JOIN reports r ON p.person_id = r.person_id
WHERE r.content IS NULL;
