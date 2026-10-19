--1-- Simple Queries -- 3 simple queries to find all the ingredients in a specific dish
select ingredient_name
from dish_ingredient
where dish_name = 'chicken fried rice';

select ingredient_name
from dish_ingredient
where dish_name = 'omelette';

select ingredient_name
from dish_ingredient
where dish_name = 'pasta alfredo';

--2-- Nutrient content -- 3 queries that calculate the total protein (in grams) in a dish 
select sum((i.protein * (di.quantity * c.grams)) / 100) as total_protein
from dish_ingredient di natural join ingredients i natural join convert_to_grams c
where di.dish_name = 'chicken fried rice';

select sum((i.protein * (di.quantity * c.grams)) / 100) as total_protein
from dish_ingredient di natural join ingredients i natural join convert_to_grams c
where di.dish_name = 'omelette';

select sum((i.protein * (di.quantity * c.grams)) / 100) as total_protein
from dish_ingredient di natural join ingredients i natural join convert_to_grams c
where di.dish_name = 'pasta alfredo';

--3-- Complex query -- A query that finds all the dishes where an ingredient is considered a protein
select distinct di.dish_name
from dish_ingredient di natural join ingredients i
where i.protein > 20;



------------- EXTRA QUERIES --------------
-- A query that lists the experience and the rating of each chef, ordered by rating in descending order
select chef_name, experience, rating
from chef
order by rating desc;

-- A query that finds all the dishes classified as entrees
select dish_name
from dishes
where meal_type = 'entree';

-- A query that lists the dishes with high cholesterol content
select di.dish_name, sum((i.cholesterol * (di.quantity * c.grams)) / 100) as total_cholesterol
from dish_ingredient di natural join ingredients i natural join convert_to_grams c
group by di.dish_name
having sum((i.cholesterol * (di.quantity * c.grams)) / 100) > 200;

-- A query that lists the dishes that have peanuts 
select distinct di.dish_name
from dish_ingredient di
join ingredients i on di.ingredient_name = i.ingredient_name
where i.haspeanuts = true;

-- A query that lists the dishes that have eggs
select distinct di.dish_name
from dish_ingredient di
join ingredients i on di.ingredient_name = i.ingredient_name
where i.haseggs = true;

-- A query that lists the dishes that use the maximum amount of salmon
select dish_name
from dish_ingredient
where ingredient_name = 'salmon'
and quantity = (select max(quantity)
                from dish_ingredient
                where ingredient_name = 'salmon')