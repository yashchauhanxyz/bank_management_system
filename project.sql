create database bank_management;

use bank_management;

create table branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(200)
);

create table accounts(
account_no INT PRIMARY KEY NOT NULL,
account_type VARCHAR(200) NOT NULL,
balance INT DEFAULT 0,
branch_id INT NOT NULL,
opening_date DATE,
CONSTRAINT bal_chk CHECK(balance>=0),
FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

create table employee(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(200),
emp_salary INT NOT NULL,
branch_id INT,
FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
CONSTRAINT salary_chk CHECK(emp_salary>=0)
);

create table customer(
account_no INT PRIMARY KEY,
cust_name VARCHAR(200),
cust_address VARCHAR(200),
cust_mobile BIGINT,
cust_dob DATE,
CONSTRAINT age_chk CHECK(year(sysdate())-year(cust_dob)>=18),
FOREIGN KEY (account_no) REFERENCES accounts(account_no)
);

INSERT INTO branch values(1078,"delhi");
INSERT INTO branch values(1079,"mumbai");
INSERT INTO branch values(1080,"nagpur");
INSERT INTO branch values(1081,"pune");
INSERT INTO branch values(1082,"bangalore");

INSERT INTO accounts values(20121381,"Savings","8430",1078,"2020-06-28");
INSERT INTO accounts values(20121382,"Joint","9448",1079,"2021-10-17");
INSERT INTO accounts values(20121383,"Savings","20320",1081,"2019-12-18");
INSERT INTO accounts values(20121384,"Joint","2002",1078,"2020-07-20");
INSERT INTO accounts values(20121385,"Current","4",1082,"2022-09-27");
INSERT INTO accounts values(20121386,"Savings","2443",1080,"2012-06-04");
INSERT INTO accounts values(20121387,"Savings","2403",1080,"2012-09-09");
INSERT INTO accounts values(20121388,"Current","3094",1079,"2005-08-05");
INSERT INTO accounts values(20121389,"Savings","42293",1080,"2018-12-07");
INSERT INTO accounts values(20121390,"Pension","23872",1079,"2019-03-18");
INSERT INTO accounts values(20121391,"Pension","23293",1078,"2010-02-17");
INSERT INTO accounts values(20121392,"Savings","9293",1082,"2015-01-27");
INSERT INTO accounts values(20121393,"Current","3820",1081,"2020-06-19");

INSERT INTO employee values(4020,"Utkarsh",10000,1078);
INSERT INTO employee values(4021,"Tushar",7000,1079);
INSERT INTO employee values(4022,"Juree",8000,1080);
INSERT INTO employee values(4023,"Aditi",10000,1082);
INSERT INTO employee values(4024,"Srijan",12000,1079);
INSERT INTO employee values(4025,"Yashika",10000,1080);
INSERT INTO employee values(4026,"Shivika",50000,1078);
INSERT INTO employee values(4027,"Harsh",15000,1082);
INSERT INTO employee values(4028,"Aaryav",20000,1081);
INSERT INTO employee values(4029,"Arnav",5000,1078);

INSERT INTO customer values(20121381,"Aditya Yadav","delhi",9287204202,"1980-09-20");
INSERT INTO customer values(20121382,"Yash Chauhan","mumbai",9428402749,"1977-04-20");
INSERT INTO customer values(20121383,"Khushi Kharke","pune",9023746292,"1999-06-27");
INSERT INTO customer values(20121384,"Shruti Arya","rajkot",7983474292,"2000-01-13");
INSERT INTO customer values(20121385,"Kaustubh Shankar","kashmir",498774299,"2001-08-21");
INSERT INTO customer values(20121386,"Sumit Das","jaipur",9282309824,"1989-04-25");
INSERT INTO customer values(20121387,"Sumit Rana","mizoram",9279749283,"1990-03-29");
INSERT INTO customer values(20121388,"Priyansh Verma","hyderabad",7264298429,"1978-07-22");
INSERT INTO customer values(20121389,"Saanvi Tanwae","udaipur",9320944704,"2002-06-29");
INSERT INTO customer values(20121390,"Varun Sharma","delhi",4974982429,"2002-12-26");
INSERT INTO customer values(20121391,"Aditya Yadav","delhi",9287204202,"1980-09-20");
INSERT INTO customer values(20121392,"Yash Chauhan","mumbai",9428402749,"1977-04-20");
INSERT INTO customer values(20121393,"Khushi Kharke","pune",9023746292,"1999-06-27");


