
INSERT INTO genre(genre_name)
SELECT DISTINCT genre FROM staging_vgsales;

SELECT * FROM genre;

INSERT INTO platform(platform_name)
SELECT DISTINCT platform FROM staging_vgsales;

SELECT * FROM platform;

INSERT INTO publisher(publisher_name)
SELECT DISTINCT publisher FROM staging_vgsales;

SELECT DISTINCT COUNT(*) FROM publisher;

INSERT INTO games (game_name, genre_id, publisher_id)
SELECT DISTINCT s.name, g.genre_id, p.publisher_id 
FROM staging_vgsales s
JOIN genre g 
	ON s.genre = g.genre_name
JOIN publisher p
	ON s.publisher = p.publisher_name;

SELECT * FROM games LIMIT 20;

SELECT genre_name FROM genre WHERE genre_id = 2;

INSERT INTO game_platform (game_id, platform_id, game_year, na_sales, eu_sales, jp_sales, other_sales, global_sales)
SELECT g.game_id, p.platform_id, CAST(NULLIF(s.year, 'N/A') AS INT), s.na_sales, s.eu_sales, s.jp_sales, s.other_sales, s.global_sales
FROM staging_vgsales s
JOIN games g
	ON s.name = g.game_name
JOIN platform p
	ON s.platform = p.platform_name;

SELECT * FROM game_platform LIMIT 20;