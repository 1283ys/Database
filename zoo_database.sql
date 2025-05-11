CREATE TABLE A_Animal (
    Animal_id INT PRIMARY KEY,
    Name VARCHAR(20),
    Species VARCHAR(40),
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Unknown')),
    Lifespan INT CHECK (Lifespan >= 0),
    Habitat VARCHAR(20),
    Enclosure_id INT NOT NULL,
    FOREIGN KEY (Enclosure_id) REFERENCES A_Enclosure(Enclosure_id)
);

CREATE TABLE A_AnimalCategory (
    Category_id NUMBER PRIMARY KEY,
    Name VARCHAR(30),
    Parent_category_id NUMBER, 
    FOREIGN KEY (Parent_category_id) REFERENCES A_AnimalCategory(Category_id)
);

CREATE TABLE A_Enclosure (
    Enclosure_id INT PRIMARY KEY,
    Name VARCHAR(30),
    Type VARCHAR(20),
    Capacity INT,
    Location VARCHAR(40)
);

CREATE TABLE A_Employee (
    Employee_id INT PRIMARY KEY,
    Name VARCHAR(30),
    Hire_date DATE,
    Role VARCHAR(30)
); 

CREATE TABLE A_Keeper (
    Employee_id INT PRIMARY KEY,
    Assigned_animals INT,
    FOREIGN KEY (Employee_id) REFERENCES A_Employee(Employee_id)
); 


CREATE TABLE A_Sponsor (
    Sponsor_id INT PRIMARY KEY,
    Name VARCHAR(30),
    Contact_info VARCHAR(66)
);

CREATE TABLE A_AnimalSponsor (
    Animal_id INT,
    Sponsor_id INT,
    PRIMARY KEY (Animal_id, Sponsor_id),
    FOREIGN KEY (Animal_id) REFERENCES A_Animal(Animal_id),
    FOREIGN KEY (Sponsor_id) REFERENCES A_Sponsor(Sponsor_id)
);

CREATE TABLE A_MaintenanceTask (
    Task_id INT PRIMARY KEY,
    Animal_id INT,
    Task_description VARCHAR(200),
    Frequency VARCHAR(50),
    FOREIGN KEY (Animal_id) REFERENCES A_Animal(Animal_id)
);

CREATE TABLE A_Visitor (
    Visitor_id INT PRIMARY KEY,
    Name VARCHAR(30),
    Visit_date DATE
);

CREATE TABLE A_VisitPlan (
    Plan_id INT PRIMARY KEY,
    Visitor_id INT,
    Animal_id INT,
    FOREIGN KEY (Visitor_id) REFERENCES A_Visitor(Visitor_id),
    FOREIGN KEY (Animal_id) REFERENCES A_Animal(Animal_id)
);

CREATE TABLE A_Introduction (
    Intro_id INT PRIMARY KEY,
    Employee_id INT,
    Animal_id INT,
    Info_presented VARCHAR(300),
    FOREIGN KEY (Employee_id) REFERENCES A_Employee(Employee_id),
    FOREIGN KEY (Animal_id) REFERENCES A_Animal(Animal_id)
);
ALTER TABLE A_Employee
ADD Manager_id INT;

ALTER TABLE A_Animal
ADD Medical_situation VARCHAR(30);

ALTER TABLE A_Employee
ADD FOREIGN KEY (Manager_id) REFERENCES A_Employee(Employee_id);

SELECT object_name, object_type
FROM all_objects
WHERE object_name = 'A_ANIMALCATEGORY';

INSERT ALL
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (0111, 'Zebra', 'Equus quagga', 'Male', 25, 'Grasslands', 2, 'Good Health Status')
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (0212, 'Kangaroo', 'Macropus rufus', 'Female', 30, 'Desert', 1, 'Dead')
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (0311, 'Penguin', 'Aptenodytes forsteri', 'Male', 15, 'Antarctic', 5, 'Good Health Status')
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (0423, 'Bald Eagle', 'Haliaeetus leucocephalus', 'Unknown', 25, 'Forest and Wetlands', 2, 'Good Health Status')
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (0521, 'Mallard Duck', 'Anas platyrhynchos', 'Male', 5, 'Ponds', 3, 'Good Health Status')
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (0631, 'King Cobra', 'Ophiophagus hannah', 'Male', 20, 'Tropical Forest', 6, 'Good Health Status')
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (0732, 'Komodo Dragon', 'Varanus komodoensis', 'Female', 30, 'Tropical Islands', 6, 'Good Health Status')
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (0842, 'Clownfish', 'Amphiprioninae', 'Female', 10, 'Coral Reefs', 3, 'Injured')
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (0942, 'Goldfish', 'Carassius auratus', 'Female', 10, 'Freshwater', 3, 'Healthy')
  INTO A_Animal (Animal_id, Name, Species, Gender, Lifespan, Habitat, Enclosure_id, Medical_situation) 
  VALUES (1051, 'Frog', 'Rana temporaria', 'Male', 10, 'Ponds', 4, 'Good Health Status')
SELECT * FROM dual;



INSERT ALL
  INTO A_Enclosure (Enclosure_id, Name, Type, Capacity, Location) 
  VALUES (1, 'Savannah Enclosure', 'Open', 50, 'Zone 10')
  INTO A_Enclosure (Enclosure_id, Name, Type, Capacity, Location) 
  VALUES (2, 'Forest Enclosure', 'Closed', 40, 'Zone 20')
  INTO A_Enclosure (Enclosure_id, Name, Type, Capacity, Location) 
  VALUES (3, 'Water Enclosure', 'Closed', 35, 'Zone 30')
  INTO A_Enclosure (Enclosure_id, Name, Type, Capacity, Location) 
  VALUES (4, 'Swamp Enclosure', 'Open', 35, 'Zone 40')
  INTO A_Enclosure (Enclosure_id, Name, Type, Capacity, Location)
  VALUES (5, 'Antarctic Enclosure', 'Closed', 20, 'Zone 50')
  INTO A_Enclosure (Enclosure_id, Name, Type, Capacity, Location)
  VALUES (6, 'Tropical Enclosure', 'Closed', 30, 'Zone 60')
SELECT * FROM dual;





INSERT ALL
  INTO A_AnimalCategory (Category_id, Name, Parent_category_id)
  VALUES (1, 'Mammals', NULL)
  INTO A_AnimalCategory (Category_id, Name, Parent_category_id) 
  VALUES (2, 'Birds', NULL)
  INTO A_AnimalCategory (Category_id, Name, Parent_category_id) 
  VALUES (3, 'Reptiles', NULL)
  INTO A_AnimalCategory (Category_id, Name, Parent_category_id) 
  VALUES (4, 'Fishes', NULL)
  INTO A_AnimalCategory (Category_id, Name, Parent_category_id) 
  VALUES (5, 'Amphibians', NULL)
  INTO A_AnimalCategory (Category_id, Name, Parent_category_id) 
  VALUES (6, 'Carnivores', 1)
  INTO A_AnimalCategory (Category_id, Name, Parent_category_id)
  VALUES (7, 'Herbivores', 1)
  INTO A_AnimalCategory (Category_id, Name, Parent_category_id)
  VALUES (8, 'Aquatic', 3)
SELECT * FROM dual;


INSERT ALL
  INTO A_Employee (Employee_id, Name, Hire_date, Role) 
  VALUES (1, 'Ferit Bahcekapili', TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Zoologist')
  INTO A_Employee (Employee_id, Name, Hire_date, Role) 
  VALUES (2, 'Arda Guler', TO_DATE('2023-07-06', 'YYYY-MM-DD'), 'Veterinarian')
  INTO A_Employee (Employee_id, Name, Hire_date, Role) 
  VALUES (3, 'Hakan Calhanoglu', TO_DATE('2021-07-05', 'YYYY-MM-DD'), 'Zookeeper')
  INTO A_Employee (Employee_id, Name, Hire_date, Role) 
  VALUES (4, 'Kerem Akturkoglu', TO_DATE('2020-05-10', 'YYYY-MM-DD'), 'Manager')
SELECT * FROM dual;

CREATE TABLE A_KeeperAnimal (
  Keeper_id NUMBER,         
  Animal_id NUMBER,         
  PRIMARY KEY (Keeper_id, Animal_id),
  FOREIGN KEY (Keeper_id) REFERENCES A_Employee(Employee_id),
  FOREIGN KEY (Animal_id) REFERENCES A_Animal(Animal_id)
);

INSERT ALL
 INTO A_Employee (Employee_id, Name, Hire_date, Role)
VALUES (5, 'Fatih Terim', TO_DATE('2022-03-15', 'YYYY-MM-DD'), 'Zookeeper')
 INTO A_Employee (Employee_id, Name, Hire_date, Role)
VALUES (6, 'Baris Alper Yilmaz', TO_DATE('2023-06-25', 'YYYY-MM-DD'), 'Zookeeper');

INSERT INTO A_Keeper (Employee_id)
VALUES (5);
INSERT INTO A_Keeper (Employee_id)
VALUES (6);


INSERT ALL
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (5, 0111)
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (5, 0212)
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (5, 0311)
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (5, 0423)
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (5, 0521)
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (6, 0631)
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (6, 0732)
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (6, 0842)
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (6, 0942)
  INTO A_KeeperAnimal (Keeper_id, Animal_id) VALUES (6, 1051)
SELECT * FROM dual;

INSERT ALL
  INTO A_Sponsor (Sponsor_id, Name, Contact_info)
   VALUES (1, 'Ridvan Arslan', 'contact@global.com')
  INTO A_Sponsor (Sponsor_id, Name, Contact_info)
   VALUES (2, 'Yasin Sariaslan', 'info@animal.org')
  INTO A_Sponsor (Sponsor_id, Name, Contact_info)
   VALUES (3, 'Emre Anil', 'preservation@wildlife.org')
  INTO A_Sponsor (Sponsor_id, Name, Contact_info)
   VALUES (4, 'Ozan Aydogan', 'advocates@nature.com')
SELECT * FROM dual;


INSERT ALL
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (0111, 1)
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (0212, 2)
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (0311, 3)
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (0423, 4)
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (0521, 1)
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (0631, 2)
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (0732, 4)
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (0842, 3)
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (0942, 1)
  INTO A_AnimalSponsor (Animal_id, Sponsor_id) VALUES (1051, 2)
SELECT * FROM dual;


INSERT ALL
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (1, 0111, 'Clean enclosure and provide food', 'Daily')
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (2, 0212, 'Check health status', 'Weekly')
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (3, 0311, 'Replace bedding and provide food', 'Daily')
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (4, 0423, 'Check for injuries and provide food', 'Daily')
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (5, 0521, 'Mow grass and provide food', 'Weekly')
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (6, 0631, 'Check water supply and provide food', 'Daily')
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (7, 0732, 'Clean water and provide food', 'Daily')
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (8, 0842, 'Replace bedding and check health', 'Weekly')
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (9, 0942, 'Check food supply and provide food', 'Daily')
  INTO A_MaintenanceTask (Task_id, Animal_id, Task_description, Frequency)
   VALUES (10, 1051, 'Clean enclosure and provide food', 'Daily')
SELECT * FROM dual;


INSERT ALL
  INTO A_Visitor (Visitor_id, Name, Visit_date)
   VALUES (1, 'Ali', TO_DATE('2025-05-01', 'YYYY-MM-DD'))
  INTO A_Visitor (Visitor_id, Name, Visit_date)
   VALUES (2, 'Burak', TO_DATE('2025-05-02', 'YYYY-MM-DD'))
  INTO A_Visitor (Visitor_id, Name, Visit_date)
   VALUES (3, 'Ceylan', TO_DATE('2025-05-03', 'YYYY-MM-DD'))
  INTO A_Visitor (Visitor_id, Name, Visit_date)
   VALUES (4, 'Deniz', TO_DATE('2025-05-04', 'YYYY-MM-DD'))
  INTO A_Visitor (Visitor_id, Name, Visit_date)
   VALUES (5, 'Enes', TO_DATE('2025-05-05', 'YYYY-MM-DD'))
  INTO A_Visitor (Visitor_id, Name, Visit_date)
   VALUES (6, 'Ferit', TO_DATE('2025-05-06', 'YYYY-MM-DD'))
  INTO A_Visitor (Visitor_id, Name, Visit_date)
   VALUES (7, 'Gizem', TO_DATE('2025-05-07', 'YYYY-MM-DD'))
  INTO A_Visitor (Visitor_id, Name, Visit_date)
   VALUES (8, 'Helen', TO_DATE('2025-05-08', 'YYYY-MM-DD'))
  INTO A_Visitor (Visitor_id, Name, Visit_date)
   VALUES (9, 'Isıl', TO_DATE('2025-05-09', 'YYYY-MM-DD'))
  INTO A_Visitor (Visitor_id, Name, Visit_date) 
   VALUES (10, 'Jale', TO_DATE('2025-05-10', 'YYYY-MM-DD'))
SELECT * FROM dual;




INSERT ALL
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (1, 1, 0111)
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (2, 2, 0212)
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (3, 3, 0311)
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (4, 4, 0423)
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (5, 5, 0521)
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (6, 6, 0631)
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (7, 7, 0732)
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (8, 8, 0842)
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (9, 9, 0942)
  INTO A_VisitPlan (Plan_id, Visitor_id, Animal_id)
   VALUES (10, 10, 1051)
SELECT * FROM dual;


INSERT ALL
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (1, 1, 0111, 'Introduction to the Zebra: Habitat, diet, and behavior.')
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (2, 2, 0212, 'Introduction to the Kangaroo: Health and conservation efforts.')
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (3, 3, 0311, 'Introduction to the Penguin: Feeding habits and habitat.')
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (4, 4, 0423, 'Introduction to the Bald Eagle: Habitat, behavior, and endangered status.')
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (5, 1, 0521, 'Introduction to the Mallard Duck: Grazing habits and behavior.')
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (6, 2, 0631, 'Introduction to the King Cobra: Behavior and social structure.')
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (7, 3, 0732, 'Introduction to the Komodo Dragon: Habitat and diet.')
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (8, 4, 0842, 'Introduction to the Clownfish: Territory and diet.')
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (9, 1, 0942, 'Introduction to the Goldfish: Social behavior and conservation.')
  INTO A_Introduction (Intro_id, Employee_id, Animal_id, Info_presented)
   VALUES (10, 2, 1051, 'Introduction to the Frog: Behavior and survival strategies.')
SELECT * FROM dual;



