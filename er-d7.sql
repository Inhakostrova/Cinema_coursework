CREATE DATABASE cinema_7;
USE cinema_7;

CREATE TABLE IF NOT EXISTS `transaction` (
	`tr_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`u_id` int NOT NULL,
	`payment_date` date NOT NULL,
	`payment_status` varchar(20) NOT NULL,
	`total_price` decimal(10) NOT NULL DEFAULT '2',
	PRIMARY KEY (`tr_id`)
);

CREATE TABLE IF NOT EXISTS `hall` (
	`hall_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`c_id` int NOT NULL,
	`hall_no` int  NOT NULL,
	PRIMARY KEY (`hall_id`)
);

CREATE TABLE IF NOT EXISTS `place` (
	`place_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`hall_id` int NOT NULL,
	`row_no` int NOT NULL,
	`seat_no` int NOT NULL,
	`seat_type` varchar(255) NOT NULL,
    `place_price` int NOT null,
	PRIMARY KEY (`place_id`)
);

CREATE TABLE IF NOT EXISTS `movie` (
	`m_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`m_name` varchar(255) NOT NULL,
	`m_type` varchar(255) NOT NULL,
	`m_duration` int NOT NULL,
	`genre` varchar(255) NOT NULL,
	PRIMARY KEY (`m_id`)
);

CREATE TABLE IF NOT EXISTS `user` (
	`u_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`u_first_name` varchar(255) NOT NULL,
	`u_last_name` varchar(255) NOT NULL,
	`u_email` varchar(255) NOT NULL,
	`u_phone` varchar(255) NOT NULL,
	`u_password` varchar(255) NOT NULL,
    `gender` varchar(255) NOT NULL,
	`birth_date` date NOT NULL,
	PRIMARY KEY (`u_id`)
);

CREATE TABLE IF NOT EXISTS `tickets` (
	`ticket_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`tr_id` int NOT NULL,
	`place_id` int NOT NULL,
	`sch_id` int NOT NULL,

	PRIMARY KEY (`ticket_id`)
);

CREATE TABLE IF NOT EXISTS `schedule` (
	`sch_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`hall_id` int NOT NULL,
	`show_date` date NOT NULL,
	`show_time` time NOT NULL,
	`admin_id` int NOT NULL,
	`m_id` int NOT NULL,
	PRIMARY KEY (`sch_id`)
);

CREATE TABLE IF NOT EXISTS `cinema` (
	`c_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`c_name` varchar(100) NOT NULL,
	`c_address` varchar(100) NOT NULL,
	PRIMARY KEY (`c_id`)
);

CREATE TABLE IF NOT EXISTS `admin` (
	`admin_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`admin_first_name` varchar(255) NOT NULL,
	`admin_last_name` varchar(255) NOT NULL,
	`admin_email` varchar(255) NOT NULL,
	`admin_phone` varchar(255) NOT NULL,
	`admin_password` varchar(255) NOT NULL,
    `gender` varchar(255) NOT NULL,
	PRIMARY KEY (`admin_id`)
);

ALTER TABLE `transaction` ADD CONSTRAINT `transaction_fk1` FOREIGN KEY (`u_id`) REFERENCES `user`(`u_id`);
ALTER TABLE `hall` ADD CONSTRAINT `hall_fk1` FOREIGN KEY (`c_id`) REFERENCES `cinema`(`c_id`);
ALTER TABLE `place` ADD CONSTRAINT `place_fk1` FOREIGN KEY (`hall_id`) REFERENCES `hall`(`hall_id`);


ALTER TABLE `tickets` ADD CONSTRAINT `tickets_fk1` FOREIGN KEY (`tr_id`) REFERENCES `transaction`(`tr_id`);

ALTER TABLE `tickets` ADD CONSTRAINT `tickets_fk2` FOREIGN KEY (`place_id`) REFERENCES `place`(`place_id`);

ALTER TABLE `tickets` ADD CONSTRAINT `tickets_fk3` FOREIGN KEY (`sch_id`) REFERENCES `schedule`(`sch_id`);
ALTER TABLE `schedule` ADD CONSTRAINT `schedule_fk1` FOREIGN KEY (`hall_id`) REFERENCES `hall`(`hall_id`);

ALTER TABLE `schedule` ADD CONSTRAINT `schedule_fk4` FOREIGN KEY (`admin_id`) REFERENCES `admin`(`admin_id`);

ALTER TABLE `schedule` ADD CONSTRAINT `schedule_fk5` FOREIGN KEY (`m_id`) REFERENCES `movie`(`m_id`);








