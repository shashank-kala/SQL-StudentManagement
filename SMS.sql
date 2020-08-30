use srk;

 CREATE TABLE STUDENTINFO ( 
StudentId int not null auto_increment , 
FirstName varchar(255) not null, 
LastName varchar(255), 
Phone int not null, 
Street varchar(255), 
City varchar(255) , 
State varchar(255), 
Country varchar(255) , 
DOB date , 
Visa varchar(255) not null, 
Studenttype varchar(255) not null, 
Majorid varchar(255) not null,
FinanceID varchar(255) unique not null, 
primary key (StudentID)
); 
INSERT INTO StudentInfo
( FirstName, LastName, Phone,Street, City, State, Country  , DOB , Visa, Studenttype, 
Majorid, FinanceID )
VALUES
  ('John', 'Oliver', '010282320','ABC','NYC','NY', 'USA','1998-02-15','N','D','CS50001','FS7000'), 
  ('Lionel', 'Messi', '010282321','Talmadge','Poughkeepsie','USA', 'USA','1997-05-18','N','D','CS50001','FS7001'),
  ('Eden', 'Hazard', '010282322','william','Queens','', 'Belgium','1996-06-10','Y','I','IS50001','FS7002'),
  ('Didier', 'Drogba', '010282323','stlouis','NYC','NY', 'USA','1990-03-19','N','D','PS50001','FS7003'),
  ('John', 'Terry', '010282324','XYZ','Jersey','NJ', 'USA','1995-08-15','N','D','LW50001','FS7004');
  
ALTER TABLE StudentINFO AUTO_INCREMENT=1000;


CREATE TABLE FINANCE ( 
FinanceID varchar(255) not null,  
Studenttype varchar(255) not null, 
ScholarshipId varchar(255) not null,
Semfees int not null,
Duedate date ,
FOREIGN KEY (StudentId) REFERENCES StudentInfo(StudentID),
FOREIGN KEY (FinanceID) REFERENCES StudentInfo(FinanceID)
); 

INSERT INTO Finance
(StudentID, FinanceID ,  Studenttype , ScholarshipId , Semfees, Duedate)
VALUES
  ('1005','FS7000','D','DEAN10','9200','2020-02-15'), 
  ('1006','FS7001','D','DEAN10','9200','2020-02-15'),
  ('1007','FS7002','I','DEAN10','8400','2020-02-15'),
  ('1008','FS7003','D','DEAN20','9200','2020-02-15'),
  ('1009','FS7004','D','DEAN20','9200','2020-02-15');
  
CREATE TABLE STUDENTTYPE( 
StudentID int,
StudentType varchar(255),
SDescription varchar(255),
FOREIGN KEY (StudentID) REFERENCES StudentInfo(StudentID)
);  
INSERT INTO STUDENTTYPE
(StudentID,StudentType , SDescription )
VALUES
('1005','D','Domestic student'), 
  ('1006','D','Domestic student'),
  ('1007','I','International Student'),
  ('1008','D','Domestic student'),
  ('1009','D','Domestic student');
  

CREATE TABLE MAJORDETAILS ( 
StudentID int ,
MajorID varchar(255) not null , 
MName varchar(255) not null, 
Duration varchar(255), 
Credits int,
InstructorID varchar(255) not null , 
primary key (MajorID),
FOREIGN KEY (StudentID) REFERENCES StudentInfo(StudentID)
); 
INSERT INTO MAJORDETAILS (StudentID, MajorID , MName , Duration, Credits, InstructorID )
VALUES
  ('1005','CS50001','Computer Science','36 Months','60','INS0001'), 
  ('1006','BS50001', 'Business','36 Months','60','INS0002'),
  ('1007','IS50001','Information Systems','36 Months','60','INS0003'),
  ('1008','PS50001',' Political Science','36 Months','60','INS0004'),
  ('1009','LW50001',' Law','36 Months','60','INS0005');
  

CREATE TABLE GRADE( 
StudentID int ,
CourseID varchar(255) not null , 
Score varchar(255) not null, 
primary key (CourseID),
FOREIGN KEY (StudentID) REFERENCES StudentInfo(StudentID)
);
ALTER TABLE GRADE
ADD credits_comp varchar(255) not null;


INSERT INTO GRADE( 
StudentID ,
CourseID  , 
Score ) 
VALUES
  ('1005','CS1230','A'), 
  ('1006','BS2330', 'B'),
  ('1007','IS1110','A'),
  ('1008','PS0003','B'),
  ('1009','LW50053','A'); 
  
update  grade
set     credits_comp = 30
where   studentid = 1005;

update  grade
set     credits_comp = 30
where   studentid = 1006;

update  grade
set     credits_comp =30
where   studentid = 1007;

update  grade
set     credits_comp = 40
where   studentid = 1008;
update  grade
set     credits_comp = 45
where   studentid = 1009;


CREATE TABLE COURSEDETAILS( 
StudentID int ,
CourseID varchar(255) not null ,  
Duration varchar(255) not null,
offermode varchar(255),
primary key (CourseID),
FOREIGN KEY (StudentID) REFERENCES StudentInfo(StudentID)
); 
INSERT INTO Coursedetails( 
StudentID ,
CourseID  , 
Duration,
Offermode ) 
VALUES
  ('1005','CS1230','30 hours','Online'), 
  ('1006','BS2330', '30 hours','Online'),
  ('1007','IS1110','30 hours','Online'),
  ('1008','PS0003','30 hours','Online'),
  ('1009','LLW50053','30 hours','Online'); 
  
CREATE TABLE SCHEDULEDETAILS( 
InstructorID int not null,
CourseID varchar(255) not null , 
STime varchar(255) not null, 
BookID varchar(255) not null,
primary key (InstructorID),
FOREIGN KEY (CourseID) REFERENCES Coursedetails(CourseID)
); 
INSERT INTO Scheduledetails( 
InstructorID ,
CourseID  , 
STime , 
BookID  ) 
VALUES
  ('100','CS1230','6:30','1B'), 
  ('101','BS2330', '10:30','1W'),
  ('102','IS1110','1:00','1TH'),
  ('103','PS0003','6:30','1F'),
  ('104','LLW50053','9:30','1M'); 
  
  

CREATE TABLE INSTRUCTORDETAILS( 
InstructorID int,
Iname varchar(255),
Email varchar(255),
Phone varchar(255),
BId varchar(255) unique not null,
FOREIGN KEY (InstructorID) REFERENCES Scheduledetails(InstructorID)
);
INSERT INTO Instructordetails( 
InstructorID ,
Iname ,
Email ,
Phone ,
BID ) 
VALUES
  ('100','Alex','a1@gmail.com','02983289','B001'), 
  ('101','Jane', 'j1@gmail.com','0943840090','B002'),
  ('102','Michael','m1@gmail.com','082372947','B003'),
  ('103','Mitchel','m2@gmail.com','09023082','B004'),
  ('104','Shaun','S1@gmail.com','02983298303','B005'); 


CREATE TABLE BOOKDETAILS( 
BID varchar(255),
Bname varchar(255),
BDesc varchar(255),
FOREIGN KEY (BID) REFERENCES Instructordetails(BID)
); 
INSERT INTO Bookdetails( 
BID ,
Bname ,
BDesc ) 
VALUES
  ('B001','Math','Intro'), 
  ('B002','Statistics','Novice'),
  ('B003','Policies','ADvance'),
  ('B004','Business','Advance'),
  ('B005','Let us C', 'Programming'); 
    
    
SELECT
   studentid , courseid
FROM
   grade 
WHERE
    credits_comp < (
        select max(credits)
        from majordetails
    )
    order by studentid;
   


CREATE TABLE Student ( 
StudentID int,
Fname varchar(255) not null,
Mname varchar(255),
Lname varchar(255) not null,
primary key (StudentID)
);
INSERT INTO StudentInfo
( Fname,Mname,Lname )
VALUES
('1','Microsoft Visio' , 'Microsoft Access' , 'Book Database'),
 ('2','Microsoft Visio', 'Microsoft Access','membership database'),
 ('3','draw.io','MySQL', 'Movie/TV series streaming'),
('4','Lucid Charts ', 'MySQL' , 'Personal banking system'),
('5','Oracle SQL data modeler' ,'MySQL' ,  'Order Management System'),
('6','Smart Draw' ,'MySQL','Student Management System'),
('7','draw.io','MySQL', 'Red Fox Fitness Database'),
('8','Microsoft Visio','Microsoft Access', 'Town of Saranville Database'),
('9','Microsoft Visio','Microsoft Access', ' steam game database'), 

('10','Lucid Charts','PostgreSQL', 'small pc repair shops database'),
('11','Lucid Charts ','MySQL', 'Student Loan Database'),
('12','Lucid Charts','MySQL', 'Java/Minecraft Database'),
('13','Lucid Charts ','MySQL', 'Java/Minecraft Database'),
('14','Lucid Charts ',' MySQL', 'League of Legends Database'),
('15','Lucid Charts ','Microsoft Access', 'baseball statistic database'),
('16','Lucid Charts ','Microsoft Access', 'baseball statistic database'),
('17','Draw.io','MySQL','Game Library Database'),
('18','Visual Paradigm','Microsoft Access','Movie Database'),
('19','Lucid Charts','MySQL','Magic the Gathering'),
('20','Microsoft Visio','MySQL','Library Database'),
('21','Toad','Microsoft Access', 'X'),

('22','Lucid Charts','PostgreSQL','fashion database'),
('23','Lucid Charts','PostgreSQL','fashion database'),
('24','Lucid Charts', 'MySQL', 'CMOS database'),
('25','Microsoft Visio',	'Microsoft Access','IoT database'),
('26','Visual Paradigm', 'MySQL','computational linguistic database'),
('27','Microsoft Visio', 'Microsoft Access','Ken’s move data database'),
('28','Lucid Charts','MySQL', 'HOSPITAL MANAGEMENT SYSTEM'),
('30','Lucid Charts' , 'MySQL' ,'Industrial Waste Generation Analysis'),
('31','draw.io', 'Microsoft Access','Laboratory Database'),
('32','Lucid Charts' ,'Microsoft SQL Serve','Coffee Management System'),
('33','Lucid Charts' ,'MySQL' , 'Job Fair Management'),
('34','Lucid Charts' ,'MySQL',	'Job Fair Management'),
('35','Lucid Charts', 'MySQL','Payrole Management'),
('36','Lucid Charts', 'MySQL', 'Music World'),
('37','Lucid Charts', 'MySQL',	'Music World'),
('38','Oracle SQL data modeler',	'MySQL',	'Organ Donor Database'),
('39''Oracle SQL data modeler',	'MySQL', 'Organ Donor Database'),
('40','Oracle SQL data modeler', 'MySQL','Fatal Human Disease Database'),
('41','Lucid Charts', 'MySQL', 'Student Health Center Database'),
('42','Lucid Charts', 'MySQL',	'Smart Vehicle Rental Database'),
('43','Lucid Charts', 	'MySQL',	'Resturant Database'),
('44','draw.io', 'MySQL' 'Loan Application Database'),
('45','Lucid Charts', 'MySQL', 'Operational Software Database'),
('46','Lucid Charts',	'MySQL', 'Wholesale Management Database'),
('47','Oracle SQL data modeler'	,'MySQL',	'Fatal Human Disease Database'),
('48','Lucid Charts', 	'MySQL',	'Mail Database'),
('49','ERDPlus','MySQL','Book Database'),
('50','Lucid Charts' ,'MySQ','Library Management System Database'),
('51','Lucid Charts', 'MySQL','Library Management System Database'),
('52','Oracle SQL data modeler',	'?'	,'Bank Database'),
('53','draw.io','MySQL'	,'Grocery Store Database'),
('54','Lucid Charts' ,'MySQL','Reforest Management System'),
('55','Lucid Charts' ,'MySQL','Tourism Database'),
('56','Lucid Charts' , 'MySQL','Insurance Management Database')



CREATE TABLE Course( 
StudentID int,
CourseId int not null , 
CourseName varchar(255) not null, 
primary key (CourseID),
Foreign key (StudentID) references student(studentid)
); 


INSERT INTO Student
( Firstname,Middlename,Lastname )
VALUES
('Maria' , 'Quiroz' , 'Gonzalez'),
 ('Ruth', '','Murphy'),
 ('Saurabh','', 'Singh'),
('Anjaneya', 'Chowdary' , 'Kamepalli'),
('Manideep' ,'Reddy' ,  'Kalusani'),
('Shashank' ,'','Kala'),
('Indraneel','', 'Gajavalli'),
('Saran','', 'Camara'),
('William','', 'Borum'),
('Gustafson','', 'John'),
('Araceli','', 'Aragon'),
('Lucas','', 'Breault'),
('Disimone','', 'Draius'),
('Joseph','', 'Cannarozzo'),
('Trevor','', 'Garrity'),
('Aidan','', 'Sweeney'),
('Matthew','','Gruszecki'),
('Fauziah','','Ibrahim'),
('Joseph','','Kiss'),
('Cameron','','Meyer'),
('Ryan','', 'Walter'),
('Eric','','Porter'),
('Simon','','Lai'),
('Lorenzo','','Galante'),
('Azer','','Khan'),
('Taylor','','Dinardo'),
('Andrew','','Calvarese'),
('Anil' , 'Deepak', 'Talathoti'),
('Shaily','','Shaik'),
('Bindhu', 'Priya', 'T'),
('Vincent','','Herlihy'),
('Tejeswi','','Vallabhaneni'),
('Susmitha','', 'Vaddella'),
('Vaibhavi','','Nimmagadda'),
('Nikith','Reddy', 'Palugulla'),
('Siva Rama', 'Krishna Sai',' Paleti'),
('Manideepak','','Neeli'),
('Srinivas','', 'Ramineni'),
('Krishna', 'Sai' , 'Nallapaneni'),
('Prasanth','','Vutlapalli'),
('Akshay','','Koka'),
('Sai','Sreelesh', 'Boddu'),
('Venkata','Tarun Teja', 'Manduva'),
('Madhulika','', 'Panidepu'),
('Pavan', 'Kumar', 'Koyi'),
('Akhila','', 'Ganta'),
('Leela' ,'Mohana','Murari'),
('Naga', 'Praneeth','Muddana'),
('Edward','','Saletto'),
('Shradhdha','','Patel'),
('Aniruddha','' ,'Tidke'),
('Sameer', 'Ranjan' ,'Mishra'),
('Sai', 'Krishna', 'Allam'),
('Madhu' , '' ,'Rakshith'),
('Venkata Koti','Reddy', 'Chinnapareddy'),
('Veerepalli','','X');
 SELECT * FROM studentinfo WHERE studentid IN (SELECT studentid FROM grade where score = 'A');
 sys_configSELECT * FROM hw7.project;
ALTER TABLE user_customer_permission MODIFY id INT NOT NULL;
ALTER TABLE user_customer_permission DROP PRIMARY KEY;