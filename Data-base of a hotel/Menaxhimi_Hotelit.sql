CREATE DATABASE [Menaxhimi_Hotelit]

USE [Menaxhimi_Hotelit]


-- DDL--
------------------------------------------------------------------------------------------
create table Hoteli(
Hotel_ID int primary key,
Emri varchar(20) not null,
Website varchar(50),
Kapaciteti int not null,
Nr_Kateve int not null,
Nr_i_dhomave int not null,
Star_rating int check(Star_rating >=1 AND Star_rating <=5),
Email varchar(50) not null unique,
Rruga varchar(50) not null,
Qyteti varchar(50) not null,
Shteti varchar(50) not null
);


create table Nr_KontaktitH(
Nr_Kontaktit VARCHAR (20) not null,
Hotel_ID int not null,
PRIMARY KEY (Hotel_ID, Nr_kontaktit),
FOREIGN KEY(Hotel_ID) REFERENCES Hoteli(Hotel_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Departament(
Departamenti_Id int primary key,
Emri varchar(20) not null,
Pershkrimi varchar(255),
Paga money not null,
CHECK (Paga>=264)
);

create table Punetoret(
Punetori_Id int primary key,
Emri varchar(20) not null,
Mbiemri varchar(20) not null,
Nr_leternjoftimit VARCHAR(20) not null,
Email varchar(50) not null unique,
Pozita_punes varchar(255) not null,
Orari_punes varchar(20) not null,
Rruga varchar(50) not null,
Qyteti varchar(50) not null,
Shteti varchar(50) not null,
Menaxheri int foreign key REFERENCES Punetoret (Punetori_Id),
Hotel_ID int foreign key REFERENCES Hoteli (Hotel_ID),
Departamenti_Id int foreign key REFERENCES Departament (Departamenti_Id)
);

create table Nr_KontaktitP(
Nr_Kontaktit VARCHAR (20) not null,
Punetori_Id int not null,
PRIMARY KEY (Punetori_Id, Nr_kontaktit),
FOREIGN KEY(Punetori_Id) REFERENCES Punetoret(Punetori_Id) ON DELETE CASCADE ON UPDATE CASCADE
);


create table Dhoma(
Nr_dhomes int  primary key,
Cmimi money not null,
Hotel_ID int foreign key REFERENCES Hoteli (Hotel_ID)
);

create table Tipi_Dhomes(
Tipi_Dhomes_Id int IDENTITY(100, 4),
Nr_Dhomes int not null,
PRIMARY KEY (Tipi_Dhomes_Id, Nr_Dhomes),
Emri varchar(20) not null,
ISpet_friendly BIT,
ISsmoke_friendly BIT,
HASsea_view BIT,
FOREIGN KEY(Nr_Dhomes) REFERENCES Dhoma(Nr_Dhomes) ON DELETE CASCADE ON UPDATE CASCADE
);



create table Single(
Tipi_Dhomes_Id int not null,
Nr_Dhomes INT NOT NULL
PRIMARY KEY (Tipi_Dhomes_Id),
FOREIGN KEY (Tipi_Dhomes_Id, Nr_Dhomes) REFERENCES Tipi_Dhomes(Tipi_Dhomes_Id, Nr_Dhomes)
);

create table Doouble(
Tipi_Dhomes_Id int not null,
Nr_Dhomes INT NOT NULL
PRIMARY KEY (Tipi_Dhomes_Id),
FOREIGN KEY (Tipi_Dhomes_Id, Nr_Dhomes) REFERENCES Tipi_Dhomes(Tipi_Dhomes_Id, Nr_Dhomes)
);

create table Twin(
Tipi_Dhomes_Id int not null,
Nr_Dhomes INT NOT NULL
PRIMARY KEY (Tipi_Dhomes_Id),
FOREIGN KEY (Tipi_Dhomes_Id, Nr_Dhomes) REFERENCES Tipi_Dhomes(Tipi_Dhomes_Id, Nr_Dhomes)
);

create table Triple(
Tipi_Dhomes_Id int not null,
Nr_Dhomes INT NOT NULL
PRIMARY KEY (Tipi_Dhomes_Id),
FOREIGN KEY (Tipi_Dhomes_Id, Nr_Dhomes) REFERENCES Tipi_Dhomes(Tipi_Dhomes_Id, Nr_Dhomes)
);


create table Klientet(
Klienti_Id int IDENTITY(1,1) primary key,
Emri varchar(20) not null,
Mbiemri varchar(20) not null,
Nr_leternjoftimit VARCHAR(20) not null,
Email varchar(50) not null unique,
Rruga varchar(50) not null,
Qyteti varchar(50) not null,
Shteti varchar(50) not null,
Credit_card varchar(50)
);

create table Rezervimi(
Rezervimi_Id int IDENTITY (200, 44) primary key,
Data_e_rezervimit date not null,
Check_in_date date not null,
Check_out_date date not null,
Menyra_e_pageses varchar(20) not null,
Totali_i_pageses money,
Statusi_i_pageses varchar(50) not null,
Klienti_Id int foreign key REFERENCES Klientet(Klienti_Id),
Nr_Dhomes int foreign key REFERENCES Dhoma(Nr_Dhomes)
);

create table Dhomat_e_rezervuara(
Rezervimi_Id int not null,
Nr_Dhomes int not null,
PRIMARY KEY(Rezervimi_Id, Nr_Dhomes),
foreign key (Rezervimi_Id) REFERENCES Rezervimi(Rezervimi_Id),
foreign key (Nr_Dhomes) REFERENCES Dhoma(Nr_Dhomes)
);

create table Procesimi_Rezervimit(
Rezervimi_Id int not null,
Klienti_Id int not null,
Data_e_rezervimit date not null,
PRIMARY KEY(Rezervimi_Id, Klienti_Id),
foreign key (Rezervimi_Id) REFERENCES Rezervimi(Rezervimi_Id),
foreign key (Klienti_Id) REFERENCES Klientet(Klienti_Id)
); 

create table Nr_KontaktitK(
Nr_Kontaktit VARCHAR (20) not null,
Klienti_Id int not null,
FOREIGN KEY(Klienti_Id) REFERENCES Klientet(Klienti_Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Sherbimet_e_hotelit (
Sherbimi_Id INT PRIMARY KEY NOT NULL,
Emri VARCHAR(20) NOT NULL,
Pershkrimi VARCHAR(255),
Cmimi MONEY NOT NULL,
);


create table Perfshin(
Rezervimi_Id int not null,
Klienti_Id int not null,
Sherbimi_Id int not null,
PRIMARY KEY(Rezervimi_Id, Klienti_Id,Sherbimi_Id ),
foreign key (Rezervimi_Id) REFERENCES Rezervimi(Rezervimi_Id),
foreign key (Klienti_Id) REFERENCES Klientet(Klienti_Id),
foreign key (Sherbimi_Id) REFERENCES Sherbimet_e_hotelit(Sherbimi_Id)
);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DML----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Insertimi i reshtave (INSERT)--------------------------------------------------------------------------------------------------------------------------------------------------

-- Shtimi ne Hoteli table
INSERT INTO Hoteli (Hotel_ID, Emri, Website, Kapaciteti, Nr_Kateve, Nr_i_dhomave, Star_rating, Email, Rruga, Qyteti, Shteti)
VALUES (1, 'Hotel UBT', 'www.hotelUBT.com', 300, 5, 50, 4, 'info@hotelubt.com', 'Rruga Xhevded Doda', 'Prishtina', 'Kosovo');

-- Shtimi i 10 rreshtave të rastësishme në tabelën Departament
INSERT INTO Departament (Departamenti_Id, Emri, Pershkrimi, Paga)
VALUES
  (1, 'Human Resources', 'Managing human resources', 400),
  (2, 'Finance', 'Financial management', 450),
  (3, 'Housekeeping', 'Cleaning and room maintenance', 350),
  (4, 'IT', 'Information technology services', 700),
  (5, 'Security', 'Ensuring hotel security', 350),
  (6, 'Marketing', 'Promoting the hotel', 500),
  (7, 'Catering', 'Providing food services', 400),
  (8, 'Maintenance', 'Building maintenance', 350),
  (9, 'Concierge', 'Assisting guests', 350),
  (10, 'Events', 'Managing events', 370);

--Insertimi i 25 punetoreve ne departamente ku punojne :

-- Insertimi i punëtorëve për departamentin e Human Resources (ID 1)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (1, 'Laura', 'Smith', '123456780', 'laura.smith@email.com', 'HR Specialist', '9 AM - 5 PM', 'Rruga 1', 'Prishtina', 'Kosova', null, 1, 1),
  (2, 'Mark', 'Johnson', '234567891', 'mark.johnson@email.com', 'HR Coordinator', '10 AM - 6 PM', 'Rruga 2', 'Prishtina', 'Kosova', 1, 1, 1);

-- Insertimi i punëtorëve për departamentin e Finance (ID 2)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (3, 'Robert', 'Brown', '345678902', 'robert.brown@email.com', 'Financial Analyst', '8 AM - 4 PM', 'Rruga 3', 'Peje', 'Kosova', null, 1, 2),
  (4, 'Sophie', 'Wilson', '678901234', 'sophie.wilson@email.com', 'Accountant', '10 AM - 6 PM', 'Rruga 4', 'Prizren', 'Kosova', null, 1, 2);

-- Insertimi i punëtorëve për departamentin e Housekeeping (ID 3)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (5, 'Emma', 'Miller', '890123458', 'emma.miller@email.com', 'Housekeeping Supervisor', '1 PM - 9 PM', 'Rruga 6', 'Istog', 'Kosova', null, 1, 3),
  (6, 'Michael', 'Wilson', '901234567', 'michael.wilson@email.com', 'Room Attendant', '7 AM - 3 PM', 'Rruga 7', 'Peje', 'Kosova', 5, 1, 3),
  (7, 'Sophie', 'Martin', '456789025', 'sophia.martin@email.com', 'Room Attendant', '9 AM - 5 PM', 'Rruga 26', 'Prishtina', 'Kosova', 5, 1, 3);

-- Insertimi i punëtorëve për departamentin e IT (ID 4)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (8, 'Daniel', 'Clark', '012345689', 'daniel.clark@email.com', 'IT Specialist', '3 PM - 11 PM', 'Rruga 8', 'Prizren', 'Kosova', null, 1, 4),
  (9, 'Sophia', 'Walker', '123456781', 'sophia.walker@email.com', 'Network Administrator', '12 PM - 8 PM', 'Rruga 9', 'Prishtina', 'Kosova', null, 1, 4);

-- Insertimi i punëtorëve për departamentin e Security (ID 5)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (10, 'William', 'White', '234567892', 'william.white@email.com', 'Security Guard', '10 AM - 6 PM', 'Rruga 10', 'Istog', 'Kosova', 12, 1, 5),
  (11, 'Aiden', 'Taylor', '345678913', 'aiden.taylor@email.com', 'Security Officer', '8 AM - 4 PM', 'Rruga 11', 'Peje', 'Kosova', 12, 1, 5),
  (12, 'Sophie', 'Johnson', '987654323', 'sophie.johnson@email.com', 'Security Specialist', '11 AM - 7 PM', 'Rruga 22', 'Prizren', 'Kosova', null, 1, 5);

-- Insertimi i punëtorëve për departamentin e Marketing (ID 6)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (13, 'Emma', 'Davis', '456789124', 'emma.davis@email.com', 'Marketing Specialist', '2 PM - 10 PM', 'Rruga 12', 'Prizeren', 'Kosova', null, 1, 6),
  (14, 'Liam', 'Wilson', '567891235', 'liam.wilson@email.com', 'Digital Marketing Coordinator', '9 AM - 5 PM', 'Rruga 13', 'Prishtina', 'Kosova', null, 1, 6);

-- Insertimi i punëtorëve për departamentin e Catering (ID 7)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (15, 'Ava', 'Smith', '678912346', 'ava.smith@email.com', 'Catering Manager', '11 AM - 7 PM', 'Rruga 14', 'Istog', 'Kosova', null, 1, 7),
  (16, 'Ethan', 'White', '765432110', 'ethan.white@email.com', 'Catering Staff', '9 AM - 5 PM', 'Rruga 23', 'Prishtina', 'Kosova', 15, 1, 7),
  (17, 'Ava', 'Martin', '876543211', 'ava.martin@email.com', 'Catering Staff', '10 AM - 6 PM', 'Rruga 24', 'Prizeren', 'Kosova', 15, 1, 7),
  (18, 'Logan', 'Anderson', '987654322', 'logan.anderson@email.com', 'Catering Staff', '8 AM - 4 PM', 'Rruga 25', 'Peje', 'Kosova', 15, 1, 7);

-- Insertimi i punëtorëve për departamentin e Maintenance (ID 8)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (19, 'Oliver', 'Brown', '890123459', 'oliver.brown@email.com', 'Maintenance Supervisor', '1 PM - 9 PM', 'Rruga 16', 'Prizren', 'Kosova', null, 1, 8),
  (20, 'Isabella', 'Clark', '901234568', 'isabella.clark@email.com', 'Maintenance Technician', '10 AM - 6 PM', 'Rruga 17', 'Prishtina', 'Kosova', 19, 1, 8);

-- Insertimi i punëtorëve për departamentin e Concierge (ID 9)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (21, 'Jackson', 'Miller', '123456789', 'jackson.miller@email.com', 'Concierge Specialist', '7 AM - 3 PM', 'Rruga 18', 'Istog', 'Kosova', null, 1, 9),
  (22, 'Olivia', 'Clark', '234567891', 'olivia.clark@email.com', 'Guest Service Representative', '3 PM - 11 PM', 'Rruga 19', 'Peje', 'Kosova', 21, 1, 9);

-- Insertimi i punëtorëve për departamentin e Events (ID 10)
INSERT INTO Punetoret (Punetori_Id, Emri, Mbiemri, Nr_leternjoftimit, Email, Pozita_punes, Orari_punes, Rruga, Qyteti, Shteti, Menaxheri, Hotel_ID, Departamenti_Id)
VALUES
  (23, 'Lucas', 'Walker', '345678902', 'lucas.walker@email.com', 'Events Coordinator', '12 PM - 8 PM', 'Rruga 20', 'Prishtina', 'Kosova', null, 1, 10),
  (24, 'Emma', 'White', '456789013', 'emma.white@email.com', 'Event Staff', '10 AM - 6 PM', 'Rruga 21', 'Istog', 'Kosova', 23, 1, 10),
  (25, 'Tom', 'White', '456789023', 'tom.white@email.com', 'Event Staff', '6 PM - 12 PM', 'Rruga 21', 'Istog', 'Kosova', 23, 1, 10);


-- Insertimi i te dhenave ne tavelen Nr_KontaktitH 
INSERT INTO Nr_KontaktitH (Hotel_ID, Nr_Kontaktit)
VALUES 
	(1, '044123567'),
	(1, '045123567'),
	(1, '049123567');

-- Insert KontaktP for each Punetor
INSERT INTO Nr_KontaktitP (Punetori_Id, Nr_Kontaktit)
VALUES
  (1, '123456789'),
  (2, '234567890'),
  (3, '345678901'),
  (4, '456789012'),
  (5, '567890123'),
  (6, '678901234'),
  (7, '789012345'),
  (8, '890123456'),
  (9, '901234567'),
  (10,'012345678'),
  (11, '045456789'),
  (12, '034567890'),
  (13, '044678901'),
  (14, '0496789012'),
  (15, '3567890123'),
  (16, '128901234'),
  (17, '189012345'),
  (18, '290123456'),
  (19, '301234567'),
  (20, '664567000'),
  (21, '553456789'),
  (22, '664567890'),
  (23, '335678901'),
  (24, '446789012'),
  (25, '77890123'),
  (16, '998901234'),
  (7, '889012345'),
  (18, '090123456');


-- Insertimi ne tabelen Sherbimet_e_hotelit
INSERT INTO Sherbimet_e_hotelit (Sherbimi_Id, Emri, Pershkrimi, Cmimi)
VALUES 
	(1, 'Wi-Fi', 'High-speed internet access', 10),
	(2, 'Spa Package', 'Relaxing spa treatments', 30),
	(3, 'Swimming Pool Access', 'Access to the hotel swimming pool', 12),
	(4, 'Children Play Area', 'Dedicated play area for children', 10),
	(5, 'Airport Pickup', 'Transportation from the airport',25),
	(6, 'Parking', 'On-site parking facilities', 10),
	(7, 'Buffet', 'Daily buffet with a variety of options', 15),
	(8, 'Gym Access', 'Access to the hotel gym facilities', 18),
	(9, 'Room Service', '24/7 room service for guests', 20),
	(10, 'Tech Support', '24/7 technical support services', 15);


--Insertimet ne tabelen Klientet
INSERT INTO Klientet(Emri, Mbiemri, Nr_leternjoftimit, Email, Rruga, Qyteti, Shteti, Credit_Card)
VALUES 
    ('Albert', 'Robertson', '1812001225508', 'albert.robertson@gmail.com', 'Seoul', 'Berlin', 'Germany', '8745123698754'),
    ('John', 'Doe', '1234567890123', 'john.doe@example.com', 'New York', '[Los Angeles]', 'USA', '2314567890123'),
    ('Jane', 'Smith', '9876543210987', 'jane.smith@example.com', 'London', 'Manchester', 'UK', '9876543210123'),
    ('Alice', 'Johnson', '8765432109876', 'alice.johnson@example.com', 'Paris', 'Marseille', 'France', '5643210987654'),
    ('Bob', 'Williams', '2345678901234', 'bob.williams@example.com', 'Berlin', 'Hamburg', 'Germany', '1230987654321'),
    ('Elena', 'Garcia', '3456789012345', 'elena.garcia@example.com', 'Madrid', 'Barcelona', 'Spain', '8765432109876'),
    ('Muhammad', 'Ali', '4567890123456', 'muhammad.ali@example.com', 'Islamabad', 'Karachi', 'Pakistan', '3456789012345'),
    ('Sophia', 'Kim', '5678901234567', 'sophia.kim@example.com', 'Seoul', 'Busan', '[South Korea]', '2109876543210'),
    ('Luca', 'Rossi', '6789012345678', 'luca.rossi@example.com', 'Rome', 'Milan', 'Italy', '9870123456789'),
    ('Maria', 'Gonzalez', '7890123456789', 'maria.gonzalez@example.com', 'Madrid', 'Valencia', 'Spain', '5432109876543'),
    ('Ahmed', 'Salem', '8901234567890', 'ahmed.salem@example.com', 'Cairo', 'Alexandria', 'Egypt', '7890123456789'),
    ('Mia', 'Johnson', '9012345678901', 'mia.johnson@example.com', 'Sydney', 'Melbourne', 'Australia', '4321098765432'),
    ('Carlos', 'Lopez', '0123456789012', 'carlos.lopez@example.com', '[Mexico City]', 'Guadalajara', 'Mexico', '8765432101234'),
    ('Yuki', 'Tanaka', '1234509876543', 'yuki.tanaka@example.com', 'Tokyo', 'Osaka', 'Japan', '1234567890987'),
    ('Anna', 'Kowalski', '2345098765432', 'anna.kowalski@example.com', 'Warsaw', 'Krakow', 'Poland', '8901234567890'),
    ('Ivan', 'Ivanov', '3450987654321', 'ivan.ivanov@example.com', 'Moscow', 'St.Petersburg', 'Russia', '6543210987654'),
    ('Sara', 'Müller', '4567890123456', 'sara.muller@example.com', 'Berlin', 'Frankfurt', 'Germany', '3456789012345');


-- Insert data into Nr_KontaktitK table
INSERT INTO Nr_KontaktitK (Klienti_Id, Nr_Kontaktit)
VALUES
    (1, '+383 69 555 1234'),
    (2, '+383 66 555 4444'),
    (3, '+383 69 444 1234'),
    (4, '+383 69 545 0034'),
    (5, '+383 69 565 1209'),
    (6, '+383 69 125 1434'),
    (7, '+383 66 111 2222'),
    (8, '+383 66 333 4444'),
    (9, '+383 67 777 8888'),
    (10, '+383 67 999 0000'),
    (11, '+383 68 222 3333'),
    (12, '+383 68 444 5555'),
    (13, '+383 68 666 7777'),
    (14, '+383 69 888 9999'),
    (15, '+383 69 000 1111'),
    (16, '+383 66 123 4567'),
    (17, '+383 67 234 5678'),
    (1, '+383 68 345 6789'),
    (1, '+383 69 456 7890'),
    (3, '+383 66 567 8901'),
    (4, '+383 67 678 9012'),
    (5, '+383 68 789 0123'),
    (6, '+383 69 890 1234'),
    (7, '+383 66 901 2345'),
    (8, '+383 67 012 3456'),
    (9, '+383 68 123 4567'),
    (1, '+383 69 234 5678'),
    (10, '+383 66 345 6789'),
    (13, '+383 67 456 7890'),
    (16, '+383 68 567 8901');

--Insertimet ne tabelen Dhoma
INSERT INTO Dhoma(Nr_dhomes, Cmimi, Hotel_ID)
VALUES 
	(101, 80.00, 1),
	(102, 80.00, 1),
	(103, 80.00, 1),
	(104, 80.00, 1),
	(105, 80.00, 1),
	(106, 60.00, 1),
	(107, 60.00, 1),
	(108, 60.00, 1),
	(201, 200.00, 1),
	(202, 200.00, 1),
	(203, 120.00, 1),
	(204, 120.00, 1),
	(205, 110.00, 1),
	(206, 110.00, 1),
	(207, 80.00, 1),
	(208, 80.00, 1),
	(301, 120.00, 1),
	(302, 120.00, 1),
	(303, 120.00, 1),
	(304, 120.00, 1),
	(305, 120.00, 1),
	(306, 120.00, 1),
	(307, 150.00, 1),
	(308, 150.00, 1),
	(401, 120.00, 1),
	(402, 120.00, 1),
	(403, 150.00, 1),
	(404, 150.00, 1),
	(405, 150.00, 1),
	(406, 150.00, 1),
	(407, 60.00, 1),
	(408, 60.00, 1);


--Insertimet ne tablene Tipi_Dhomes
INSERT INTO Tipi_Dhomes(Nr_Dhomes, Emri, ISpet_friendly, ISsmoke_friendly, HASsea_view)
VALUES 
	(101, 'Studio', 1, 1, 0),
	(102, 'Studio', 1, 1, 0),
	(103, 'Studio', 1, 1, 0),
	(104, 'Studio', 1, 1, 0),
	(105, 'Studio', 1, 1, 0),
	(106, 'Studio', 1, 1, 0),
	(107, 'Studio', 1, 1, 0),
	(108, 'Studio', 1, 1, 0),
	(201, 'Presidential Suite', 0, 0, 1),
	(202, 'Presidential Suite', 0, 0, 1),
	(203, 'Deluxe room', 0, 1, 1),
	(204, 'Deluxe room', 0, 1, 1),
	(205, 'King room', 0, 0, 1),
	(206, 'King room', 0, 0, 1),
	(207, 'Studio', 1, 1, 0),
	(208, 'Studio', 1, 1, 0),
	(301, 'Connecting rooms', 1,1,1),
	(302, 'Connecting rooms', 1,1,1),
	(303, 'Deluxe room', 0, 1, 1),
	(304, 'Deluxe room', 0, 1, 1),
	(305, 'Deluxe room', 0, 1, 1),
	(306, 'Deluxe room', 0, 1, 1),
	(307, 'Studio', 1, 1, 0),
	(308, 'Studio', 1, 1, 0),
	(401, 'Connecting rooms', 1,1,1),
	(402, 'Connecting rooms', 1,1,1),
	(403, 'King room', 0, 0, 1),
	(404, 'King room', 0, 0, 1),
	(405, 'King room', 0, 0, 1),
	(406, 'King room', 0, 0, 1),
	(407, 'Studio', 1, 1, 0),
	(408, 'Studio', 1, 1, 0);


--Insertimet ne tabelen Single
INSERT INTO Single(Tipi_Dhomes_Id, Nr_Dhomes)
VALUES 
	(120, 106),
	(124, 107),
	(128, 108),
	(148, 205),
	(152, 206),
	(220, 407),
	(224, 408);

--Insertimet ne tabelen Doouble
INSERT INTO Doouble(Tipi_Dhomes_Id, Nr_Dhomes)
VALUES 
	(100, 101),
	(104, 102),
	(108, 103),
	(112, 104),
	(116, 105),
	(156, 207),
	(160, 208),
	(180, 305),
	(184, 306),
	(204, 403),
	(208, 404),
	(212, 405);

--Insertimet ne tabelen Twin
INSERT INTO Twin(Tipi_Dhomes_Id, Nr_Dhomes)
VALUES 
	(140, 203),
	(144, 204),
	(172, 303),
	(176, 304),
	(216, 406);

--Insertimet ne tabelen Tripple
INSERT INTO Triple(Tipi_Dhomes_Id, Nr_Dhomes)
VALUES 
	(132, 201),
	(136, 202),
	(164, 301),
	(168, 302),
	(188, 307),
	(192, 308),
	(196, 401),
	(200, 402);

--Insertimet ne tabelen Rezervimi 
INSERT INTO Rezervimi(Data_e_rezervimit, Check_in_date, Check_out_date, Menyra_e_pageses, Totali_i_pageses, Statusi_i_pageses, Klienti_Id, Nr_Dhomes)
VALUES 
	('2023-10-23', '2024-01-15', '2024-01-20', 'CARD',450.00, 'PAID', 1 , 207),
	('2023-10-23', '2024-01-15', '2024-01-20', 'CARD',450.00, 'PAID', 1 , 208),
    ('2023-09-12', '2024-01-18', '2024-01-25', 'CASH',840.00, 'NOT PAID',2 , 301),
    ('2023-11-05', '2024-01-21', '2024-01-24', 'CARD',600.00, 'PAID', 3, 201),
    ('2023-11-17', '2024-01-23', '2024-01-31', 'CARD', 960.00, '30% PAID', 4, 302),
	('2023-12-01', '2024-01-26', '2024-01-31', 'CARD',600.00, 'PAID', 5, 204),
    ('2023-12-01', '2024-01-26', '2024-01-31', 'CARD', 600.00, 'PAID', 5, 203),
    ('2023-10-15', '2024-01-30', '2024-02-06', 'CARD', 1050.00, '30% PAID', 6, 405),
    ('2024-01-04', '2024-01-31', '2024-02-10', 'CASH', 800.00, 'NOT PAID', 7, 104),
	('2023-11-03', '2024-02-01', '2024-02-10', 'CARD', 1080.00, 'NOT PAID', 8, 303),
	('2023-12-18', '2024-02-04', '2024-02-08', 'CASH', 800.00, '30% PAID', 9, 201),
	('2023-12-18', '2024-02-04', '2024-02-08', 'CASH', 440.00, '30% PAID', 9, 205),
	('2023-12-27', '2024-02-06', '2024-02-11', 'CARD', 600.00, 'PAID', 10, 306),
	('2024-01-10', '2024-02-11', '2024-02-15', 'CASH', 240.00, 'NOT PAID', 11, 106),
	('2024-01-22', '2024-02-14', '2024-02-18', 'CARD', 320.00, '30% PAID', 12, 102),
	('2024-01-22', '2024-02-14', '2024-02-18', 'CARD', 320.00, '30% PAID', 12, 103),
	('2024-01-22', '2024-02-14', '2024-02-18', 'CARD', 320.00, '30% PAID', 12, 104),
	('2024-01-13', '2024-02-18', '2024-02-25', 'CASH', 1400.00, 'NOT PAID', 13, 202),
	('2024-01-14', '2024-02-20', '2024-02-25', 'CARD', 750.00, 'PAID', 14, 307),
	('2024-01-20', '2024-02-24', '2024-03-01', 'CARD',720.00, 'PAID', 15, 305),
	('2024-02-01', '2024-02-28', '2024-03-03', 'CARD', 480.00, '30% PAID', 16, 401),
    ('2024-02-01', '2024-02-28', '2024-03-03', 'CARD', 480.00, '30% PAID', 16, 402),
	('2024-02-10', '2024-03-01', '2024-03-07', 'CASH', 360.00, 'NOT PAID', 17, 407),
    ('2024-02-10', '2024-03-01', '2024-03-07', 'CASH', 720.00, 'NOT PAID', 17, 304);
	

--Insertimet ne tabelen Dhomat_E_Rezervuara
INSERT INTO Dhomat_e_rezervuara(Rezervimi_Id, Nr_Dhomes)
VALUES  (200, 207),
		(244, 208),
		(288, 301),
		(332, 201),
		(376, 302),
		(420, 204),
		(464, 203),
		(508, 405),
		(552, 104),
		(596, 303),
		(640, 201),
		(684, 205),
		(728, 306),
		(772, 106),
		(816, 102),
		(860, 103),
		(904, 104),
		(948, 202),
		(992, 307),
		(1036, 305),
		(1080, 401),
		(1124, 402),
		(1168, 407),
		(1212, 304);

-- Insert data into Procesimi_Rezervimit table
INSERT INTO Procesimi_Rezervimit (Rezervimi_Id, Klienti_Id, Data_e_rezervimit)
SELECT Rezervimi_Id, Klienti_Id, Data_e_rezervimit
FROM Rezervimi;


-- Insert data into the Perfshin table
INSERT INTO Perfshin (Rezervimi_Id, Klienti_Id, Sherbimi_Id)
VALUES
    (200, 1, 1),
    (244, 1, 2),
    (288, 2, 3),
    (332, 3, 4),
    (376, 4, 5),
    (420, 5, 6),
    (464, 5, 7),
    (508, 6, 8),
    (552, 7, 9),
    (596, 8, 1),
    (640, 9, 2),
    (684, 9, 2),
    (728,  10, 5),
    (772,  11, 6),
    (816,  12, 8),
    (860,  12, 9),
    (904,  12, 10),
    (948,  13, 1),
    (992,  14, 2),
    (1036, 15, 3),
    (1080, 16, 4),
    (1124, 16, 4),
    (1168, 17, 10),
	(728,  10, 10),
    (772,  11, 3),
    (816,  12, 3),
    (860,  12, 1),
    (904,  12, 2),
    (948,  13, 4),
    (992,  14, 10),
    (1036, 15, 10),
    (1080, 16, 9),
    (1124, 16, 5),
    (1168, 17, 9),
	(1168, 17, 3),
    (1212, 17, 1);


--Perditesimi (UPDATE) --------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Përditësimi i punëtorëve në departamentin e Housekeeping për të ndryshuar orarin e punës për ata që kanë orarin '9 AM - 5 PM'
UPDATE Punetoret
SET Orari_punes = '10 AM - 6 PM'
WHERE Departamenti_Id = 3 AND Orari_punes = '9 AM - 5 PM';

-- Përditësimi i çmimit të shërbimit 'Spa Package' në Sherbimet_e_hotelit për të shtuar një zbritje prej 5euro
UPDATE Sherbimet_e_hotelit
SET Cmimi = Cmimi - 5
WHERE Emri = 'Spa Package';

-- Përditësimi i informacionit të kontaktit për punëtorët me ID = 3
UPDATE Nr_KontaktitP
SET Nr_Kontaktit = '044555555'
WHERE Punetori_Id = 3;

-- Përditësimi i informacionit të kontaktit për punëtorët me ID = 10
UPDATE Nr_KontaktitP
SET Nr_Kontaktit = '044999999'
WHERE Punetori_Id = 10;

-- Përditësimi i informacionit të kontaktit për klientin me ID = 1
UPDATE Nr_KontaktitK
SET Nr_Kontaktit = '+38344980999'
WHERE Klienti_Id = 1;

-- Përditësimi i informacionit të kontaktit për klientin me ID = 2
UPDATE Nr_KontaktitK
SET Nr_Kontaktit = '+38345980922'
WHERE Klienti_Id = 2;

-- Përditësimi i cmimit për shërbimin 'Swimming Pool Access' në Sherbimet_e_hotelit
UPDATE Sherbimet_e_hotelit
SET Cmimi = 22
WHERE Emri = 'Swimming Pool Access';

-- Përditësimi i mbiemrit dhe email-it të punëtorit me ID 22 në tabelën Punetoret
UPDATE Punetoret
SET Mbiemri = 'Brown', Email = 'olivia.brown@email.com'
WHERE Punetori_Id = 22;

-- Përditësimi i vlerës së rating-ut për hotelin me ID 1 në tabelën Hoteli
UPDATE Hoteli
SET Star_rating = 5
WHERE Hotel_ID = 1;

-- Përditësimi i cmimit për shërbimin 'Tech Support' në Sherbimet_e_hotelit
UPDATE Sherbimet_e_hotelit
SET Cmimi = 30
WHERE Emri = 'Tech Support';

--Përditësimi i çmimit të dhomave 403, 404, 405, 406 nga 150euro në 170euro. (Janë përditësuar 4 rreshta)
UPDATE Dhoma
SET Cmimi=170
WHERE Nr_dhomes between 403 and 406;

--Përditësimi i qytetit të klientes Sara Müller nga Frankfurt në Berlin. (Është përditësuar 1 rresht)
UPDATE Klientet
SET Qyteti = 'Berlin'
WHERE Emri like 'Sara' and Mbiemri like 'Müller';

--Përditësimi i kolonës Is_Smoke_Friendly të tipit të dhomave Deluxe nga 1 në 0, d.t.th nuk janë smoke_friendly. (Janë përditësuar 6 rreshta)
UPDATE Tipi_Dhomes
SET ISsmoke_friendly= 0
WHERE Emri like 'Deluxe Room';



----------------Delete-----------------------------------------------------------------------------------------------------------------
DELETE FROM Nr_KontaktitK
WHERE Klienti_Id = 1 AND Nr_Kontaktit = '+383 69 555 1234'

DELETE FROM Nr_KontaktitK
WHERE Klienti_Id = 1 AND Nr_Kontaktit = '+383 69 456 7890'

DELETE FROM Punetoret
WHERE Emri = 'Logan' AND Mbiemri = 'Anderson';

DELETE FROM Perfshin
WHERE Rezervimi_Id = 1168
  AND Klienti_Id = 17
  AND Sherbimi_Id = 3;

DELETE FROM Perfshin
WHERE Rezervimi_Id = 860
  AND Klienti_Id = 12
  AND Sherbimi_Id = 1;


--
DELETE FROM Dhomat_e_rezervuara
WHERE Rezervimi_Id = 904 AND Nr_Dhomes= 104;

DELETE FROM Dhomat_e_rezervuara
WHERE Rezervimi_Id = 376 AND Nr_Dhomes =302;

DELETE FROM Procesimi_Rezervimit
WHERE Rezervimi_Id = 904;

DELETE FROM Nr_KontaktitP
WHERE Punetori_Id = 7 and Nr_Kontaktit = '889012345';

DELETE FROM Nr_KontaktitP
WHERE Punetori_Id = 18 and Nr_Kontaktit = '090123456';

--Query
--8 query të thjeshta vetëm me një relacion(tabelë):--Lista e klientave me emer dhe mbiemer, qe jane nga Gjermania ose Franca (Eljana Gjeçbitriq)select Emri, Mbiemri, Shteti from Klientetwhere Shteti like 'Germany' OR  Shteti like 'France'--Lista e rezervimeve qe kane totalin e pageses mes 800 dhe 1500 euro (Eljana Gjeçbitriq)select * from Rezervimiwhere Totali_i_pageses between 800 and 1500 order by Totali_i_pageses desc--Mesatarja e totalit te pageses per te gjitha rezervimet (Eljana Gjeçbitriq)select avg(Totali_i_pageses)as 'Mesatarja e pagesave'from Rezervimi--Numri i dhomave te hotelit qe jane King room (Eljana Gjeçbitriq)select count(Nr_Dhomes) as 'King rooms'from Tipi_Dhomeswhere Emri='King room'--Paraqitja e rezervimeve mes datave '2024-01-26' dhe '2024-01-31' --DRENUSHA SHOSHI
SELECT *
FROM Rezervimi
WHERE Check_in_date <= '2024-01-26' AND Check_out_date >= '2024-01-31';

--Paraqitja e punetoreve qe punojne ne orar '10 AM - 6 PM --DRENUSHA SHOSHI
SELECT *
FROM Punetoret
WHERE Orari_punes = '10 AM - 6 PM';

--Shfaqja e pages mesatare ne nje departament --DRENUSHA SHOSHI
SELECT AVG(Paga) AS PagaMesatare
FROM Departament;

--Paraqitja e rezervimeve te papaguara --DRENUSHA SHOSHI
SELECT *
FROM Rezervimi
WHERE Statusi_i_pageses = 'NOT PAID';--8 query te thjeshta me minimum dy relacione--Lista e rezervimeve qe ka bere Klientja Mia Johnson (Eljana Gjeçbitriq)select r.Data_e_rezervimit, r.Check_in_date, r.Check_out_date, r.Totali_i_pageses, r.Statusi_i_pageses, r.Nr_Dhomesfrom Rezervimi r, Klientet kwhere r.Klienti_Id=k.Klienti_Id and k.Emri='Mia' and k.Mbiemri='Johnson'--Lista e klienteve qe perdorin sherbimin Spa Package me check-in dhe check-out datat e tyre (Eljana Gjeçbitriq)select k.Emri, k.Mbiemri, r.Check_in_date, r.Check_out_date, sh.Emri as 'Sherbimi'
from Klientet k, Rezervimi r, Sherbimet_e_hotelit sh, Perfshin p
where p.Klienti_Id=k.Klienti_Id and p.Rezervimi_Id=r.Rezervimi_Id and p.Sherbimi_Id=sh.Sherbimi_Id
and sh.Emri='Spa Package'

--Paraqitja e menaxheres se departamentit Sequrity me emer, mbiemer, pozite pune, orar pune dhe page (Eljana Gjeçbitriq)
select p.Emri, p.Mbiemri, p.Orari_punes, p.Pozita_punes, d.Paga
from Punetoret p, Departament d
where p.Departamenti_Id=d.Departamenti_Id and p.Menaxheri is null and d.Emri='Security'

--Paraqitja e dhomave Single ne katin e pare (Eljana Gjeçbitriq)
select dh.Nr_dhomes, tdh.Emri, dh.Cmimi
from Single s, Dhoma dh, Tipi_Dhomes tdh
where s.Nr_Dhomes=dh.Nr_dhomes and s.Nr_Dhomes=tdh.Nr_Dhomes and dh.Nr_dhomes between 101 and 108

--Pataqitja e nr. te kontaktit dhe emails te secilit punetor --DRENUSHA SHOSHI
SELECT P.Emri + ' ' + P.Mbiemri AS Emri_Punetorit, NP.Nr_Kontaktit AS Nr_Kontaktit, P.Email AS Email
FROM Punetoret P , Nr_KontaktitP NP
WHERE P.Punetori_Id = NP.Punetori_Id;

--Pataqitja e nr. te kontaktit dhe emails te secilit klient --DRENUSHA SHOSHI
SELECT K.Emri + ' ' + K.Mbiemri AS Emri_Klientit, NK.Nr_Kontaktit ,K.Email
FROM Klientet K ,Nr_KontaktitK NK
WHERE K.Klienti_Id = NK.Klienti_Id;

--Paraqitja e rezervimeve se bashku me emrin e klientit qe ka bere ate rezervim --DRENUSHA SHOSHI
SELECT R.Rezervimi_Id, K.Emri + ' ' + K.Mbiemri AS Emri_Klientit, R.Check_in_date, R.Check_out_date,R.Totali_i_pageses, R.Statusi_i_pageses
FROM Rezervimi R, Klientet K
WHERE R.Klienti_Id = K.Klienti_Id;

--Paraqitja e punetoreve qe jane menaxher (Punetoret qe skan menaxher jane vete menaxher) --DRENUSHA SHOSHI
SELECT P.Emri + ' ' + P.Mbiemri AS Emri_Punetorit, P.Nr_leternjoftimit, D.Emri AS 'Departamenti', P.Pozita_punes
FROM Punetoret p, Departament d
WHERE P.Departamenti_Id = D.Departamenti_Id AND P.Menaxheri is null;


--8 query te avancuara me minimum dy relacione tabelash 

--Paraqitja e punetoreve te departamentit IT (Eljana Gjeçbitriq)
select CONCAT(p.Emri, p.Mbiemri) as 'Emri_Mbiemri', p.Pozita_punes,p.Orari_punes, d.Paga
from Punetoret p left join Departament d
on p.Departamenti_Id=d.Departamenti_Id
where d.Emri='IT'

--Paraqitja e dhomave Deluxe qe jane twin room (Eljana Gjeçbitriq)
select t.Nr_Dhomes, t.Emri
from Tipi_Dhomes t right join Twin tw
on tw.Nr_Dhomes=t.Nr_Dhomes 
where t.Emri='Deluxe room'

--Paraqitja e klienteve te cilet kane bere me shume se 1 rezervim (Eljana Gjeçbitriq)
select k.Emri, k.Mbiemri, count(r.Rezervimi_Id) as 'Numri i rezervimeve'
from Klientet k inner join Rezervimi r
on r.Klienti_Id=k.Klienti_Id
group by r.Klienti_Id, k.Emri, k.Mbiemri
having count(r.Rezervimi_Id)>1

--Shuma e pagesave e fituar nga tipet e dhomave te ndryshme (Eljana Gjeçbitriq)
select t.Emri as 'Tipi Dhomes', sum(r.Totali_i_pageses) as 'Shuma e fituar'
from Rezervimi r inner join Tipi_Dhomes t
on r.Nr_Dhomes=t.Nr_Dhomes
group by t.Emri

--Klientet dhe koheqendrimi i tyre ne hotel (Eljana Gjeçbitriq)

select k.Emri, k.Mbiemri, DATEDIFF(day, MIN(r.Check_in_date), MAX(r.Check_out_date)) AS 'Kohe-qendrimi'
from Klientet k left join Rezervimi r 
on r.Klienti_Id = k.Klienti_Id
group by k.Emri, k.Mbiemri
order by 'Kohe-qendrimi' DESC;

--Gjetja e dhomave te lira dhe tipi i tyre --DRENUSHA SHOSHI
SELECT D.Nr_dhomes as 'Nr. i dhomes se lire', T.Emri AS Tipi_Dhomes
FROM Dhoma D
LEFT JOIN Dhomat_e_rezervuara DR ON D.Nr_dhomes = DR.Nr_Dhomes
LEFT JOIN Tipi_Dhomes T ON D.Nr_dhomes = T.Nr_Dhomes
WHERE DR.Rezervimi_Id IS NULL;

--Gjetja e nr te punetoreve ne secilin departament --DRENUSHA SHOSHI
SELECT d.Emri as 'Departamenti', COUNT(p.Punetori_Id) as 'Nr. Punetoreve'
FROM Departament d RIGHT JOIN Punetoret p
ON d.Departamenti_Id = p.Departamenti_Id
GROUP BY d.Emri

--Gjetja e dhomave qe jane Smoke Friendly --DRENUSHA SHOSHI
SELECT dh.Nr_dhomes,t.ISsmoke_friendly
FROM Dhoma dh INNER JOIN Tipi_Dhomes t
ON dh.Nr_dhomes = t.Nr_Dhomes
WHERE t.ISsmoke_friendly = 1

--Paraqitja e klienteve qe kane paguar vetem 30% te totalit te pageses --DRENUSHA SHOSHI
SELECT r.Rezervimi_Id, k.Emri+' '+k.Mbiemri as 'Klienti', r.Totali_i_pageses ,r.Menyra_e_pageses, r.Statusi_i_pageses
FROM Rezervimi r FULL JOIN Klientet k
ON r.Klienti_Id=k.Klienti_Id
WHERE Statusi_i_pageses = '30% PAID';

--8 Subquery te thjeshta 

--Shfaqja e punetoreve qe punojne ne departamentet Marketing dhe Financa (Eljana Gjeçbitriq)
select (p.Emri+' '+p.Mbiemri) as 'Emri_Mbiemri',p.Email, p.Pozita_punes, p.Orari_punes 
from Punetoret p
where p.Departamenti_Id in (select d.Departamenti_Id
						from Departament d
						where d.Emri='Marketing' or d.Emri='Finance'
						)

--Rezervimet me total me te ulet se mesatarja e totaleve te te gjitha rezervimeve (Eljana Gjeçbitriq)
select *
from Rezervimi r
where r.Totali_i_pageses<(select avg(r.Totali_i_pageses)
						 from Rezervimi r)

--Klientet qe kane rezervuar dhoma ne katin IV (Eljana Gjeçbitriq)
select *
from Klientet k
where exists (select k.Emri, k.Mbiemri, r.Rezervimi_Id
					from Rezervimi r
					where k.Klienti_Id=r.Klienti_Id
					and r.Nr_Dhomes BETWEEN 401 AND 408)

--Dhomat qe nuk lejojne kafshet (Eljana Gjeçbitriq)
select dh.Nr_dhomes, dh.Cmimi
from Dhoma dh 
where dh.Nr_dhomes not in (select t.Nr_Dhomes
							from Tipi_Dhomes t
							where t.ISpet_friendly=1)

--Gjetja e punetoreve qe punojne ne departamentin qe paguan me se shumti --DRENUSHA SHOSHI
SELECT *
FROM Punetoret
WHERE Departamenti_Id = (SELECT TOP 1 Departamenti_Id
                                          FROM Departament
                                          ORDER BY Paga
                                          DESC);

--Gjetja e klientit qe ka bere rezervimin me shumen me te madhe te pageses --DRENUSHA SHOSHI
SELECT *
FROM Klientet
WHERE Klienti_Id = (SELECT TOP 1 Klienti_Id
                              FROM Rezervimi
                              ORDER BY Totali_i_pageses DESC);

--Gjeni klientin qe ka bere rezervimin me heret se te tjeret --DRENUSHA SHOSHI
SELECT *
FROM Klientet
WHERE Klienti_Id = (SELECT TOP 1 R.Klienti_Id
                              FROM Rezervimi R
                              ORDER BY R.Data_e_rezervimit ASC
                              );

--Paraqitja e rezervimeve te kryera na Klientet qe vijn nga 'Manchester' --DRENUSHA SHOSHI
SELECT *
FROM Rezervimi
WHERE Klienti_Id IN (SELECT Klienti_Id
                              FROM Klientet
                              WHERE Qyteti = 'Manchester');

--8 subquery te avancuara

--Shfaqja e departamenteve me numrin e punetoreve ne at departament(Klauzola select) (Eljana Gjeçbitriq)
select d.Emri, d.Pershkrimi, (select count(p.Punetori_Id)
								from Punetoret p
								where d.Departamenti_Id=p.Departamenti_Id) as 'Numri i punetoreve'
from Departament d

--Klientet dhe totali qe kane paguar (Klauzola from)(Eljana Gjeçbitriq)
select *
from Klientet k inner join (select r.Klienti_Id, sum(r.Totali_i_pageses) as 'TOTALI'
							from Rezervimi r
							group by r.Klienti_Id) as Pagesat
on k.Klienti_Id=Pagesat.Klienti_Id

--Klienti i cili qendron me se paku ne hotel (Eljana Gjeçbitriq)
WITH Koheqendrimet(Id_Klienti, Koheqendrimi)as 
(
	select r.Klienti_Id, DATEDIFF(day, MIN(r.Check_in_date), MAX(r.Check_out_date))
	from Rezervimi r
	group by r.Klienti_Id
)
select *
from Klientet k
where k.Klienti_Id=(select top 1 ko.Id_Klienti
					from Koheqendrimet ko
					order by ko.Koheqendrimi ASC)

--Dhoma qe ka me se shumti rezervime (Eljana Gjeçbitriq)
create view Rezervimet as
select r.Nr_Dhomes, count(r.Rezervimi_Id) as Nr_rezervimeve
from Rezervimi r
group by r.Nr_Dhomes;


select dh.Nr_dhomes, dh.Cmimi
from Dhoma dh
where dh.Nr_dhomes in(select re.Nr_Dhomes
					from Rezervimet re
					where re.Nr_rezervimeve=(select max(re_inner.Nr_rezervimeve)
											from Rezervimet re_inner)
						);

--Sherbimet me cmim me te madh se cmimi mesatar --DRENUSHA SHOSHI
SELECT *
FROM Sherbimet_e_hotelit S
WHERE S.Cmimi > (SELECT AVG(sh.Cmimi)
                        FROM Sherbimet_e_hotelit Sh);

--Gjej dhomen me me se paku rezervime --DRENUSHA SHOSHI
SELECT *
FROM Dhoma
WHERE Nr_dhomes = (
    SELECT TOP 1 R.Nr_dhomes
    FROM Rezervimi R
    GROUP BY R.Nr_dhomes
    ORDER BY COUNT(*) ASC
);

--Shfaqja e klienteve dhe numrin te rezervimeve te tyre (Klauzola FROM) --DRENUSHA SHOSHI
SELECT k.Emri+' '+k.Mbiemri as Klientu, rez.Nr_Rezervimeve
FROM Klientet k
JOIN (SELECT Klienti_Id , COUNT(*) AS Nr_Rezervimeve
       FROM Rezervimi
       GROUP BY Klienti_Id) rez
ON k.Klienti_Id = rez.Klienti_Id;


--Shfaqja e dhomave dhe sa here jane rezervuar(Klauzola SELECT) --DRENUSHA SHOSHI
SELECT *, (SELECT COUNT(*)
               FROM Rezervimi R
               WHERE R.Nr_dhomes = D.Nr_dhomes) AS Nr_Rezervimeve
FROM
    Dhoma D;


--8 query/subquery duke përdorur operacionet e algjebrës relacionale 

--Klientet qe qendrojne ne katin I dhe perdorin sherbimin 'Room Service' (Eljana Gjeçbitriq)
create view klientetP as
select p.Klienti_Id
from Perfshin p inner join Sherbimet_e_hotelit sh
on p.Sherbimi_Id=sh.Sherbimi_Id and sh.Emri like 'Room Service'
intersect 
select p.Klienti_Id 
from Perfshin p inner join Rezervimi r
on p.Rezervimi_Id=r.Rezervimi_Id and r.Nr_Dhomes between 101 and 108


select *
from klientetP  kp inner join Klientet k
on kp.Klienti_Id=k.Klienti_Id

--Rezervimet e dhomave double dhe king qe kane paguar 30% (Eljana Gjeçbitriq)
create view rezDH as 
select r.Rezervimi_Id
from Rezervimi r inner join Doouble d
on r.Nr_Dhomes= d.Nr_Dhomes 
union 
select r.Rezervimi_Id
from Rezervimi r inner join Tipi_Dhomes t
on r.Nr_Dhomes=t.Nr_Dhomes and t.Emri='King room'

select *
from rezDH rd inner join Rezervimi r
on rd.Rezervimi_Id=r.Rezervimi_Id where r.Statusi_i_pageses like '30% PAID'

--Dhomat qe kane cmimin >100euro por nuk jane 'Presidential Suite' (Eljana Gjeçbitriq)
select dh.Nr_dhomes
from Dhoma dh
where dh.Cmimi >120
EXCEPT
select dh.Nr_dhomes
from Dhoma dh inner join Tipi_Dhomes t
on dh.Nr_dhomes=t.Nr_Dhomes and t.Emri='Presidential Suite'

--Departamentet qe kane me shume se 2 punetore, dhe ofrojne page <=400euro (Eljana Gjeçbitriq)
create view departamentet as
select d.Departamenti_Id
from Departament d inner join Punetoret p
on d.Departamenti_Id=p.Departamenti_Id
group by d.Departamenti_Id
having count(p.Punetori_Id) > 2

INTERSECT

select d.Departamenti_Id
from Departament d 
where d.Paga<=400

select d.Departamenti_Id, d.Emri,d.Pershkrimi, d.Paga
from Departament d inner join departamentet de
on d.Departamenti_Id=de.Departamenti_Id

-- Krijimi VIEW i dhomave qe jane Single dhe kane sea view (INTERSECT) --DRENUSHA SHOSHI
CREATE VIEW seaViewSingleRooms AS
SELECT Nr_Dhomes FROM Single
INTERSECT
SELECT Nr_Dhomes FROM Tipi_Dhomes WHERE HASsea_view = 1;

--Paraqitja e dhomave qe jane Single dhe kane sea view
SELECT * FROM seaViewSingleRooms svsr
INNER JOIN Single s ON svsr.Nr_Dhomes = s.Nr_Dhomes;

-- VIEW me emails te te gjithe klienteve dhe punetoreve(UNION) --DRENUSHA SHOSHI
CREATE VIEW CombinedEmails AS
SELECT Email FROM Klientet
UNION
SELECT Email FROM Punetoret;

-- Query per te gjitha emails ne databaze
SELECT Email FROM CombinedEmails;


-- Gjej dhomat që nuk janë rezervuar dhe kanë smoking dhe sea view te lejuar (EXCEPT) --DRENUSHA SHOSHI
SELECT Nr_dhomes
FROM Dhoma
WHERE Nr_dhomes NOT IN (
    SELECT d.Nr_dhomes
    FROM Dhomat_e_rezervuara dr
    JOIN Dhoma d ON dr.Nr_dhomes = d.Nr_dhomes)
EXCEPT
SELECT d.Nr_dhomes
FROM Dhoma d
JOIN Tipi_Dhomes td ON d.Nr_dhomes = td.Nr_Dhomes
WHERE td.ISsmoke_friendly = 1 AND td.HASsea_view = 1;

-- Përdor 'EXCEPT' për të gjetur dhomat e lira me cmim mbi 100 euro --DRENUSHA SHOSHI
SELECT Nr_Dhomes
FROM Dhoma
WHERE Cmimi > 100
EXCEPT
SELECT DISTINCT Nr_Dhomes
FROM Dhomat_e_rezervuara;

--8 Proceduara të ruajtura (Stored Procedure)

--Perqindja e mysafireve nga shteti(input) (Eljana Gjeçbitriq)
create procedure perqindjaShteti(@Shteti varchar(50))
as
	begin
		declare @Perqindja decimal(5,2)

		select @Perqindja = ((count(*) * 100)/(select count(*) from Klientet))
		from Klientet k
		where k.Shteti like 'Germany'

		print('Perqindja e mysafireve nga shteti ' + @Shteti + ' eshte ' + cast(@Perqindja as varchar(40)) + ' %.')

end

 execute perqindjaShteti 'Germany'
 
--Numri i rezervimeve te klientit sipas id (Eljana Gjeçbitriq)
create procedure nrRezervimeve(@id int)
as 
begin
	declare @nrRez int
	set @nrRez=(select count(*)
				from Rezervimi r
				where r.Klienti_Id=@id)
	if(@nrRez=1)
		begin
			print 'Klienti ka bere vetem 1 rezervim'
		end
	else if(@nrRez>1)
		begin
			print 'Klienti ka bere ' + CAST(@nrRez AS VARCHAR(10)) + ' rezervime'
		end
	else
		begin
			print 'Error'
		end

end


execute nrRezervimeve 5
--Sherbimet Speciale ne baze te totalit qe paguan klienti (Eljana Gjeçbitriq)
create procedure sherbimet_speciale
@klientiID varchar (50)=null,
@totali decimal = null
AS
BEGIN
SELECT k.Klienti_Id,k.Emri, k.Mbiemri, k.Nr_leternjoftimit, Sherbimet_Speciale=( CASE
WHEN @totali between 1000 and 2000 THEN 'Bottle of champagne, Extra pillows in room, Hammam/Massage' 
WHEN @totali between 700 and 1000 THEN 'Bottles of water, free tickets for hotel events'
else NULL
END )
FROM Rezervimi r join Klientet k
ON r.Klienti_Id=k.Klienti_Id 
WHERE k.Klienti_Id=@klientiID
END

execute sherbimet_speciale '6', '1050'

--Te lexohen pozitat e punetoreve nje nga nje me while loop (Eljana Gjeçbitriq)
DECLARE @Counter INT , @MaxId INT, 
        @Pozita NVARCHAR(100)
SELECT @Counter = min(p.Punetori_Id) , @MaxId = max(p.Punetori_Id) 
FROM Punetoret p
 
WHILE(@Counter IS NOT NULL
      AND @Counter <= @MaxId)
BEGIN
   SELECT @Pozita = p.Pozita_punes
   FROM Punetoret p WHERE p.Punetori_Id = @Counter
    
   PRINT CONVERT(VARCHAR,@Counter) + '. Pozita e punes: ' + @Pozita  
   SET @Counter  = @Counter  + 1        
END

--Stored procedure INPUT OUTPUT per paraqitjen e dhomes me informacione per cmim, hotel, dhe nr i rezervimeve --DRENUSHA SHOSHI
CREATE PROCEDURE GetRoomInfoAndReservationCount
    @RoomNumber INT,
    @Cmimi MONEY OUTPUT,
    @Hotel_ID INT OUTPUT,
    @Nr_Rezervimeve INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        @Cmimi = D.Cmimi,
        @Hotel_ID = D.Hotel_ID,
        @Nr_Rezervimeve = (
            SELECT COUNT(*)
            FROM Rezervimi R
            WHERE R.Nr_Dhomes = D.Nr_dhomes
        )
    FROM
        Dhoma D
    WHERE
        D.Nr_dhomes = @RoomNumber;
END


DECLARE @RoomNumber INT = 102;

DECLARE @Cmimi MONEY,
        @Hotel_ID INT,
        @Nr_Rezervimeve INT;

EXEC GetRoomInfoAndReservationCount
    @RoomNumber,
    @Cmimi OUTPUT,
    @Hotel_ID OUTPUT,
    @Nr_Rezervimeve OUTPUT;

SELECT
    @Cmimi AS Cmimi,
    @Hotel_ID AS Hotel_ID,
    @Nr_Rezervimeve AS Nr_Rezervimeve;


--Stored procedure INPUT OUTPUT: Shfaqja e departamenteve dhe paga --DRENUSHA SHOSHI
CREATE PROCEDURE GetDepartamentInfo
    @Departamenti_Id INT,
    @EmriDepartamentit VARCHAR(20) OUTPUT,
    @PagaDepartamentit MONEY OUTPUT
AS
BEGIN
    SELECT @EmriDepartamentit = Emri,
           @PagaDepartamentit = Paga
    FROM Departament
    WHERE Departamenti_Id = @Departamenti_Id;
END;

--finance
DECLARE @Emri VARCHAR(20);
DECLARE @Paga MONEY;
DECLARE @Departamenti_Id INT = 2;

EXEC GetDepartamentInfo
    @Departamenti_Id = @Departamenti_Id,
    @EmriDepartamentit = @Emri OUTPUT,
    @PagaDepartamentit = @Paga OUTPUT;

PRINT 'Emri i Departamentit: ' + @Emri;
PRINT 'Paga e Departamentit: ' + CAST(@Paga AS VARCHAR(20));

--hr
DECLARE @Emri VARCHAR(20);
DECLARE @Paga MONEY;
DECLARE @Departamenti_Id INT = 1;

EXEC GetDepartamentInfo
    @Departamenti_Id = @Departamenti_Id,
    @EmriDepartamentit = @Emri OUTPUT,
    @PagaDepartamentit = @Paga OUTPUT;

PRINT 'Emri i Departamentit: ' + @Emri;
PRINT 'Paga e Departamentit: ' + CAST(@Paga AS VARCHAR(20));



--Stored Procedura me Shprehje WHILE dhe CASE: Pershkrimi i dhomes --DRENUSHA SHOSHI
CREATE PROCEDURE GetRoomTypeDescription
    @RoomTypeID INT
AS
BEGIN
    DECLARE @Emri VARCHAR(20);
    DECLARE @Description NVARCHAR(255);
    DECLARE @ISpet_friendly BIT;
    DECLARE @HASsea_view BIT;
    DECLARE @ISSmoke_friendly BIT;

    DECLARE RoomTypeCursor CURSOR FOR
    SELECT Emri, ISpet_friendly, HASsea_view, ISSmoke_friendly
    FROM Tipi_Dhomes
    WHERE Nr_Dhomes = @RoomTypeID;

    OPEN RoomTypeCursor;
    FETCH NEXT FROM RoomTypeCursor INTO @Emri, @ISpet_friendly, @HASsea_view, @ISSmoke_friendly;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Description =
            CASE
                WHEN @ISpet_friendly = 1 AND @HASsea_view = 1 AND @ISSmoke_friendly = 1 THEN 'Dhoma Pet Friendly me Sea View dhe lejohet Smoking'
                WHEN @ISpet_friendly = 1 AND @ISSmoke_friendly = 1 THEN 'Dhoma Pet Friendly dhe lejohet Smoking'
                WHEN @HASsea_view = 1 AND @ISSmoke_friendly = 1 THEN 'Dhoma me Sea View dhe lejohet Smoking'
                WHEN @ISpet_friendly = 1 AND @HASsea_view = 1 THEN 'Pet Friendly Dhoma me Sea View'
                WHEN @ISpet_friendly = 1 THEN 'Dhoma Pet Friendly'
                WHEN @HASsea_view = 1 THEN 'Dhoma me Sea View'
                WHEN @ISSmoke_friendly = 1 THEN 'Dhoma qe lejon Smoking'
                ELSE 'Standard Room'
            END;

        PRINT 'Dhoma ' + @Emri + ': ' + @Description;

        FETCH NEXT FROM RoomTypeCursor INTO @Emri, @ISpet_friendly, @HASsea_view, @ISSmoke_friendly;
    END;

    CLOSE RoomTypeCursor;
    DEALLOCATE RoomTypeCursor;
END;

EXEC GetRoomTypeDescription @RoomTypeID = 101;
EXEC GetRoomTypeDescription @RoomTypeID = 201;
EXEC GetRoomTypeDescription @RoomTypeID = 301;
EXEC GetRoomTypeDescription @RoomTypeID = 401;


-- Stored Procedure me IF...ELSE dhe CASE: Kategorizimi i Sherbimeve te Hotelit --DRENUSHA SHOSHI
CREATE PROCEDURE CategorizeServices
AS
BEGIN
    DECLARE @ServiceId INT;
    DECLARE @ServiceName VARCHAR(20);
    DECLARE @ServiceDescription VARCHAR(255);
    DECLARE @ServicePrice MONEY;

    DECLARE ServiceCursor CURSOR FOR
    SELECT Sherbimi_Id, Emri, Pershkrimi, Cmimi
    FROM Sherbimet_e_hotelit;

    OPEN ServiceCursor;
    FETCH NEXT FROM ServiceCursor INTO @ServiceId, @ServiceName, @ServiceDescription, @ServicePrice;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @Category VARCHAR(50);

        IF @ServicePrice <= 15
            SET @Category = 'Ekonomik';
        ELSE IF @ServicePrice <= 25
            SET @Category = 'Standard';
        ELSE
            SET @Category = 'Premium';

        PRINT 'Sherbimi ' + @ServiceName + ' me cmim ' + CAST(@ServicePrice AS VARCHAR) + ' kategorizohet si: Sherbim ' + @Category;

        FETCH NEXT FROM ServiceCursor INTO @ServiceId, @ServiceName, @ServiceDescription, @ServicePrice;
    END;

    CLOSE ServiceCursor;
    DEALLOCATE ServiceCursor;
END;

EXEC CategorizeServices;