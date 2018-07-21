drop TABLE Notifications;
drop TABLE Farmer_Crops;
drop TABLE Media;
drop TABLE Complaints;
drop TABLE Advertise;
drop TABLE Product_Sale_Details;
drop TABLE Product_Sale;
drop TABLE Product_Ratting;
drop TABLE Product_Bidding;
drop TABLE Product;
drop TABLE Users;
drop TABLE role;

CREATE TABLE role(
  id serial PRIMARY KEY,
  name VARCHAR (20) UNIQUE NOT NULL
);

CREATE TABLE Users (
  id serial PRIMARY KEY,
  role_id INTEGER REFERENCES role(id) ON DELETE CASCADE,
  username VARCHAR (50) UNIQUE NOT NULL,
  password VARCHAR (50) NOT NULL,
  email VARCHAR (50) NOT NULL,
  adreess VARCHAR (100) NULL NULL,
  district VARCHAR (50) NOT NULL,
  state VARCHAR (50) NOT NULL,
  country VARCHAR (50) NOT NULL,
  created_on TIMESTAMP NOT NULL
);



CREATE TYPE status AS ENUM ('0', '1', '2');

CREATE TABLE Product(
  id serial PRIMARY KEY,
  user_id INTEGER REFERENCES Users (id) ON DELETE CASCADE,
  name VARCHAR (50) UNIQUE NOT NULL,
  description VARCHAR (100) NOT NULL,
  product_status status NOT NULL,
  purchase_price REAL NOT NULL,
  sale_price REAL NOT NULL,
  created_on TIMESTAMP NOT NULL
  -- PRIMARY KEY (id, user_id)
  -- FOREIGN KEY (user_id) REFERENCES Users (id)
);

CREATE TABLE Notifications(
  id serial PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  url VARCHAR(100) UNIQUE,
  description VARCHAR(100) NOT NULL,
  created_on TIMESTAMP NOT NULL
);


CREATE TABLE Advertise(
  id serial,
  user_id INTEGER REFERENCES Users (id) ON DELETE CASCADE,
  title VARCHAR (50) NOT NULL,
  description VARCHAR (100) NOT NULL,
  created_on TIMESTAMP NOT NULL,
  ad_status status NOT NULL,
  PRIMARY KEY (id, user_id)
);

CREATE TABLE Product_Bidding(
  id serial,
  user_id INTEGER REFERENCES Users (id) ON DELETE CASCADE,
  product_name VARCHAR(50) NOT NULL,
  description VARCHAR(100) NOT NULL,
  quntity REAL NOT NULL,
  measure_unit VARCHAR(50),
  cureency VARCHAR(20),
  baseprice REAL NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  PRIMARY KEY (id, user_id)
);

CREATE TABLE Complaints(
  id serial,
  user_id INTEGER REFERENCES Users (id) ON DELETE CASCADE,
  description VARCHAR(100),
  PRIMARY KEY (id, user_id)
);

CREATE TABLE Product_Sale(
  id serial PRIMARY KEY,
  order_id INTEGER UNIQUE,
  product_id INTEGER REFERENCES Product (id) ON DELETE CASCADE,
  -- user_id INTEGER REFERENCES Users (id) ON DELETE CASCADE,
  created_on TIMESTAMP NOT NULL
  -- PRIMARY KEY (id, order_id)
);

CREATE TABLE Product_Ratting(
  id serial,
  product_id INTEGER REFERENCES Product (id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES Users (id) ON DELETE CASCADE,
  ratting REAL NOT NULL,
  created_on TIMESTAMP NOT NULL,
  PRIMARY KEY (id, product_id, user_id)
);



CREATE TABLE Product_Sale_Details(
  id serial PRIMARY KEY,
  product_sale_id int REFERENCES Product_Sale (id) ON DELETE CASCADE,
  -- product_id int REFERENCES Product_Sale (id) ON DELETE CASCADE,
  purchase_price REAL NOT NULL,
  sale_price REAL not NULL,
  quntity INTEGER NOT NULL
  -- PRIMARY KEY (id, order_id, product_id)
);



CREATE TABLE Media(
  id serial PRIMARY KEY,
  product_id INTEGER REFERENCES Product (id) ON DELETE CASCADE,
  image VARCHAR(100),
  video VARCHAR(100)
  -- PRIMARY KEY (id, product_id)
);

CREATE TABLE Farmer_Crops(
  id serial PRIMARY KEY,
  user_id INTEGER REFERENCES Users (id) ON DELETE CASCADE,
  media_id INTEGER REFERENCES Media (id) ON DELETE CASCADE,
  crop_name VARCHAR(50) NOT NULL,
  description VARCHAR(100) NOT NULL,
  quntity REAL NOT NULL,
  duration VARCHAR(50)
  -- PRIMARY KEY (id, user_id)
);

-- Insert into role values
INSERT INTO role VALUES(DEFAULT,'farmer');
INSERT INTO role VALUES(DEFAULT,'retailers');
INSERT INTO role VALUES(DEFAULT,'admin');

-- insert into User values
INSERT INTO Users VALUES(DEFAULT,1,'ravi','ravi','abc@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2017-06-22 19:10:25');
INSERT INTO Users VALUES(DEFAULT,1,'ravi1','ravi1','abc1@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-06-22 19:10:25');
INSERT INTO Users VALUES(DEFAULT,1,'ravi2','ravi12','abc2@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-06-22 19:10:25');
INSERT INTO Users VALUES(DEFAULT,1,'ravi3','ravi123','abc3@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-06-22 19:10:25');
INSERT INTO Users VALUES(DEFAULT,1,'ravi4','ravi1234','abc4@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-06-22 19:10:25');
INSERT INTO Users VALUES(DEFAULT,2,'rvi','rvi','rvi@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-07-01 19:10:25');

-- insert into Product values
INSERT INTO Product VALUES(DEFAULT,2,'Harit Biyane','dfdfdfdfdfdfdfdfdfd','1','105.50','110','2018-07-01 19:10:25');
INSERT INTO Product VALUES(DEFAULT,2,'Uttam Beej','dfdfdfdfdfdfdfdfdfd','1','500','600','2018-07-01 19:10:25');
INSERT INTO Product VALUES(DEFAULT,2,'Janukiy biyane','dfdfdfdfdfdfdfdfdfd','1','305.50','410','2018-07-01 19:10:25');
INSERT INTO Product VALUES(DEFAULT,2,'Biyane','dfdfdfdfdfdfdfdfdfd','1','705.50','810','2018-07-01 19:10:25');


  -- insert into product sale values
INSERT INTO Product_Sale values(DEFAULT,101,1,'2018-04-01 1:10:25');
INSERT INTO Product_Sale values(DEFAULT,102,2,'2018-01-01 1:10:25');
INSERT INTO Product_Sale values(DEFAULT,103,3,'2018-05-01 1:10:25');


  -- insert into product sale details values
INSERT INTO Product_Sale_Details values(DEFAULT,1,105.50,110,50);
INSERT INTO Product_Sale_Details values(DEFAULT,2,500,600,150);
INSERT INTO Product_Sale_Details values(DEFAULT,3,705.50,810,500);

-- isert value into product ratting

INSERT INTO Product_Ratting values(DEFAULT,1,2,4.5,'2018-05-01 1:10:25');
INSERT INTO Product_Ratting values(DEFAULT,2,2,4.0,'2018-06-01 1:10:25');
INSERT INTO Product_Ratting values(DEFAULT,3,2,5.0,'2018-08-01 1:10:25');

