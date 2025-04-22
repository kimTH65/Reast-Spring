
CREATE TABLE board
(
  board_number   INT         NOT NULL AUTO_INCREMENT COMMENT 'board num',
  title          TEXT        NOT NULL COMMENT 'board title',
  content        TEXT        NOT NULL COMMENT 'board content',
  write_datetime DATETIME    NOT NULL COMMENT 'write datetime',
  favorite_count INT         NOT NULL DEFAULT 0 COMMENT 'fav count',
  comment_count  INT         NOT NULL DEFAULT 0 COMMENT 'comment count',
  view_count     INT         NOT NULL DEFAULT 0 COMMENT 'view count',
  write_email    VARCHAR(50) NOT NULL COMMENT 'user email',
  PRIMARY KEY (board_number)
) COMMENT 'board table';

CREATE TABLE comment
(
  comment_number INT         NOT NULL AUTO_INCREMENT COMMENT 'comment_num',
  content        TEXT        NOT NULL COMMENT 'content',
  write_datetime DATETIME    NOT NULL COMMENT 'write_time',
  user_email     VARCHAR(50) NOT NULL COMMENT 'user email',
  board_number   INT         NOT NULL COMMENT 'board num',
  PRIMARY KEY (comment_number)
) COMMENT 'comment table';

CREATE TABLE favorite
(
  user_email   VARCHAR(50) NOT NULL COMMENT 'user email',
  board_number INT         NOT NULL COMMENT 'board num',
  PRIMARY KEY (user_email, board_number)
) COMMENT 'favorite table';

CREATE TABLE image
(
  board_number INT  NOT NULL COMMENT 'board num',
  image        TEXT NOT NULL COMMENT 'image url'
) COMMENT 'image table';

CREATE TABLE search_log
(
  sequence      INT     NOT NULL AUTO_INCREMENT COMMENT 'sequence',
  search_word   TEXT    NOT NULL COMMENT 'search word',
  relation_word TEXT    NULL     COMMENT 'realation word',
  relation      BOOLEAN NOT NULL COMMENT 'relation',
  PRIMARY KEY (sequence)
) COMMENT 'search_log table';

CREATE TABLE user
(
  email          VARCHAR(50)  NOT NULL COMMENT 'user email',
  password       VARCHAR(100) NOT NULL COMMENT 'user password',
  nickname       VARCHAR(20)  NOT NULL UNIQUE COMMENT 'user name',
  tel_number     VARCHAR(15)  NOT NULL UNIQUE COMMENT 'user tel',
  address        TEXT         NOT NULL COMMENT 'user address',
  address_detail TEXT         NULL     COMMENT 'address detail',
  profle_image   TEXT         NULL     COMMENT 'profile url',
  PRIMARY KEY (email)
) COMMENT 'user table';

ALTER TABLE image
  ADD CONSTRAINT FK_board_TO_image
    FOREIGN KEY (board_number)
    REFERENCES board (board_number);

ALTER TABLE board
  ADD CONSTRAINT FK_user_TO_board
    FOREIGN KEY (write_email)
    REFERENCES user (email);

ALTER TABLE favorite
  ADD CONSTRAINT FK_user_TO_favorite
    FOREIGN KEY (user_email)
    REFERENCES user (email);

ALTER TABLE favorite
  ADD CONSTRAINT FK_board_TO_favorite
    FOREIGN KEY (board_number)
    REFERENCES board (board_number);

ALTER TABLE comment
  ADD CONSTRAINT FK_user_TO_comment
    FOREIGN KEY (user_email)
    REFERENCES user (email);

ALTER TABLE comment
  ADD CONSTRAINT FK_board_TO_comment
    FOREIGN KEY (board_number)
    REFERENCES board (board_number);

CREATE USER 'developer'@'*' IDENTIFIED BY 'Passw0rd!';

CREATE VIEW board_list_view AS
SELECT 
    B.board_number AS board_number,
    B.title AS title,
    B.content AS content,
    I.image AS title_image,
    B.view_count AS view_count,
    B.favorite_count AS favorite_count,
    B.comment_count AS comment_count,
    B.write_datetime AS write_datetime,
    B.writer_email AS writer_email,
    U.nickname AS writ_nickname,
    U.profle_image AS writer_profile_image
FROM board AS B
INNER JOIN user AS U
ON B.writer_email = U.email
LEFT JOIN (SELECT board_number, ANY_VALUE(image) AS image FROM image GROUP BY board_number) AS I
ON B.board_number = I.board_number