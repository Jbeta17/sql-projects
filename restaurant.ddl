create table ingredients (
  ingredient_name varchar(20) primary key,
  calories numeric(3, 0),
  cholesterol numeric(3, 0),
  sodium numeric(3, 0),
  protein numeric(3, 0),
  carbs numeric(3, 0),
  haspeanuts boolean,
  haseggs boolean
);

create table dishes (
  dish_name varchar(20) primary key,
  cuisine varchar(20),
  meal_type varchar(10)
);

create table convert_to_grams (
  unit varchar(50) primary key,
  grams numeric (5, 2)
);

create table driver (
    driver_name varchar(20) primary key,
    phone varchar(20)
);

create table deliver_batch (
   batch_id varchar(20) primary key,
   batch_date date,
   dish_name varchar(20),
   numOrdersForDish int,
   driver_name varchar(20),
   time_slot varchar(50),
   foreign key (dish_name) references dishes(dish_name),
   foreign key (driver_name) references driver(driver_name)
);

create table chef (
  chef_name varchar(20) primary key,
  experience varchar(20),
  rating numeric(1, 0)
);

create table dish_ingredient (
  dish_name varchar(20),
  ingredient_name varchar(20),
  quantity numeric(10, 2),
  unit varchar(20),
  primary key(dish_name,  ingredient_name),
  foreign key (dish_name) references dishes(dish_name),
  foreign key (ingredient_name) references ingredients(ingredient_name),
  foreign key (unit) references convert_to_grams(unit)
);

create table batch_chef (
  batch_id varchar(20),
  chef_name varchar(20),
  primary key (batch_id, chef_name),
  foreign key (batch_id) references deliver_batch(batch_id),
  foreign key (chef_name) references chef(chef_name)
);