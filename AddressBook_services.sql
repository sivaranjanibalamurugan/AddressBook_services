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