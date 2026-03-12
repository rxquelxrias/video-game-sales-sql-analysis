CREATE DATABASE vgsales;

CREATE TABLE genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(100) NOT NULL
);

CREATE TABLE publisher (
	publisher_id SERIAL PRIMARY KEY,
	publisher_name VARCHAR(100) NOT NULL
);

CREATE TABLE platform (
	platform_id SERIAL PRIMARY KEY,
	plaftform_name VARCHAR(100) NOT NULL
);

CREATE TABLE games (
	game_id SERIAL PRIMARY KEY,
	game_name VARCHAR(255) NOT NULL,
	genre_id INT REFERENCES genre(genre_id),
	publisher_id INT REFERENCES publisher(publisher_id)
);

CREATE TABLE game_platform (
	game_platform_id SERIAL PRIMARY KEY,
	game_id INT REFERENCES games(game_id),
	platform_id INT REFERENCES platform(platform_id),
	game_year INT,
	na_sales NUMERIC(16,2),
	eu_sales NUMERIC(16,2),
	jp_sales NUMERIC (16,2),
	other_sales NUMERIC (16,2),
	global_sales NUMERIC (16,2)

);
