-- creat user
INSERT INTO user VALUES ('email@email.com','Password1','nickname','08012345678','tokyo','shinjuku',null);

-- login
SELECT * FROM user WHERE email = 'email@email.com'

-- create board
INSERT INTO board(title,content,write_datetime,favorite_count,comment_count,view_count,writer_email)
VALUES ('test_title','test_content','2025-04-15 00:07',0,0,0,'email@email.com');

-- create board image
INSERT INTO iamge(board_number,image) VALUES(1,'url');

-- create comment
INSERT INTO comment (content, write_datetime,user_email,board_number)
VALUES('hello world', '2025-04-15 00:18', 'email@email.com',1);

UPDATE board SET comment_count = comment_count +1 WHERE board_number = 1;

-- like 
INSERT INTO
favorite VALUES ('email@email.com',1);

UPDATE board SET favorite_count = favorite_count +1 WHERE board_number = 1;

-- unLike
INSERT INTO
favorite WHERE user_email = 'email@email.com' AND board_number = 1;

UPDATE board SET favorite_count = favorite_count -1 WHERE board_number = 1;

-- board fix
UPDATE board SET title = 'fix title', content = 'fix content', where board_number = 1;

DELETE FROM image WHERE board_number = 1;

INSERT INTO iamge(board_number,image) VALUES(1,'url');

-- board delete
DELETE FROM comment WHERE board_number = 1;

DELETE FROM favorite WHERE board_number = 1;

DELETE FROM board WHERE board_number = 1;

-- board load 
SELECT 
    B.board_number AS board_number,
    B.title AS title,
    B.content AS content,
    B.write_datetime AS write_datetime,
    B.writer_email AS writer_email,
    U.nickname AS nickname,
    U.profle_image AS profle_image
FROM board AS B
INNER JOIN user AS U
ON B.writer_email = U.email
WHERE board_number = 1;

SELECT image
FROM image WHERE board_number = 1;

SELECT 
    U.email AS email,
    U.nickname AS nickname,
    U.profle_image
FROM favorite AS F
INNER JOIN user AS U
ON F.user_email = U.email
WHERE F.board_number = 1;

SELECT 
    U.nickname AS nickname,
    U.profle_image AS profle_image,
    C.write_datetime AS write_datetime,
    C.content AS content
FROM comment AS C
INNER JOIN user AS U
ON C.user_email = U.email
WHERE C.board_number = 1
ORDER BY write_datetime DESC;

-- recent board load
SELECT * FROM board_list_view
ORDER BY write_datetime DESC
LIMIT 0,5;

-- searchd board
SELECT * FROM board_list_view
WHERE title LIKE '%fix%' OR content LIKE '%fix%'
ORDER BY write_datetime DESC;

-- week top3 board
SELECT * FROM board_list_view
WHERE write_datetime BETWEEN 'yyyy-mm-dd 00:00' AND 'yyyy-mm-dd 00:00'
ORDER BY favorite_count DESC, comment_count DESC, view_count DESC, write_datetime DESC
LIMIT 3;

-- selected user board
SELECT * FROM board_list_view
WHERE writer_email = 'email@email.com'
ORDER BY write_datetime DESC;

-- popular searches 
SELECT search_word, count(search_word) AS count
FROM search_log
WHERE relation IS FALSE
GROUP BY search_word
ORDER BY count DESC
LIMIT 15;

-- related searches
SELECT relation_word, count(relation_word) AS count
FROM search_log
WHERE search_word = 'search'
GROUP BY relation_word
ORDER BY count DESC
LIMIT 15;

-- user information
SELECT *
FROM user
WHERE email = 'email@email.com';

-- user nickname fix
UPDATE user SET nickname = 'fix nickname' WHERE email = 'email@email.com';

-- user profile image fix
UPDATE user SET profle_image = 'fix proifle' WHERE email = 'email@email.com';