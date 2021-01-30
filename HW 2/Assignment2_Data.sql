CREATE TABLE members (
memb_no int NOT NULL,
name varchar(64) NOT NULL,
PRIMARY KEY (memb_no));

CREATE TABLE books (
isbn int NOT NULL,
title varchar(64) NOT NULL,
authors varchar(128) NOT NULL,
publisher varchar(128) NOT NULL,
PRIMARY KEY (isbn));


CREATE TABLE borrowed (
memb_no int NOT NULL,
isbn int NOT NULL,
PRIMARY KEY (memb_no, isbn),
FOREIGN KEY (memb_no) REFERENCES members(memb_no),
FOREIGN KEY (isbn) REFERENCES books(isbn));


INSERT INTO members VALUES (001,"Angela");
INSERT INTO members VALUES (002,"Sam");
INSERT INTO members VALUES (003,"Kim");
INSERT INTO members VALUES (004,"Wu");
INSERT INTO members VALUES (005,"John");

INSERT INTO books VALUES (010000,"Math","MathAuthor", "McGraw-Hill");
INSERT INTO books VALUES (010101,"Stat","StatAuthor", "Pearson");
INSERT INTO books VALUES (101010,"English","EnglishAuthor", "McGraw-Hill");
INSERT INTO books VALUES (100101,"Spanish","SpanishAuthor", "pearson");
INSERT INTO books VALUES (000001,"C S","C SAuthor", "Oxford");

INSERT INTO borrowed VALUES (003,"010101");
INSERT INTO borrowed VALUES (005,"000001");
INSERT INTO borrowed VALUES (001,"010000");
INSERT INTO borrowed VALUES (004,"100101");
INSERT INTO borrowed VALUES (002,"010000");
INSERT INTO borrowed VALUES (002,"101010");
INSERT INTO borrowed VALUES (002,"100101");