create table User(
icno varchar(14)not null,
user_name varchar(100)not null,
user_phone varchar(15)not null,
user_email varchar(50)not null,
user_addr varchar(200)not null,
user_password varchar(8),
unique key(user_password),
primary key(icno)
);

create table Parcel(
parcel_code varchar(15)not null,
no_shelf int(4),
parcel_date date not null,
parcel_status varchar(15)not null check('Available' and 'Pickup'),
icno varchar(14)not null,
primary key (parcel_code),
constraint fk_icno1 foreign key(icno) references user(icno)ON UPDATE CASCADE
);

create table Authorized_Officer(
officer_id varchar(5),
officer_name varchar(20),
parcel_code varchar(15)not null,
primary key(officer_id),
constraint fk_parcel2 foreign key(parcel_code) references parcel(parcel_code)ON UPDATE CASCADE
);





