#drop database kaiaki_db;
DROP DATABASE  IF EXISTS kaiaki_db;
create database kaiaki_db charset = utf8 collate = utf8_general_ci;

use kaiaki_db;

create table user_type(
	id_user_type int not null auto_increment,
	name_type  varchar(50) not null unique,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp ,
	constraint pk_user_typ primary key (id_user_type)
);

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
	 `created_at` datetime  DEFAULT NOW() NOT NULL,
	 `updated_at` datetime  DEFAULT NOW() ON UPDATE NOW() NOT NULL,
	 `deleted_at` datetime,
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
    id_city int not null,
	id_imovel_type int not null,
	id_user int not null,
    name_imovel varchar(50) not null,
    description_imovel text,
    price_day float,
    price_week float,
    price_mouth float,
    latitude varchar(20),
    longitude varchar(20),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint pk_imovel primary key (id_imovel),
    constraint fk_city_imovel foreign key (id_city) references city_tb(id_city),
    constraint fk_imovel_type_imovel foreign  key (id_imovel_type) references imovel_type_tb (id_imovel_type),
	constraint fk_user_imovel foreign  key (id_user) references user_tb (id_user)
);

create table  comodide_tb (
	id_comodide int not null auto_increment,
    name_comodide varchar(80),
    icon text,
	`created_at` datetime  DEFAULT NOW() NOT NULL,
	`updated_at` datetime  DEFAULT NOW() ON UPDATE NOW() NOT NULL,
	`deleted_at` datetime,
    constraint pk_comodide primary key (id_comodide)    
);


create table photo_imovel_tb(
	id_photo_propertie int not null auto_increment,
    id_propertie int not null,
    url text,
    featured_photo enum (0, 1) default 0,
    description_photo 250,
	  `created_at` datetime  DEFAULT NOW() NOT NULL,
	  `updated_at` datetime  DEFAULT NOW() ON UPDATE NOW() NOT NULL,
	  `deleted_at` datetime,
	constraint pk_photo_propertie primary key (id_photo_propertie)  ,
    constraint fk_propertie_photo foreign key (id_propertie) references propertie_tb(id_propertie)    
);

create table address_tb(
	id_adress int not null auto_increment,
	id_neighborhood int not null auto_increment,
	address varchar(300) not null,
	constraint pk_address primary key(id_adress),
	constraint fk_neighborhood_address foreign key(id_adress) references neighborhood_tb(id_neighborhood)
);

create table propertie_comodide_tb(
	id_comodide int not null,
    id_propertie int not null,
    description_comodide text,
	  `created_at` datetime  DEFAULT NOW() NOT NULL,
	  `updated_at` datetime  DEFAULT NOW() ON UPDATE NOW() NOT NULL,
	  `deleted_at` datetime,
    constraint fk_comodide_propertie foreign key(id_comodide) references comodide_tb(id_comodide),
    constraint fk_propertie_comodide foreign key(id_propertie) references propertie_tb(id_propertie),
    constraint pk_propertie_comodide primary key(id_comodide, id_propertie)
);

create table reting_tb(
	id_user int not null,
    id_propertie int not null,
    view_reting enum(0, 1) default 0,
    desire_reting enum(0, 1) default 0,
	`created_at` datetime  DEFAULT NOW() NOT NULL,
	`updated_at` datetime  DEFAULT NOW() ON UPDATE NOW() NOT NULL,
	`deleted_at` datetime,
    constraint fk_reting_user foreign key(id_user) references user_tb(id_user),
    constraint fk_reting_imovel foreign key(id_propertie) references propertie_tb(id_propertie),
    constraint pk_reting primary key(id_user, id_propertie)
);
INSERT INTO `address_tb` (`id_address`, `id_neighborhood`, `address`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Maputo, Hulene A, AV. Julius Nherere, 2019', '31231233', '283828382', '2020-01-27 17:41:06', '2020-01-27 17:41:06', NULL),
(2, 1, 'Maputo, Magoanine, AV. Julius Nherere, 2019', '9938239291', '882389232', '2020-01-27 17:41:34', '2020-01-27 17:42:13', NULL),
(5, 1, 'Maputo, Mavalane B, rua 323232', '8238238382', '9932939293', '2020-01-27 17:44:05', '2020-01-27 17:44:05', NULL);

create table booking_tb(
	id_user int not null,
    id_imovel int not null,
	code_booking varchar(50) not null,
    qty int not null,
    price int not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
	deleted_at timestamp,
    constraint fk_booking_user foreign key(id_user) references user_tb(id_user),
    constraint fk_booking_imovel foreign key(id_imovel) references imovel_tb(id_imovel),
    constraint pk_booking primary key(id_user, id_imovel),
    constraint un_booking unique(code_booking)
);

create table payment_type_tb(
	id_payment_type int not null auto_increment,
    name_payment_type varchar(50),
    description_payment_type text,
	`created_at` datetime  DEFAULT NOW() NOT NULL,
	`updated_at` datetime  DEFAULT NOW() ON UPDATE NOW() NOT NULL,
	`deleted_at` datetime,
    constraint pk_payment_type primary key(id_payment_type)
);

create table payment_tb(
	id_payment int not null auto_increment,
    id_payment_type int not null,
	id_user int not null,
    id_propertie int not null,
    amount float not null,
    status enum('canceled', 'accept', 'pending', 'refused') DEFAULT 'pending',
	`created_at` datetime  DEFAULT NOW() NOT NULL,
	`updated_at` datetime  DEFAULT NOW() ON UPDATE NOW() NOT NULL,
	`deleted_at` datetime,
    constraint pk_payment primary key(id_payment),
    constraint fk_propertie foreign key(id_propertie) references propertie_tb(id_propertie),
    constraint fk_payment_type foreign key(id_payment_type) references payment_type_tb(id_payment_type),
    constraint fk_payment_booking foreign key(id_user, id_propertie) references booking_tb(id_user, id_propertie)
);
