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
--UC9--Adding type of contact--
alter  table AddressBookTable add bookType varchar(200)
update AddressBookTable set bookType='Friend' where personId= 1 or personId = 3
update AddressBookTable set bookType='Family' where personId=4 or personId =5
--UC10--Calculate Number of Contact based on book type
select count(phoneNumber)as NoOfContact,bookType from AddressBookTable group by bookType
--UC11-- Adding contact in Two type--
insert into AddressBookTable values ('Bala','Shivan','RR.Nagar','Chennai','Tamil Nadu',600025,9876543210,'balsi@gmail.com','Family')
--UC12 Creating the ER Diagram for the Table
Create table ContactType 
(
 typeId int primary key,
 typeName varchar(50)
)

create table ContactAddress
(
 contactId int ,
 typeId int
)

create table AddresBook
(
  personId int identity(1,1) primary key,
  firstName varchar(100),
  lastName varchar(100),
  address varchar(200),
  city varchar(50),
  state varchar(100),
  zipCode bigint,
  phoneNumber bigint,
  email varchar(50),
  typeId int
)
--inserting records into the AddressBook--
Insert into AddressBook (firstName,lastName,address,city,state,zipCode,phoneNumber,email) 
Select firstName,lastName,address,city,state,zipCode,phoneNumber,email from AddressBookTable

Alter table AddressBook drop column typeId
select * from AddressBook

--Inserting the contact type such as Friends and family, Profession
insert into ContactType values (1,'Friend'),(2,'Family'),(3,'Science')
select * from ContactType

--Inserting the Contact Address that link type and person id
insert into ContactAddress values(2,2),(3,2),(2,1),(4,1),(5,3)
select * from ContactAddress

Alter table ContactAddress Add foreign key (contactId) REFERENCES AddressBook(personId)
Alter table ContactAddress Add foreign key (typeId) REFERENCES ContactType(typeId)
