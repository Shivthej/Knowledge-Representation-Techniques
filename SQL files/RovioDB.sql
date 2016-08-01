--Written by Annu Kuriakose, 02/18/2016
--creating the database - roviodb
drop database if exists roviodb;
create database roviodb;
use roviodb;

--creating tables required for roviodb
drop table if exists cookbook;
create table cookbook(
	COOKBOOKID varchar(2) not null,
	TITLE      varchar(40),
	AUTHOR	   varchar(20),
	primary key(COOKBOOKID)
);

drop table if exists recipe;
create table recipe(
	RECIPEID varchar(2) not null,
	NAME varchar(15),
	SERVES varchar(2),
	SUMMARY varchar(70),
	primary key (RECIPEID)
);

drop table if exists cookbook_recipe;
create table cookbook_recipe(
	COOKBOOKID varchar(2) not null,
	RECIPEID varchar(2) not null,
	primary key (COOKBOOKID, RECIPEID),
	foreign key (COOKBOOKID) references cookbook (COOKBOOKID),
	foreign key (RECIPEID) references recipe (RECIPEID)
);

drop table if exists instruction;
create table instruction(
	INSTRUCTIONID varchar(3) not null,
	COMMAND varchar(80),
	primary key (INSTRUCTIONID)
);

drop table if exists recipe_instruction;
create table recipe_instruction(
	RECIPEID varchar(2) not null,
	INSTRUCTIONID varchar(3) not null,
	ORDER1 int,
	primary key (RECIPEID, INSTRUCTIONID),
	foreign key (INSTRUCTIONID) references instruction (INSTRUCTIONID),
	foreign key (RECIPEID) references recipe (RECIPEID)
);

drop table if exists ingredient;
create table ingredient(
	INGREDIENTID varchar(2) not null,
	NAME varchar(15),
	SUBSTITUTE varchar(10),
	primary key (INGREDIENTID)
);

drop table if exists recipe_ingredient;
create table recipe_ingredient(
	RECIPEID varchar(2) not null,
	INGREDIENTID varchar(2) not null,
	AMOUNT decimal(5,2),
	UNIT varchar(5),
	primary key (RECIPEID, INGREDIENTID),
	foreign key (RECIPEID) references recipe (RECIPEID),
	foreign key (INGREDIENTID) references ingredient (INGREDIENTID)
);

--inserting the values to all the tables in roviodb
insert into cookbook values
(21, 'Angry Birds Bad Piggies Egg Recipes', 'Bonnier Kirjat Oy'),
(22, 'The Cookbook Library', 'Anne Willan'),
(23, 'The Fat Cookbook', 'Fran McCullough'),
(24, 'Bake Love Write', 'Lois Winston');

insert into recipe values
(11, 'Grilled Delight', 4, 'A tasty grilled egg dish to be served with vegetable salad'),
(12, 'Oven Made', 2, 'Oven made egg - a delicacy with chives, peper and grated cheese'),
(13, 'Egg Bhurji', 2, 'A spiced up scrambled eggs with onions, tomatoes spices etc..');

insert into cookbook_recipe values
(21, 11),
(21, 12),
(22, 13);

insert into instruction values
(101, 'Fire up an outdoor grill.'),
(102, 'Use a muffin pan: coat all cups with cooking spray and break one egg per cup'),
(406, 'Place the pan on the grill and cook for 2-3 min over medium heat.'),
(109, 'Serve with mixed vegetables/salad.'),
(201, 'preheat the oven to 325 degree.'),
(202, 'Grease inside of a ramekin with butter and pour the cream on the bottom.'),
(203, 'Break egg on top of cream without breaking yolk.'),
(204, 'Add salt pepper chives and grated cheese.'),
(205, 'Bake for 12 to 15 min or until the whites have set.'),
(206, 'Remove from oven and allow to set for 2 to 3 min before serving.'),
(501, 'Finely chop the onion, chilli, tomato, ginger and cilantro leaves.'),
(502, 'Break the Eggs. Beat the eggs and add milk and salt.'),
(506, 'In a shallow frying pan heat butter, add onions and cook partly.'),
(509, 'Add all veggies except cilantro.Add spices to taste.Fry till tomatoes are mushy.'),
(503, 'Add beaten eggs mixture. Stir continously till eggs are cooked and firm.'),
(504, 'Remove pan and garnish egg bhurji with coriander.'),
(505, 'Server with buttered toast or fried bread or with roti or parathas');

insert into recipe_instruction values
(11, 101, 1),
(11, 102, 2),
(11, 406, 3),
(11, 109, 4),
(12, 201, 1),
(12, 202, 2),
(12, 203, 3),
(12, 204, 4),
(12, 205, 5),
(12, 206, 6),
(13, 501, 1),
(13, 502, 2),
(13, 506, 3),
(13, 509, 4),
(13, 503, 5),
(13, 504, 6),
(13, 505, 7);

insert into ingredient values
(41, 'Egg', null),
(42, 'Butter', 'Olive oil'),
(43, 'Cream', null),
(44, 'Salt', null),
(45, 'Pepper', 'Chilli'),
(46, 'Minced Chives', null),
(47, 'Grated Cheese', null),
(48, 'Onions', null),
(49, 'Tomato', null),
(50, 'Ginger', null),
(51, 'Chilli', 'Pepper'),
(52, 'Coriander', null),
(53, 'Cooking Spray', null);

insert into recipe_ingredient values
(11, 41, 10, 'Nos'),
(11, 53, 1, 'Nos'),
(12, 41, 2, 'Nos'),
(12, 43, 2, 'tbsp'),
(12, 46, 1, 'tbsp'),
(12, 44, 1, 'tbsp'),
(12, 45, 1, 'tbsp'),
(12, 47, 1, 'tbsp'),
(12, 42, 1, 'tbsp'),
(13, 41, 3, 'Nos'),
(13, 48, 1, 'Nos'),
(13, 42, 1, 'tbsp'),
(13, 49, 1, 'Nos'),
(13, 50, 1, 'tbsp'),
(13, 51, 1, 'Nos'),
(13, 52, null, null),
(13, 44, 1, 'tbsp');