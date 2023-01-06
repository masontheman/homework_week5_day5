create or replace procedure add_customer(c_ticket_id integer default null, c_full_name_c varchar(80) default 'Maason Delgado')
language plpgsql
as $$
begin 
	insert into customer(ticket_id,full_name_c)
	values (c_ticket_id, c_full_name_c);
end
$$;

create or replace procedure add_customer2(c_full_name_c varchar(80) default 'Maason Delgado',c_ticket_id integer default null)
language plpgsql
as $$
begin 
	insert into customer(ticket_id,full_name_c)
	values (c_ticket_id, c_full_name_c);
end
$$;

call add_customer(null,'Scooby Doo');
call add_customer2('Sean Bals');
call add_customer2('Poop Head');
-- I have 5 customers made 

select * from customer c;

create or replace procedure add_cars(cars_customer_id integer,cars_car_model varchar(40), cars_car_year varchar(4),cars_car_make varchar(25))
language plpgsql
as $$
begin 
	insert into car(
	customer_id,
	car_model,
	car_year,
	car_make)
	values (cars_customer_id,cars_car_model, cars_car_year,cars_car_make);
end
$$;

call add_cars(1,'Camry','2023','Toyota');
call add_cars(2,'Ultima','2022','Nissan');
call add_cars(3,'Machine','2002','Mystery');
call add_cars(4,'Bug','2018','Volkswagen');
call add_cars(5,'Poopster','1875','Poop Model');

select * from car;
create or replace procedure make_invoice()
language plpgsql
as $$
begin 
	insert into invoice(
customer_id,
i_date,
car_id)
	select customer_id,now(),car_id from car;
end
$$;

call make_invoice();
-- adds everything from car into the invoice table with a date assigned so in total I have 7 invoice_ids 
select * from invoice i;

create or replace procedure buy_tickets()
language plpgsql
as $$
begin 
	insert into ticket(
t_date,
customer_id)
	select now(),customer_id from car;
end
$$;
call buy_tickets();
--free car service for all cars on the house lol
select * from ticket;
-- 7 free washes purchased on 2023-01-06 14:37:51.821
-- time to pay the mechanics
create or replace procedure pay_mechanics(m_full_name_m varchar(80) default 'Pablo')
language plpgsql
as $$
begin 
	insert into mechanic(
car_id,
full_name_m)
	select car_id, m_full_name_m from car;
end
$$;
call pay_mechanics('mike');
select * from mechanic m;
-- Pablo is rich
-- payed mike too 
-- they serviced 50 cars because I called the function too many times haha 


