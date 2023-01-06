drop table salesperson;

create table SalesPerson(
	salesperson_id serial primary key,
	car_id integer not null,
	customer_id integer not null,
	invoice_id integer not null,
	full_name_s varchar(80) not null
);

alter table salesperson 
add foreign key(car_id) references car(car_id);

alter table salesperson 
add foreign key(customer_id) references customer(customer_id);

alter table salesperson 
add foreign key(invoice_id) references invoice(invoice_id);

drop table car;

create table Car(
	car_id serial primary key,
	customer_id integer not null,
	car_model varchar(40) not null,
	car_year varchar(4) not null,
	car_make varchar(25) not null
);

alter table car 
add foreign key(customer_id) references customer(customer_id);

drop table invoice;

create table Invoice(
	invoice_id serial primary key,
	customer_id integer not null,
	i_date timestamp not null,
	car_id integer not null
);

alter table invoice 
add foreign key(customer_id) references customer(customer_id);

alter table invoice 
add foreign key(car_id) references car(car_id);

drop table customer;

create table Customer(
	customer_id serial primary key,
	ticket_id integer,
	full_name_c varchar(80) not null
);

alter table customer 
add foreign key(ticket_id) references ticket(ticket_id);

drop table mechanic;

create table Mechanic(
	mechanic_id serial primary key,
	car_id integer not null,
	full_name_m varchar(80) not null
);

alter table mechanic 
add foreign key(car_id) references car(car_id);

drop table ticket;

create table Ticket(
	 ticket_id serial primary key,
	 t_date timestamp not null
);

alter table ticket
add column customer_id integer not null;

alter table ticket 
add foreign key(customer_id) references customer(customer_id);

