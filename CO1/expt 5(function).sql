use bank_organisation;
Database changed
mysql> select *from customer;
+-----+-----------+-------------+--------+------------+
| cid | cname     | location    | sex    | dob        |
+-----+-----------+-------------+--------+------------+
|   1 | SHANA     | Kotarakara  | female | 1981-10-02 |
|   2 | ANJANA    | kalamassery | female | 1978-04-10 |
|   3 | AMRUTHA   | kanjikuzhi  | female | 1989-06-30 |
|   4 | SAHALA    | poppoyii    | female | 1999-07-02 |
|   5 | SNEHA     | mekak       | female | 1978-02-11 |
|   6 | SHAMNA    | mekil       | female | 1989-10-10 |
|   9 | SONIYA    | ayoor       | female | 1996-08-23 |
+-----+-----------+-------------+--------+------------+
7 rows in set (0.00 sec)
CREATE FUNCTION `account_count`(customer_name varchar(20)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
declare a_count integer;
select count(*) into a_count
from Customer
where Customer.cname=customer_name;
RETURN a_count;
END

mysql> select account_count("SHAMNA");
+------------------------+
| account_count("SHAMNA") |
+------------------------+
|                      1 |
+------------------------+
1 row in set (0.00 sec)