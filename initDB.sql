create table developers
(
id SERIAL primary key,
developer_name varchar(250),
age int,
gender varchar(10),
email varchar(60),
phone_number varchar(25)
);
alter table developers owner to postgres;

create table skills
(
id serial primary key,
branch ENUM ('Java', 'C++', 'C#', 'JS')), 
skill_level ENUM ('Junior', 'Middle', 'Senior'))
);
alter table skills owner to postgres;

create table companies
(
id serial primary key,
company_name varchar(250),
city varchar(25)
);
alter table customers owner to postgres;

create table customers
(
id serial primary key,
customer_name varchar(250),
phone_number varchar(25)
);
alter table customers owner to postgres;

create table projects
(
id serial primary key,
project_name varchar(250),
customers_id int not null,
company_id int not null,
foreign key (customers_id) references customers(id),
foreign key (company_id) references companies(id)
);
alter table projects owner to postgres;

create table developers_skills
(
id serial primary key,
developer_id int not null,
skills_id int not null,
foreign key (developer_id) references developers(id),
foreign key (skills_id) references skills(id)
);
alter table developers_skills owner to postgres;

create table developers_projects
(
id serial primary key,
developers_skills_id int not null,
project_id int not null,
foreign key (developers_skills_id) references developers_skills(id),
foreign key (project_id) references projects(id)
);
alter table developers_projects owner to postgres;