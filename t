Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.36 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
6 rows in set (0.14 sec)

mysql> create database Test3;
Query OK, 1 row affected (0.03 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| test3              |
| world              |
+--------------------+
7 rows in set (0.00 sec)

mysql> use test3;
Database changed
mysql> create table stagiaire(
    -> code_stg int primary key,
    -> nom_stg varchar(20) not null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> create table stargiaire(
    -> code_stg int primary key,
    -> nom_stg varchar(20) not null);
Query OK, 0 rows affected (0.08 sec)

mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stargiaire      |
+-----------------+
1 row in set (0.02 sec)

mysql> desc stagiaire;
ERROR 1146 (42S02): Table 'test3.stagiaire' doesn't exist
mysql> desc stargiare;
ERROR 1146 (42S02): Table 'test3.stargiare' doesn't exist
mysql> desc stargiaire;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> select* from stargiaire;
Empty set (0.01 sec)

mysql> insert into stargiaire
    -> values(1,'kabbour')
    -> values(2,'bouchaib');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values(2,'bouchaib')' at line 3
mysql> insert into stargiaire
    -> values(1,'kabbour'),
    -> (2,'bouchaib');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stargiaire;
+----------+----------+
| code_stg | nom_stg  |
+----------+----------+
|        1 | kabbour  |
|        2 | bouchaib |
+----------+----------+
2 rows in set (0.00 sec)

mysql> insert into stargiaire
    -> values(1,'fff');
ERROR 1062 (23000): Duplicate entry '1' for key 'stargiaire.PRIMARY'
mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stargiaire      |
+-----------------+
1 row in set (0.00 sec)

mysql> create table stg_copy like stargiaire;
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stargiaire      |
| stg_copy        |
+-----------------+
2 rows in set (0.00 sec)

mysql> desc stg_copy;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> select * from stg_copy;
Empty set (0.00 sec)

mysql> insert into stg_copy select * from stargiaire;
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stg_copy;
+----------+----------+
| code_stg | nom_stg  |
+----------+----------+
|        1 | kabbour  |
|        2 | bouchaib |
+----------+----------+
2 rows in set (0.00 sec)

mysql> select * from stargiaire;
+----------+----------+
| code_stg | nom_stg  |
+----------+----------+
|        1 | kabbour  |
|        2 | bouchaib |
+----------+----------+
2 rows in set (0.00 sec)

mysql> delete from stargiaire;
Query OK, 2 rows affected (0.01 sec)

mysql> select * from stargiaire;
Empty set (0.00 sec)

mysql> insert into stargiaire select * from stg_copy ;
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stargiaire;
+----------+----------+
| code_stg | nom_stg  |
+----------+----------+
|        1 | kabbour  |
|        2 | bouchaib |
+----------+----------+
2 rows in set (0.00 sec)

mysql> delete from stg_copy where nom_stg = 2 ;
ERROR 1292 (22007): Truncated incorrect DOUBLE value: 'kabbour'
mysql> delete from stg_copy where code_stg = 2;
Query OK, 1 row affected (0.01 sec)

mysql> select * from stg_copy;
+----------+---------+
| code_stg | nom_stg |
+----------+---------+
|        1 | kabbour |
+----------+---------+
1 row in set (0.00 sec)

mysql> drop table stg_copy;
Query OK, 0 rows affected (0.06 sec)

mysql> show tables ;
+-----------------+
| Tables_in_test3 |
+-----------------+
| stargiaire      |
+-----------------+
1 row in set (0.00 sec)

mysql> alter table stargiaire
    -> drop primary key;
Query OK, 2 rows affected (0.06 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from stargiaire;
+----------+----------+
| code_stg | nom_stg  |
+----------+----------+
|        1 | kabbour  |
|        2 | bouchaib |
+----------+----------+
2 rows in set (0.00 sec)

mysql> desc stargiaire;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   |     | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table  stargiaire
    -> add primary key (code_stg)
    ->
    -> ;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc stargiaire;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create table Groupe(
    -> code_gr int primary key,
    -> nom_gr varchar (10) not null unique ,
    -> filiere_gr varchar (10) not null
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> show tables;
+-----------------+
| Tables_in_test3 |
+-----------------+
| groupe          |
| stargiaire      |
+-----------------+
2 rows in set (0.00 sec)

mysql> desc group ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group' at line 1
mysql> desc groupe ;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| code_gr    | int         | NO   | PRI | NULL    |       |
| nom_gr     | varchar(10) | NO   | UNI | NULL    |       |
| filiere_gr | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from groupe ;
Empty set (0.00 sec)

mysql> insert into groupe
    -> values (1,'Dev104','info'),
    -> (2,'gest109','gestion'),
    -> (3,'dev108','info');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from groupe;
+---------+---------+------------+
| code_gr | nom_gr  | filiere_gr |
+---------+---------+------------+
|       1 | Dev104  | info       |
|       2 | gest109 | gestion    |
|       3 | dev108  | info       |
+---------+---------+------------+
3 rows in set (0.00 sec)

mysql> alter table stargiaire
    -> add code_gr int ;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc stargiaire ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
| code_gr  | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from stargiaire ;
+----------+----------+---------+
| code_stg | nom_stg  | code_gr |
+----------+----------+---------+
|        1 | kabbour  |    NULL |
|        2 | bouchaib |    NULL |
+----------+----------+---------+
2 rows in set (0.00 sec)

mysql> alter table stargiaire
    -> add foreign key (code_gr) references groupe (code_gr);
Query OK, 2 rows affected (0.10 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> desc stargiaire;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| code_stg | int         | NO   | PRI | NULL    |       |
| nom_stg  | varchar(20) | NO   |     | NULL    |       |
| code_gr  | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> update stargiare
    -> set code_gr = 3 where code_st = 1;
ERROR 1146 (42S02): Table 'test3.stargiare' doesn't exist
mysql> update stargiaire
    -> set code_gr = 3 where code_st = 1;
ERROR 1054 (42S22): Unknown column 'code_st' in 'where clause'
mysql> update stargiare
    -> set code_gr = 3 where code_stg = 1;
ERROR 1146 (42S02): Table 'test3.stargiare' doesn't exist
mysql> update stargiaire
    ->  set code_gr = 3 where code_stg = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update stargiaire
    -> set code_gr = 1 where code_stg = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from groupe;
+---------+---------+------------+
| code_gr | nom_gr  | filiere_gr |
+---------+---------+------------+
|       1 | Dev104  | info       |
|       2 | gest109 | gestion    |
|       3 | dev108  | info       |
+---------+---------+------------+
3 rows in set (0.00 sec)

mysql> delete from groupe where code_gr = 1;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (test3.stargiaire, CONSTRAINT stargiaire_ibfk_1 FOREIGN KEY (code_gr) REFERENCES groupe (code_gr))
mysql> delete from groupe where code_gr = 2;
Query OK, 1 row affected (0.01 sec)

mysql> select * from groupe ;
+---------+--------+------------+
| code_gr | nom_gr | filiere_gr |
+---------+--------+------------+
|       1 | Dev104 | info       |
|       3 | dev108 | info       |
+---------+--------+------------+
2 rows in set (0.00 sec)

mysql> select * from stargiaire join groupe where stargiaire.code_gr = groupe.code_gr;
+----------+----------+---------+---------+--------+------------+
| code_stg | nom_stg  | code_gr | code_gr | nom_gr | filiere_gr |
+----------+----------+---------+---------+--------+------------+
|        2 | bouchaib |       1 |       1 | Dev104 | info       |
|        1 | kabbour  |       3 |       3 | dev108 | info       |
+----------+----------+---------+---------+--------+------------+
2 rows in set (0.00 sec)

mysql> select * from satrgaiaire join groupe ;
ERROR 1146 (42S02): Table 'test3.satrgaiaire' doesn't exist
mysql> select * from stargiaire join groupe ;
+----------+----------+---------+---------+--------+------------+
| code_stg | nom_stg  | code_gr | code_gr | nom_gr | filiere_gr |
+----------+----------+---------+---------+--------+------------+
|        2 | bouchaib |       1 |       1 | Dev104 | info       |
|        1 | kabbour  |       3 |       1 | Dev104 | info       |
|        2 | bouchaib |       1 |       3 | dev108 | info       |
|        1 | kabbour  |       3 |       3 | dev108 | info       |
+----------+----------+---------+---------+--------+------------+
4 rows in set (0.00 sec)

mysql> select code_stg, nom_stg,filiere from stargiaire join groupe where stargiaire.code_gr = groupe.code_gr;
ERROR 1054 (42S22): Unknown column 'filiere' in 'field list'
mysql>  select code_stg, nom_stg, filiere_gr from stargiaire join groupe where stargiaire.code_gr = groupe.code_gr;
+----------+----------+------------+
| code_stg | nom_stg  | filiere_gr |
+----------+----------+------------+
|        2 | bouchaib | info       |
|        1 | kabbour  | info       |
+----------+----------+------------+
2 rows in set (0.00 sec)

mysql>  select code_stg, nom_stg,nom_gr, filiere_gr from stargiaire join groupe where stargiaire.code_gr = groupe.code_gr;
+----------+----------+--------+------------+
| code_stg | nom_stg  | nom_gr | filiere_gr |
+----------+----------+--------+------------+
|        2 | bouchaib | Dev104 | info       |
|        1 | kabbour  | dev108 | info       |
+----------+----------+--------+------------+
2 rows in set (0.00 sec)

mysql> desc groupe;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| code_gr    | int         | NO   | PRI | NULL    |       |
| nom_gr     | varchar(10) | NO   | UNI | NULL    |       |
| filiere_gr | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql>
