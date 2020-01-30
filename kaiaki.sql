drop database if exists kaiaki_db;

create database kaiaki_db charset = utf8 collate = utf8_general_ci;

use kaiaki_db;

create table user_type(
	id_user_type int not null auto_increment,
	name_type  varchar(50) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
	constraint pk_user_typ primary key (id_user_type)
);

insert into user_type(name_type) values ("Admin"),("Guest");

create table user_tb (
	id_user int not null auto_increment,
    id_user_type int not null,
    facebook_id varchar(250) default null,
    google_id varchar(250) default null,
    password varchar(255),
    mail varchar(75) ,
    cell varchar(16),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_user primary key (id_user),
    constraint fk_user_type foreign key (id_user_type) references user_type(id_user_type),
    constraint un_user unique(mail, cell)
);

create table personal_tb (
	id_personal int not null auto_increment,
    id_user int not null,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_brith date,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_personal primary key (id_personal),
    constraint fk_user_personal foreign key (id_user) references user_tb(id_user) on delete cascade
);

create table photo_tb (
	id_photo int not null auto_increment,
    id_user int not null,
    url text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint fk_photo primary key (id_photo),
    constraint fk_user_photo foreign key (id_user) references user_tb(id_user)
);

create table city_tb (
	id_city int not null auto_increment,
    city_code int not null,
    name_city varchar(50) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint fk_city primary key (id_city)    
);

create table neighborhood_tb(
	id_neighborhood int not null auto_increment,
    id_city int not null,
    neighbordhood_code int not null,
    name_neighborhood varchar(100) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_neighborhood primary key(id_neighborhood),
    constraint fk_neighborhood foreign key(id_city) references city_tb(id_city) on delete cascade on update cascade
);

create table imovel_type_tb(
	id_imovel_type int not null auto_increment,
	name_type varchar(50),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_imovel_type primary key (id_imovel_type)    
);

create table imovel_tb (
	id_imovel int not null auto_increment,
    id_neighborhood int not null,
	id_imovel_type int not null,
	id_user int not null,
    name_imovel varchar(50) not null,
    description_imovel text,
    price_day float,
    price_week float,
    price_mouth float,
    latitude varchar(20),
    longitude varchar(20),
    imovel_status enum('Enabled', 'Disabled') null default 'Enabled',
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_imovel primary key (id_imovel),
    constraint fk_neighborhood_imovel foreign key (id_neighborhood) references neighborhood_tb(id_neighborhood),
    constraint fk_imovel_type_imovel foreign  key (id_imovel_type) references imovel_type_tb (id_imovel_type),
	constraint fk_user_imovel foreign  key (id_user) references user_tb (id_user)
);

create table  comodide_tb (
	id_comodide int not null auto_increment,
    name_comodide varchar(50),
    icon text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_comodide primary key (id_comodide)    
);

create table photo_imovel_tb(
	id_photo_imovel int not null auto_increment,
    id_imovel int not null,
    url text,
    featured_photo text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
	constraint pk_photo_imovel primary key (id_photo_imovel)  ,
    constraint fk_imovel_photo_imovel foreign key (id_imovel) references imovel_tb(id_imovel)    
);

create table imovel_comodide_tb(
	id_comodide int not null,
    id_imovel int not null,
    description_comodide text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint fk_comodide_imovel foreign key(id_comodide) references comodide_tb(id_comodide),
    constraint fk_imovel_comodide foreign key(id_imovel) references imovel_tb(id_imovel),
    constraint pk_imovel_comodide primary key(id_comodide, id_imovel)
);

create table reting_tb(
	id_user int not null,
    id_imovel int not null,
    view_reting int not null,
    desire_reting int not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint fk_reting_user foreign key(id_user) references user_tb(id_user),
    constraint fk_reting_imovel foreign key(id_imovel) references imovel_tb(id_imovel),
    constraint pk_reting primary key(id_user, id_imovel)
);

// Run this Code
create table booking_tb(
    id_booking int not null auto_increment,
	id_user int not null,
    id_imovel int not null,
	code_booking varchar(50) not null,
    qty int not null,
    price int not null,
    check_in date NOT NULL,
    check_out date DEFAULT NULL,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_booking primary key(id_booking),
    constraint fk_booking_user foreign key(id_user) references user_tb(id_user),
    constraint fk_booking_imovel foreign key(id_imovel) references imovel_tb(id_imovel),
    constraint un_booking unique(code_booking)
);

// Run this Code
create table booking_confirm(
    id_booking_confirm int not null auto_increment,
    id_booking int not null,
    reservation_start date not null,
    reservation_end date not null,
    period business_time (reservation_start, reservation_end),
    primary key(id_booking_confirm, business_time without overlaps),    
    constraint fk_booking_confirm foreign key(id_booking) references booking_tb(id_booking)
);

create table payment_type_tb(
	id_payment_type int not null auto_increment,
    name_payment_type varchar(50),
    description_payment_type text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_payment_type primary key(id_payment_type)
);

// Run this Code
create table payment_tb(
	id_payment int not null auto_increment,
    id_payment_type int not null,
	id_booking int not null,
    amount float not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_payment primary key(id_payment),
    constraint fk_payment_type foreign key(id_payment_type) references payment_type_tb(id_payment_type),
    constraint fk_payment_booking foreign key(id_booking) references booking_tb(id_booking)
);
