drop TABLE notifications;
drop TABLE farmer_crops;
drop TABLE media;
drop TABLE complaints;
drop TABLE advertise;
drop TABLE product_sale_details;
drop TABLE product_sale;
drop TABLE product_rating;
drop TABLE product_bidding;
drop TABLE product;
drop TABLE users;
drop TABLE role;

CREATE TABLE role(
  id serial PRIMARY KEY,
  name VARCHAR (20) UNIQUE NOT NULL
);

CREATE TABLE users (
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

CREATE TABLE product(
  id serial PRIMARY KEY,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  name VARCHAR (50) NOT NULL,
  description VARCHAR (100) NOT NULL,
  product_status status NOT NULL,
  purchase_price REAL NOT NULL,
  sale_price REAL NOT NULL,
  created_on TIMESTAMP NOT NULL
);

CREATE TABLE notifications(
  id serial PRIMARY KEY,
  product_id INTEGER REFERENCES product (id) ON DELETE CASCADE,
  title VARCHAR(50) NOT NULL,
  url VARCHAR(100) UNIQUE,
  description VARCHAR(100) NOT NULL,
  created_on TIMESTAMP NOT NULL
);


CREATE TABLE advertise(
  id serial,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  title VARCHAR (50) NOT NULL,
  description VARCHAR (100) NOT NULL,
  created_on TIMESTAMP NOT NULL,
  ad_status status NOT NULL,
  PRIMARY KEY (id, user_id)
);

CREATE TABLE product_bidding(
  id serial,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  product_name VARCHAR(50) NOT NULL,
  description VARCHAR(100) NOT NULL,
  quantity REAL NOT NULL,
  measure_unit VARCHAR(50),
  cureency VARCHAR(20),
  baseprice REAL NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  PRIMARY KEY (id, user_id)
);

CREATE TABLE complaints(
  id serial,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  description VARCHAR(100),
  PRIMARY KEY (id, user_id)
);

CREATE TABLE product_sale(
  id serial PRIMARY KEY,
  order_id INTEGER UNIQUE,
  product_id INTEGER REFERENCES product (id) ON DELETE CASCADE,
  created_on TIMESTAMP NOT NULL
);

CREATE TABLE product_rating(
  id serial,
  product_id INTEGER REFERENCES product (id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  rating REAL NOT NULL,
  created_on TIMESTAMP NOT NULL,
  PRIMARY KEY (id, product_id, user_id)
);



CREATE TABLE product_sale_details(
  id serial PRIMARY KEY,
  product_sale_id int REFERENCES product_sale (id) ON DELETE CASCADE,
  purchase_price REAL NOT NULL,
  sale_price REAL not NULL,
  quantity INTEGER NOT NULL
);



CREATE TABLE media(
  id serial PRIMARY KEY,
  product_id INTEGER REFERENCES product (id) ON DELETE CASCADE,
  image VARCHAR(100),
  video VARCHAR(100)
);

CREATE TABLE farmer_crops(
  id serial PRIMARY KEY,
  user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
  media_id INTEGER REFERENCES media (id) ON DELETE CASCADE,
  crop_name VARCHAR(50) NOT NULL,
  description VARCHAR(100) NOT NULL,
  quantity REAL NOT NULL,
  duration VARCHAR(50)
);

-- Insert into role values
INSERT INTO role VALUES(DEFAULT,'farmer');
INSERT INTO role VALUES(DEFAULT,'retailers');
INSERT INTO role VALUES(DEFAULT,'admin');

-- insert into User values
INSERT INTO users VALUES(DEFAULT,1,'ravi','ravi','abc@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2017-06-22 19:10:25');
INSERT INTO users VALUES(DEFAULT,1,'ravi1','ravi1','abc1@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-06-22 19:10:25');
INSERT INTO users VALUES(DEFAULT,1,'ravi2','ravi12','abc2@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-06-22 19:10:25');
INSERT INTO users VALUES(DEFAULT,1,'ravi3','ravi123','abc3@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-06-22 19:10:25');
INSERT INTO users VALUES(DEFAULT,1,'ravi4','ravi1234','abc4@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-06-22 19:10:25');
INSERT INTO users VALUES(DEFAULT,2,'rvi','rvi','rvi@gmail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-07-01 19:10:25');
INSERT INTO users VALUES(DEFAULT,2,'rdsvi1','rvdsi1','rvids1@gmail.com','pune dfefwccxsfsf,sad','pune','maharashtra','india','2018-02-03 19:10:25');
INSERT INTO users VALUES(DEFAULT,2,'rcxxvi','rvxci','rvi@gmxcail.com','pune sfsf,sad','ahmednagar','maharashtra','india','2018-07-01 19:10:25');
INSERT INTO users VALUES(DEFAULT,2,'raavi1','rvaai1','rvi1@gmaaail.com','pune dfefwccxsfsf,sad','pune','maharashtra','india','2018-02-03 19:10:25');


-- insert into Product values
INSERT INTO product VALUES(DEFAULT,6,'Harit Biyane','dfdfdfdfdfdfdfdfdfd','1','105.50','110','2018-07-01 19:10:25');
INSERT INTO product VALUES(DEFAULT,7,'Uttam Beej','dfdfdfdfdfdfdfdfdfd','1','500','600','2018-07-01 19:10:25');
INSERT INTO product VALUES(DEFAULT,8,'Janukiy biyane','dfdfdfdfdfdfdfdfdfd','1','305.50','410','2018-07-01 19:10:25');
INSERT INTO product VALUES(DEFAULT,9,'cotton 5151 Biyane','dfdfdfdfdfdfdfdfdfd','1','705.50','810','2018-07-01 19:10:25');

  -- insert into product sale values
INSERT INTO product_sale values(DEFAULT,101,1,'2018-04-01 1:10:25');
INSERT INTO product_sale values(DEFAULT,102,2,'2018-01-01 1:10:25');
INSERT INTO product_sale values(DEFAULT,103,3,'2018-05-01 1:10:25');
INSERT INTO product_sale values(DEFAULT,104,1,'2018-05-01 1:10:25');
INSERT INTO product_sale values(DEFAULT,105,2,'2018-05-01 1:10:25');
INSERT INTO product_sale values(DEFAULT,106,4,'2018-05-01 1:10:25');


  -- insert into product sale details values
INSERT INTO product_sale_details values(DEFAULT,1,105.50,110,500);
INSERT INTO product_sale_details values(DEFAULT,2,500,600,150);
INSERT INTO product_sale_details values(DEFAULT,3,305.50,410,5);
INSERT INTO product_sale_details values(DEFAULT,1,105.50,110,400);
INSERT INTO product_sale_details values(DEFAULT,2,500,600,350);
INSERT INTO product_sale_details values(DEFAULT,4,705.50,810,50);



-- isert value into product rating

INSERT INTO product_rating values(DEFAULT,1,2,4.5,'2018-05-01 1:10:25');
INSERT INTO product_rating values(DEFAULT,2,2,4.0,'2018-06-01 1:10:25');
INSERT INTO product_rating values(DEFAULT,3,2,5.0,'2018-08-01 1:10:25');
INSERT INTO product_rating values(DEFAULT,1,2,5.0,'2018-08-01 1:10:25');
INSERT INTO product_rating values(DEFAULT,2,2,4.2,'2018-08-01 1:10:25');
INSERT INTO product_rating values(DEFAULT,4,2,4.5,'2018-08-01 1:10:25');

select DISTINCT t1.id,t1.name,t3.TotalQuantity from product t1 inner join product_sale t2 on t1.id=t2.product_id inner join (SELECT product_sale_id, SUM(quantity) AS TotalQuantity FROM product_sale_details GROUP BY product_sale_id ORDER BY SUM(quantity) DESC limit 1) t3 on t2.product_id=t3.product_sale_id;

select t1.id,t1.name,avg as rating,TotalQuantity from product t1 inner join (select product_id,avg(rating) from product_rating group by product_id order by avg(rating) desc) t2 on t1.id=t2.product_id inner join (SELECT  product_sale_id, SUM(quantity) AS TotalQuantity FROM product_sale_details GROUP BY product_sale_id ORDER BY SUM(quantity) DESC ) t3 on t2.product_id=t3.product_sale_id;

SELECT order_id,product_id FROM product_sale WHERE product_id='1' and EXTRACT(MONTH FROM created_on) >= 1;

select product_id,to_char(created_on,'mon') as Moth from product_sale where product_id in(select id from product where user_id=6);