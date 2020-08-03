DROP TABLE IF EXISTS user;

DROP TABLE IF EXISTS expense;

DROP TABLE IF EXISTS admin;

DROP TABLE IF EXISTS log;
DROP TABLE IF EXISTS user;

DROP TABLE IF EXISTS expense;

DROP TABLE IF EXISTS admin;

DROP TABLE IF EXISTS log;
DROP TABLE IF EXISTS user;

DROP TABLE IF EXISTS expense;

DROP TABLE IF EXISTS admin;

DROP TABLE IF EXISTS log;
DROP TABLE IF EXISTS user;

DROP TABLE IF EXISTS expense;

DROP TABLE IF EXISTS admin;

DROP TABLE IF EXISTS log;


-- 사용자
CREATE TABLE user (
		user_no INTEGER NOT NULL,
		name VARCHAR(50) NOT NULL,
		image VARCHAR(255) NULL,
		id VARCHAR(50) NOT NULL,
		password VARCHAR(150) NOT NULL,
		alterkey VARCHAR(100) NULL
);

-- 사용자
ALTER TABLE user
	ADD CONSTRAINT PK_user -- 사용자 기본키
	PRIMARY KEY (
		user_no -- 사용자번호
	);

ALTER TABLE user
	MODIFY COLUMN user_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE user
	MODIFY COLUMN user_no INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 경비
CREATE TABLE expense (
		expense_no INTEGER NOT NULL,
		user_no INTEGER NOT NULL,
		name VARCHAR(50) NULL,
		use_date DATE NULL,
		use_price VARCHAR(50) NULL,
		approve_price VARCHAR(50) NULL,
		process_status VARCHAR(50) NULL,
   		registration_date DATE DEFAULT CURRENT_DATE,           -- 등록일
		receipt VARCHAR(255) NULL,
		process_date DATETIME NULL,
		remark VARCHAR(70) NULL
);

-- 경비
ALTER TABLE expense
	ADD CONSTRAINT PK_expense -- 경비 기본키
	PRIMARY KEY (
		expense_no -- 경비번호
	);

ALTER TABLE expense
	MODIFY COLUMN expense_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE expense
	MODIFY COLUMN expense_no INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 관리자
CREATE TABLE admin (
		admin_no INTEGER NOT NULL,
		id VARCHAR(50) NOT NULL,
		password VARCHAR(255) NOT NULL
);

-- 관리자
ALTER TABLE admin
	ADD CONSTRAINT PK_admin -- 관리자 기본키
	PRIMARY KEY (
		admin_no -- 관리자번호
	);

ALTER TABLE admin
	MODIFY COLUMN admin_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE admin
	MODIFY COLUMN admin_no INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 경비
ALTER TABLE expense
	ADD CONSTRAINT FK_user_TO_expense -- 사용자 -> 경비
	FOREIGN KEY (
		user_no -- 사용자번호
	)
	REFERENCES user ( -- 사용자
		user_no -- 사용자번호
	)
	ON DELETE CASCADE;
	
CREATE TABLE log (
		log_no INTEGER NOT NULL,
		user_no INTEGER NOT NULL,
		log_in VARCHAR(150) NULL,
		log_out VARCHAR(150) NULL
);

ALTER TABLE log
	ADD CONSTRAINT PK_log -- 관리자 기본키
	PRIMARY KEY (
		log_no -- 관리자번호
	);
	
ALTER TABLE log
	MODIFY COLUMN log_no INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE log
	MODIFY COLUMN log_no INTEGER NOT NULL AUTO_INCREMENT(1,1);
	
-- 경비
ALTER TABLE log
	ADD CONSTRAINT FK_user_TO_log -- 사용자 -> 경비
	FOREIGN KEY (
		user_no -- 사용자번호
	)
	REFERENCES user ( -- 사용자
		user_no -- 사용자번호
	)
	ON DELETE CASCADE;
	
-- 이벤트 
CREATE EVENT IF NOT EXISTS log_delete
    ON SCHEDULE
       EVERY 1 DAY
    ON COMPLETION NOT PRESERVE
    ENABLE
    COMMENT "로그인, 로그아웃 기록 삭제"
    DO 
    delete from log;

	
	