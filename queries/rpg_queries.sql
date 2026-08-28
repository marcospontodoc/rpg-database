SELECT *
FROM player;

SELECT name, level
FROM character
WHERE level > 25;

SELECT name, level
FROM character
ORDER BY level DESC;

SELECT 
	c.name AS character_name, 
	cl.name AS classe_name, 
	c.level AS character_level
FROM character c
JOIN class cl
	ON c.id_class = cl.id_class
ORDER BY level DESC

SELECT 
	p.name AS player_name, 
	c.name AS character_name,
	cl.name AS class_name,
	level
FROM character c
JOIN player p
	ON c.id_player = p.id_player
JOIN class cl
	ON c.id_class = cl.id_class
ORDER BY level DESC

SELECT
    p.name AS player_name,
    COUNT(c.id_character) AS total_characters
FROM player p
LEFT JOIN character c
    ON p.id_player = c.id_player
GROUP BY p.id_player, p.name
ORDER BY total_characters DESC;

SELECT
	p.name AS player_name,
	COUNT(c.id_character) AS character_quantity
FROM character c
JOIN player p
	ON c.id_player = p.id_player
GROUP BY p.id_player
HAVING 
    COUNT(c.id_character) > 1
ORDER BY character_quantity DESC;

SELECT	
	c.name as character_name,
	level
FROM character c
WHERE
	level > (
SELECT
	AVG(level)
FROM character
)