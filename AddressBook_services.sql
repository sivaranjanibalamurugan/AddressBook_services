--UC1-Creating the database for addressbook services--
create database Addressbook_services;
use  Addressbook_services;
--UC2- creating table-
create table AddressBookTable
(
  personId int identity(1,1) primary key,
  firstName varchar(200),
  lastName varchar(200),
  address varchar(200),
  city varchar(100),
  state varchar(100),
  zipCode bigint,
  phoneNumber bigint,
  email varchar(100)
)
--UC3-Inserting new rows inside the table--
insert into AddressBookTable values('Siva','Ranjani','East new st','madurai','Tamil Nadu',600259,8667361462,'siva@gmail.com'),
('Bala','Vickram','cross street','chennai','Tamil Nadu',600145,9786146251,'bala@gmail.com'),
('Karthik','Bala','KKnagar','Trichy','Tamil Nadu',600189,9861325453,'karthick@gmail.com'),
('Siva','Karthik','Anna nagar','salem','Tamil Nadu',600019,789643210,'sikar@gmail.com')
select * from AddressBookTable
