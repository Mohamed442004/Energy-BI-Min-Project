create table regions (
    region_id int primary key,
    region_name varchar(50)
);

create table tariff_plans (
    tariff_id int primary key,
    plan_name varchar(50),
    rate_per_kwh float -- ÓÚÑ Çáßíáæ æÇØ
);


create table households_sql (
    household_id_sql varchar(50) primary key, 
    region_id int,
    tariff_id int,
    foreign key (region_id) references regions(region_id),
    foreign key (tariff_id) references tariff_plans(tariff_id)
);

insert into regions values (1, 'cairo'), (2, 'alexandria'), (3, 'giza');
insert into tariff_plans values (1, 'standard', 0.50), (2, 'premium', 0.75);


insert into households_sql values ('H00001', 1, 1);
insert into households_sql values ('H00002', 2, 1);
insert into households_sql values ('H00003', 3, 2);