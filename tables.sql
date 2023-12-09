
CREATE TABLE Type_of_print ( 
	id INTEGER PRIMARY KEY, 
	names VARCHAR (100) NOT NULL 
); 
 
CREATE TABLE Workroom ( 
	id INTEGER PRIMARY KEY, 
	name INTEGER (100) NOT NULL, 
	City INTEGER (100) NOT NULL, 
	indexs  VARCHAR (100) NOT NULL, 
	address VARCHAR (100) NOT NULL 
); 
CREATE TABLE Workshop ( 
	id INTEGER PRIMARY KEY, 
	name VARCHAR(100) NOT NULL, 
	Workroom_id INTEGER, 
	FOREIGN KEY (Workroom_id)  
	REFERENCES Workroom(id)  
	ON DELETE SET NULL ON UPDATE NO ACTION 
); 
CREATE TABLE Equipment ( 
	id INTEGER PRIMARY KEY,  
	name INTEGER (100) NOT NULL, 
	Description INTEGER (100) NOT NULL 
); 
CREATE TABLE Equipment_Workshop ( 
	id INTEGER PRIMARY KEY, 
	Equipment_id INTEGER, 
	Workshop_id INTEGER, 
	FOREIGN key (Equipment_id) 
	REFERENCES Equipment(id) 
	ON DELETE SET NULL ON UPDATE NO ACTION, 
	FOREIGN KEY (Workshop_id)  
	REFERENCES Workshop(id)  
	ON DELETE SET NULL ON UPDATE NO ACTION  
); 
	CREATE TABLE Employees ( 
	id INTEGER PRIMARY KEY,  
	last_name VARCHAR (100) NOT NULL,  
	mail VARCHAR (100) NOT NULL,  
	phone INTEGER NOT NULL,  
	position INTEGER NOT NULL,  
	prin_report_id INTEGER,  
	FOREIGN KEY (prin_report_id) 
	REFERENCES Prin_report(id) 
	ON DELETE SET NULL ON UPDATE NO ACTION 
); 
 
CREATE TABLE Prin_report ( 
  	id INTEGER PRIMARY KEY AUTOINCREMENT,  
  	Date_report DATE NOT NULL, 
  	employee_id INTEGER NOT NULL,  
  	description VARCHAR(100) NOT NULL,  
  	FOREIGN KEY (employee_id)  
  	REFERENCES Employees(id)  
  	ON DELETE CASCADE ON UPDATE NO ACTION  
); 
CREATE TABLE Client ( 
  	id INTEGER PRIMARY KEY, 
  	Name VARCHAR (100) NOT NULL,  
  	mail VARCHAR (100) NOT NULL,  
  	phone INTEGER (11) NOT NULL,  
  	Last_name VARCHAR (100) NOT NULL,  
  	address VARCHAR (100) NOT NULL, 
  	indexs  VARCHAR (100) NOT NULL, 
  	City INTEGER (100) NOT NULL 
); 
CREATE TABLE Orders ( 
  	id INTEGER PRIMARY KEY, 
  	Order_date DATE NOT NULL, 
  	statuss VARCHAR (100) NOT NULL, 
  	amount VARCHAR (100) NOT NULL, 
  	Client_id INTEGER, 
  	FOREIGN KEY (Client_id)  
  	REFERENCES Client(id)  
  	ON DELETE SET NULL ON UPDATE NO ACTION 
); 
CREATE TABLE Product ( 
  	id INTEGER PRIMARY KEY, 
  	Name VARCHAR (100) NOT NULL, 
  	Description INTEGER (100) NOT NULL, 
  	price INTEGER (100) NOT NULL, 
  	Type_of_print_id INTEGER, 
  	FOREIGN KEY (Type_of_print_id)  
  	REFERENCES Type_of_print(id)  
  	ON DELETE SET NULL ON UPDATE NO ACTION 
); 
CREATE TABLE Orders_Detail ( 
  	id INTEGER PRIMARY KEY, 
  	quantity VARCHAR (100) NOT NULL, 
  	Orders_id INTEGER, 
  	Product_id INTEGER, 
  	FOREIGN KEY (Orders_id)  
  	REFERENCES Orders(id)  
  	ON DELETE SET NULL ON UPDATE NO ACTION, 
  	FOREIGN KEY (Product_id)  
  	REFERENCES Product(id)  
  	ON DELETE SET NULL ON UPDATE NO ACTION 
); 
CREATE TABLE Supplier ( 
  	id INTEGER PRIMARY KEY, 
  	Name VARCHAR (100) NOT NULL,    
  	address VARCHAR (100) NOT NULL, 
  	City INTEGER (100) NOT NULL 
); 
CREATE TABLE Supplier_Product ( 
  	id INTEGER PRIMARY KEY, 
  	Supplier_id INTEGER, 
  	Product_id INTEGER, 
  	FOREIGN key (Supplier_id) 
  	REFERENCES Supplier(id) 
  	ON DELETE SET NULL ON UPDATE NO ACTION, 
  	FOREIGN KEY (Product_id)  
  	REFERENCES Product(id)  
  	ON DELETE SET NULL ON UPDATE NO ACTION  
); 