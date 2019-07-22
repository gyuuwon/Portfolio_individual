-- user 
CREATE TABLE port_user(
	uno int PRIMARY KEY auto_increment,
	umail VARCHAR(50) NOT NULL UNIQUE,
	umailVendor VARCHAR(50) NOT NULL,
	upw VARCHAR(50) NOT NULL,
	uname VARCHAR(50) NOT NULL,
	uphone VARCHAR(50) NOT NULL,
	gender VARCHAR(50) NOT NULL,
	upoint int NOT NULL DEFAULT 0
);

SELECT * FROM port_user;

-- port_board
CREATE TABLE port_tbl_board(
	n_bno INT PRIMARY KEY auto_increment,
	n_title VARCHAR(200) NOT NULL,
	n_content text NULL,
	n_writer VARCHAR(50) NOT NULL,
	n_regdate TIMESTAMP NOT NULL DEFAULT now(),
	n_viewcnt INT DEFAULT 0,
	n_showboard VARCHAR(10) NULL DEFAULT 'Y',
	n_uno INT NOT NULL
);

DROP TABLE port_tbl_board;
SELECT * FROM port_tbl_board;

-- port_sboard
ALTER TABLE port_re_tbl_board ADD CONSTRAINT fk_port_re_tbl_board_uno
FOREIGN KEY (uno) REFERENCES port_user(uno);

CREATE TABLE port_re_tbl_board(
	bno INT PRIMARY KEY auto_increment,
	title VARCHAR(200) NOT NULL,
	content TEXT NOT NULL,
	writer VARCHAR(45) NOT NULL,
	origin INT NULL DEFAULT 0,
	depth INT NULL DEFAULT 0,
	seq INT NULL DEFAULT 0,
	regdate TIMESTAMP NULL DEFAULT now(),
	updatedate TIMESTAMP NULL DEFAULT now(),
	viewcnt INT NULL DEFAULT 0,
	showboard VARCHAR(10) NULL DEFAULT 'Y',
	uno INT NOT NULL
);

SELECT * FROM port_re_tbl_board;

