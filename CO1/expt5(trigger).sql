mysql> create database testing;
Query OK, 1 row affected (0.01 sec)

mysql> use testing;
Database changed

mysql> create table details(name varchar(20), gender varchar(20), date_of_birth date, subject varchar(20),identification_number int(20) primary key);
Query OK, 0 rows affected, 1 warning (0.06 sec)

mysql> insert into details values ('LAKSHMI','female','1997-01-29','POLITICS',092),
    -> ('KAVYA','female','2000-12-02','PHYSICS',082),
    -> ('KAILAS','male','1999-10-11','MEDICAL',907),
    -> ('SACHIN','male','1993-09-23','COMMERCE',765);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select *from details;
+---------+--------+---------------+----------+-----------------------+
| name    | gender | date_of_birth | subject  | identification_number |
+---------+--------+---------------+----------+-----------------------+
| KAVYA   | female | 2000-12-02    | PHYSICS  |                    82 |
| LAKSHMI | female | 1997-01-29    | POLITICS |                    92 |
| SACHIN  | male   | 1993-09-23    | COMMERCE |                   765 |
| KAILAS  | male   | 1999-10-11    | MEDICAL  |                   907 |
+---------+--------+---------------+----------+-----------------------+
4 rows in set (0.00 sec)

mysql> delimiter //
mysql> create Trigger inserting before insert on details for each row
    -> begin
    -> if new.identification_number <0 then set new.identification_number=0;
    -> end if;
    -> end //
Query OK, 0 rows affected (0.02 sec)

mysql> insert into details values('NIKHIL','male','1997-02-23','MATHEMATICS',679);
    -> select *from details;
    -> //
Query OK, 1 row affected (0.01 sec)

+---------+--------+---------------+-------------+-----------------------+
| name    | gender | date_of_birth | subject     | identification_number |
+---------+--------+---------------+-------------+-----------------------+
| KAVYA   | female | 2000-12-02    | PHYSICS     |                    82 |
| LAKSHMI | female | 1997-01-29    | POLITICS    |                    92 |
| NIKHIL  | male   | 1997-02-23    | MATHEMATICS |                   679 |
| SACHIN  | male   | 1993-09-23    | COMMERCE    |                   765 |
| KAILAS  | male   | 1999-10-11    | MEDICAL     |                   907 |
+---------+--------+---------------+-------------+-----------------------+
5 rows in set (0.01 sec)

mysql>