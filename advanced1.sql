CREATE TABLE `News` (
	`ID_News` varchar(11) NOT NULL  ,
	`Start` DATE NOT NULL,
	`End` DATE NOT NULL,
	`NewsTitle` VARCHAR(50) NOT NULL,
	`NewsDesc` VARCHAR(200) NOT NULL,
	PRIMARY KEY (`ID_News`)
);

CREATE TABLE `Images` (
	`ID_Images` varchar(11) NOT NULL  ,
	`ID_News` varchar(11) NOT NULL,
	`ImageDesc` VARCHAR(200) NOT NULL  ,
	PRIMARY KEY (`ID_Images`)
);

CREATE TABLE `Lecturer` (
	`NIK` varchar(11) NOT NULL  ,
	`ID_User` VARCHAR(50) NOT NULL  ,
	`Email` VARCHAR(50) NOT NULL  ,
	`Name` VARCHAR(50) NOT NULL  ,
	PRIMARY KEY (`NIK`)
);

CREATE TABLE `User` (
	`ID_User` varchar(11) NOT NULL  ,
	`Email` VARCHAR(50) NOT NULL  ,
	`Password` VARCHAR(20) NOT NULL  ,
	PRIMARY KEY (`ID_User`)
);

CREATE TABLE `CourseField` (
	`NIK` varchar(11) NOT NULL  ,
	`ID_Course` varchar(11) NOT NULL  ,
	PRIMARY KEY (`NIK`,`ID_Course`)
);

CREATE TABLE `Course` (
	`ID_Course` varchar(11) NOT NULL  ,
	`CourseTitle` VARCHAR(50) NOT NULL  ,
	`CourseDesc` VARCHAR(200) NOT NULL  ,
	`CoursePurpose` VARCHAR(200) NOT NULL,
	`Semester` INT NOT NULL,
	`Precondition` varchar(11) NOT NULL,
	`SKSweight` INT NOT NULL,
	PRIMARY KEY (`ID_Course`)
);

CREATE TABLE `Student` (
	`NIM` varchar(11) NOT NULL  ,
	`ID_User` VARCHAR(50) NOT NULL,
	`Name` VARCHAR(50) NOT NULL,
	`Email` VARCHAR(50) NOT NULL,
	`Year` INT NOT NULL,
	PRIMARY KEY (`NIM`)
);

CREATE TABLE `Facility` (
	`ID_Facility` varchar(11) NOT NULL,
	`FacTitle` VARCHAR(50) NOT NULL,
	`FacDesc` VARCHAR(200) NOT NULL,
	`FacImg` VARCHAR(200) NOT NULL,
	`PIC` varchar(11) NOT NULL,
	PRIMARY KEY (`ID_Facility`)
);

CREATE TABLE `EduBG` (
	`ID_Edu` varchar(11) NOT NULL  ,
	`NIK` varchar(11) NOT NULL  ,
	`EduTitle` VARCHAR(50) NOT NULL,
	`EduDesc` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`ID_Edu`)
);

CREATE TABLE `Position` (
	`ID_Position` varchar(11) NOT NULL  ,
	`NIK` varchar(11) NOT NULL,
	`PosType` BINARY NOT NULL,
	`PosTitle` varchar(50) NOT NULL,
	PRIMARY KEY (`ID_Position`)
);

CREATE TABLE `ResearchArea` (
	`ID_RA` varchar(11) NOT NULL  ,
	`NIK` varchar(11) NOT NULL  ,
	`RATitle` VARCHAR(50) NOT NULL,
	`RADesc` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`ID_RA`)
);

CREATE TABLE `Publication` (
	`ID_Publication` varchar(11) NOT NULL  ,
	`ID_RA` varchar(11) NOT NULL  ,
	`NIK` varchar(11) NOT NULL  ,
	`PubTitle` VARCHAR(50) NOT NULL  ,
	`PubDesc` VARCHAR(200) NOT NULL  ,
	PRIMARY KEY (`ID_Publication`)
);

ALTER TABLE `Images` ADD CONSTRAINT `Images_fk0` FOREIGN KEY (`ID_News`) REFERENCES `News`(`ID_News`);

ALTER TABLE `Lecturer` ADD CONSTRAINT `Lecturer_fk0` FOREIGN KEY (`ID_User`) REFERENCES `User`(`ID_User`);

ALTER TABLE `CourseField` ADD CONSTRAINT `CourseField_fk0` FOREIGN KEY (`NIK`) REFERENCES `Lecturer`(`NIK`);

ALTER TABLE `CourseField` ADD CONSTRAINT `CourseField_fk1` FOREIGN KEY (`ID_Course`) REFERENCES `Course`(`ID_Course`);

ALTER TABLE `Course` ADD CONSTRAINT `Course_fk0` FOREIGN KEY (`Precondition`) REFERENCES `Course`(`ID_Course`);

ALTER TABLE `Student` ADD CONSTRAINT `Student_fk0` FOREIGN KEY (`ID_User`) REFERENCES `User`(`ID_User`);

ALTER TABLE `Facility` ADD CONSTRAINT `Facility_fk0` FOREIGN KEY (`PIC`) REFERENCES `Lecturer`(`NIK`);

ALTER TABLE `EduBG` ADD CONSTRAINT `EduBG_fk0` FOREIGN KEY (`NIK`) REFERENCES `Lecturer`(`NIK`);

ALTER TABLE `Position` ADD CONSTRAINT `Position_fk0` FOREIGN KEY (`NIK`) REFERENCES `Lecturer`(`NIK`);

ALTER TABLE `ResearchArea` ADD CONSTRAINT `ResearchArea_fk0` FOREIGN KEY (`NIK`) REFERENCES `Lecturer`(`NIK`);

ALTER TABLE `Publication` ADD CONSTRAINT `Publication_fk0` FOREIGN KEY (`ID_RA`) REFERENCES `ResearchArea`(`ID_RA`);

ALTER TABLE `Publication` ADD CONSTRAINT `Publication_fk1` FOREIGN KEY (`NIK`) REFERENCES `Lecturer`(`NIK`);

