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
('Siva','Karthik','Anna nagar','salem','Tamil Nadu',600019,789643210,'sikar@gmail.com'),
insert into AddressBookTable values('Rathna','Priya','MR nagar','salem','kerela',602589,7896478850,'rat@gmail.com')

select * from AddressBookTable
--uC4- Edit contact in table--
update AddressBookTable set email = 'bala@gmail.com' where firstName='Karthikk' and lastName='Bala'
--UC5-Delete a person--
delete from   AddressBookTable where firstname = 'Bala' and lastname = 'Vickram'
--UC6-Retrieve the person using the state--
select * from AddressBookTable where state='Tamil Nadu' or city = 'madurai'
select* from AddressBookTable where state = 'kerela'
--UC7-Calculating the size of the record by state or city--
select count(phoneNumber)as NoOfContact,state from AddressBookTable group by state
select count(phoneNumber)as NoOfContact,city from AddressBookTable group by city
--UC8-Retrieve record based on state or city--
select * from AddressBookTable where city = 'madurai' order by(lastName)
select * from AddressBookTable where state = 'Tamil Nadu' order by (firstName)